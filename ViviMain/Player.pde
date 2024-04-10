class Player extends Agent {
  
  Player(float startX, float startY)
  {
    super(startX, startY, new PlayerInput());
    loadImageArchive("sprites/player.png");
    sizeX = 80;
    sizeY = 30;
    initializePlayer();
  }

  private void initializePlayer(){
    initialState = "IDLE";
    states = new ArrayList<State>();
    states.add(new Idle(this));
    states.add(new Run(this));
    states.add(new Die(this));
    initializeAgent();
  }
}

class PlayerInput  implements IAgentInput{
 
    private boolean isRunning = false;
    private int direction = 0;
  
    public void processInput(boolean[] keys) {
      if (keys[RIGHT_ARROW]){
        direction = 1;
      } else if (keys[LEFT_ARROW]) {
        direction = -1;
      } else {
        direction = 0;
      }
      
      isRunning = keys[RIGHT_ARROW] || keys[LEFT_ARROW];
    }
    
    public int getDirection() {
      return direction;
    }
    
    public boolean isRunning() {
      return isRunning;
    }
}
