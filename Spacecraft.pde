class Spacecraft extends GravityObject {
    float radius;
    color col;
    PImage image;

    Spacecraft(color col) {
        super(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), 0);
        this.col = col;
    }

    void set(PVector pos, PVector vel, float m, float r) {
        this.pos = new PVector[] {
            pos.copy().add(vel),
            pos.copy(),
            pos.copy(),
            pos.copy(),
        };
        this.vel = vel;
        this.mass = m;
        this.radius = r;
    }

    void draw() {
        if (5/camera.zoom > radius*2) {
            fill(col);
            circle(pos[0].x, pos[0].y, 10/camera.zoom);
        } else {
            image(image, pos[0].x, pos[0].y, radius*2, radius*2);
            // fill(#FFFF00);
            // circle(pos[0].x, pos[0].y, radius*2);

        }
    }
}