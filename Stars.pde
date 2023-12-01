class Star{
  float x;
  float y;
  float s;
  PVector velocity, accelerate, location;

 Star(){
   location = new PVector(random(-1e8,1e8), random(-1e8,1e8));
   s = random(5e4, 1e5);
   velocity = planet.vel.copy().add(random(-500, -1000), 0);
 }
 
 void draw(){
   fill(255);
   noStroke();
   circle(location.x,location.y,s);
 }
 
 void move(){
   accelerate = new PVector(0,0);
 }
 
 void update(){
   velocity.add(PVector.mult(accelerate, dt));
   location.add(PVector.mult(velocity, dt));   
 }
 //move x position of stars so it doesn't go off screen
}
