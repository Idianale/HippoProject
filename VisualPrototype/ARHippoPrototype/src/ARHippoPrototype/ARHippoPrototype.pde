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
PeasyCam cam;
//Capture cam; // temp till we change to phone cam
//MultiMarker nya;

void setup() {
  size(1280, 900, P3D);
  orientation(PORTRAIT);
  noStroke();
  s = loadShape("../../data/testHippo4.obj");
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(5000);
  
  // x, y, and z coordinates of camera in model space
  float[] position = cam.getPosition(); 
  // To set the initial camera position (double x, double y, double z, double distance)
  cam.lookAt(position[0], position[1], position[2], 1500, 1000); 

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
  
  pushMatrix();
  shape(s);
  popMatrix();
     
  //drawAxes(1110.0); // To show the axes

  //nya.drawBackground(cam);
  //if((!nya.isExist(0))){ return; }
  //nya.beginTransform(0);
  //fill(0,0,255);
  //translate(0,0,20);
  //box(40);
  //nya.endTransform();
}

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
