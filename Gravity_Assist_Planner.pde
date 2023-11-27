import g4p_controls.*;

Planet planet = new Planet();
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
    planet.draw();
    popMatrix();
    
    for(int i = 0; i < stars.length; i++){
      stars[i].draw();
      stars[i].move();
      stars[i].update();
    }

}
