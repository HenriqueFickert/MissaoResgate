class Button extends UIObject {
  PFont boldFont;
  boolean useText = true;
  String text = "";

  Button(float startX, float startY, String text, IClickAction action) {
    super(startX, startY, 150, 45, action);
    loadImageArchive("sprites/botao-jogo.png");
    this.text = text;
  }

  Button(float startX, float startY, int sizeX, int sizeY, PImage sprite, IClickAction action) {
    super(startX, startY, sizeX, sizeY, action);
    this.sprite = sprite;
  }

  Button(String imagepath, boolean useText, float startX, float startY, String text, IClickAction action) {
    super(startX, startY, 150, 50, action);
    loadImageArchive(imagepath);
    this.useText = useText;
    this.text = text;
  }

  public void render() {
    image(sprite, positionX, positionY);

    if (useText) {
      textFont(font, regularSize);
      textAlign(CENTER, CENTER);
      fill(whiteColor);
      float textX = positionX + sizeX / 2;
      float textY = positionY + sizeY / 2;
      text(text, textX, textY);
    }
  }
}
