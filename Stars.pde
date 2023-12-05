class Star{
  float x;
  float y;
  float s;
  int edge = 50;
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
   //if star location is less than 0, it'll reset it's position
   if(location.x < camera.pos.x - width / camera.zoom){
     location.x = camera.pos.x + width / camera.zoom;//+edge;
   }
   
   velocity.add(PVector.mult(accelerate, dt));
   location.add(PVector.mult(velocity, dt));   

 }
}
