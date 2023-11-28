PVector calculateVelocity(PVector vp, PVector ve, PVector ve2){
//vp = 0; velocity of planet - user picks
  // ve = 0; entering velocity - user picks
  PVector v1 = vp.add(ve); //v1 = velocity of planet + entering velocity 
 // float ve2 = 0; exiting velcoity --> calculate?
  PVector v2 = vp.add(ve2); //v2 = velocity of planet + exit velocity
  
  PVector ChangeinVelocity = v2.sub(v1);
  return(ChangeinVelocity);
}
