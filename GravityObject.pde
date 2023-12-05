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

    void kn(int n, GravityObject target, float mult) { // find k of n in Runge-Kutta 4
        if (n > 0) {
            pos[n] = PVector.add(pos[0], PVector.mult(kVel[n - 1], dt*mult));
            // println(n, pos[n], kVel[n - 1]);
        }
        
        force.set(0, 0);
        force.add(
            PVector.sub(target.pos[n], pos[n])
            .setMag(G*mass*target.mass/pow(PVector.dist(pos[n], target.pos[n]), 2))
        );
        // println(G*mass*target.mass/pow(PVector.dist(pos[n], target.pos[n]), 2));
        // println(pos[n], target.pos[n], pow(PVector.dist(pos[n], target.pos[n]), 2));
        // println(mass, target.mass, (double) mass*target.mass, pow(PVector.dist(pos[n], target.pos[n]), 2), force, PVector.mult(force, dt/mass));

        kVel[n] = PVector.add(n < 1 ? vel : kVel[n-1], force.mult(dt/mass));
        // stroke(255);
        // line(pos[n].x, pos[n].y, pos[n].x + kVel[n].x * t * frameLength * 10, pos[n].y + kVel[n].y * t * frameLength * 10);
        // println(n < 1 ? vel : kVel[n-1], force, kVel[n]);
        // kVel[n] = PVector.add(vel, force.mult(dt/mass));
    }

    void velVerlet(GravityObject target) {
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

    void leapFrog(GravityObject target) {
        // prevForce = force.copy();

        kVel[0] = PVector.add(vel, PVector.mult(force, dt/(mass*2)));
        pos[0].add(PVector.mult(kVel[0], dt));
        
        force.set(0, 0);
        force.add(
            PVector.sub(target.pos[0], pos[0])
            .setMag(G*mass*target.mass/pow(PVector.dist(pos[0], target.pos[0]), 2))
        );
        vel = kVel[0].add(PVector.mult(force, dt/(mass*2)));
    }

    void move() {
        vel = (PVector.add(kVel[0], PVector.mult(kVel[1], 2)).add(PVector.mult(kVel[2], 2)).add(kVel[3])).div(6);
        // vel = kVel[3].copy();

        pos[0].add(PVector.mult(vel, dt));
    }

    void eulerIntegrate() {
        vel = kVel[0].copy();

        pos[0].add(PVector.mult(vel, dt));
    }
}