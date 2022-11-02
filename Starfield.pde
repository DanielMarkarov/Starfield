particle[] organism = new particle[300];

void setup()
{
 size (1000, 1000);
 background(0);
 for (int i = 0; i < organism.length-1; i++) 
 {
   organism[i] = new particle();
   organism[300] = new oddball();
 }

void draw()
{
 noStroke();
 
 for(int i = 0; i < organism.length; i++) 
 {
   organism[i].move();
   organism[i].show();
 }

class Particle
{
  double myX, myY, mySize, speed, myAngle;
  int myColor;
  
  particle() 
  {
    myX = 500.0;
    myY = 500.0;
    myAngle = Math.random()* 2 * Math.PI;
    mySize = 3;
    speed = Math.random()*10;
    myColor = color((int)(Math.random()*255+40), (int)(Math.random()*46+200), (int)(Math.random()*96+200));
   }
   
   void move()
   {
    myX += Math.cos(myAngle) * speed;
    myY += Math.sin(myAngle) * speed;
   }
   
   void show()
   {
     stroke(myColor);
     fill(myColor);
     ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
   }
 }
 
class Oddball extends particle
{
  int modifierX = 1;
  int modifierY = 1;
  oddball()
  {
    myX = 500;
    myY = 500;
  }
  
  void move()
  {
    myX += (modifierX)*(int)(Math.random()*9)-4;;
    myY += (modifierY)*(int)(Math.random()*9)-4;
    
    if(myX >= 1000){ modifierX = -1;}
    if(myX <= 0)   { modifierX =  1;}
    if(myY >= 1000){ modifierY = -1;}
    if(myY <= 0)   { modifierY =  1;}
  }
  
  void show()
  {
    stroke(255);
    ellipse(myX,    myY    , 10, 10);
    ellipse(myX -2, myY - 2, 2 , 2);
    ellipse(myX +2, myY - 2, 2 , 2);
    rect   (myX -3, myY + 2, 5 , 1);
  }
}


