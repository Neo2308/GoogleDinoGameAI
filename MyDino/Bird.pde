class Bird
{
  float posX;
  int w;
  int h;
  int type;
  int timealive=0;
  Bird(int t)
  {
    t=2;
    type=t;
    posX=width;
    switch(type)
    {
      case 0:
        w = bird1.width;
        h = bird1.height;
        break;
      case 1:
        w = bird1.width;
        h = 70+bird1.height;
        break;
      case 2:
        w = bird1.width;
        h = 140+bird1.height;
        break;
    }
  }
  void show()
  {
    fill(0);
    rectMode(CORNER);
    if(timealive>0)
      image(bird1,posX-bird1.width/2,height-groundHeight-h);
    else
      image(bird2,posX-bird2.width/2,height-groundHeight-h);
      
    //rect(posX-w/2,height -groundHeight-h,w,h);
    //switch(type)
    //{
    //  case 0:
    //    image(Bird1,posX-smallCactus.width/2,height-groundHeight-smallCactus.height);
    //    break;
    //  case 1:
    //    image(Bird2,posX-bigCactus.width/2,height-groundHeight-bigCactus.height);
    //    break;
    //  case 2:
    //    image(manySmallCactus,posX-manySmallCactus.width/2,height-groundHeight-manySmallCactus.height);
    //    break;
    //}
  }
  void update()
  {
    incrementcounters();
    move();
  }
  void incrementcounters()
  {
    timealive++;
    if(timealive>15)
      timealive=-15;
  }
  void move()
  {
    posX-=speed;
  }
  boolean collided(float playerUp,float playerDown,float playerLeft,float playerRight)
  {
    float thisUp=h;
    float thisDown=h-bird1.height;
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
