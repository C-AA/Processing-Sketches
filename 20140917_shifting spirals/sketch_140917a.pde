void setup() {
  size(1000,1000);
  background(255);
}

void draw(){
  noLoop();
  translate(width/2, height/2);
  smooth(4);
  noFill();
  int x = 0;
  

  strokeCap(PROJECT);
 int oldStep = 1;
 int step = 5;
 while (x <= 1000){
 pushMatrix();
   oldStep = step;
   
   step = int(random(10,20));
   
   strokeWeight((oldStep/2));
   stroke(0, 0, int(random(0,255)), int(random(0,100)));
   int randomA = int(random(-180,180));
   rotate(radians(randomA));
   noFill();
   arc(0,0, x, x, 0,PI);
   print(x, "\n");
 popMatrix();
 x = x + step;
 }

}
