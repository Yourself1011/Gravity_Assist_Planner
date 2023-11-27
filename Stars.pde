class Star{
  float x;
  float y;
  float s;
  PVector velocity, accelerate;
  PVector location;
  
 Star(){
   location = new PVector(random(0,width), random(0,height));
   s = random(0, 5);
 }
 
 void draw(){
   fill(255);
   circle(location.x,location.y,s);

 }
 
 void move(){
   accelerate = new PVector(random(-0.01,0.01), random(-0.1, 0.1));
   velocity = new PVector(0,0);
 }
 
 void update(){
   velocity.add(accelerate);
   location.add(velocity);   
 }


}
