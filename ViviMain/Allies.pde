class Cat extends Agent {

  Cat(float startX, float startY)
  {
    super(startX, startY, new EnemyInput());
    loadImageArchive("sprites/heart.png");
    tag = "Ally";
    sizeX = 64;
    sizeY = 151;
    initializeAgent();
    speed = 7;
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
