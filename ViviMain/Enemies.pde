class Enemy extends Agent {

  Enemy(float startX, float startY)
  {
    super(startX, startY, new EnemyInput());
    loadImageArchive("sprites/player.png");
    tag = "Enemy";
    sizeX = 64;
    sizeY = 151;
    initializeAgent();
  }

  @Override
    public void initializeAgent() {
    interactable = true;
    initialState = "RUN";
    states = new ArrayList<State>();
    states.add(new Idle(this));
    states.add(new RunVertical(this));
    states.add(new Disable(this));
    setUpSprites();
    changeState(initialState);
  }

  @Override
    public void onGetHit(IHittable other) {
    if (other instanceof Agent) {
      Agent otherAgent = (Agent) other;
      if (otherAgent.tag.equals("Player"))
      {
        changeState("DISABLE");
        interactable = false;
      }
    }
  }
}

class EnemyInput implements IAgentInput {

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
