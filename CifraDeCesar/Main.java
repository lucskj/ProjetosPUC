/*
Gabriel Antonio Gomes de Farias
Lucas Kreutzer de Jesus
*/

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        boolean flag = true;
        Cifra_Cesar cifra_cesar = new Cifra_Cesar();

        while (flag)
        {
            System.out.println("1. Criptografar\n2. Descriptografar\nS. Encerrar\n");
            String opcao = retornaStr("Escolha uma opção.");

            switch (opcao)
            {
                default -> System.out.println("Opção invalida.");
                case "1" -> cifra_cesar.textoCrip(retornaStr("Digite o texto: "), cifra_cesar.retornaChave());
                case "2" -> cifra_cesar.textoDescrip(retornaStr("Digite o texto: "), cifra_cesar.retornaChave());
                case "s","S" -> {System.out.println("\nAdeus!"); flag = false;}
            }
        }
    }

    static String retornaStr(String pergunta)
    {
        Scanner entrada = new Scanner(System.in);
        System.out.println(pergunta);
        System.out.print(">> ");
        return entrada.nextLine();
    }
}
