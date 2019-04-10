PImage skull; 
PImage model; 
PImage book;
PImage xout;
boolean overTusk = false;
boolean locked = false;
boolean showBook = false;
boolean changeColor = false;
boolean overex = false;

void setup() {
  size(546, 1000); 
  skull = loadImage("hippo_skull.jpg");
  model = loadImage("hippo_model.jpg");
  book = loadImage("open_book.png");
  xout = loadImage("xout.png");
}

void draw() {
  if (showBook) {
    tint(100);
  } else {
    tint(255);
  }
  pushMatrix();
  rotate(PI/2.0); 
  image(skull, 0, -width, height, width);
  popMatrix(); 
  fill(0, 255, 255, 60);
  float tuskX = 55;
  float tuskY = 590;
  float tuskRadius = 30;
  if (changeColor) {
    fill(0, 150, 255, 255);
  } else {
    fill(0, 255, 255, 60);
  }
  circle(tuskX, tuskY, tuskRadius*2); 
  fill(0, 255, 255, 60);
  circle(315, 680, 60);
  circle(315, 400, 30);

  //if click on first circle (tusk)
  if (mouseX > tuskX-tuskRadius && mouseX < tuskX+tuskRadius && 
    mouseY > tuskY-tuskRadius && mouseY < tuskY+tuskRadius) {
    overTusk = true;
  } else {
    overTusk = false;
  }
  float exitX = width-50;
  float exitY = 200;
  //if circle was clicked, show data
  if (showBook) {
    tint(255);
    image(book, 25, 200, width-50, height/2);
    image(xout, exitX, exitY, 40, 40);
    pushMatrix();
    rotate(PI/2.0); 
    image(model, 240, -width+275,  height/2-50, width/2-40);
    popMatrix(); 
    String[] lines = loadStrings("tusk.txt");
    fill(0);
    //textSize(32);
    PFont header = createFont("Bookman Old Style Bold Italic", 30);
    PFont font = createFont("Bookman Old Style Italic", 24);
    textFont(header);
    for (int i = 0; i < lines.length; i++) {
      if (i==0) {
        text(lines[i], width/2+50, 280);
        textFont(font);
      } else {
        text(lines[i], width/2+20, 280 + 40*i, 30);
      }
    }
    if (mouseX > exitX-20 && mouseX < exitX+20 && 
      mouseY > exitY-20 && mouseY < exitY+20) {
      overex = true;
    }
  }
}

//changes color of circle so you know it's clicked
void mousePressed() {
  if (overTusk) {
    changeColor=true;
  } else {
    changeColor = false;
  }
}

void mouseReleased() {
  changeColor = false;
}

void mouseClicked() {
  println("X: " + mouseX, "Y: " + mouseY); 
  if (overTusk) {
    println("clicked on circle");
    showBook = true;
  }
  if (overex) {
    println("clicked on ex");
    showBook = false;
    overex = false;
  }
}
