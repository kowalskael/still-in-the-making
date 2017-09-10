void drawJointOrientation(int userId,int jointType,PVector pos,float length) {
  // draw the joint orientation  
  PMatrix3D  orientation = new PMatrix3D();
  float confidence = context.getJointOrientationSkeleton(userId,jointType,orientation);
  if(confidence < 0.001f) // nothing to draw, orientation data is useless
    return;
    
  pushMatrix();
    translate(pos.x,pos.y,pos.z);
    // set the local coordsys
    applyMatrix(orientation);
    // coordsys lines are 100mm long
    // x - r
    stroke(255,confidence * 200 + 55);
    line(0,0,0,
         length,0,0);
    // y - g
    stroke(255,confidence * 200 + 55);
    line(0,0,0,
         0,length,0);
    // z - b    
    stroke(255,confidence * 200 + 55);
    line(0,0,0,
         0,0,length);
    strokeWeight(0);
    stroke(255);
    point(0, 0, 0);
    
  popMatrix();
  strokeWeight(0);
}
