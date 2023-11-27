class Planet {
// FIELDS
  PVector pos;
  float mass, radius ;
  float xVel, yVel;

  
  Planet(int xP, int yP, float m, float r, float xV, float yV ) {
    this.pos = new PVector (xP, yP);
    this.mass = m;
    //this.col = c;
    this.radius = r;
    this.xVel = xV;
    this.yVel = yV;
      
    }

  void drawPlanet() {
    fill(255);
    circle(this.pos.x, this.pos.y, this.radius);
    this.pos.x += xVel;
        
    }
}
