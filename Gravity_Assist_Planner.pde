import g4p_controls.*;

Planet planet = new Planet(100, 200, 1000, 200, 1, 1);

void setup() {
    fullScreen();
    createGUI();
    
}

void draw() {
    background(0);
    pushMatrix();
    translate(-camera.pos.x, -camera.pos.y);
    scale(camera.zoom);
    planet.drawPlanet();
    popMatrix();

}
