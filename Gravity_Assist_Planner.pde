import g4p_controls.*;

Planet planet = new Planet();

void setup() {
    fullScreen();
    createGUI();
}

void draw() {
    background(0);
    pushMatrix();
    translate(-camera.pos.x, -camera.pos.y);
    scale(camera.zoom);
    planet.draw();
    popMatrix();

}
