import g4p_controls.*;

Planet planet = new Planet(100, 200, 5.972e24, 6378100, 1000, 1);
Spacecraft spacecraft = new Spacecraft();
Star [] stars = new Star [1000];
float t = 0.5;
int prevFrame = 0, frameLength;
float[] mults = {0.5, 0.5, 1, 1}; // multipliers for rk4

final float G = 6.6743e-11;

void setup() {
    fullScreen();
    // createGUI();
    for(int i = 0; i < stars.length; i ++){
      stars[i] = new Star();
    }
    spacecraft.reset(new PVector(7378100, 0), new PVector(0, 7500));
    prevFrame = millis();
}

void draw() {
    frameLength = millis() - prevFrame;
    prevFrame = millis();

    ellipseMode(CENTER);
    background(0);
    //drawing stars
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.pos.x, -camera.pos.y);
    for (int i = 0; i < 4; ++i) {
      planet.kn(i, spacecraft, mults[i]);
      spacecraft.kn(i, planet, mults[i]);
    }

    planet.drawPlanet();
    
    for(int i = 0; i < stars.length; i++){
      stars[i].draw();
      stars[i].move();
      stars[i].update();
    }
    planet.drawPlanet();

    spacecraft.draw();

    popMatrix();
}
