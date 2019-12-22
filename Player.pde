class Player
{
  int score=0;
  float posY=0;
  float velY=0;
  int playerHeight=30;
  int playerWidth=20;
  float gravity=1.2;
  int lifespan=0;
  float maxpos=0;
  boolean dead=false;
  boolean duck=false;
  int runcount=-5;
  void show()
  {
    //fill(0);
    rectMode(CORNER);
    if(duck&&posY==0)
    {
      if(runcount<0)
        image(dinoDuck1,playerXpos-dinoDuck1.width/2,height-groundHeight-(posY+dinoDuck1.height));
      
      else
        image(dinoDuck2,playerXpos-dinoDuck2.width/2,height-groundHeight-(posY+dinoDuck2.height));  
    }
    else if(posY==0)
    {
      if(runcount<0)
        image(dinoRun1,playerXpos-dinoRun1.width/2,height-groundHeight-(posY+dinoRun1.height));
      else
        image(dinoRun2,playerXpos-dinoRun2.width/2,height-groundHeight-(posY+dinoRun2.height));
      //println(playerXpos-dinoRun2.width/2,height-groundHeight-(posY+dinoRun2.height));
    }
    else
    {
      image(dinoJump,playerXpos-dinoJump.width/2,height-groundHeight-(posY+dinoJump.height));
    }
  }
  void jump(boolean bigjump)
  {
    if(posY==0)
    {
      if(bigjump==true)
      {
        gravity = 1;
        velY = 20;
      }
      else
      {
        gravity = 1.2;
        velY = 16;
      }
    }
  }
  void update()
  {
    incrementcounters();
    move();
  }
  void incrementcounters()
  {
    lifespan++;
    if(lifespan%3==0)
      score++;
    runcount++;
    if(runcount>5)
      runcount=-5;
  }
  void move()
  {
    posY+=velY;
    if(posY>0)
      velY-=gravity;
    else
    {
      velY = 0;
      posY = 0;
    }
    rectMode(CORNER);
    if(checkcollision)
    {
      float playerup;
      float playerdown;
      float playerleft;
      float playerright;
      if(duck&&posY==0)
      {
        playerup=posY+dinoDuck1.height;
        playerdown=posY;
        playerleft=playerXpos-dinoDuck1.width/2;
        playerright=playerXpos+dinoDuck1.width/2;
        //rect(playerleft,height-groundHeight-playerup,dinoDuck1.width,dinoDuck1.height);
      }
      else if(posY==0)
      {
        playerup=posY+dinoRun1.height;
        playerdown=posY;
        playerleft=playerXpos-dinoRun1.width/2;
        playerright=playerXpos+dinoRun1.width/2;
        //rect(playerleft,height-groundHeight-playerup,dinoRun1.width,dinoRun1.height);
        //println(playerXpos-dinoRun2.width/2,height-groundHeight-(posY+dinoRun2.height));
      }
      else
      {
        playerup=posY+dinoJump.height;
        playerdown=posY;
        playerleft=playerXpos-dinoJump.width/2;
        playerright=playerXpos+dinoJump.width/2;
        //rect(playerleft,height-groundHeight-playerup,dinoJump.width,dinoJump.height);
      }
      for(int i=0;i<obstacles.size();i++)
      {
        if(obstacles.get(i).collided(playerup,playerdown,playerleft,playerright))
        {
          dead=true;
          return;
        }
      }
      for(int i=0;i<birds.size();i++)
      {
        if(birds.get(i).collided(playerup,playerdown,playerleft,playerright))
        {
          dead=true;
          return;
        }
      }
    }
    maxpos=max(maxpos,posY);
  }
  void nextframe()
  {
    update();
    show();
  }
  void duck()
  {
    duck=true;
    if(posY>0)
      gravity=3;
  }
  void unduck()
  {
    duck=false;
  }
}
