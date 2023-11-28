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
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.pos.x, -camera.pos.y);
    popMatrix();
    
    for(int i = 0; i < stars.length; i++){
      stars[i].draw();
      stars[i].move();
      stars[i].update();
    }
    planet.drawPlanet();

}
