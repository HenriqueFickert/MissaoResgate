class Game extends Scene {
  Player player = new Player(300, 700);
  EnemySpawner enemySpawner = new EnemySpawner();
  
  Game(int sceneId) {
    super(sceneId);
  }
  
  void onClick(){}
    
  void onKeyPressed(boolean [] keys)
  {
    player.agentInput.processInput(keys);
  }
    
  void onKeyReleased(boolean [] keys)
  {
    player.agentInput.processInput(keys);
  }
    
  void onDraw(){
    drawBackGround();
    player.onDraw();
    enemySpawner.onDraw();
    detectCollisions();
  }
  
  void detectCollisions(){
    for (WorldObject object : enemySpawner.enemies) {
      if (object.tag == "Enemy" && player.detectCollision(object)) {
      }
    }
  }
  
  void drawBackGround(){
      background(235);
  }
}
