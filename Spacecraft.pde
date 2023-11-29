class Spacecraft extends GravityObject {
    // PVector force = new PVector(0, 0), vel = new PVector(0, 0), pos = new PVector(0, 0);

    Spacecraft() {
        super(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), 6500);
    }

    void reset(PVector pos, PVector vel) {
        this.pos[0] = pos;
        this.vel = vel;
    }

    void draw() {
        fill(#00FF00);
        circle(pos[0].x, pos[0].y, 2e5);
    }
}