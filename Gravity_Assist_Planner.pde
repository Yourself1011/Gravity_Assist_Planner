import g4p_controls.*;
PImage photo;
boolean running;
boolean instruct;

Planet planet = new Planet(0, 0, 5.972e24, 6378100, 0, 0);
Spacecraft spacecraft = new Spacecraft(#00FF00), spacecraft2 = new Spacecraft(#0000FF);
Star [] stars = new Star [1000];
float t = 1.0/1000, dt = 1, prevDt = 1;
int prevFrame, frameLength;
float[] mults = {1, 0.5, 0.5, 1}; // multipliers for rk4

final float G = 6.6743e-11;

void setup() {
    fullScreen();
    photo = loadImage("spacey.png");
    running = false;
    instruct = false;
    createGUI();

    for(int i = 0; i < stars.length; i ++){
      stars[i] = new Star();
    }
    // spacecraft.set(new PVector(planet.radius + 422000, 0), new PVector(0, 27600/3.6), 450000, 100);
    // spacecraft2.set(new PVector(planet.radius + 422000, 0), new PVector(0, 27600/3.6), 450000, 100);
    spacecraft.set(new PVector(-planet.radius - 384400000, 0), new PVector(0, -1022), 7.342e22, 1738100); // moon
    // spacecraft2.set(new PVector(planet.radius + 384400000, 0), new PVector(0, 1022), 7.342e22, 1738100);

    planet.image = loadImage("earth.png");
    spacecraft.image = loadImage("voyager_1.png");
    camera.translate(-width/2, -height/2);
    prevFrame = millis();
}

void draw() {
  background(0);
  //Intro Screen 
  if(running == false){
    
    //stars 
    for(int i = 0; i < 1000; i++){
       circle(random(0,width), random(0, height), random(0, 3));
    }
       
    //setting the GUI not visible 
    spMass.setVisible(false);
    planetMass.setVisible(false);
    spPreset.setVisible(false);
    pPreset.setVisible(false);
    spInitialSpeed.setVisible(false);
    pOrbitSpeed.setVisible(false);
    spInitialPos.setVisible(false);
    spInitialAngle.setVisible(false);
    pRadius.setVisible(false);
    Demo1.setVisible(false);
    demo2.setVisible(false);
    demo3.setVisible(false);
    demo4.setVisible(false);
    textSize(35);
    textAlign(CENTER);
    image(photo, width/2, height/2);
    imageMode(CENTER);
    text("G.A.P: Gravity Assist Planner", width/2, height/1.6);
    
    textSize(25);
    text("Press Enter to Start", width/2, height/1.15);  
    text("Press the right arrow to read instructions", width/2, height/1.1);
    
    if(instruct == true){
      background(0);
      textSize(35);
      textAlign(CENTER);
      text("How to use the Gravity Assist Planner", width/2, height/5);
      textSize(30);
      text("Adjust the sliders to plan out your desired gravity assist route.", width/2, height/3);
      text("Use the demos to get inspired!", width/2, height/2.5);
      textSize(25);
      text("Press the left arrow to go back", width/2, height/2);
    }
  }
  
    else{
    frameLength = min(millis() - prevFrame, 100);
    prevFrame = millis();
    prevDt = dt;
    dt = frameLength * t;

    // for (int i = 0; i < 4; ++i) {
    //   planet.kn(i, spacecraft, mults[i]);
    //   spacecraft.kn(i, planet, mults[i]);
    // }
    // spacecraft2.kn(0, planet, 1);
    // planet.move();
    // spacecraft.move();
    // spacecraft2.eulerIntegrate();
    // planet.velVerlet(spacecraft);
    // spacecraft.velVerlet(planet);
    planet.leapFrog(spacecraft);
    spacecraft.leapFrog(planet);

    camera.pos.add(PVector.mult(planet.vel, dt));

    ellipseMode(CENTER);
    imageMode(CENTER);
    //drawing stars
    pushMatrix();
    scale(camera.zoom);
    translate(-camera.pos.x, -camera.pos.y);
    
    for(int i = 0; i < stars.length; i++){
      stars[i].move();
      stars[i].update();
      stars[i].draw();
    }
    planet.drawPlanet();

    spacecraft.draw();
    // spacecraft2.draw();

    popMatrix();


    drawScale();
    fill(255);
  }
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
  spacecraft.pos[0].set(spInitialPos.getValueF() - planet.radius, 1e7 + planet.radius);
}

void setSPValues(int sPmass, int initialSpeed, int initialPos, int initialAngle ){
  spMass.setValue(sPmass);
  spInitialSpeed.setValue(initialSpeed);
  spInitialPos.setValue(initialPos);
  spInitialAngle.setValue(initialAngle);
  
}

void drawScale() {
    float count = 85/camera.zoom;
    String unit = "m";
    if (count > 1000) {
        count /= 1000;
        unit = "km";
    }

    float power = pow(10, ceil(log(count) / log(10))) / 2;
    count = ceil(count / power) * power;
    float metres = unit.equals("m") ? count : count * 1000;
    float len = metres * camera.zoom;

    fill(255);
    stroke(255);
    textSize(24);
    textAlign(CENTER, BOTTOM);
    line(20, height - 50, 20 + len, height - 50);
    text("0" + unit, 20, height - 10);
    line(20, height - 55, 20, height - 45);
    text(count + unit, 20 + len, height - 10);
    line(20 + len, height - 55, 20 + len, height - 45);

    int numTicks = len / 5 > 50 ? 10 : 5;

    for (float x = len / numTicks; x < len; x += len / numTicks) {
        line(20 + x, height - 53, 20 + x, height - 47);
    }

}
