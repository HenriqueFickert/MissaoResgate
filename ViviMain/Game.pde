class Game extends Scene {
  Game(int sceneId) {
    super(sceneId);
  }
  
  Player player = new Player(300, 700);
  Enemy enemy = new Enemy(300, 100);
  
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
    background(235);
    player.onDraw();
    enemy.onDraw();
    enemy.agentInput.processInput(keys);
  }
}
