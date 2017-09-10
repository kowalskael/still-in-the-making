import oscP5.*;
import netP5.*;
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import SimpleOpenNI.*;
import processing.opengl.*;

import processing.video.*;
Movie myMovie;
PImage img;
SimpleOpenNI context;
PeasyCam cam;
int boundSize = 3600;
OscP5 oscP5;
NetAddress myRemoteLocation;
OscMessage myMessage = new OscMessage("");

int i=0;
int numOfSkeletons = 0; // !!!

PVector      bodyCenter = new PVector();
PVector      bodyDir = new PVector();
PVector      com = new PVector();                                   
PVector      com2d = new PVector();                                   
color[]      userClr = new color[]{ color(255,255, 255),
                                    color(255,255, 255),
                                    color(255,255, 255),
                                    color(255,255, 255),
                                    color(255,255, 255),
                                    color(255,255, 255)
                                   };
                                   
void setup() {
  size(1366, 768,P3D);  // strange, get drawing error in the cameraFrustum if i use P3D, in opengl there is no problem
    

  context = new SimpleOpenNI(this);
  if(context.isInit() == false) {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
 
  context.enableDepth();
  context.enableUser(); // enable skeleton generation for all joints

  cam = new PeasyCam(this, 0, 0, 1000, 3000); //set up a PeasyCam
   
  oscP5 = new OscP5(this,5002); //start oscP5, telling it to listen for incoming messages at port 5001 */
  myRemoteLocation= new NetAddress("127.0.0.1",5002); // set the remote location to be the localhoston port 5001
  
  stroke(255);
  smooth();
  myMovie = new Movie(this, "stil.mp4");
  myMovie.loop();  
  img = loadImage("ziemia.gif");
 }

void draw() {
  context.update(); // update the cam
  background(0);


  scale(-1, 1, 1);
  rotateZ(radians(180));
  rotateY(radians(360));

  int[] userList = context.getUsers(); // draw the skeleton if it's available
  numOfSkeletons = 0; // !!!
  for(int i=0;i<userList.length;i++) {
    if(context.isTrackingSkeleton(userList[i])) numOfSkeletons += 1;
   
 }

  for(int i=0;i<userList.length;i++) {
    if(context.isTrackingSkeleton(userList[i])) { // jeśli pojawią się 2 szkielety, narysuj je
       if(numOfSkeletons == 2) drawSkeleton(userList[i]); 

  }
}  
 
   // !!!
  if(numOfSkeletons == 2) {
    PVector LeftHandOne= new PVector();
    context.getJointPositionSkeleton(userList[i], SimpleOpenNI.SKEL_LEFT_HAND, LeftHandOne); // !!! ma działać dla lewej ręki User1
    drawLeftHandOne(userList[i]);
   
  }
  else {
   translate(-width/4, -height/4, boundSize);
   //rotate(-180);
   image(myMovie, 0, 0);

  }
 
}

void drawLeftHandOne(int userId) { 
  
  PVector jointPosH = new PVector(); 
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HAND, jointPosH); 

  rectMode(CENTER);
  translate(-width/40, -height/4, boundSize);
  for (int y = 0; y < width; y += 40) {
  for (int x = 0; x < height; x += 40) {
     if ((x % 20) == 0) {
     float angle = map(jointPosH.x, jointPosH.y, 0, 0, PI);
     // pushMatrix();
     translate(x, y);
     rotate(angle);
     rect(0, 0, 2, 1);
     //popMatrix();
    }     
   }  
   }
    if (jointPosH.z<1450) {
     pushMatrix();
     image(img, 0, 0, 1000, 1000);
     popMatrix();
   }

}

void drawSkeleton() {}
void drawLimb() {}
void drawJointOrientation() {}
void onNewUser() {}
void onLostUser() {}
void onVisibleUser() {}
void getBodyDirection() {}

void movieEvent(Movie m) {
  m.read();
}
