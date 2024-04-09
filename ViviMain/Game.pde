class Game extends Scene {
  Game(int sceneId) {
    super(sceneId);
  }
  
  void onClick(){}
    
  void onKeyPressed(boolean [] keys){}
    
  void onKeyReleased(boolean [] keys){}
    
  void onDraw(){
    background(0);
    handlePlayer();
  }
  
  void handlePlayer() {
    Player player = new Player(150, 150);
    player.onDraw();
  }
}
