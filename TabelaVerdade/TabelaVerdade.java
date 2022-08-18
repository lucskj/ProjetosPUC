package VersaoFinal;

public class TabelaVerdade {

    // Método responsável por obter o resultado lógico da expressão passada.
    public static char printBit(boolean p) {
        if (p) {
            return 'V';
        }
        else {
            return 'F';
        }
    }

    public void checkVariaveis(String expressao) {

        /*
        Ao receber a expressão, iremos checar quais variáveis estão presentes, para que possamos enviar a informação
        para o próximo método. Além disso, caso a expressão não apresente as variáveis corretas, o usuário receberá um
        aviso.
        */

        if (expressao.contains("p") && !expressao.contains("q") && !expressao.contains("r")) {
            checkExpressao(expressao, "1");
        }
        else if (expressao.contains("p") && expressao.contains("q") && !expressao.contains("r")) {
            checkExpressao(expressao, "2");
        }
        else if (expressao.contains("p") && expressao.contains("q") && expressao.contains("r")) {
            checkExpressao(expressao, "3");
        }
        else {
            System.out.println("\nExpressão inválida. Tente novamente...");
        }
    }

    public void checkExpressao(String expressao, String nVariaveis) {

        /*
        Primeiro, nesse método, são criadas 3 listas de possíveis expressões para cada número de variáveis,
        respectivamente.
        */

        String[] expPossiveis1 = {"p", "~p"};

        String[] expPossiveis2 = {"p^q", "~p^q", "p^~q", "~p^~q", "pvq", "~pvq", "pv~q", "~pv~q"};

        String[] expPossiveis3 = {"p^q^r", "~p^q^r", "p^~q^r", "p^q^~r", "~p^~q^r", "~p^q^~r", "p^~q^~r", "~p^~q^~r",
                                "pvqvr", "~pvqvr", "pv~qvr", "pvqv~r", "~pv~qvr", "~pvqv~r", "pv~qv~r", "~pv~qv~r",
                                "p^qvr", "~p^qvr", "p^~qvr", "p^qv~r", "~p^~qvr", "~p^qv~r", "p^~qv~r", "~p^~qv~r",
                                "pvq^r", "~pvq^r", "pv~q^r", "pvq^~r", "~pv~q^r", "~pvq^~r", "pv~q^~r", "~pv~q^~r"};

        /*
        Em seguida, a expressão recebida é manipulada, fazendo com que todos os espaços em branco sejam removidos, a
        fim de se criar um padrão para compará-la às expressões armazenadas nas listas.
        */

        String expressaoNova = expressao.strip();
        StringBuilder expressaoFinal = new StringBuilder();

        for (int i = 0; i < expressaoNova.length(); i++) {
            if (expressaoNova.charAt(i) != ' ') {
                expressaoFinal.append(expressaoNova.charAt(i));
            }
        }

        /*
        Nesse momento, o programa irá verificar o número de variáveis que foi passado e passará por todos os elementos
        da lista relacionada à tal valor. Caso a expressão do usuário exista na lista, ela será passada como argumento
        para o último método, juntamente de sua posição na lista. Caso contrário, o usuário receberá um aviso.
        */

        boolean sucesso = false;

        switch (nVariaveis) {
            case "1" -> {
                for (int i = 0; i < expPossiveis1.length; i++) {
                    if (expressaoFinal.toString().equals(expPossiveis1[i])) {
                        montarTabela1(expressaoFinal.toString(), i);
                        sucesso = true;
                    }
                }
                if (!sucesso) {
                System.out.println("\nExpressão inválida. Tente novamente...");
                }
            }
            case "2" -> {
                for (int i = 0; i < expPossiveis2.length; i++) {
                    if (expressaoFinal.toString().equals(expPossiveis2[i])) {
                        montarTabela2(expressaoFinal.toString(), i);
                        sucesso = true;
                    }
                }
                if (!sucesso) {
                    System.out.println("\nExpressão inválida. Tente novamente...");
                }
            }
            case "3" -> {
                for (int i = 0; i < expPossiveis3.length; i++) {
                    if (expressaoFinal.toString().equals(expPossiveis3[i])) {
                        montarTabela3(expressaoFinal.toString(), i);
                        sucesso = true;
                    }
                }
                if (!sucesso) {
                    System.out.println("\nExpressão inválida. Tente novamente...");
                }
            }
        }
    }

    /*
    Caso o usuário envie uma expressão com uma variável, a tabela será montada nesse método.
    */

    public void montarTabela1(String expressao, int indice) {

        // Nesse momento, o programa irá inicializar e instanciar variáveis necessárias para o método.
        int i;
        boolean p;
        char resultado = ' ';
        StringBuilder borda = new StringBuilder("----");
        int tamanhoExpressao = expressao.length();

        /*
        Criação de um laço 'for' para realizar a formatação das bordas da tabela. Para isso, inicializei a variável
        'borda' com uma quantidade de traços e fui adicionando mais de acordo com o tamanho da expressão recebida.
        */

        for (int contador = 1; contador < tamanhoExpressao; contador++) {
            borda.append("-");
        }

        // Mais comandos de formatação.
        System.out.printf("+---+%s+\n", borda);
        System.out.printf("| p |  %s \n", expressao);
        System.out.printf("+---+%s+\n", borda);

        // Realizando a checagem de todos os casos possíveis de valores para cada variável por meio do laço 'for'.
        for (i = 1; i >= 0; i--) {
            if (i == 1) {
                p = true;
            } else {
                p = false;
            }

            /*
            Utilizando a posição da expressão das listas criadas no método anterior para obter o resultado lógico da
            expressão.
            */

            switch (indice) {
                case 0 -> resultado = printBit(p);
                case 1 -> resultado = printBit(!p);
            }
            System.out.printf("| %s |  %s  \n", printBit(p), resultado);
        }
        System.out.printf("+---+%s+\n\n", borda);
    }

    /*
    Caso o usuário envie uma expressão com duas variáveis, a tabela será montada nesse método.
    */

    public void montarTabela2(String expressao, int indice) {

        // Novamente, inicializando variáveis necessárias.
        int i;
        boolean p, q;
        char resultado = ' ';
        StringBuilder borda = new StringBuilder("---");
        int tamanhoExpressao = expressao.length();

        // Realizando a formatação das bordas da tabela de acordo com o tamanho da expressão.
        for (int contador = 1; contador < tamanhoExpressao; contador++) {
            borda.append("-");
        }

        // Comandos de formatação.
        System.out.printf("+---+---+%s+\n", borda);
        System.out.printf("| p | q | %s \n", expressao);
        System.out.printf("+---+---+%s+\n", borda);

        // Checando todos os casos possíveis de valores para as variáveis, nesse caso duas.
        for (i = 3; i >= 0; i--) {
            switch (i) {
                case 3 -> {
                    p = true; q = true;
                }
                case 2 -> {
                    p = true; q = false;
                }
                case 1 -> {
                    p = false; q = true;
                }
                default -> {
                    p = false; q = false;
                }
            }

            // Recebendo a informação de qual expressão deve ser resolvida, utilizando como base sua posição na lista.
            switch (indice) {
                case 0 -> resultado = printBit(p && q);
                case 1 -> resultado = printBit(!p && q);
                case 2 -> resultado = printBit(p && !q);
                case 3 -> resultado = printBit(!p && !q);
                case 4 -> resultado = printBit(p || q);
                case 5 -> resultado = printBit(!p || q);
                case 6 -> resultado = printBit(p || !q);
                case 7 -> resultado = printBit(!p || !q);
            }
            System.out.printf("| %s | %s |  %s  \n", printBit(p), printBit(q), resultado);
        }
        System.out.printf("+---+---+%s+\n\n", borda);
    }

    /*
    Caso o usuário envie uma expressão com três variáveis, a tabela será montada nesse método.
    */

    public void montarTabela3(String expressao, int indice) {

        // Inicializando as variáveis.
        int i;
        boolean p, q, r;
        char resultado = ' ';
        StringBuilder borda = new StringBuilder("---");
        int tamanhoExpressao = expressao.length();

        // Formatando a borda da tabela de acordo com o tamanho da expressão recebida.
        for (int contador = 1; contador < tamanhoExpressao; contador++) {
            borda.append("-");
        }

        // Comandos de formatação.
        System.out.printf("+---+---+---+%s+\n", borda);
        System.out.printf("| p | q | r | %s \n", expressao);
        System.out.printf("+---+---+---+%s+\n", borda);

        // Checagem de todos os casos possíveis de valores para as variáveis, nesse caso três.
        for(i = 7; i >= 0; i--) {
            switch (i) {
                case 7 -> {
                    p = true; q = true; r = true;
                }
                case 6 -> {
                    p = true; q = true; r = false;
                }
                case 5 -> {
                    p = true; q = false; r = true;
                }
                case 4 -> {
                    p = true; q = false; r = false;
                }
                case 3 -> {
                    p = false; q = true; r = true;
                }
                case 2 -> {
                    p = false; q = true; r = false;
                }
                case 1 -> {
                    p = false; q = false; r = true;
                }
                default -> {
                    p = false; q = false; r = false;
                }
            }

            // Analisando qual expressão deverá ser resolvida, utilizando como base a posição recebida da lista.
            switch (indice) {
                case 0 -> resultado = printBit(p && q && r);
                case 1 -> resultado = printBit(!p && q && r);
                case 2 -> resultado = printBit(p && !q && r);
                case 3 -> resultado = printBit(p && q && !r);
                case 4 -> resultado = printBit(!p && !q && r);
                case 5 -> resultado = printBit(!p && q && !r);
                case 6 -> resultado = printBit(p && !q && !r);
                case 7 -> resultado = printBit(!p && !q && !r);
                case 8 -> resultado = printBit(p || q || r);
                case 9 -> resultado = printBit(!p || q || r);
                case 10 -> resultado = printBit(p || !q || r);
                case 11 -> resultado = printBit(p || q || !r);
                case 12 -> resultado = printBit(!p || !q || r);
                case 13 -> resultado = printBit(!p || q || !r);
                case 14 -> resultado = printBit(p || !q || !r);
                case 15 -> resultado = printBit(!p || !q || !r);
                case 16 -> resultado = printBit(p && q || r);
                case 17 -> resultado = printBit(!p && q || r);
                case 18 -> resultado = printBit(p && !q || r);
                case 19 -> resultado = printBit(p && q || !r);
                case 20 -> resultado = printBit(!p && !q || r);
                case 21 -> resultado = printBit(!p && q || !r);
                case 22 -> resultado = printBit(p && !q || !r);
                case 23 -> resultado = printBit(!p && !q || !r);
                case 24 -> resultado = printBit(p || q && r);
                case 25 -> resultado = printBit(!p || q && r);
                case 26 -> resultado = printBit(p || !q && r);
                case 27 -> resultado = printBit(p || q && !r);
                case 28 -> resultado = printBit(!p || !q && r);
                case 29 -> resultado = printBit(!p || q && !r);
                case 30 -> resultado = printBit(p || !q && !r);
                case 31 -> resultado = printBit(!p || !q && !r);
            }
            System.out.printf("| %s | %s | %s |   %s   \n", printBit(p), printBit(q), printBit(r), resultado);
        }
        System.out.printf("+---+---+---+%s+\n\n", borda);
    }
}
