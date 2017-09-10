// SimpleOpenNI user events
void onNewUser(SimpleOpenNI curContext,int userId) {
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  context.startTrackingSkeleton(userId);

}

void onLostUser(SimpleOpenNI curContext,int userId) {
  println("onLostUser - userId: " + userId);
  println("\tlost User");
}

void onVisibleUser(SimpleOpenNI curContext,int userId) {
  //println("onVisibleUser - userId: " + userId);
}
