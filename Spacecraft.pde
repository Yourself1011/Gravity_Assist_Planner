class Spacecraft extends GravityObject {

    Spacecraft() {
        super(new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), 0);
    }

    void set(PVector pos, PVector vel, float m) {
        this.pos[0] = pos;
        this.vel = vel;
        this.mass = m;
    }

    void draw() {
        fill(#00FF00);
        circle(pos[0].x, pos[0].y, 2e5);
    }
}