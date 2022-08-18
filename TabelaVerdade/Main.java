import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        // Instanciando a classe que receberá a expressão do usuário e a classe das funcionalidades da tabela.
        Scanner input = new Scanner(System.in);
        TabelaVerdade tabela = new TabelaVerdade();

        // Criando um loop apenas para garantir que o usuário possa continuar o programa caso digite algo errado.
        while (true) {

            // Pedindo para o usuário digitar a expressão digitada, seguindo as limitações.
            System.out.println("Digite a expressão lógica, utilizando variáveis p, q, r, e canônicos (~/^/v), ou S para encerrar: ");

            // Armazenando a expressão digitada em uma variável.
            String expressao = input.nextLine();

            // Usuário tecla S/s caso queira encerar o programa.
            if(expressao.equals("s") || expressao.equals("S")) {
                System.exit(0);
            }
            else {
                // Enviando a expressão para o método.
                tabela.checkVariaveis(expressao);
            }
        }
    }
}
