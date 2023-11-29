/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void slider1_change1(GSlider source, GEvent event) { //_CODE_:spMass:266849:
  spacecraft.mass = spMass.getValueF();
} //_CODE_:spMass:266849:

public void slider2_change1(GSlider source, GEvent event) { //_CODE_:planetMass:539922:
  planet.mass = planetMass.getValueF()*(pow(10,24));
} //_CODE_:planetMass:539922:

public void spPresetOpened(GDropList source, GEvent event) { //_CODE_:spPreset:253720:
  println("spPreset - GDropList >> GEvent." + event + " @ " + millis());
  // get the spacecraft name and set values accordingly
  String spType = spPreset.getSelectedText();
  
  if (spType == "Voyager 1") {
    
  }
} //_CODE_:spPreset:253720:

public void pPresetOpened(GDropList source, GEvent event) { //_CODE_:pPreset:241108:
  println("pPreset - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:pPreset:241108:

public void slider1_change2(GSlider source, GEvent event) { //_CODE_:pOrbitSpeed:346573:
  planet.vel.x = pOrbitSpeed.getValueF();
} //_CODE_:pOrbitSpeed:346573:

public void slider1_change3(GSlider source, GEvent event) { //_CODE_:spInitialSpeed:483261:
  println("spInitialSpeed - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:spInitialSpeed:483261:

public void slider1_change4(GSlider source, GEvent event) { //_CODE_:pInitialPos:965079:
  spacecraft.pos[0].x = pInitialPos.getValueF();
} //_CODE_:pInitialPos:965079:

public void slider2_change2(GSlider source, GEvent event) { //_CODE_:pInitialAngle:697099:
  println("pInitialAngle - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:pInitialAngle:697099:

public void button1_click1(GButton source, GEvent event) { //_CODE_:Demo1:443366:
  println("Demo1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:Demo1:443366:

public void button2_click1(GButton source, GEvent event) { //_CODE_:demo2:312806:
  println("demo2 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:demo2:312806:

public void button3_click1(GButton source, GEvent event) { //_CODE_:demo3:711930:
  println("demo3 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:demo3:711930:

public void button4_click1(GButton source, GEvent event) { //_CODE_:demo4:484823:
  println("demo4 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:demo4:484823:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:823739:
  appc.background(230);
} //_CODE_:window1:823739:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  spMass = new GSlider(this, 25, 38, 147, 40, 10.0);
  spMass.setLimits(6500.0, 1000.0, 10000.0);
  spMass.setNumberFormat(G4P.DECIMAL, 2);
  spMass.setOpaque(false);
  spMass.addEventHandler(this, "slider1_change1");
  planetMass = new GSlider(this, 243, 38, 161, 40, 10.0);
  planetMass.setLimits(5.9, 1.0, 10.0);
  planetMass.setNumberFormat(G4P.DECIMAL, 2);
  planetMass.setOpaque(false);
  planetMass.addEventHandler(this, "slider2_change1");
  togGroup1 = new GToggleGroup();
  spPreset = new GDropList(this, 44, 221, 103, 80, 3, 10);
  spPreset.setItems(loadStrings("list_253720"), 0);
  spPreset.addEventHandler(this, "spPresetOpened");
  pPreset = new GDropList(this, 270, 126, 101, 80, 3, 10);
  pPreset.setItems(loadStrings("list_241108"), 0);
  pPreset.addEventHandler(this, "pPresetOpened");
  pOrbitSpeed = new GSlider(this, 242, 76, 163, 40, 10.0);
  pOrbitSpeed.setLimits(0.5, 0.0, 1.0);
  pOrbitSpeed.setNumberFormat(G4P.DECIMAL, 2);
  pOrbitSpeed.setOpaque(false);
  pOrbitSpeed.addEventHandler(this, "slider1_change2");
  spInitialSpeed = new GSlider(this, 22, 79, 149, 40, 10.0);
  spInitialSpeed.setLimits(0.5, 0.0, 1.0);
  spInitialSpeed.setNumberFormat(G4P.DECIMAL, 2);
  spInitialSpeed.setOpaque(false);
  spInitialSpeed.addEventHandler(this, "slider1_change3");
  pInitialPos = new GSlider(this, 23, 121, 149, 40, 10.0);
  pInitialPos.setLimits(0.5, 0.0, 1.0);
  pInitialPos.setNumberFormat(G4P.DECIMAL, 2);
  pInitialPos.setOpaque(false);
  pInitialPos.addEventHandler(this, "slider1_change4");
  pInitialAngle = new GSlider(this, 26, 163, 147, 40, 10.0);
  pInitialAngle.setLimits(0.5, 0.0, 1.0);
  pInitialAngle.setNumberFormat(G4P.DECIMAL, 2);
  pInitialAngle.setOpaque(false);
  pInitialAngle.addEventHandler(this, "slider2_change2");
  Demo1 = new GButton(this, 214, 196, 80, 30);
  Demo1.setText("Demo 1");
  Demo1.addEventHandler(this, "button1_click1");
  demo2 = new GButton(this, 333, 195, 80, 30);
  demo2.setText("Demo 2");
  demo2.addEventHandler(this, "button2_click1");
  demo3 = new GButton(this, 214, 243, 80, 30);
  demo3.setText("Demo 3");
  demo3.addEventHandler(this, "button3_click1");
  demo4 = new GButton(this, 334, 242, 80, 30);
  demo4.setText("Demo 4");
  demo4.addEventHandler(this, "button4_click1");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 240, 120, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GSlider spMass; 
GSlider planetMass; 
GToggleGroup togGroup1; 
GDropList spPreset; 
GDropList pPreset; 
GSlider pOrbitSpeed; 
GSlider spInitialSpeed; 
GSlider pInitialPos; 
GSlider pInitialAngle; 
GButton Demo1; 
GButton demo2; 
GButton demo3; 
GButton demo4; 
GWindow window1;
