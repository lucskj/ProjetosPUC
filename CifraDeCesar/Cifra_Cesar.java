import java.text.Normalizer;
import java.util.Scanner;

public class Cifra_Cesar {
    char[] alfabeto = new char[]
            {'a', 'b', 'c', 'd', 'e',
            'f', 'g', 'h', 'i', 'j',
            'k', 'l', 'm', 'n', 'o',
            'p', 'q', 'r', 's', 't',
            'u', 'v', 'w', 'x', 'y',
            'z'};

    char[] extras = new char[]
            {'/', ' ', '*', ';', ':', '.',
            ',', '"', '(', ')', '[', ']',
            '{', '}', '!', '@', '#', '$',
            '%', '¨', '&', '-', '_', '+',
            '=', '0', '1', '2', '3', '4',
            '5', '6', '7', '8', '9'};

    public void textoCrip(String texto, int chave) {
        texto = Normalizer.normalize(texto, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");

        char[] texto_char = new char[texto.length()];
        for (int i = 0; i < texto.length(); i++)
            texto_char[i] = texto.charAt(i);

        StringBuilder novoTexto = new StringBuilder("");
        int posicaoNova = 0;
        char digitoNovo;

        for (char letra : texto_char) {
            if (!checkChar(letra, extras)) {
                for (int i = 0; i < alfabeto.length; i++) {
                    posicaoNova = i + chave;
                    if (posicaoNova > 25)
                        posicaoNova = i + chave - 26;
                    digitoNovo = alfabeto[posicaoNova];

                    if (letra == alfabeto[i])
                        novoTexto.append(digitoNovo);
                    else if (letra == Character.toUpperCase(alfabeto[i]))
                        novoTexto.append(Character.toUpperCase(digitoNovo));
                }
            } else
                novoTexto.append(letra);
        }
        System.out.println(novoTexto);
    }

    public void textoDescrip(String texto, int chave) {
        texto = Normalizer.normalize(texto, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");

        char[] texto_char = new char[texto.length()];
        for (int i = 0; i < texto.length(); i++) {
            texto_char[i] = texto.charAt(i);
        }

        StringBuilder novoTexto = new StringBuilder("");
        int posicaoNova = 0;
        char digitoNovo;

        for (char letra : texto_char) {
            if (!checkChar(letra, extras)) {
                for (int i = 0; i < alfabeto.length; i++) {
                    posicaoNova = i - chave;
                    if (posicaoNova < 0)
                        posicaoNova = 26 + posicaoNova;
                    digitoNovo = alfabeto[posicaoNova];

                    if (letra == alfabeto[i])
                        novoTexto.append(digitoNovo);
                    else if (letra == Character.toUpperCase(alfabeto[i]))
                        novoTexto.append(Character.toUpperCase(digitoNovo));
                }
            } else
                novoTexto.append(letra);
        }
        System.out.println(novoTexto);
    }

    public int retornaChave() {
        Scanner entrada = new Scanner(System.in);
        System.out.println("Digite a chave desejada: ");
        return entrada.nextInt();
    }

    public boolean checkChar(char letra, char[] symbols) {
        for (char x : symbols) {
            if (letra == x)
                return true;
        }
        return false;
    }
}
