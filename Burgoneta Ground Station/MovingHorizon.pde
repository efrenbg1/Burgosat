void movingHorizon()
{
  float xx =200;
  float yy = 585;
  translate(xx,yy);
  // This is the function containing everything that has to
  // do with the moving parts of the artificial horizon
  
  //float newX = map(, 0, 300, -150, 150);
  //println("newX = " + newX);
  //sky
  noStroke();
  fill(30,143,198);
  quad(25,25, 275,25, 275,newY+newX, 25,newY-newX);
  
  //ground
  fill(183,113,28);
  quad(25,newY-newX, 275,newY+newX, 275,275, 25,275);
  
  // white line
  stroke(250);
  line(25,newY-newX, 275,newY+newX); // tilting line
  
  // non tilting lines
  strokeWeight(2);
  // This is here so you can easily change the width of the gap
  // between the white lines
  translate(0,0);
  int gap = 13;
  line(115, newY+6*gap, 185, newY+6*gap);
  line(140, newY+5*gap, 160, newY+5*gap);
  line(120, newY+4*gap, 180, newY+4*gap);
  line(140, newY+3*gap, 160, newY+3*gap);
  line(125, newY+2*gap, 175, newY+2*gap);
  line(140, newY+1*gap, 160, newY+1*gap);
  line(140, newY-1*gap, 160, newY-1*gap);
  line(125, newY-2*gap, 175, newY-2*gap);
  line(140, newY-3*gap, 160, newY-3*gap);
  line(120, newY-4*gap, 180, newY-4*gap);
  line(140, newY-5*gap, 160, newY-5*gap);
  line(115, newY-6*gap, 185, newY-6*gap);
  translate(-xx,-yy);
}

void frame()
{
  float yyy = 886;
  float xxx = 200;
  translate(xxx,yyy);
  rotate(-PI/2);
  fill(183,113,28);
  strokeWeight(1);
  stroke(25);
 
  
  float xxxx = 300;
  float yyyy = 0;
  translate(xxxx,yyyy);
  rotate(PI/2);
   
  beginShape();
  vertex(25,150);
  vertex(49,150);
  bezierVertex(49,180, 70,250, 150,245);
  vertex(25,245);
  endShape();
  
  beginShape();
  vertex(275,150);
  vertex(250,150);
  bezierVertex(251,180, 230,250, 150,245);
  vertex(275,245);
  endShape();
  fill(30,143,198);
 
  beginShape();
  vertex(25,150);
  vertex(49,150);
  bezierVertex(53,18, 246,18, 250,150);
  vertex(275,150);
  bezierVertex(265,-20, 35,-20, 25,150);
  endShape();
  
  fill(250);
  noStroke();
  triangle(150,50, 140,30, 160,30); 
  stroke(250);
  strokeWeight(4);
  line(25,150, 49,150);
  line(251,150, 275,150);
  strokeWeight(4);
  fill(25);
  stroke(25);
  line(150,150, 150,200);
  triangle(150,200, 125,250, 175,250);
 
   
  beginShape();
  vertex(60, 245);
  vertex(0, 300);
  vertex(300, 300);
  vertex(240, 245);
  endShape(CLOSE);
  beginShape(LINES);
  vertex(90, 150);
  vertex(125, 150);
  vertex(125, 150);
  vertex(150, 170);
  vertex(150, 170);
  vertex(175, 150);
  vertex(175, 150);
  vertex(210, 150);
  endShape();
  
  ellipseMode(CENTER);
  noFill();
  stroke(25);
  strokeWeight(3);
  ellipse(150, 150, 200, 200);
  rotate(-PI/2);
  translate(-xxxx,-yyyy);
  
  
  
  fill(75);
  noStroke();
  beginShape();
  vertex(25,275);
  vertex(300,275);
  vertex(300,300);
  vertex(25,300);
  endShape();
  
  beginShape();
  vertex(25,300);
  vertex(25,0);
  vertex(0,0);
  vertex(0,300);
  endShape();
  beginShape();
  vertex(0,0);
  vertex(275,0);
  vertex(275,25);
  vertex(0,25);
  endShape();
  
  beginShape();
  vertex(275,0);
  vertex(300,0);
  vertex(300,275);
  vertex(275,275);
  endShape();
  
  
  fill(75);
  stroke(75);
  
  beginShape();
  vertex(150, 25);
  bezierVertex(-16,25, -16,275, 150, 275);
  vertex(150,275);
  vertex(25,275);
  vertex(25,25);
  endShape();
  fill(75);
  
  beginShape();
  vertex(150, 25);
  bezierVertex(316,25, 316,275, 150, 275);
  vertex(150,275);
  vertex(275,275);
  vertex(275,25);
  endShape();
  
  ellipseMode(CENTER);
  noFill();
  stroke(25);
  strokeWeight(2);
  ellipse(150, 150, 250, 250);
  translate(0,300);
  fill(75);
  noStroke();
  
  beginShape();
  vertex(25,275);
  vertex(300,275);
  vertex(300,300);
  vertex(25,300);
  endShape();
  
  beginShape();
  vertex(25,300);
  vertex(25,0);
  vertex(0,0);
  vertex(0,300);
  endShape();
  
  beginShape();
  vertex(0,0);
  vertex(275,0);
  vertex(275,25);
  vertex(0,25);
  endShape();
  
  beginShape();
  vertex(275,0);
  vertex(300,0);
  vertex(300,275);
  vertex(275,275);
  endShape();
  
  stroke(75);
  beginShape();
  vertex(150, 25);
  bezierVertex(-16,25, -16,275, 150, 275);
  vertex(150,275);
  vertex(25,275);
  vertex(25,25);
  endShape();
  
  beginShape();
  vertex(150, 25);
  bezierVertex(316,25, 316,275, 150, 275);
  vertex(150,275);
  vertex(275,275);
  vertex(275,25);
  endShape();
  rotate(PI/2);
  translate(-xxx,-yyy);
}
