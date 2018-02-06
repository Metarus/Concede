class Player extends Entity {
  float health=100;
  int atkTimer, invul;
  boolean right=true;
  PVector armP=new PVector(0, 0);
  PVector armD=new PVector(0, 0);
  Player(color _c, float posX, float posY, float _w, float _h) {
    super(_c, posX, posY, _w, _h);
  }

  void pUpdate() {
    player.invul--;
    movement();
    drawHealth();
    if(health<=0){reset();}
  }

  void pDisplay() {
    display();
    fill(255);
    if (!wP&&!sP) {
      armD=new PVector(160, 40);
      if (right) {
        rect(pos.x+10, pos.y-30, 10, 10);
        rect(pos.x+30, pos.y-30, 10, 10);
        armP=new PVector(pos.x+130, pos.y);
      } else {
        rect(pos.x-10, pos.y-30, 10, 10);
        rect(pos.x-30, pos.y-30, 10, 10);
        armP=new PVector(pos.x-130, pos.y);
      }
    } else {
      armD=new PVector(40, 160);
      if (wP) {
        rect(pos.x+10, pos.y-40, 10, 10);
        rect(pos.x-10, pos.y-40, 10, 10);
        armP=new PVector(pos.x, pos.y-130);
      } else {
        rect(pos.x+10, pos.y+20, 10, 10);
        rect(pos.x-10, pos.y+20, 10, 10);
        armP=new PVector(pos.x, pos.y+130);
      }
    }
    if(atkTimer>0) {
      fill(0, 0, 255);
      rect(armP.x, armP.y, armD.x, armD.y);
    }
  }

  void movement() {
    if(!concede) {
      if(aP) {
        applyForce(-5, 0); 
        right=false;
      }
      if(dP) {
        applyForce( 5, 0); 
        right=true;
      }
      if(spaceP&&pos.y>=height-151) {
        applyForce(0, -70);
      }
    }
    atkTimer-=1;
  }

  void drawHealth() {
    rectMode(CORNER);
    fill(0);
    rect(0, 0, width, 60);
    fill(255);
    rect(5, 5, width-10, 50);
    fill(255, 0, 0);
    rect(5, 5, health/100*(width-10), 50);
    rectMode(CENTER);
  }

  void attack() {
    atkTimer=10;
  }
}