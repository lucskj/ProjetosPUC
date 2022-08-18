import java.util.ArrayList;

public class Grafo {
  ArrayList<No> nos;
  MatrizAdj matriz;

  public Grafo(int qtd_nos){
    qtd_nos--;
    this.nos = new ArrayList<>();
    this.matriz = new MatrizAdj(); 
    
    for(int i = 0; i < qtd_nos; i++) {
      nos.add(new No());
      matriz.definirTamanho();
    }

    nos.add(new No());
  }

  public void cria_adjacencia(int i, int j, int P){
    matriz.definirAdjacencia(i,j, (double) P);
  }

  public void remove_adjacencia(int i, int j){
    matriz.desfazerAdjacencia(i, j);
  }

  public void imprime_adjacencias(){
    matriz.imprimirMatrizAdj(nos);
  }

  public void seta_informacao(int i, String V){
    nos.get(i).dado = V;
  }

  public void adjacentes(int i){
    // recebe o vetor i q deve indicar as adjacencias
    System.out.printf("Total de adjacencias por %s: %s",i, matriz.obterAdjacenciasPor(i));
  }

}