class Planet {
// FIELDS
  PVector pos;
  int mass, radius ;
  float xVel, yVel;

  
  Planet(int xP, int yP, int m, int r, float xV, float yV ) {
    this.pos = new PVector (xP, yP);
    this.mass = m;
    //this.col = c;
    this.radius = r;
    this.xVel = xV;
    this.yVel = yV;
      
    }

  void drawPlanet() {
    circle(this.pos.x, this.pos.y, this.radius);
    this.pos.x += xVel;
        
    }
}
