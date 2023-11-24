import g4p_controls.*;

Planet planet = new Planet();

void setup() {
    fullScreen();
    createGUI();
}

void draw() {
    pushMatrix();
    translate(50, 500);
    planet.draw();
    popMatrix();

}
