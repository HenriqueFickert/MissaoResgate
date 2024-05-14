class Button extends UIObject {

  PFont boldFont;
  boolean useText = true;

  Button(float startX, float startY, ClickAction action) {
    super(startX, startY, 150, 50, action);
    loadImageArchive("sprites/playbutton.png");
    boldFont = createFont("Arial-Bold", 16);
  }

  Button(String imagepath, boolean useText, float startX, float startY, ClickAction action) {
    super(startX, startY, 150, 50, action);
    loadImageArchive(imagepath);
    boldFont = createFont("Arial-Bold", 16);
    this.useText = useText;
  }

  public void render() {
    image(sprite, positionX, positionY);

    if (useText) {
      textFont(boldFont);
      textAlign(CENTER, CENTER);
      fill(0xFFFF7C28);
      textSize(16);
      float textX = positionX + sizeX / 2;
      float textY = positionY + sizeY / 2;
      text("PLAY", textX, textY);
    }
  }
}
