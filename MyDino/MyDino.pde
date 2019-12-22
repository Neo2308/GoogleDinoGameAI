int groundHeight = 250;
int playerXpos = 150;
Player player1 = new Player();
int obstacleTimer = 0;
int minimumTimeBetweenObstacles = 60;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Bird> birds = new ArrayList<Bird>();
float speed = 10;
int randomAddition=0;
boolean checkcollision=true;

PImage dinoRun1;
PImage dinoRun2;
PImage dinoDuck1;
PImage dinoDuck2;
PImage dinoJump;
PImage smallCactus;
PImage bigCactus;
PImage manySmallCactus;
PImage bird1;
PImage bird2;

void setup()
{
  frameRate(60);
  fullScreen();
  dinoRun1 = loadImage("dinorun0000.png");
  dinoRun2 = loadImage("dinorun0001.png");
  dinoDuck1 = loadImage("dinoduck0000.png");
  dinoDuck2 = loadImage("dinoduck0001.png");
  dinoJump = loadImage("dinoJump0000.png");
  smallCactus = loadImage("cactusSmall0000.png");
  bigCactus = loadImage("cactusBig0000.png");
  manySmallCactus = loadImage("cactusSmallMany0000.png");
  bird1 = loadImage("bird1.png");
  bird2 = loadImage("bird2.png");
  
}
void draw()
{
  drawtoscreen();
}
void drawtoscreen()
{
  background(250);
  stroke(0);
  strokeWeight(2);
  line(0, height -groundHeight -30,width,height-groundHeight-30);
  if(!player1.dead)
  {
    player1.nextframe();
    updateObstacles();
  }
  else
  {
    textAlign(CENTER);
    fill(100);
    textSize(40);
    text("GAMEOVER",width/2,height/2);
    player1.show();
    showObstacles();
  }
  textAlign(CENTER);
  fill(0);
  textSize(40);
  text("Score:"+player1.score,150,height-60);
}
void keyPressed()
{
  if(!player1.dead)
  {
    switch(key)
    {
      case 'w':
      case 'W':
        player1.jump(true);
        break;
      case CODED:
        switch(keyCode)
        {
          case UP:
            player1.jump(false);
            break;
          case DOWN:
            player1.duck();
            break;
        }
        break;
    }
  }
}
void keyReleased()
{
  if(!player1.dead)
  {
    switch(key)
    {
      case CODED:
        switch(keyCode)
        {
          case DOWN:
            player1.unduck();
            break;
        }
        break;
    }
  }
}
void updateObstacles()
{
  //println(obstacleTimer);
  obstacleTimer++;
  speed+=0.002;
  if(obstacleTimer>minimumTimeBetweenObstacles+randomAddition)
    addObstacle();
  moveObstacles();
  showObstacles();
}
void moveObstacles()
{
  for(int i=0;i<obstacles.size();i++)
  {
    obstacles.get(i).update();
    if(obstacles.get(i).posX < -playerXpos)
    {
      obstacles.remove(i);
      i--;
    }
  }
  for(int i=0;i<birds.size();i++)
  {
    birds.get(i).update();
    if(birds.get(i).posX < -playerXpos)
    {
      birds.remove(i);
      i--;
    }
  }
}
void showObstacles()
{
  for(int i=0;i<obstacles.size();i++)
    obstacles.get(i).show();
  for(int i=0;i<birds.size();i++)
    birds.get(i).show();
}
void addObstacle()
{
  int tempInt = floor(random(3));
  if(player1.lifespan>1000 && random(1)<0.2)
  {
    Bird temp = new Bird(tempInt);
    birds.add(temp);
  }
  else
  {
    Obstacle temp = new Obstacle(tempInt);
    obstacles.add(temp);
  }
  randomAddition = floor(random(50));
  obstacleTimer=0;
}
