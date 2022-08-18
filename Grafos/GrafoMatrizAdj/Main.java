import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
    
    Grafo grafo = new Grafo(retornaInt("Digite o tamanho da matriz."));
    boolean rodar = true;
    
    while(rodar){
      String opcao = retornaString("\n1. Tamanho Matriz\n2. Criar adjacencia\n3. Remover adjacencia\n4. Imprime adjacencia" +
              "\n5. Seta informação\n6. Adjacentes\n\nS. Encerrar");
      switch(opcao){
          default -> System.out.println("Opção inválida.");
          case "1" -> {
            grafo = new Grafo(retornaInt("Digite o tamanho da matriz."));
                      }
          case "2" -> {
            grafo.cria_adjacencia(retornaInt("Digite o 1ro elemento para criar a adjacencia."),
                    retornaInt("Digite o 2do elemento para criar a adjacencia."), retornaInt("Digite o custo."));
          }
          case "3" -> {
            grafo.remove_adjacencia(retornaInt("Digite o 1ro elemento para desfazer a adjacencia"),
                    retornaInt("Digite o 2do elemento para desfazer a adjacencia"));
          }
          case "4" ->  grafo.imprime_adjacencias();
          case "5" -> grafo.seta_informacao(retornaInt("Digite o indice."), retornaString("Digite o rótulo novo."));
          case "6" -> grafo.adjacentes(retornaInt("Digite o indice do vetor de adjacencia."));
          case "s","S" -> {
              System.out.println("Adeus!!");
              rodar = false;
          }
      }
    }
  }

  static int retornaInt(String pergunta){
    while(true){
    Scanner entrada = new Scanner(System.in);
    System.out.println(pergunta);
    System.out.print(">> ");
    int num = entrada.nextInt();
    if(num >= 0)
      return num;
    }
  }

  static String retornaString(String pergunta) {
    Scanner entrada = new Scanner(System.in);
    System.out.println(pergunta);
    System.out.print(">> ");
    return entrada.nextLine();
  }
}

