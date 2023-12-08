void setUnits() {
    spMass.setUnits("kg");
    planetMass.setUnits("kg");
    spInitialSpeed.setUnits("m/s");
    pOrbitSpeed.setUnits("m/s");
    spInitialPos.setUnits("m");
    spInitialAngle.setUnits("°");
    pRadius.setUnits("m");
    tValue.setUnits("x");
}

void getpValues() {
  planet.mass = pow(10, planetMass.getValueF());
  planet.vel.set(0, 0);
  camera.pos.sub(planet.pos[0].x, planet.pos[0].y);
  planet.pos[0].set(0, 0);
  planet.radius = pRadius.getValueF() * 1000000;
}

void setPValues(float pMass, float pVel, float r ) {
  planetMass.setValue(log(pMass)/log(10));
  pOrbitSpeed.setValue(pVel);
  pRadius.setValue(r);
  
}

void getspValues(){
  spacecraft.mass = spMass.getValueF();
  spacecraft.vel.set(-spInitialSpeed.getValueF(), 0).rotate(radians(spInitialAngle.getValueF())).add(planet.vel);
  spacecraft.pos[0].set(-spInitialPos.getValueF() - planet.radius, 2e7 + planet.radius);
  spacecraft.exploded = false;
}

void setSPValues(int sPmass, int initialSpeed, int initialPos, int initialAngle ){
  spMass.setValue(sPmass);
  spInitialSpeed.setValue(initialSpeed);
  spInitialPos.setValue(initialPos);
  spInitialAngle.setValue(initialAngle);
  
}