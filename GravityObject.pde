class GravityObject {
    PVector[] kVel, pos;
    PVector vel, force;
    float mass;

    GravityObject(PVector force, PVector vel, PVector pos, float mass) {
        this.force = force;
        this.kVel = new PVector[] {
            vel,
            vel,
            vel,
            vel,
        };
        this.vel = vel;
        this.pos = new PVector[] {
            pos,
            new PVector(0, 0),
            new PVector(0, 0),
            new PVector(0, 0),
        };
        this.mass = mass;
    }

    void kn(int n, GravityObject target, float mult) { // find k of n in Runge-Kutta 4
        force.set(0, 0);
        force.add(
            PVector.sub(target.pos[n], pos[n])
            .setMag(G*mass*target.mass/pow(PVector.dist(pos[n], target.pos[n]), 2))
        );

        kVel[n] = PVector.add(vel, force.mult(t*frameLength/mass));
        if (n < 3) {
            pos[n + 1] = PVector.add(pos[0], PVector.mult(kVel[n], t*frameLength*mult));
        } 
    }

    void move() {
        vel = (PVector.add(kVel[0], PVector.mult(kVel[1], 2)).add(PVector.mult(kVel[2], 2)).add(kVel[3])).div(6);

        pos[0].add(PVector.mult(vel, t*frameLength));
    }
}