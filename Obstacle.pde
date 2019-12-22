class Obstacle
{
  float posX;
  int w;
  int h;
  int type;
  Obstacle(int t)
  {
    type=t;
    posX=width;
    switch(type)
    {
      case 0:
        w = smallCactus.width;
        h = smallCactus.height;
        break;
      case 1:
        w = bigCactus.width;
        h = bigCactus.height;
        break;
      case 2:
        w = manySmallCactus.width;
        h = manySmallCactus.height;
        break;
    }
  }
  void show()
  {
    fill(0);
    rectMode(CORNER);
    //rect(posX-w/2,height -groundHeight-h,w,h);
    switch(type)
    {
      case 0:
        image(smallCactus,posX-smallCactus.width/2,height-groundHeight-smallCactus.height);
        break;
      case 1:
        image(bigCactus,posX-bigCactus.width/2,height-groundHeight-bigCactus.height);
        break;
      case 2:
        image(manySmallCactus,posX-manySmallCactus.width/2,height-groundHeight-manySmallCactus.height);
        break;
    }
  }
  void update()
  {
    move();
  }
  void move()
  {
    posX-=speed;
  }
  boolean collided(float playerUp,float playerDown,float playerLeft,float playerRight)
  {
    float thisUp=h;
    float thisDown=0;
    float thisLeft=posX-w/2;
    float thisRight=posX+w/2;
    if(thisLeft<playerRight&&playerLeft<thisRight)
    {
      if(thisDown<playerUp&&playerDown<thisUp)
        return true;
    }
    return false;
  }
}
