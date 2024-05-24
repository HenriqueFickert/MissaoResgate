class Agent extends WorldObject implements IHittable {
  ArrayList<State> states;
  State currentState;
  State previousState;
  String initialState;
  public String currentStateName;

  float speed = 10;
  IAgentInput agentInput;

  PImage[] sprites;
  int currentFrame = 0;
  int totalFrames;
  int frameDelay = 10;
  int frameCount = 0;

  public float boostVelocity = 0;

  Agent(float startX, float startY, IAgentInput agentInput)
  {
    super(startX, startY);
    this.agentInput = agentInput;
  }

  public void initializeAgent()
  {
    setUpSprites();
    changeState(initialState);
  }

  void render() {
    image(sprites[currentFrame], positionX, positionY, sizeX, sizeY);
    updateFrame();
  }

  void onDraw()
  {
    currentState.onDrawState();
    render();
  }

  protected void changeState(String state)
  {
    State desiredState = getStateByName(state);

    if (desiredState == null)
      return;

    if (currentState != null)
      currentState.onExitState();

    previousState = currentState;
    currentState = desiredState;
    currentStateName = currentState.name;
    currentState.onEnterState();
  }

  protected State getStateByName(String name) {
    for (State state : states) {
      if (state.name.equals(name)) {
        return state;
      }
    }
    return null;
  }

  public void onGetHit(IHittable other) {
  }

  protected void setUpSprites() {
    totalFrames = sprite.width / sizeX;
    sprites = new PImage[totalFrames];

    for (int i = 0; i < totalFrames; i++) {
      sprites[i] = sprite.get(i * sizeX, 0, sizeX, sizeY);
    }
  }

  private void updateFrame() {
    frameCount++;
    if (frameCount >= frameDelay) {
      frameCount = 0;
      currentFrame = (currentFrame + 1) % totalFrames;
    }
  }
  
  public void boostVelocity(float boostVelocity){
    this.boostVelocity = boostVelocity; 
  }
}
