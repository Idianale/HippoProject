/**
 * AR Hippo Skull Exploration 
 * Basic setup of program
 * Jarynn Cunningham, Jessica Lee, Patrick Perez
 * CSCI 5609
 *
*/

import processing.video.*;
import jp.nyatla.nyar4psg.*;
import peasy.*;


//Capture cam; // temp till we change to phone cam
//MultiMarker nya;
PShape s;
int r, y;
float scaleFactor = .04;
PeasyCam cam;

void setup() {
  size(640,480,P3D);
  orientation(PORTRAIT);
  noStroke();
  s = loadShape("../../data/Lower_Hippo_Jaw.obj");
  //s.setFill(color(255,255,255));
  y = height;
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  
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
  camera(0, 0, height * .86602,
    0, 0, 0,
    0, 1, 0);
  shape(s);
  //s.rotateY(.01);
  //nya.drawBackground(cam);
  
  //if((!nya.isExist(0))){ return; }
  
  //nya.beginTransform(0);
  //fill(0,0,255);
  //translate(0,0,20);
  //box(40);
  //nya.endTransform();
}

void mouseDragged() {
  if (abs(mouseX - pmouseX) < 50) 
    r += mouseX - pmouseX;
  if (abs(mouseY - pmouseY) < 50) 
    y += mouseY - pmouseY;
}
