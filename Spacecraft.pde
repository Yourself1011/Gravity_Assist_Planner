class Spacecraft {
    PVector force = new PVector(0, 0), vel = new PVector(0, 0), pos = new PVector(0, 0);
    float mass = 6500;

    Spacecraft() {

    }

    void reset(PVector pos, PVector vel) {
        this.pos = pos;
        this.vel = vel;
    }

    void draw() {
        force.add(
            PVector.sub(planet.pos, pos)
            .setMag(G*mass*planet.mass/pow(PVector.dist(pos, planet.pos), 2))
        );

        println(pos, vel, force, PVector.dist(pos, planet.pos));
        vel.add(force.div(mass));
        pos.add(vel);

        force.set(0, 0);

        fill(#00FF00);
        circle(pos.x, pos.y, 1e5);
    }
}