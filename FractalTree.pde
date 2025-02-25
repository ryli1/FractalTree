private double fractionLength = .82; 
private int smallestBranch = 6; 
private double branchAngle = .2;  
public void setup() 
{   
  size(640, 640);    
  noLoop();
} 
public void draw() {   
  background(0);   
  stroke(#A58F7B);   
  strokeWeight(2);
  line(320, 640, 320, 540);   
  drawBranches(320, 540, 80, 3*PI/2);  //will add later
} 
public void drawBranches(int x, int y, double branchLength, double angle) {   
  double x2, x3;
  double y2, y3;
  double angle1 = angle-branchAngle;
  double angle2 = angle+branchAngle;
  x2 = x + (Math.cos(angle1) * branchLength);
  y2 = y + (Math.sin(angle1) * branchLength);
  x3 = x + (Math.cos(angle2) * branchLength);
  y3 = y + (Math.sin(angle2) * branchLength);
  if (branchLength <= 30) {
    stroke(#FCD8FF);
    strokeWeight(1);
  } else {  
    stroke(#A58F7B);   
    strokeWeight(2);
  }
  line(x, y, (float)x2, (float)y2);     
  line(x, y, (float)x3, (float)y3); 
  if (branchLength >= smallestBranch) {
    drawBranches((int)x2, (int)y2, branchLength*fractionLength, angle1-(Math.random()*PI/4));
    drawBranches((int)x3, (int)y3, branchLength*fractionLength, angle2+(Math.random()*PI/4));
  }
} 
