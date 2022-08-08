import random


def ver():
    for v in matriz:
        print(v)


def alocar():
    print('Criar matriz para alocação')
    p_valores = [' ', 'X']
    linhas = input('\nN° de linhas\n>> ')
    colunas = input('\nN° de colunas\n>> ')
    if linhas.isnumeric() and colunas.isnumeric():
        linhas = int(linhas)
        colunas = int(colunas)
        if linhas > 0 and colunas > 0:
            matriz = []
            for lin in range(0, linhas):
                linha = []
                for col in range(0, colunas):
                    aleatorio = random.choice(p_valores)
                    linha.append(aleatorio)
                matriz.append(linha)
            return matriz, linhas, colunas
        else:
            print('Erro: As linhas e colunas devem ser maiores que 0')
    else:
        print('Erro: Caracter detectado')


def first_fit():
    tamanho = ''
    check_tamanho = True
    while check_tamanho:
        tamanho = input("Insira o tamanho da memória para alocação: ")
        if tamanho.isnumeric():
            tamanho = int(tamanho)
            check_tamanho = False
        else:
            print('Valor Inválido.')

    posicao_considerada = -1
    linha_considerada = -1
    coluna_considerada = -1
    qtd_vazios = 0

    check_repeticao = False

    for i in range(0, len(matriz)):
        for j in range(0, len(matriz[i])):
            termo = matriz[i][j]
            if termo == ' ' and check_repeticao is False:
                qtd_vazios += 1
                if posicao_considerada == -1 and linha_considerada == -1 and coluna_considerada == -1:
                    posicao_considerada = j
                    coluna_considerada = j
                    linha_considerada = i
                if qtd_vazios == tamanho:
                    while posicao_considerada < j + tamanho:
                        if coluna_considerada >= n_colunas:
                            linha_considerada += 1
                            coluna_considerada = 0
                            matriz[linha_considerada][coluna_considerada] = 'X'
                            posicao_considerada += 1
                            coluna_considerada += 1
                            if posicao_considerada > tamanho:
                                check_repeticao = True
                                break
                        else:
                            matriz[linha_considerada][coluna_considerada] = 'X'
                            posicao_considerada += 1
                            coluna_considerada += 1
                            if posicao_considerada > tamanho:
                                check_repeticao = True
                                break
            else:
                posicao_considerada = -1
                linha_considerada = -1
                coluna_considerada = -1
                qtd_vazios = 0

    return matriz


def worstfit():
    tamanho = ''
    check_tamanho = True
    while check_tamanho:
        tamanho = input("Insira o tamanho da memória para alocação: ")
        if tamanho.isnumeric():
            tamanho = int(tamanho)
            check_tamanho = False
        else:
            print('Valor Inválido.')

    posicao_considerada = -1
    linha_considerada = -1
    coluna_considerada = -1
    qtd_vazios = 0
    seq_vazios = []
    maior_valor = 0

    for i in range(0, len(matriz)):
        for j in range(0, len(matriz[i])):
            termo = matriz[i][j]
            if termo == ' ':
                qtd_vazios += 1
            else:
                seq_vazios.append(qtd_vazios)
                qtd_vazios = 0

    seq_vazios.append(qtd_vazios)
    qtd_vazios = 0

    for i in range(0, len(seq_vazios)):
        if seq_vazios[i] > maior_valor:
            maior_valor = seq_vazios[i]

    check_repeticao = False

    for i in range(0, len(matriz)):
        for j in range(0, len(matriz[i])):
            termo = matriz[i][j]
            if termo == ' ' and check_repeticao is False:
                qtd_vazios += 1
                if posicao_considerada == -1 and linha_considerada == -1 and coluna_considerada == 1:
                    posicao_considerada = j
                    coluna_considerada = j
                    linha_considerada = i
                if qtd_vazios == maior_valor:
                    while posicao_considerada < i + tamanho:
                        if coluna_considerada >= n_colunas:
                            linha_considerada += 1
                            coluna_considerada = 0
                            matriz[linha_considerada][coluna_considerada] = 'X'
                            posicao_considerada += 1
                            coluna_considerada += 1
                            if posicao_considerada >= tamanho:
                                check_repeticao = True
                                break
                        else:
                            matriz[linha_considerada][coluna_considerada] = 'X'
                            posicao_considerada += 1
                            coluna_considerada += 1
                            if posicao_considerada >= tamanho:
                                check_repeticao = True
                                break
            else:
                posicao_considerada = -1
                linha_considerada = -1
                coluna_considerada = -1
                qtd_vazios = 0

    return matriz


def bestfit():
    tamanho = ''
    check_tamanho = True
    while check_tamanho:
        tamanho = input("Insira o tamanho da memória para alocação: ")
        if tamanho.isnumeric():
            tamanho = int(tamanho)
            check_tamanho = False
        else:
            print('Valor Inválido.')

    posicao_considerada = -1
    linha_considerada = -1
    coluna_considerada = -1
    qtd_vazios = 0
    seq_vazios = []
    valor_ideal = 10

    for i in range(0, len(matriz)):
        for j in range(0, len(matriz[i])):
            termo = matriz[i][j]
            if termo == ' ':
                qtd_vazios += 1
            else:
                seq_vazios.append(qtd_vazios)
                qtd_vazios = 0

    seq_vazios.append(qtd_vazios)
    qtd_vazios = 0
    seq_possiveis = []

    for i in range(0, len(seq_vazios)):
        if seq_vazios[i] >= tamanho:
            seq_possiveis.append(seq_vazios[i])

    for i in range(0, len(seq_possiveis)):
        if seq_possiveis[i] <= valor_ideal:
            valor_ideal = seq_possiveis[i]

    check_repeticao = False

    for i in range(0, len(matriz)):
        for j in range(0, len(matriz[i])):
            termo = matriz[i][j]
            if termo == ' ' and check_repeticao is False:
                qtd_vazios += 1
                if posicao_considerada == -1 and linha_considerada == -1 and coluna_considerada == 1:
                    posicao_considerada = j
                    coluna_considerada = j
                    linha_considerada = i
                if qtd_vazios == valor_ideal:
                    if matriz[linha_considerada][j+1] == 'X':
                        while posicao_considerada < i + tamanho:
                            if coluna_considerada >= n_colunas:
                                linha_considerada += 1
                                coluna_considerada = 0
                                matriz[linha_considerada][coluna_considerada] = 'X'
                                posicao_considerada += 1
                                coluna_considerada += 1
                                if posicao_considerada >= tamanho:
                                    check_repeticao = True
                                    break
                            else:
                                matriz[linha_considerada][coluna_considerada] = 'X'
                                posicao_considerada += 1
                                coluna_considerada += 1
                                if posicao_considerada >= tamanho:
                                    check_repeticao = True
                                    break
            else:
                posicao_considerada = -1
                linha_considerada = -1
                coluna_considerada = -1
                qtd_vazios = 0

    return matriz


def desalocar():
    # linha assume q o usuário vai colocar um inteiro então linha 1 seria matriz[0]
    linha = input('N° da linha para desalocar.\n>> ')
    # col assume tbm q o usuario vai colocar um inteiro então coluna 1 seria matriz[linha][0]
    col = input('N° da coluna de inicio da desalocação.\n>> ')
    # numero de elementos que ele ira percorrer dps da posição da coluna
    passos = input('N° de passos para desalocar\n>> ')
    # verifica se são númericos
    if linha.isnumeric() and col.isnumeric() and passos.isnumeric():
        # tipagem
        linha = int(linha)
        col = int(col)
        passos = int(passos)
        # linha 1 = matriz[0] & coluna 1 = matriz[linha][0]
        linha -= 1
        col -= 1
        # verifica se linha e coluna são iguais ou menores q o n° de elementos
        # passos tem q ser menor ou igual à diferença do n° de elementos da col - a coluna inicial
        if linha <= len(matriz) - 1 and col <= len(matriz[linha]) - 1 and passos <= len(matriz[linha]) - col:
            for x in range(len(matriz[linha])):
                while passos > 0:
                    matriz[linha][col] = ' '
                    passos -= 1
                    col += 1
            for x in matriz:
                print(x)
            return matriz
        else:
            print('Erro: O número de linhas/colunas/elementos não pode ser superior ao da matriz')
            return matriz
    else:
        print('Erro: Caracter inválido')


def menu():
    print('-' * 30)
    print('1 - Alocação da matriz de memória.')
    print('2 - Visualização da memória.')
    print('3 - Alocação first fit.')
    print('4 - Alocação best fit.')
    print('5 - Alocação worst fit.')
    print('6 - Desalocação.')
    print('7 - Sair.')
    print('-' * 30)


while True:
    menu()
    escolha = input('Digite a operação desejada: ')

    if escolha == '1':
        alocacao = alocar()
        matriz = alocacao[0]
        n_linhas = alocacao[1]
        n_colunas = alocacao[2]

    elif escolha == '2':
        ver()

    elif escolha == '3':
        matriz = first_fit()
        ver()

    elif escolha == '4':
        matriz = bestfit()
        ver()

    elif escolha == '5':
        matriz = worstfit()
        ver()

    elif escolha == '6':
        matriz = desalocar()

    elif escolha == '7':
        break

    else:
        print('Opção Inválida.')
