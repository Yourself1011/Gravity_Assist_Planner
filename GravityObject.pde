class GravityObject {
    PVector[] kVel, pos;
    PVector vel, force, prevForce;
    float mass;

    GravityObject(PVector force, PVector vel, PVector pos, float mass) {
        this.force = force;
        this.kVel = new PVector[] {
            vel.copy(),
            vel.copy(),
            vel.copy(),
            vel.copy(),
        };
        this.vel = vel;
        this.pos = new PVector[] {
            pos.copy().add(vel),
            pos.copy(),
            pos.copy(),
            pos.copy(),
        };
        this.mass = mass;
    }

    void kn(int n, GravityObject target, float mult) { // find k of n in Runge-Kutta 4 (was not effective for this)
        if (n > 0) {
            pos[n] = PVector.add(pos[0], PVector.mult(kVel[n - 1], dt*mult));
        }
        
        force.set(0, 0);
        force.add(
            PVector.sub(target.pos[n], pos[n])
            .setMag(G*mass*target.mass/pow(PVector.dist(pos[n], target.pos[n]), 2))
        );

        kVel[n] = PVector.add(n < 1 ? vel : kVel[n-1], force.mult(dt/mass));
    }

    void velVerlet(GravityObject target) { // was not effective either
        force.set(0, 0);
        force.add(
            PVector.sub(target.pos[0], pos[0])
            .setMag(G*mass*target.mass/pow(PVector.dist(pos[0], target.pos[0]), 2))
        );

        pos[2] = pos[0].copy();
        pos[0].add(PVector.sub(pos[0], pos[1]).mult(dt / prevDt)).add(force.mult(dt*dt/mass));
        vel = PVector.sub(pos[0], pos[2]).div(dt);
        pos[1] = pos[2];
    }

    void leapFrog(GravityObject target) { // works fine
        kVel[0] = PVector.add(vel, PVector.mult(force, dt/(mass*2)));
        pos[0].add(PVector.mult(kVel[0], dt));
        
        force.set(0, 0);
        force.add(
            PVector.sub(target.pos[0], pos[0])
            .setMag(G*mass*target.mass/pow(PVector.dist(pos[0], target.pos[0]), 2))
        );
        vel = kVel[0].add(PVector.mult(force, dt/(mass*2)));
    }

    void move() { // used for rk4
        vel = (PVector.add(kVel[0], PVector.mult(kVel[1], 2)).add(PVector.mult(kVel[2], 2)).add(kVel[3])).div(6);

        pos[0].add(PVector.mult(vel, dt));
    }

    void eulerIntegrate() {
        vel = kVel[0].copy();

        pos[0].add(PVector.mult(vel, dt));
    }
}