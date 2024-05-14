class StartButton extends UIObject {
  PFont boldFont;

  StartButton(float startX, float startY)
  {
    super(startX, startY, 150, 50);
    loadImageArchive("sprites/playbutton.png");
    boldFont = createFont("Arial-Bold", 16);
  }

  protected  void onClick()
  {
    currentScreen = 1;
  }

  public void render()
  {
    image(sprite.get(0, 0, sizeX, sizeY), positionX, positionY);
    textFont(boldFont);
    textAlign(CENTER, CENTER);
    fill(0xFFFF7C28);
    textSize(16);
    float textX = positionX + sizeX / 2;
    float textY = positionY + sizeY / 2;
    text("PLAY", textX, textY);
  }
}
