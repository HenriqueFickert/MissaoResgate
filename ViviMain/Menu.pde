class Menu extends Scene {
  StartButton startbutton;
  
  Textfield txtUsername;
  Table table;
  int lineCounter;
  boolean pedirNome=true;
  String jogador="";

  Menu(int sceneId) {
    super(sceneId);
    startbutton = new StartButton(getMiddleScreenX(150),getMiddleScreenY(50));

    txtUsername = cp5.addTextfield("NOME DO JOGADOR")
                  .setPosition(getMiddleScreenX(100), getMiddleScreenY(30) - 75)
                  .setSize(100, 30)
                  .setVisible (false);
                 
      txtUsername.setVisible(true);
      txtUsername.setFocus(true);
      
      
    table = loadTable(filePath, "header");
    int posy = 284;
    fill(0);
    for (TableRow row : table.rows()) {
      text(row.getString("jogador"), 160, posy);
      text(row.getString("pontos"), 577, posy);
      posy += 53;
    }
  }
  
  private void savePoints(){
      table = loadTable(filePath, "header"); //lê o arquivo indicando que há um cabeçalho
      table.setColumnType("pontos", Table.INT); //marca como int para ordenar por pontos
      TableRow newRow = table.addRow(); //cria uma nova linha na tabela
      newRow.setString("jogador", jogador);
     // newRow.setInt("pontos", pontos);
      table.sortReverse("pontos");
      lineCounter = table.getRowCount(); //pega o número de linhas da tabela
      if (lineCounter > 2) { //limita o número de jogadores no placar
        table.removeRow(lineCounter-1); //remove o último da lista
      }
      saveTable(table, filePath); // botao voltar game over
  }
  
  public void jogador(String texto) {
  jogador = texto;
  txtUsername.setVisible(false);
  pedirNome = false;
}
  
  void onClick()
  {
    if (startbutton.detectMouseCollision())
      startbutton.onClick();
  }
    
  void onKeyPressed(boolean [] keys){}
    
  void onKeyReleased(boolean [] keys){}
    
  void onDraw(){
   startbutton.render();
  }
  
  public float getMiddleScreenX(int size){
   return (width - size) / 2;
  }
  
  public float getMiddleScreenY(int size){
   return (height - size) / 2;
  }
}
