// Draws a global map showing country locations.
// Version 1.7, 29th January, 2017
// Author Ben Fry with modifications by Jo Wood, giCentre.

PImage mapImage;            // Background map image.
Table locationTable;        // Table storing country locations.
Table dataTable;            // Table storing dental health data.
float dataMin = MAX_FLOAT;  // Used to store min and max data values.
float dataMax = MIN_FLOAT;

// Start the sketch and load the data (image and two tables).
void setup()
{
  size(1000,550);

  // Load the background map.
  mapImage = loadImage("worldCountries.png");

  // Load data from tables
  locationTable = loadTable("countryLocations.tsv","header,tsv");
  dataTable     = loadTable("badTeeth.tsv","header,tsv");

  // Find the minimum and maximum values
  for (int row=0; row<dataTable.getRowCount(); row++)
  {
    dataMin = min(dataMin,dataTable.getFloat(row,"NumBadTeeth"));
    dataMax = max(dataMax,dataTable.getFloat(row,"NumBadTeeth"));
  }
}

// Plots the data over the background map.
void draw()
{
  background(255);

  // Draw the background image taking up the full width and height of sketch.
  image(mapImage,0,0,width,height);

  // Set the appearance of the data circles.
  fill(192,0,0,80);
  stroke(255);
  strokeWeight(0.5);

  // Go through each row in table drawing each data item as a circle.
  for (int row=0; row<dataTable.getRowCount(); row++)
  {
    // Get the bad teeth data for the country.
    String countryName = dataTable.getString(row,"CountryName");
    float badTeeth     = dataTable.getFloat(row,"NumBadTeeth");
    float circleSize = map(badTeeth,dataMin,dataMax,1,30);

    // Find the row in the location table that matches the country in the data table.
    TableRow countryRow = locationTable.findRow(countryName,"CountryName");

    // It is possible that we cannot find countryName (from the dataTable) in the
    // location table, so only attempt to plot the circle if country is found in both.
    if (countryRow != null)
    {
      // Extract the latitude and longitude from the row we have found.
      float latitude  = countryRow.getFloat("latitude");
      float longitude = countryRow.getFloat("longitude");

      // Scale the latitude and longitude to fit in the sketch.
      float x = map(longitude,-180,180,0,width);
      float y = map(latitude,-60,85,height,0);
      ellipse(x,y,circleSize,circleSize);
    }
  }
}