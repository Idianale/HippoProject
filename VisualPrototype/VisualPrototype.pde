PImage skull; 
PImage model; 

void setup(){
  size(640, 640); 
  skull = loadImage("hippo_skull.jpg");
  model = loadImage("hippo_model.jpg");
}

void draw(){
  pushMatrix();
  rotate(PI/2.0); 
  image(skull,-15,-600,width-100,height-100);
  popMatrix(); 
  fill(0,255,255,60);
  rect(85,280,100,100); 
}

void mouseClicked(){
  println("X: " + mouseX, "Y: " + mouseY); 

}
