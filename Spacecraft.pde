class Spacecraft extends GravityObject {
    float radius;
    color col;
    boolean exploded;
    final int numSpikes = 12;
    float[] lengths = new float[numSpikes];
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
        if (exploded) {
            fill(#FFFF00);
            beginShape();
            for (int i = 0; i < numSpikes; i++) {
                PVector spikePos = new PVector(0, lengths[i] * 2).rotate(2*PI / numSpikes * i).add(pos[0]);
                vertex(spikePos.x, spikePos.y);
            }
            endShape(CLOSE);
            fill(#FF8800);
            beginShape();
            for (int i = 0; i < numSpikes; i++) {
                PVector spikePos = new PVector(0, lengths[i]).rotate(2*PI / numSpikes * i).add(pos[0]);
                vertex(spikePos.x, spikePos.y);
            }
            endShape(CLOSE);
        } else if (5/camera.zoom > radius*2) {
            fill(col);
            circle(pos[0].x, pos[0].y, 10/camera.zoom);
        } else {
            image(image, pos[0].x, pos[0].y, radius*2, radius*2);
            // fill(#FFFF00);
            // circle(pos[0].x, pos[0].y, radius*2);

        }

        if (!exploded && pos[0].dist(planet.pos[0]) <= radius + planet.radius) {
            for (int i = 0; i < numSpikes; i++) {
                lengths[i] = abs(randomGaussian() * 5e4) + 1e5;
            }
            exploded = true;
        }
    }
}