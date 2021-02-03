import processing.serial.*;
Serial port1;
Serial port2;
int data1;
int data2;
PImage G;
int screen=0;

void setup(){
  fullScreen();
   noStroke();
   port1 = new Serial(this,"COM3", 9600);
   port2 = new Serial(this,"COM7", 9600);


}

void draw(){
  if (screen==0){
   display();
  
  }
  else if(screen==1){
    r();
  }
  else if(screen==2){
    b();
  }
}





void display(){
  background(255,193,0);
  fill  (254,255,150);
  ellipse(width/2,height,1200,1200);
  fill (168,189,188,191);
  rect(655,160,1050,80);
  textSize(45);
  fill(73,40,79);
  text("Welcome to the Wild West Training, Train Well!!!", width/8-27, height/4);   
  fill(255,0,0);
  rect(250,4*height/6,89,190);
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
  rect(0,height-40,2*1280,200);
  fill(0,255,0);
  rect(0,height-140,2*1280,6);
  
  ard1();
}

void ard1()
{
  if (port2.available() > 0) 
    {
     data2=port2.read();
     println(data1);
     screen=port2.read();
    if(data2==1)
    {
      screen=2;
       }
    else if(data2==0)
    {
      screen=0;
        }
  }   
  
  if (port1.available() > 0) 
    {
     data1=port1.read();
     println(data1);
     screen=port1.read();
    if(data1==1)
    {
      screen=1;
       }
    else if(data1==0)
    {
      screen=0;
        }
  } 
  } 
  
 
  
  
  void r(){
   background(255, 0, 0);
      textSize(185);
      fill(227,227,220);
      text("RED WINS!", width/8-27, height/4);
    }
      
      
void b(){
   background(130,233,255);
      textSize(185);
      fill(66,64,169);
      text("BLUE WINS!", width/8-27, height/4); 
}
  
