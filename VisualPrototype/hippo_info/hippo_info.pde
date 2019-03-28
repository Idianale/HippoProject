int displayMode = 0; 
PImage model; 
PImage banner; 
PImage pTeeth; 
PImage trendMap; 


String introText = "Lorem Ipsum Intro What"; 
String tusk = "Right Canine"; 
String hint1 = "This animal is semi-aquatic"; 
String hint2 = "Eyes, ears, and nostrils placed high on skull so it can breathe while body is submerged in water"; 
String hint3 = "Can move 8km/h (5 mph) in water"; 
String hint4 = "In fact, mating occurs in the water!"; 
String hint5 = "This is an animal classified as a megafauna"; 
String incisors1 = "* A type of teeth used for fighting"; 
String bottomJaw = "* Average bite force of about 8100 Newtons (11 times stronger than a human)"; 
void setup(){
  size(640,640); 
  model = loadImage("hippo_model.jpg");
  banner = loadImage("stat.PNG"); 
  pTeeth = loadImage("poachTeeth.jpg"); 
  trendMap = loadImage("2004TrendMap.gif"); 
  textSize(32); 
  background(100);   
}

void draw(){
  if(displayMode == 0){
    background(100); 
    fill(100);
    rect(0,0,width,height); 
    
    
  } else if(displayMode == 1){
    background(100); 
    fill(255);
    textSize(32); 
    text(hint1, width/8, height/8-80,500,300);
    text(hint2, width/8, height/8,500,300);
    text(hint3, width/8, height/8+200,500,300);
    text(hint4, width/8, height/8+300,500,300);
    text(hint5, width/8, height/8+400,500,300); 


  
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
    textSize(25); 
    text(incisors1, width/8, height/6 + 100);
    text(bottomJaw, width/8, height/6 + 120,300,300);
    //text("Visual Graphic", width/3, height/6 + 300);
  } else if (displayMode == 4){
    background(100); 
    fill(0,255,255,60);
    rect(80, 40, width-200, 300, 7);
    String[] lines = loadStrings("tusk.txt");
    fill(255);
    //textSize(32);
    PFont header = createFont("Arial Bold", 30);
    PFont font = createFont("Arial", 24);
    textFont(header);
    /*
    for (int i = 0 ; i < lines.length; i++) {
      if (i==0){
        text(lines[i], width/2 - 50, height/6);
        textFont(font);
      }
      else{
        text(lines[i], 100, height/6 + 40*i);
      }      
    }
    */ 
    text(tusk, width/4, height/6); 
    textSize(25); 
    text(incisors1, width/8+10, height/8 + 100);
    text(bottomJaw, width/8+10, height/8 + 120,400,300);

    image(banner,0,380, width, 150); 
  } else if (displayMode == 5){
    background(100); 
    image(pTeeth,30,30, 600,250);
    image(trendMap,30,300,600,300); 
    
  }
}

void keyPressed() {
  if(key == '0'){
    displayMode = 0; 
  }
  if (key == '1') {
    displayMode = 1;
  }
  if (key == '2') {
    displayMode = 2;
  }
  if (key == '3') {
    displayMode = 4;
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
