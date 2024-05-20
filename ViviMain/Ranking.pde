class Ranking {
  Textfield txtUsername;
  Table table;
  int lineCounter;
  String player="";
  int points = 0;
  String filePath = "data/hiscores.csv";

  public void savePoints() {
    table = loadTable(filePath, "header");
    table.setColumnType("points", Table.INT);
    TableRow newRow = table.addRow();
    newRow.setString("player", player);
    newRow.setInt("points", points);
    table.sortReverse("points");

    lineCounter = table.getRowCount();
    if (lineCounter > 10) {
      table.removeRow(lineCounter-1);
    }

    saveTable(table, filePath);
  }

  public void createUsernameInput(float positionX, float positionY) {
    txtUsername = cp5.addTextfield("")
      .setPosition(positionX, positionY)
      .setFont(smallFont) 
      .setSize(200, 40)
      .setVisible(false);
  }

  public void setUsernameVisible(boolean isVisible) {
    txtUsername.setVisible(isVisible);
    txtUsername.setFocus(isVisible);
  }

  public void createRankingTable(float positionX, float positionY, float rowGap, float colummGap) {
    table = loadTable(filePath, "header");
    fill(0);
    textAlign(LEFT);
    textSize(16);
    int rank = 1;
    for (TableRow row : table.rows()) {
      text(rank + ".", positionX, positionY);
      text(row.getString("player"), positionX + 30, positionY);
      text(row.getString("points" )+ "pts", positionX + colummGap, positionY);
      positionY += rowGap;
      rank++;
    }
  }

  public String getPlayerName() {
    return player;
  }

  public void setPlayerName() {
    this.player = txtUsername.getText();
  }

  public String getInputText() {
    return txtUsername.getText();
  }

  public void setPoints(int points) {
    this.points = points;
  }
}
