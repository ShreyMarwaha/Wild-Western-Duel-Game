import processing.serial.*;
  
import processing.sound.*;
SoundFile file;
SoundFile file1;
Serial port;

int data;
int savedTime;
int totalTime = 1900;
int screen=0;
int a=0;


void setup(){
  fullScreen();
  rectMode(CENTER);
  noStroke();
    savedTime = millis();
     port = new Serial(this,"COM7", 9600);
     file = new SoundFile(this, "win.mp3");
file1 = new SoundFile(this, "lose.mp3");
}

void draw(){
 
if (screen==0){
  display();
}
else if (screen==1){
  if (a==0){
    file.play();
    a=1;}
  win();
}
else {
  
  if (a==0){
    file1.play();
    a=1;} 
lose();
}
}



void display(){
   background(255,193,0);
  fill  (254,255,150);
  ellipse(width/2,height,1200,1200);
  fill (168,189,188,191);
  rect(755,260,1250,80);
  textSize(45);
  fill(73,40,79);
  text("Welcome to the Wild West Training, Train Well!!!", width/8-27, height/4);   
  fill(255,0,0);
  rect(250,4*height/6,89,190);
  rect(220,5*height/6,30,190);
   rect(280,5*height/6,30,190);
  fill(0,0,0);
  ellipse(width-250,3.95*height/6,200,200);
  fill(255,255,255);
  ellipse(width-250,3.95*height/6,170,170);
  fill(255,0,0);
  ellipse(width-250,3.95*height/6,140,140);
  fill(255);
  ellipse(width-250,3.95*height/6,125,125);
  fill(255,0,0);
  ellipse(width-250,3.95*height/6,17,17);
  fill(162,99,55);
  rect(0,height-40,4*1280,200);
  fill(0,255,0);
  rect(0,height-140,4*1280,6);
  timer();
  ard();
 }
 





void timer() {
  // Calculate how much time has passed
  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) {
    println("TOO SLOW!!!");
    screen=2;
   savedTime = millis();
    
  }
}


void ard()
{
    if (port.available() > 0) 
    {
     data=port.read();
     println(data);
     screen=port.read();
    if(data==1)
    {
      screen=1;
       }
    else if(data==0)
    {
      screen=0;
      display();  }
  }  } 
  
  
  void win(){
      

    background(12,133,8);
      textSize(185);
      fill(227,227,220);
      text("YOU WIN!!", width/8-27, height/4);
      
 
    
  }
    
      void lose()
  { 
       
    background(246,79,79);
      textSize(185);
      fill(227,227,220);
      text("YOU LOSE :(", width/8-27, height/4);
   
    
  }
  
  void keyPressed() {
  if (keyPressed) {
    
    
    if (key=='f'){
      if (screen>0){
      screen = 0;}      
  } 
}
}
