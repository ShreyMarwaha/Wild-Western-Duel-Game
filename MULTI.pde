import processing.serial.*;
import processing.video.*;
import processing.sound.*;
SoundFile file;
SoundFile file1;
Serial port;
Serial port1;
Serial port2;
int data;
int data1;
int data2;
PImage bg;
PImage startscreen;
PImage blue;
PImage red;
PImage cool;
Movie video;
int screen=0;
int a=0;
int b=0;

void setup(){
  fullScreen();
  background(0);
  rectMode(CENTER);
  noStroke();
  file = new SoundFile(this, "win.mp3");
  file1 = new SoundFile(this, "m.mp3");
  video = new Movie(this, "video.mov");
  
  port = new Serial(this,"COM3", 9600);
    port1 = new Serial(this,"COM7", 9600);
    port2 = new Serial(this,"COM8", 9600);
motion();

  
}

void movieEvent(Movie video) {
  video.read();
}

void draw(){
  if (screen==0){
    video();
  
  }
  else if(screen==1){
    
    if (a==0)
    {file1.play();
    a=1;}
    
    
    star();
  }
  else if(screen==2){
    display();
  }
  else if(screen==3){
    r();
  }
  else if(screen==4){
    b();
  }
     
}


void video() {
  background(0);
imageMode(CENTER);   
    image(video, width/2,height/2);
      video.play();
     if (video.time()==11){ 
    video.stop();
    screen=1;}
    motion();
}


void star(){
  
  
  cool=loadImage("14.jpg");
  imageMode(CENTER);
  image(cool,width/2,height/2,width,height);
  motion();

}

void display(){
  
 bg=loadImage("full.jpg");
  imageMode(CENTER);
  image(bg,width/2,height/2,width,height);
  ard();
  ard2();

}

void keyPressed() {
  if (keyPressed) {
    
    if (key == 'r') {
      screen=3 ;
      
    } 
    else if (key == 'b') {
      screen=4 ;
    }
    
    else if (key=='f'){
      if (screen==0){
      screen = 1;}
      else if (screen==1){
        screen=2;}
       
  } 
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
      screen=3;
       }
    else if(data==0)
    {
      screen=2;
        }
  }  } 
  
  void ard2()
{
    if (port1.available() > 0) 
    {
     data1=port1.read();
     println(data1);
     screen=port1.read();
    if(data1==1)
    {
      screen=4;
       }
    else if(data1==0)
    {
      screen=2;
        }
  }  } 
  
  
  void ard1()
{
    if (port2.available() > 0) 
    {
     data2=port2.read();
     println(data2);
     screen=port2.read();
    if(data2==1)
    {
      screen=4;
       }
    else if(data2==0)
    {
      screen=2;
        }
  }  } 
  
  
void r(){
  file.play(); 
  background(255, 0, 0);
      textSize(185);
      fill(227,227,220);
      text("RED WINS!", width/8-27, height/4);
    ard();}
      
      
void b(){
  file.play();
   background(130,233,255);
      textSize(185);
      fill(66,64,169);
      text("BLUE WINS!", width/8-27, height/4); 
}

void motion(){
  {
    if (port1.available() > 0) 
    {
     data1=port.read();
     println(data1);
     
    if(data1!=9999)
    {
      
      if (screen==0){
      screen = 1;}
      else if (screen==1){
        screen=2;}
       
       }
   
      }
  }  } 
