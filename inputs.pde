void mouseDragged() {
    camera.translate(pmouseX - mouseX, pmouseY - mouseY);
}

void mouseWheel(MouseEvent e) {
    float count = e.getCount();

    PVector mouseVector = new PVector(mouseX, mouseY);
    if (count < 0) {
        camera.zoom *= 1.1;
        mouseVector.mult(0.1);
    } else if (count > 0) {
        camera.zoom /= 1.1;
        mouseVector.mult(-0.1);
    } else {
        return;
    }

    camera.translate(mouseVector.x, mouseVector.y);


    // cameraZoom = clamp(cameraZoom, 0.1, 100);
}

void keyPressed(){
  if(keyCode == ENTER){
    running = true;
    prevFrame = millis();
    //making GUI visible if user enters program
    spMass.setVisible(true);
    planetMass.setVisible(true);
    spPreset.setVisible(true);
    pPreset.setVisible(true);
    spInitialSpeed.setVisible(true);
    pOrbitSpeed.setVisible(true);
    spInitialPos.setVisible(true);
    spInitialAngle.setVisible(true);
    pRadius.setVisible(true);
    Demo1.setVisible(true);
    demo2.setVisible(true);
    demo3.setVisible(true);
    demo4.setVisible(true);
  }
  
  if(keyCode == RIGHT){
    instruct = true;
  }
  
  if(keyCode == LEFT){
    instruct = false;
  }

    
    image(photo,width/2, height/2);

}
