particle [] star;

void setup()
{
  //frameRate(200);
  background(0);
  size(2000, 1000);
  star = new particle[301];
  for (int i = 0; i < 250; i++) {
    star[i] = new particle();
  }
  for (int i = 250; i < star.length; i++) {
    star[i] = new odd();
  }
  star[star.length-1] = new ship();
}

void draw()
{
  fill(0, 0, 0, 75);
  rect(0, 0, 2000, 1000);
  for (int i = 0; i < star.length-1; i++) {
    star[i].show();
    star[i].walk();
  }

  for (int radius = 10; radius < 150; radius += 10) {
    fill(0, 0, 0, 200-1.8*radius);
    ellipse(1000, 500, 2*radius, 2*radius);
  }
    star[star.length-1].show();
    star[star.length-1].walk();
}

class particle 
{
  double X, Y, speed, angle, offset; 
  double distance;
  int myColor;
  particle ()
  {
    X = 1000;
    Y = 500;
    angle = Math.random()*2*PI;
    myColor = (int)(Math.random()*240)+15;
    speed = (Math.random()*6.7)+0.3;
    offset = Math.random()*10;
    distance = dist(1000, 500, (float)X, (float)Y);
  }
  void walk()
  {
    X += speed * Math.cos(angle);
    Y += speed * Math.sin(angle);
    if (X > 2000) {
      X = 1000+offset; 
      Y = 500+offset;
      angle = Math.random()*2*PI;
    }
    if (Y > 1100) {
      X = 1000+offset; 
      Y = 500+offset;
      angle = Math.random()*2*PI;
    }
    if (X < 0) {
      X = 1000+offset; 
      Y = 500+offset;
      angle = Math.random()*2*PI;
    }
    if (Y < 0) {
      X = 1000+offset; 
      Y = 500+offset;
      angle = Math.random()*2*PI;
    }
    distance = (dist(1000, 500, (float)X, (float)Y))/2.7;
  }
  void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)X, (float)Y, (float)(3.5+speed/3), (float)(3.5+speed/3));
  }
}

class odd extends particle
{
  int myRed, myGreen, myBlue;
  odd() {
    X = 1000;
    Y = 500;
    angle = Math.random()*2*PI;
    myColor = (int)(Math.random()*240)+15;
    myRed = (int)(Math.random()*240)+15;
    myGreen= (int)(Math.random()*240)+15;
    myBlue = (int)(Math.random()*240)+15;
    speed = (Math.random()*6.7)+4;
    offset = Math.random()*10;
    distance = dist(1000, 500, (float)X, (float)Y);
  }
  void show() {
    noStroke();
    fill(myRed - (float)distance/5, myGreen, myBlue - (float)distance/2, myColor);
    ellipse((float)X, (float)Y, (float)(4+speed/3), (float)(4+speed/3));
  }
}

class ship extends particle
{

  float size;
  ship() {
    X = 0;
    Y = 700;
    speed = (Math.random()*6.7)+4;
    size = 1.6;
  }  

  void walk() {
    if (Y < 550){
    size-=0.0047;
    }
    Y-=1.6;
        if (size < -0.01) {
      Y = 1200;
      size = 1.6;
    }
  }

  void show() {
    noStroke();
    fill(120);
    quad(1000-75*size+(float)X, 500+60*size+(float)Y, 1000+75*size+(float)X, 500+60*size+(float)Y, 1000+50*size+(float)X, 500+200*size+(float)Y, 1000-50*size+(float)X, 500+200*size+(float)Y);
    bezier(1000-50*size+(float)X, 500+200*size+(float)Y, 1000-25*size+(float)X, 500+120*size+(float)Y, 1000+25*size+(float)X, 500+120*size+(float)Y, 1000+50*size+(float)X, 500+200*size+(float)Y);
    ellipse(1000+0*size+(float)X, 500+200*size+(float)Y, 100*size,50*size);
    //fuselage
    fill(140);
    quad(1000+45*size+(float)X, 500+140*size+(float)Y, 1000+150*size+(float)X, 500+130*size+(float)Y, 1000+150*size+(float)X, 500+175*size+(float)Y, 1000+40*size+(float)X, 500+190*size+(float)Y);
    quad(1000-45*size+(float)X, 500+140*size+(float)Y, 1000-150*size+(float)X, 500+130*size+(float)Y, 1000-150*size+(float)X, 500+175*size+(float)Y, 1000-40*size+(float)X, 500+190*size+(float)Y);
    fill(150, 255);
    //arms
    fill(160);
    ellipse(1000+(float)X, 500+(float)Y, 440*size, 180*size);
    //saucer
    fill(175);
    quad(1000+135*size+(float)X, 500+80*size+(float)Y, 1000+185*size+(float)X, 500+85*size+(float)Y, 1000+150*size+(float)X, 500+305*size+(float)Y, 1000+115*size+(float)X, 500+300*size+(float)Y);
    quad(1000-135*size+(float)X, 500+80*size+(float)Y, 1000-185*size+(float)X, 500+85*size+(float)Y, 1000-150*size+(float)X, 500+305*size+(float)Y, 1000-115*size+(float)X, 500+300*size+(float)Y);
    ellipse(1000+160*size+(float)X, 500+80*size+(float)Y, 50*size,50*size);
    ellipse(1000-160*size+(float)X, 500+80*size+(float)Y, 50*size,50*size);
    //nacelles
    fill(255);
    ellipse(1000+133.5*size+(float)X, 500+300*size+(float)Y, 35*size,35*size);
    ellipse(1000-133.5*size+(float)X, 500+300*size+(float)Y, 35*size,35*size);
  }
}
