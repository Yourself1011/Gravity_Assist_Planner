import g4p_controls.*;
PImage photo;
boolean running;
boolean instruct;

Planet planet = new Planet(100, 200, 5.972e24, 6378100, 29800, 1);
Spacecraft spacecraft = new Spacecraft();
Star [] stars = new Star [1000];
float t = 0.5;
int prevFrame, frameLength;
float[] mults = {0.5, 0.5, 1, 1}; // multipliers for rk4

final float G = 6.6743e-11;

void setup() {
    fullScreen();
    photo = loadImage("spacey.png");
    running = false;
    instruct = false;
    // createGUI();
    for(int i = 0; i < stars.length; i ++){
      stars[i] = new Star();
    }
    spacecraft.set(new PVector(6795600, 0), new PVector(29800, 26700/3.6), 450000);
    camera.translate(-width/2, -height/2);
    prevFrame = millis();
}

void draw() {
  //Intro Screen for now
  if(running == false){
    background(0);
    image(photo, width/2, height/2);
    text("Press Enter to Start", 200, 600);  
    text("Press the right arrow to read instructions", 400, 600);
    
    if(instruct == true){
      background(0);
      text("Blah blah", 200, 600);
      text("Press the left arrow to go back", 400, 600);
    }
  }
  
  else{
    frameLength = millis() - prevFrame;
    prevFrame = millis();

    for (int i = 0; i < 4; ++i) {
      planet.kn(i, spacecraft, mults[i]);
      spacecraft.kn(i, planet, mults[i]);
    }
    planet.move();
    spacecraft.move();

    camera.pos.add(PVector.mult(planet.vel, t*frameLength));

    ellipseMode(CENTER);
    background(0);
    //drawing stars
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.pos.x, -camera.pos.y);
    
    for(int i = 0; i < stars.length; i++){
      stars[i].move();
      stars[i].update();
      stars[i].draw();
    }
    planet.drawPlanet();

    spacecraft.draw();

    popMatrix();
  }
}


//Keys for Intro Screen
void keyPressed(){
  if(keyCode == ENTER){
    running = true;
  }
  
  if(keyCode == RIGHT){
    instruct = true;
  }
  
  if(keyCode == LEFT){
    instruct = false;
  }
}
