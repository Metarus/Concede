class Enemy extends Entity {
  float damage, speed, health, maxHealth;
  int invul, type, oC;
  Enemy(color _c, float posX, float posY, float _w, float _h, float _speed, float _damage, int _health, int _type) {
    super(_c, posX, posY, _w, _h);
    damage=_damage;
    speed=_speed;
    health=_health;
    type=_type;
    maxHealth=health;
    oC=c;
  }

  void eUpdate() {
    invul--;
    if (aabb(player.pos.x-player.w/2, player.pos.y-player.h/2, player.w, player.h, pos.x-w/2, pos.y-h/2, w, h)) {
      PVector force=new PVector(player.pos.x-pos.x, player.pos.y-pos.y);
      force.normalize();
      player.applyForce(50*force.x, 50*force.y);
      player.move();
      if(player.invul<0){player.health-=damage; player.invul=20;}
      if(concede){
        if(health>maxHealth/5){player.health=0;} else {
          player.health=100;
          concede=false;
          win();
        }
      }
    }
    if (player.atkTimer>0) {
      if (aabb(player.armP.x-player.armD.x/2, player.armP.y-player.armD.y/2, player.armD.x, player.armD.y, pos.x-w/2, pos.y-h/2, w, h)) {
        PVector force=new PVector(player.armP.x-player.pos.x, player.armP.y-player.pos.y-50);
        force.normalize();
        applyForce(force.x*10, force.y*10);
        player.applyForce(force.x*-10, force.y*-10);
        if(invul<0){health-=5; invul=20;}
      }
    }
    atk();
    if(invul>0) {
      c=color(255, 200, 0);
    } else c=oC;
    if(health<=0) {reset();}
  }
  
  void atk() {
    switch(type) {
      case 0:
        if(player.pos.x<pos.x) {
          applyForce(-speed*health/maxHealth, 0);
        } else applyForce(speed*health/maxHealth, 0);
        if(abs(player.pos.x-pos.x)<300&&pos.y>=height-151) {
          applyForce(0, -70);
        }
        break;
      case 1:
        if(player.pos.x<pos.x) {
          applyForce(-speed*maxHealth/(health+20), 0);
        } else applyForce(speed*maxHealth/health, 0);
        if(abs(player.pos.x-pos.x)<300&&pos.y>=height-151) {
          applyForce(0, -70);
        }
        break;
    }
  }
}