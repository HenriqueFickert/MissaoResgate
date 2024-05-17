class Button extends UIObject {
  PFont boldFont;
  boolean useText = true;
  String text = "";

  Button(float startX, float startY, String text, IClickAction action) {
    super(startX, startY, 150, 50, action);
    loadImageArchive("sprites/playbutton.png");
    boldFont = createFont("Arial-Bold", 16);
    this.text = text;
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
      textFont(font, 16);
      textAlign(CENTER, CENTER);
      fill(0xFFFF7C28);
      textSize(16);
      float textX = positionX + sizeX / 2;
      float textY = positionY + sizeY / 2;
      text(text, textX, textY);
    }
  }
}
