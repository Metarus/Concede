boolean wP, aP, sP, dP, spaceP, concede;
int rN=-1;
PVector vec=new PVector(0, 0);
Player player=new Player(color(0, 0, 255), 100, 0, 100, 100);
Enemy enemy=new Enemy(color(255, 0, 0), 1000, 0, 100, 100, 5, 5, 50, 0);

int[][] eS={ //r, g, b, w, h, spd, dmg, hp, type
  {255, 0, 0, 100, 100, 5, 5, 50, 0},
  {255, 0, 120, 300, 600, 1, 10, 100, 1},
};

void setup() {
  fullScreen(P2D);
  frameRate(60);
  noStroke();
  rectMode(CENTER);
  enemy.pos.x=width-50;
  win();
}

void draw() {
  background(255);
  fill(255);
  player.update();
  player.pUpdate();
  enemy.update();
  enemy.eUpdate();
  player.pDisplay();
  enemy.display();
  fill(0);
  rect(width/2, height-50, width, 100);
}

void keyPressed() {
  if(key=='w') {wP=true;}
  if(key=='a') {aP=true;}
  if(key=='s') {sP=true;}
  if(key=='d') {dP=true;}
  if(keyCode==32) {spaceP=true;}
  if(key=='j'&&player.atkTimer<-10) {player.attack();}
}

void keyReleased() {
  if(key=='w') {wP=false;}
  if(key=='a') {aP=false;}
  if(key=='s') {sP=false;}
  if(key=='d') {dP=false;}
  if(key=='k') {concede=true;}
  if(keyCode==32) {spaceP=false;}
}

boolean aabb(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  if(x1<x2+w2&&
     x1+w1>x2&&
   y1<y2+h2&&
     y1+h1>y2) { 
    return(true);
  } else return(false);    
}

void reset() {
  player.pos=new PVector(100, 150);
  player.health=100;
  enemy.pos=new PVector(width-100, height-100);
  enemy.health=enemy.maxHealth;
  concede=false;
}

void win() {
  player.pos=new PVector(100, 150);
  player.health=100;
  rN++;
  enemy.oC=color(eS[rN][0], eS[rN][1], eS[rN][2]);
  enemy.w=eS[rN][3];
  enemy.h=eS[rN][4];
  enemy.speed=eS[rN][5];
  enemy.damage=eS[rN][6];
  enemy.health=eS[rN][7];
  enemy.maxHealth=eS[rN][7];
  enemy.type=eS[rN][8];
  enemy.pos=new PVector(width-200, height-200);
}