//＜Processingコード＞
import ketai.camera.*;
import ketai.net.nfc.record.*;
import ketai.net.*;
import ketai.ui.*;
import ketai.cv.facedetector.*;
import ketai.sensors.*;
import ketai.net.nfc.*;
import ketai.net.wifidirect.*;
import ketai.data.*;
import ketai.net.bluetooth.*;

import jp.nyatla.nyar4psg.*;

int refresh = 0;
int block = 0;

KetaiCamera cam;
PImage img;
PImage img2;
MultiMarker nya;

void setup() {
 size(displayWidth, displayHeight,P3D);
 colorMode(RGB, 100);
 println(MultiMarker.VERSION);

 cam=new KetaiCamera(this,640,480, 60);
 img = new PImage(640, 480);

 nya=new MultiMarker(this,640,480,this.createInput(new File("camera_para.dat")),NyAR4PsgConfig.CONFIG_PSG);
 nya.addARMarker("patt.hiro",80);

 cam.start();

}

void onCameraPreviewEvent()
{
  cam.read();
  refresh = 1;
}

void draw()
{

 if (refresh == 1) {
   block = 1;
   refresh = 0;

   image(cam, 0, 0, displayWidth, displayHeight);
   img.copy(cam, 0, 0, 640, 480, 0, 0, 640, 480);
   nya.detect(img);

   if((!nya.isExistMarker(0))){
     return;
   }

   nya.beginTransform(0);
   fill(0,0,255);
   translate(0,0,20);
   box(40);
   nya.endTransform();
   block = 0;
 }
}
/*
import ketai.camera.*;

KetaiCamera cam;

void setup() {
  fullScreen();
  orientation(LANDSCAPE);

  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(displayDensity * 25);
  cam = new KetaiCamera(this, 640, 480, 24);
}

void draw() {

  if (cam != null && cam.isStarted())
    image(cam, width/2, height/2, width, height);
  else
  {
    background(128);
    text("Camera is currently off.", width/2, height/2);
  }
  drawUI();
}

void onCameraPreviewEvent()
{
  cam.read();
}

void mousePressed()
{
  //Toggle Camera on/off
  if (mouseX < width/3 && mouseY < 100)
  {
    if (cam.isStarted())
    {
      cam.stop();
    } else
      cam.start();
  }

  if (mouseX < 2*width/3 && mouseX > width/3 && mouseY < 100)
  {
    if (cam.getNumberOfCameras() > 1)
    {
      cam.setCameraID((cam.getCameraID() + 1 ) % cam.getNumberOfCameras());
    }
  }

  //Toggle Camera Flash
  if (mouseX > 2*width/3 && mouseY < 100)
  {
    if (cam.isFlashEnabled())
      cam.disableFlash();
    else
      cam.enableFlash();
  }
}

void drawUI()
{
  pushStyle();
  textAlign(LEFT);
  fill(0);
  stroke(255);
  rect(0, 0, width/3, 100);
  rect(width/3, 0, width/3, 100);

  rect((width/3)*2, 0, width/3, 100);

  fill(255);
  if (cam.isStarted())
    text("Camera Off", 5, 80); 
  else
    text("Camera On", 5, 80); 

  if (cam.getNumberOfCameras() > 0)
  {
    text("Switch Camera", width/3 + 5, 80);
  }

  if (cam.isFlashEnabled())
    text("Flash Off", width/3*2 + 5, 80); 
  else
    text("Flash On", width/3*2 + 5, 80); 

  popStyle();
}

*/
