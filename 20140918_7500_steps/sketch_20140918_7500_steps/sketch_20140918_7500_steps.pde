class Walker {
  int startx = 0;
  int starty = 0;
  int secondx = 0;
  int secondy = 0;


Walker() {
  startx = width/2;
  starty = height/2;
  secondx = startx + 1;
  secondy = starty + 1;
}

void display(){
  
  int r = 0;
  int opacity = 100;
  int strokeW = 1;
  

  
  if (frameCount < 10000) {
      r = int(random(1,200));
     opacity = int(random(10,50));
      strokeW = int(random(1,4));
        stroke(r, opacity);
  }
  if (frameCount > 25000) {
      r = int(random(100,200));
     opacity = int(random(50,75));
      strokeW = int(random(1,3));
        stroke(r, opacity);
  }
  if (frameCount > 50000) {
      r = int(random(0,100));
      opacity = int(random(75,100));
      strokeW = int(random(1,2));
        stroke(r, 0, 0, opacity);
  }
  strokeWeight(strokeW);  
  int curveDelta = 1;
  curve(startx+curveDelta, starty+curveDelta, startx, starty, secondx, secondy, secondx+curveDelta, secondy+curveDelta);
  startx = secondx;
  starty = secondy;
}

void step() {
  int choice = int(random(4));
  int gridsize = int(random(10,20));

if (choice == 0) {
  secondx = secondx - gridsize ;
} else if (choice == 1) {
  secondx = secondx + gridsize;
} else if (choice == 2) {
  secondy = secondy + gridsize;
} else {
  secondy = secondy - gridsize;
}

if (secondy > height) {
  secondy = height; 
}

if (secondx >  width) {
  secondx = width;
}

if (secondy < 0) {
  secondy = 0; 
}

if (secondx < 0) {
  secondx = 0;
}
}
}

Walker w;

void setup() {
  // size(700, 1900);
  size(1900,1300);
  w = new Walker();
  smooth();
  background(255);
  frameRate(10000);
}

void draw() {
  w.step();
  int maxsteps = 75000;
  if (frameCount < maxsteps) {
    w.display();
  }
  if (frameCount == maxsteps) {
    saveFrame("9112014_5.bmp");
  }
}
  
