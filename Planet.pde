 class Planet extends GravityObject {
// FIELDS
  float radius;

  
  Planet(int xP, int yP, float m, float r, float xV, float yV ) {
    super(new PVector(0, 0), new PVector(xV, yV), new PVector(xP, yP), m);
    //this.col = c;
    this.radius = r;

    }

  void drawPlanet() {
    fill(255);
    circle(this.pos[0].x, this.pos[0].y, this.radius * 2);
    }
}
