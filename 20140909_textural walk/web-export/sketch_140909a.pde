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
  int opacity = 0;
  int strokeW = int(random(1,3));
  strokeWeight(strokeW);
  
  if (frameCount < 10000) {
      r = int(random(0,100));
      opacity = int(random(10,50));
  }
  if (frameCount > 10000) {
      r = int(random(100,200));
      opacity = int(random(50,75));
  }
  if (frameCount > 60000) {
      r = int(random(200,255));
      opacity = int(random(75,100));
  }
  
  stroke(r, opacity);
  curve(startx+5, starty+5, startx, starty, secondx, secondy, secondx, secondy);
  startx = secondx;
  starty = secondy;
}

void step() {
  int choice = int(random(4));
  int gridsize = int(random(1,20));

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
  size(350, 950);
  w = new Walker();
  smooth();
  background(255);
  frameRate(10000);
}

void draw() {
  w.step();
  if (frameCount < 50000) {
    w.display();
  }
  if (frameCount == 50000) {
    saveFrame(test.jpg);
  }
}
  

