class Ranking {
  Textfield txtUsername;
  Table table;
  int lineCounter;
  String player="";
  int points = 0;
  String filePath = "hiscores.csv";

  public void savePoints() {
    table = loadTable(filePath, "header");
    table.setColumnType("points", Table.INT);
    TableRow newRow = table.addRow();
    newRow.setString("player", player);
    newRow.setInt("points", points);
    table.sortReverse("points");

    lineCounter = table.getRowCount();
    if (lineCounter > 2) {
      table.removeRow(lineCounter-1);
    }

    saveTable(table, filePath);
  }

  public void createUsernameInput(float positionX, float positionY) {
    txtUsername = cp5.addTextfield("Nickname")
      .setPosition(positionX, positionY)
      .setSize(100, 30)
      .setVisible (true);
  }

  public void setUsernameVisible(boolean isVisible) {
    txtUsername.setVisible(isVisible);
    txtUsername.setFocus(isVisible);
  }

  public void createRankingTable(float positionY, float positionX, float rowGap, float colummGap) {
    table = loadTable(filePath, "header");
    fill(0);
    for (TableRow row : table.rows()) {
      text(row.getString("player"), positionX, positionY);
      text(row.getString("points"), positionX + colummGap, positionY);
      positionY += rowGap;
    }
  }

  public void setPlayerName() {
    this.player = txtUsername.getText();
  }

  public void setPoints(int points) {
    this.points = points;
  }
}
