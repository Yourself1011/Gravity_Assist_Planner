import g4p_controls.*;

Planet planet = new Planet();

void setup() {
    fullScreen();
    createGUI();
}

void draw() {
    background(0);
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.pos.x, -camera.pos.y);
    planet.draw();
    popMatrix();

}
