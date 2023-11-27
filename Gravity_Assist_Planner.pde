import g4p_controls.*;

Planet planet = new Planet(100, 200, 5.972e24, 6378100, 1, 1);
Spacecraft spacecraft = new Spacecraft();
Star [] stars = new Star [1000];

final float G = 6.6743e-11;

void setup() {
    fullScreen();
    createGUI();
    for(int i = 0; i < stars.length; i ++){
      stars[i] = new Star();
    }
    spacecraft.reset(new PVector(6378110, 0), new PVector(0, 7500));
}

void draw() {
    ellipseMode(CENTER);
    background(0);
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.pos.x, -camera.pos.y);
    planet.drawPlanet();
    
    for(int i = 0; i < stars.length; i++){
      stars[i].draw();
      stars[i].move();
      stars[i].update();
    }

    spacecraft.draw();

    popMatrix();
}
