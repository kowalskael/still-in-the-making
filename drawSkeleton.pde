void drawSkeleton(int userId) {// draw the skeleton with the selected joints
  drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK); // to get the 3d joint data
  drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
  drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
  drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
  drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  

  getBodyDirection(userId,bodyCenter,bodyDir); // draw body direction
  bodyDir.mult(1);  // 200mm length
  bodyDir.add(bodyCenter);
  strokeWeight(1); 
  stroke(255);
  line(bodyCenter.x,bodyCenter.y,bodyCenter.z, 
       bodyDir.x ,bodyDir.y,bodyDir.z);
  PVector joint_HEAD= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_HEAD, joint_HEAD);
  strokeWeight(1.5);
  stroke(255);
 

  //PVectorjoint_HEAD= new PVector();
  //context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_HEAD, joint_HEAD);
  PVector joint_NECK= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_NECK, joint_NECK);
  PVector joint_LEFT_SHOULDER= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, joint_LEFT_SHOULDER);
  PVector joint_LEFT_ELBOW= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, joint_LEFT_ELBOW);
  PVector joint_LEFT_HAND= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HAND, joint_LEFT_HAND);
  PVector joint_RIGHT_SHOULDER= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, joint_RIGHT_SHOULDER);
  PVector joint_RIGHT_ELBOW= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, joint_RIGHT_ELBOW);
  PVector joint_RIGHT_HAND= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, joint_RIGHT_HAND);
  PVector joint_TORSO= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_TORSO, joint_TORSO);
  PVector joint_LEFT_HIP= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HIP, joint_LEFT_HIP);
  PVector joint_LEFT_KNEE= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_KNEE, joint_LEFT_KNEE);
  PVector joint_LEFT_FOOT= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_FOOT, joint_LEFT_FOOT);
  PVector joint_RIGHT_HIP= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HIP, joint_RIGHT_HIP);
  PVector joint_RIGHT_KNEE= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, joint_RIGHT_KNEE);
  PVector joint_RIGHT_FOOT= new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_FOOT, joint_RIGHT_FOOT);
 
  

 
  myMessage.add(userId);

  myMessage.add(new float[] {
  joint_HEAD.x,joint_HEAD.y,joint_HEAD.z,
  joint_NECK.x,joint_NECK.y,joint_NECK.z,
  joint_LEFT_SHOULDER.x,joint_LEFT_SHOULDER.y,joint_LEFT_SHOULDER.z,
  joint_LEFT_ELBOW.x,joint_LEFT_ELBOW.y,joint_LEFT_ELBOW.z,
  joint_LEFT_HAND.x,joint_LEFT_HAND.y,joint_LEFT_HAND.z,
  joint_RIGHT_SHOULDER.x,joint_RIGHT_SHOULDER.y,joint_RIGHT_SHOULDER.z,
  joint_RIGHT_ELBOW.x,joint_RIGHT_ELBOW.y,joint_RIGHT_ELBOW.z,
  joint_RIGHT_HAND.x,joint_RIGHT_HAND.y,joint_RIGHT_HAND.z,
  joint_LEFT_HIP.x,joint_LEFT_HIP.y,joint_LEFT_HIP.z,
  joint_LEFT_KNEE.x,joint_LEFT_KNEE.y,joint_LEFT_KNEE.z,
  joint_LEFT_FOOT.x,joint_LEFT_FOOT.y,joint_LEFT_FOOT.z,
  joint_RIGHT_HIP.x,joint_RIGHT_HIP.y,joint_RIGHT_HIP.z,
  joint_RIGHT_KNEE.x,joint_RIGHT_KNEE.y,joint_RIGHT_KNEE.z,
  joint_RIGHT_FOOT.x,joint_RIGHT_FOOT.y,joint_RIGHT_FOOT.z,
  }
  );
  strokeWeight(0);
  
  oscP5.send(myMessage, myRemoteLocation);
  //send the message out.
  myMessage.clear();
  //clean the message once it send out. 
}
