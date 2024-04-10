class Enemy extends Agent {
  
  Enemy(float startX, float startY)
  {
    super(startX, startY, new EnemyInput());
    loadImageArchive("sprites/player.png");
    sizeX = 80;
    sizeY = 30;
    initializeEnemy();
  }

  private void initializeEnemy(){
    initialState = "RUNVERTICAL";
    states = new ArrayList<State>();
    states.add(new Idle(this));
    states.add(new RunVertical(this));
    states.add(new Die(this));
    initializeAgent();
  }
}

class EnemyInput  implements IAgentInput{
 
    private boolean isRunning = true;
    private int direction = 1;
  
    public void processInput(boolean[] keys) {
    }
    
    public int getDirection() {
      return direction;
    }
    
    public boolean isRunning() {
      return isRunning;
    }
}
