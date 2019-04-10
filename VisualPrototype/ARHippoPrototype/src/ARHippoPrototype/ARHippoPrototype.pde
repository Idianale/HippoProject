/**
 * AR Hippo Skull Exploration 
 * Basic setup of program
 *
 * Jarynn Cunningham, Jessica Lee, Patrick Perez
 * CSCI 5609
 *
 *   To install libraries:
 *      - Select Sketch at top left of screen
 *      - Click import Library...
 *      - Add Library...
 *      - search for "nyar4psg" and select install (this is the AR library
 *      - search for "PeasyCam" and select install (this is the camera movement)
*/


/******************************************************************************************
 * Imports
 *****************************************************************************************/
import processing.video.*;
import jp.nyatla.nyar4psg.*;
import peasy.*;

/******************************************************************************************
 * Global Variables
 *****************************************************************************************/
PShape s;
PShape sphere01;
PShape sphere02;
PImage img;
PVector vec;
PeasyCam cam;
int sphereSize = 25;
float bx,by;
boolean overShpere = false;
boolean locked = false;



//Capture cam; // temp till we change to phone cam
//MultiMarker nya;

void setup() {
  size(1280, 900, P3D);
  orientation(PORTRAIT);
  noStroke();
  s = loadShape("../../data/testHippo4.obj");
  img = loadImage("../../data/boneTexture.jpeg");
  textureMode(IMAGE);
 
  
  cam = new PeasyCam(this,-60, 0, 0, 100); // Centered around object not origin
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(5000);
  
  // x, y, and z coordinates of camera in model space
  float[] position = cam.getPosition(); 
  // To set the initial camera position (double x, double y, double z, double distance)
  cam.lookAt(position[0], position[1], position[2], 1500, 1000);
  
  sphere01 = createShape(SPHERE, sphereSize);
  sphere02 = createShape(SPHERE, sphereSize);
  
  bx = width/2.0;
  by = height/2.0;

  //cam=new Capture(this,640,480); // temp till we change to phone cam
  //nya=new MultiMarker(this,width,height,"../../data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  //nya.addARMarker("../../data/patt.hiro",80); // will change when we use our own AR marker
  //cam.start();
}

void draw()
{
  //if (cam.available() !=true) { return; }
  //cam.read();
  //nya.detect(cam);
  
  background(0xffffffff);
  lights();
  rotateX(-.5);
  rotateY(-.5);
  
  beginShape();
  shape(s);
  //s.setTexture(img); // Some reason makes program run slower but looks neat
  endShape();

  
  //pushMatrix();
  //translate(-240,-120,10);
  //if(POIClicked() == true) {
  //  sphere01.setFill(color(255,0,0,60));
  //}
  //else {
  //  sphere01.setFill(color(0,255,255,60));
  //  //fill(0,255,255,60);
  //}
  
  //shape(sphere01);
  ////sphere(25);
  //popMatrix();
  
  
  pushMatrix();
  translate(10,-50,20);
  sphere02.setFill(color(0,255,255,60)); // Green color
  //fill(0,255,255,60);
  shape(sphere02);
  //sphere(25);
  popMatrix();
  
    pushMatrix();
  // Test if the cursor is over the sphere 
  if (mouseX > bx-sphereSize && mouseX < bx+sphereSize && mouseY > by-sphereSize && mouseY < by+sphereSize) {
    overShpere = true;  
    if(!locked) { 
      //stroke(255); 
      sphere01.setFill(color(255,0,0,60)); // Red color
    } 
  } else {
    sphere01.setFill(color(0,255,255,60)); // Green color
    overShpere = false;
  }

  translate(-240,-120,10);
  shape(sphere01);
  popMatrix();

  
  

  //nya.drawBackground(cam);
  //if((!nya.isExist(0))){ return; }
  //nya.beginTransform(0);
  //fill(0,0,255);
  //translate(0,0,20);
  //box(40);
  //nya.endTransform();
}

void mousePressed() {
  if(overShpere) { 
    locked = true; 
    sphere01.setFill(color(255,255,0,60));
  } else {
    locked = false;
  }
}

//boolean POIClicked() { // This doesn't work like I wanted it to (click on the blue/green shpere and it does something)
//  println(sphere01.getVertexCount());
//  for(int i = 0; i < sphere01.getVertexCount(); i++) {
//    vec= sphere01.getVertex(i);
//  }
  
//  for(int i = 0; i < sphere01.getVertexCount(); i++) {
//   println(vec.x + ", " + vec.y);
//  }
  
//  if(mouseX >= vec.x - 25 || mouseX <= vec.x + 25 && mouseY >= vec.y - 25 || mouseY <= vec.y + 25) {
//    return true;
//  }
//  return false;
//}

void drawAxes(float size){
  //X  - red
  stroke(192,0,0);
  line(0,0,0,size,0,0);
  //Y - green
  stroke(0,192,0);
  line(0,0,0,0,size,0);
  //Z - blue
  stroke(0,0,192);
  line(0,0,0,0,0,size);
}
