import java.util.ArrayList;

public class MatrizAdj {
  ArrayList<ArrayList<Double>> matriz_adj;
  int tamanho;

  // Valor padrão, caso não haja adjacências.
  Double semAdjacencia = Double.POSITIVE_INFINITY;

  public MatrizAdj() {
    this.matriz_adj = new ArrayList<>();
    this.matriz_adj.add(new ArrayList<>());
    this.matriz_adj.get(0).add(semAdjacencia); // Inicializando a matriz com um valor inicial.
    this.tamanho = matriz_adj.size();
  }

  public void definirTamanho() {
    ArrayList<Double> aux = new ArrayList<>();
    for (int i = 0; i < tamanho; i++) {
      aux.add(semAdjacencia);
    }

    matriz_adj.add(aux);
    tamanho++;

    for (int i = 0; i < tamanho; i++) {
      matriz_adj.get(i).add(semAdjacencia);
    }
  }

  // Responsável por definir uma relação de adjacência entre dois nós.
  public void definirAdjacencia(int x, int y, Double valor) {
    // Checagem para garantir que os valores não ultrapassam o limite do tamanho.
    if (y <= matriz_adj.size() - 1 && x <= matriz_adj.size() - 1) {
      matriz_adj.get(x).set(y, valor);
    }
  }

  // Responsável por remover uma relação de adjacência, substituindo seu valor
  // pelo valor padrão definido no início.
  public void desfazerAdjacencia(int x, int y) {
    // Checagem para garantir que os valores não ultrapassam o limite do tamanho.
    if (y <= matriz_adj.size() - 1 && x <= matriz_adj.size() - 1) {
      matriz_adj.get(x).set(y, semAdjacencia);
    }
  }

  // Responsável pela estilização e estruturação da matriz de adjacências.
  public void imprimirMatrizAdj(ArrayList <No> nos) {
    System.out.printf("Tamanho: %s\n", tamanho);
    String tabela_matriz = "|   +   |";
    
    for (int i = 0; i < matriz_adj.size(); i++) {
      String dado = nos.get(i).dado;
      if (dado == null)
        tabela_matriz += "   " + i + "   |";
      else {
        int tamanhoDado = (dado.length());
        switch (tamanhoDado) {
          case 1 -> tabela_matriz += "   " + dado + "   |";
          case 2 -> tabela_matriz += "   " + dado + "  |";
          case 3 -> tabela_matriz += "  " + dado + "  |";
          case 4 -> tabela_matriz += "  " + dado + " |";
          case 5 -> tabela_matriz += " " + dado + " |";
        }
      }
    }
    System.out.println(tabela_matriz);


    for (int i = 0; i < matriz_adj.size(); i++) {
      String dado = nos.get(i).dado;
      
      if (dado == null)
        System.out.printf("|   %d   |", i);
      else {
        int tamanhoDado = (dado.length());
        switch (tamanhoDado) {
          case 1 -> System.out.printf("|   %s   |", dado);
          case 2 -> System.out.printf("|   %s  |", dado);
          case 3 -> System.out.printf("|  %s  |", dado);
          case 4 -> System.out.printf("|  %s |", dado);
          case 5 -> System.out.printf("| %s |", dado);
        }
      }
      
      for (int j = 0; j < matriz_adj.get(i).size(); j++) {
        Double valor = matriz_adj.get(i).get(j);
        int tamanhoValor = (valor.toString().length()) - 2;
        
        if (valor.equals(semAdjacencia))
          System.out.print("   x   |");
        else {
          switch (tamanhoValor) {
            case 1 -> System.out.printf("   %.0f   |", valor);
            case 2 -> System.out.printf("   %.0f  |", valor);
            case 3 -> System.out.printf("  %.0f  |", valor);
            case 4 -> System.out.printf("  %.0f |", valor);
            case 5 -> System.out.printf(" %.0f |", valor);
          }
        }
      }
      System.out.println();
  }
  }

  public int obterAdjacenciasPor(int y) {
    int cont = 0;
    for (int x = 0; x < matriz_adj.size(); x++) {
      Double valor = matriz_adj.get(y).get(x);
      if (valor != semAdjacencia) {
        cont++;
      }
    }
    return cont;
  }
}