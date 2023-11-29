class Spacecraft extends GravityObject {
    float radius;

    Spacecraft() {
        super(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), 0);
    }

    void set(PVector pos, PVector vel, float m, float r) {
        this.pos[0] = pos;
        this.vel = vel;
        this.mass = m;
        this.radius = r;
    }

    void draw() {
        if (10/camera.zoom > radius) {
            fill(#00FF00);
            circle(pos[0].x, pos[0].y, 10/camera.zoom);
        } else {
            // image here
            fill(#FFFF00);
            circle(pos[0].x, pos[0].y, radius);

        }
    }
}