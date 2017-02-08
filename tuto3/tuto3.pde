// Shows the Copenhagen forcast temperatures in the next 5 days.
// Jo Wood, 26th January 2017

float tue,wed,thu,fri,sat;  // Daily max temperatures.
color minCol,maxCol;        // Colours representing temp range.

void setup()
{
  size(400,90);
  noStroke();
  textAlign(CENTER);

  // Set the forecast temperatures and range
  tue = 4;
  wed = -2;
  thu = -3;
  fri = -1;
  sat = 1;

  // Use HSB colour space.
  colorMode(HSB,360,100,100);
  minCol = color(238,45,55);   // Blue in HSB space.
  maxCol = color(165,67,72);   // Pale green in HSB space.
}

void draw()
{
  background(0,0,255);

  fill(lerpColor(minCol,maxCol,norm(tue,-4,4)));
  ellipse(width*.1,height/2,30,30);

  fill(lerpColor(minCol,maxCol,norm(wed,-4,4)));
  ellipse(width*.3,height/2,30,30);

  fill(lerpColor(minCol,maxCol,norm(thu,-4,4)));
  ellipse(width*.5,height/2,30,30);

  fill(lerpColor(minCol,maxCol,norm(fri,-4,4)));
  ellipse(width*.7,height/2,30,30);

  fill(lerpColor(minCol,maxCol,norm(sat,-4,4)));
  ellipse(width*.9,height/2,30,30);

  // Draw text labels.
  fill(0,0,0);
  text("Copenhagen 5 day temperature forecast",width*.5,20);
  text("Tue",width*.1,height-10);
  text("Wed",width*.3,height-10);
  text("Thu",width*.5,height-10);
  text("Fri",width*.7,height-10);
  text("Sat",width*.9,height-10);

  noLoop();    // Draw once only.
}