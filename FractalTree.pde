private double fractionLength = .82; 
private int smallestBranch = 6; 
private double branchAngle = .2;
public ArrayList <Branch> branches = new ArrayList <Branch>();

public void setup() {   
  size(740, 640);
  noLoop();
} 

public void draw() {   
  background(#17446F);   
  stroke(#6f4c36);   
  strokeWeight(4);
  line(370, 640, 370, 540);   
  drawBranches(370, 540, 80, 3*PI/2);
  for(Branch b : branches) {
    b.show(); 
  }
}

public void mousePressed() {
  redraw(); 
}

public void drawBranches(int x, int y, double branchLength, double angle) {   
  double x2, x3;
  double y2, y3;
  double angle1 = angle-branchAngle-(Math.random()*PI/4);
  double angle2 = angle+branchAngle+(Math.random()*PI/4);
  x2 = x + (Math.cos(angle1) * branchLength);
  y2 = y + (Math.sin(angle1) * branchLength);
  x3 = x + (Math.cos(angle2) * branchLength);
  y3 = y + (Math.sin(angle2) * branchLength);
  if (branchLength <= 20) {
    if ((int)(Math.random()*5) == 0) {
      stroke(#620d24);
    } else {
      stroke(#f4e7ee);
    }
    strokeWeight(1);
  } else {  
    stroke(#6f4c36);   
    strokeWeight(3);
  }
  line(x, y, (float)x2, (float)y2);  
  if (branchLength <= 20) {
    if ((int)(Math.random()*5) == 0) {
      stroke(#620d24);
    } else {
      stroke(244, 231, 238, 150);
    }
    strokeWeight(1);
  } else {  
    stroke(#6f4c36);   
    strokeWeight(3);
  }
  line(x, y, (float)x3, (float)y3); 
  if (branchLength >= smallestBranch) {
    drawBranches((int)x2, (int)y2, branchLength*fractionLength, angle1);
    drawBranches((int)x3, (int)y3, branchLength*fractionLength, angle2);
  }
} 

public class Branch {
  public float x1, x2, y1, y2;
  public Branch(float x1, float x2, float y1, float y2) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
  }
  public void show() {
    line(x1, y1, x2, y2); 
  }
}
