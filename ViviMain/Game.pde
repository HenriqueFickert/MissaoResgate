class Game extends Scene {
  Player player = new Player(300, 580);
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
  
  private long lastCheck = 0;
  private final long delay = 100000;
  
  void detectCollisions() {
      long now = System.nanoTime();
      if ((now - lastCheck) >= delay) {
          for (WorldObject object : enemySpawner.enemies) {
              if (object.tag.equals("Enemy") && player.detectCollision(object)) {
                  System.out.println("collidiu " + object.tag);
              }
          }
          lastCheck = now; 
      }
  }
  
  void drawBackGround(){
      background(235);
  }
}
