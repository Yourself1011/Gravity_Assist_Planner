class Planet {
// FIELDS
  PVector pos;
  float pMass, radius ;
  float xVel;

  
  Planet(int xP, int yP, float m, float r, float xV ) {
    this.pos = new PVector (xP, yP);
    this.pMass = m;
    //this.col = c;
    this.radius = r;
    this.xVel = xV;
      
    }

  void drawPlanet() {
    fill(255);
    circle(this.pos.x, this.pos.y, this.radius);
    this.pos.x += xVel;
        
    }
}
