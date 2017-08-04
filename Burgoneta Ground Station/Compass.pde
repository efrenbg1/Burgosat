void compass()
{
  // This whole void function contains the stuff needed to make the
  // compass and all of its moving bits and pieces
  float xx = 200;
  float yy = 585;
  translate(xx,yy);
  // compass background
  ellipseMode(CENTER);
  fill(50);
  stroke(10);
  strokeWeight(2);
  ellipse(150,150,250,250);
  
  // This section draws the dashed lines and the dots on the compass,
  // and rotates them around the "origin".
  translate(150,150);  
  //CompassX = map(CompassX, -180,180, -180,180);
  if (compass>=0){
         CompassX = map(compass,0,90,0,180);
        } else {
        CompassX = map(compass,0,-90,360,180);
        }
  rotate(radians(CompassX));
 //println(compass);
  noStroke();
  fill(250);
  int radius = 100;
  for( int degC = 5; degC < 360; degC += 10) //Compass dots
  {
    float angleC = radians(degC);
    float xC = 0 + (cos(angleC)* radius);
    float yC = 0 + (sin(angleC)* radius);
    ellipse(xC,yC, 3, 3);
  }
  for( int degL = 10; degL < 370; degL += 10) //Compass lines
  {
    float angleL = radians(degL);
    float x = 0 + (cos(angleL)* 120);
    float y = 0 + (sin(angleL)* 120);
    stroke(250);
    strokeWeight(2);
    line(0,0, x,y);
  }
  
  // Because the lines are radiating from the origin, they need to be
  // partially covered to make the dashed lines on the compass perimeter
  fill(50);  
  noStroke();
  ellipseMode(CENTER);
  ellipse(0,0, 193,193);
  
  // Load the font that will be used for the N,E,S,W markings
  letters = loadFont("Tunga-48.vlw");
  textAlign(CENTER);
  
  // Draw the letters
  fill(250);
  textFont(letters, 32);
  text("N", 1, -75);
  rotate(radians(90));
  text("E", 0, -75);
  rotate(radians(90));
  text("S", 0, -75);
  rotate(radians(90));
  text("W", 0, -75);
  rotate(radians(90));
  
  // Draw the little orange airplane in the middle of the compass face
  rotate(radians(-CompassX)); //make it stationary
  stroke(234,144,7);
  strokeWeight(3);
  beginShape(LINES);
  vertex(0, -70); vertex(0, -55);
  vertex(0, -55); vertex(-10, -35);
  vertex(-10, -35); vertex(-50, 0);
  vertex(-50, 0); vertex(-50, 13);
  vertex(-50, 13); vertex(-8, 0);
  vertex(-8, 0); vertex(-5, 35);
  vertex(-5, 35); vertex(-23, 50);
  vertex(-23, 50); vertex(-23, 60);
  vertex(-23, 60); vertex(-2, 55);
  vertex(-2, 55); vertex(0, 65);
  vertex(0, -55); vertex(10, -35);
  vertex(10, -35); vertex(50, 0);
  vertex(50, 0); vertex(50, 13);
  vertex(50, 13); vertex(8, 0);
  vertex(8, 0); vertex(5, 35);
  vertex(5, 35); vertex(23, 50);
  vertex(23, 50); vertex(23, 60);
  vertex(23, 60); vertex(2, 55);
  vertex(2, 55); vertex(0, 65);
  endShape();  
  // end airplane drawing
  //rotate(radians(CompassX));
  translate(-xx,-yy);
}
