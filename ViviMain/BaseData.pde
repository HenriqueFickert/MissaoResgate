public abstract class WorldObject {
  public float positionX, positionY;
  int sizeX = 100, sizeY = 100;
  public String tag = "";
  PImage sprite;
  public boolean interactable = true;

  public WorldObject(float startX, float startY) {
    positionX = startX;
    positionY = startY;
  }

  protected abstract void render();

  protected abstract void onDraw();

  public boolean detectCollision(WorldObject collisionWorldObject) {
    boolean overlapX = positionX < collisionWorldObject.positionX + collisionWorldObject.sizeX && positionX + sizeX > collisionWorldObject.positionX;
    boolean overlapY = positionY < collisionWorldObject.positionY + collisionWorldObject.sizeY && positionY + sizeY > collisionWorldObject.positionY;
    return overlapX && overlapY;
  }

  public void setPosition(float x, float y) {
    this.positionX = x;
    this.positionY = y;
  }

  public void loadImageArchive (String path) {
    sprite = loadImage(path);
  }
}

public abstract class UIObject {
    float positionX, positionY;
    int sizeX = 100, sizeY = 100;
    PImage sprite;
    IClickAction clickAction;

    public UIObject(float startX, float startY, int sizeX, int sizeY, IClickAction action) {
        positionX = startX;
        positionY = startY;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.clickAction = action;
    }

    public void onClick() {
        if (clickAction != null) {
            clickAction.execute();
        }
    }

  public boolean detectMouseCollision() {
    boolean overlapX = mouseX >= positionX && mouseX <= positionX + sizeX;
    boolean overlapY = mouseY >= positionY && mouseY <= positionY + sizeY;
    return overlapX && overlapY;
  }

  public void loadImageArchive (String path) {
    sprite = loadImage(path);
  }

  public void render() {
    image(sprite.get(0, 0, sizeX, sizeY), positionX, positionY);
  }
}

public abstract class Scene {
  int sceneId;

  public Scene(int sceneId) {
    this.sceneId = sceneId;
  }

  protected abstract void onClick();

  protected abstract void onKeyPressed(boolean [] keys);

  protected abstract void onKeyReleased(boolean [] keys);

  protected abstract void onDraw();
}

public abstract class State {
  String name = "";
  protected Agent agent;

  public State(String name, Agent agent) {
    this.name = name;
    this.agent = agent;
  }

  public abstract void onEnterState();

  public abstract void onDrawState();

  public abstract void onExitState();
}
