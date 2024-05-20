class AgentSpawner {
  public ArrayList<Agent> agents;
  int[] spotsX = new int[4];
  int lastSpawnTime;

  AgentSpawner() {
    agents = new ArrayList<Agent>();
    initializeSpots();
    lastSpawnTime = millis();
  }

  void initializeSpots() {
    int margin = 50;
    int usableWidth = width - (2 * margin);
    int columnWidth = usableWidth / spotsX.length;

    for (int i = 0; i < 4; i++) {
      int centerX = margin + (i * columnWidth) + (columnWidth / spotsX.length);
      spotsX[i] = centerX;
    }
  }

  void onDraw() {
    if (millis() - lastSpawnTime > 1000) {
      if (random(1) < 0.5) {
        spawnTwoAgents();
      } else {
        poolingAgents((int) random(spotsX.length));
      }
      lastSpawnTime = millis();
    }

    for (Agent agent : agents) {
      agent.onDraw();
    }
  }

  void poolingAgents(int columnIndex) {
    if (columnIndex < 0 || columnIndex >= spotsX.length) return;

    String agentType;
    float randomValue = random(1);
    if (randomValue < 0.33) {
      agentType = "House";
    } else if (randomValue < 0.66) {
      agentType = "Tree";
    } else {
      agentType = "Cat";
    }

    for (Agent agent : agents) {
      if (agent.currentStateName.equals("DISABLE") && agent.getClass().getSimpleName().equals(agentType)) {
        agent.setPosition(spotsX[columnIndex], -100);
        agent.initializeAgent();
        return;
      }
    }

    Agent newAgent;
    if (agentType.equals("House")) {
      newAgent = new House(spotsX[columnIndex], -100);
    } else if (agentType.equals("Tree")) {
      newAgent = new Tree(spotsX[columnIndex], -100);
    } else {
      newAgent = new Cat(spotsX[columnIndex], -100);
    }

    agents.add(newAgent);
  }

  void spawnTwoAgents() {
    int firstColumn = (int) random(spotsX.length);
    int secondColumn = (int) random(spotsX.length);
    while (secondColumn == firstColumn) {
      secondColumn = (int) random(spotsX.length);
    }

    poolingAgents(firstColumn);
    poolingAgents(secondColumn);
  }
}
