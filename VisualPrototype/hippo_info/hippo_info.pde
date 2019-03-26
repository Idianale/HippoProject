int displayMode = 0; 
PImage model; 


String introText = "Lorem Ipsum Intro What"; 
String tusk = "Right Canine"; 

void setup(){
  size(640,640); 
  model = loadImage("hippo_model.jpg");
  textSize(32); 
  background(100); 
}

void draw(){
  if(displayMode == '0'){
    background(100); 
  } else if(displayMode == 1){
    background(100); 
    fill(0, 102, 153);
    text(introText, 200,50); 
  
  } else if(displayMode == 2){
    pushMatrix(); 
    rotate(PI/2.0); 
    image(model,-15,-600,width-100,height-100);
    popMatrix(); 
    textSize(30); 
    fill(255); 
    text("Hippo Model", 60,600); 
  } else if(displayMode == 3){
    background(100); 
    fill(255);
    textSize(50); 
    text(tusk, width/4, height/6); 
    text("FACT #1", width/4, height/6 + 100);
    text("FACT #2", width/4, height/6 + 200);
    text("Visual Graphic", width/4, height/6 + 300);
  } else if (displayMode == 4){
    background(100); 
    fill(0,153,153,120);
    rect(80, 40, width-200, 300, 7);
    String[] lines = loadStrings("tusk.txt");
    fill(255);
    //textSize(32);
    PFont header = createFont("Arial Bold", 30);
    PFont font = createFont("Arial", 24);
    textFont(header);
    for (int i = 0 ; i < lines.length; i++) {
      if (i==0){
        text(lines[i], width/2 - 50, height/6);
        textFont(font);
      }
      else{
        text(lines[i], 100, height/6 + 40*i);
      }      
    }
  }
}

void keyPressed() {
  if(key == '9'){
    displayMode = 9; 
  }
  if (key == '1') {
    displayMode = 1;
  }
  if (key == '2') {
    displayMode = 2;
  }
  if (key == '3') {
    displayMode = 3;
  }
  if (key == '4') {
    displayMode = 4;
  }
  if (key == '5') {
    displayMode = 5;
  }
  if (key == '6') {
    displayMode = 6;
  }
  System.out.println("Display Mode " + displayMode + "\n");
   

}

void mouseClicked(){
  println("X: " + mouseX, "Y: " + mouseY); 

}