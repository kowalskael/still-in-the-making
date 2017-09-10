void drawLimb(int userId,int jointType1,int jointType2) {
  PVector jointPos1 = new PVector();
  PVector jointPos2 = new PVector();
  float  confidence;
  // draw the joint position
  confidence = context.getJointPositionSkeleton(userId,jointType1,jointPos1);
  confidence = context.getJointPositionSkeleton(userId,jointType2,jointPos2);
  strokeWeight(1);
  stroke(255,confidence * 200 + 55);
  line(jointPos1.x,jointPos1.y,
       jointPos2.x,jointPos2.y);
  //drawJointOrientation(userId,jointType1,jointPos1,50);
}
