import g4p_controls.*;

Planet planet = new Planet(100, 200, 1000, 200, 1, 1);
Star [] stars = new Star [1000];

void setup() {
    fullScreen();
    createGUI();
    for(int i = 0; i < stars.length; i ++){
      stars[i] = new Star();
    }
}

void draw() {
    background(0);
    //drawing stars    
    for(int i = 0; i < stars.length; i++){
      stars[i].draw();
      stars[i].move();
      stars[i].update();
    }
    
    pushMatrix();
    scale(camera.zoom);
    planet.drawPlanet();
    translate(-camera.pos.x, -camera.pos.y);
    popMatrix();
    
}
