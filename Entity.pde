class Entity {
  PVector pos=new PVector(0, 0);
  PVector vel=new PVector(0, 0);
  int w, h;
  color c;
  Entity(color _c, float posX, float posY, float _w, float _h) {
    pos.x=posX;
    pos.y=posY;
    w=int(_w);
    h=int(_h);
    c=_c;
  }

  void update() {
    physics();
    move();
  }

  void display() {
    fill(c);
    rect(pos.x, pos.y, w, h);
  }

  void move() {
    pos.x+=vel.x;
    pos.y+=vel.y;
    if (pos.y>=height-(100+h/2)) {
      pos.y=height-(100+h/2);
      vel.y*=-0.4;
    }
    if (pos.x>=width-w/2) {
      pos.x=width-w/2;
      vel.x=0;
    }
    if (pos.x<=w/2) {
      pos.x=w/2;
      vel.x=0;
    }
  }

  void applyForce(float accX, float accY) {
    vel.x+=accX;
    vel.y+=accY;
  }

  void physics() {
    applyForce(0, 5);
    applyForce(0.1*-vel.x, 0.02*-vel.y);
  }
}