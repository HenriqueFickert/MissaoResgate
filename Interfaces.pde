interface IClickAction {
  void execute();
}

interface IAgentInput {
  public void processInput(boolean[] keys);
  public int getDirection();
  public boolean isRunning();
}

interface IHittable {
  public void onGetHit(IHittable collidedWith);
}
