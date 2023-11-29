import g4p_controls.*;
PImage photo;
boolean running;
boolean instruct;

Planet planet = new Planet(100, 200, 5.972e24, 6378100, 29800, 1);
Spacecraft spacecraft = new Spacecraft();
Star [] stars = new Star [1000];
float t = 1.0/1000;
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
    spacecraft.set(new PVector(planet.radius + 422000, 0), new PVector(29800, 27600/3.6), 450000, 100);
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

    drawScale();
}

void drawScale() {
    float count = 85/camera.zoom;
    String unit = "m";
    if (count > 1000) {
        count /= 1000;
        unit = "km";
    }

    float power = pow(10, ceil(log(count) / log(10))) / 2;
    count = ceil(count / power) * power;
    float metres = unit.equals("m") ? count : count * 1000;
    float len = metres * camera.zoom;

    fill(255);
    stroke(255);
    textSize(24);
    textAlign(CENTER, BOTTOM);
    line(20, height - 50, 20 + len, height - 50);
    text("0" + unit, 20, height - 10);
    line(20, height - 55, 20, height - 45);
    text(count + unit, 20 + len, height - 10);
    line(20 + len, height - 55, 20 + len, height - 45);

    for (float x = len / 5; x < len; x += len / 5) {
        line(20 + x, height - 53, 20 + x, height - 47);
    }
}