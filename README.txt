PHilippe Santos Silva - 2015004429
Marcos Vinicius de Carvalho Ribeiro - 2015098008

TP2 - Linguagens de Programação
2021-01


Introdução

O problemas das N rainhas consiste em criar um programa que mostre todas as possíveis formas de se organizar N rainhas em um tabuleiro NxN de forma que elas não se ataquem.
Duas rainhas se atacam se estão na mesma linha, coluna ou diagonal.


Corpo

O problema foi resolvido em c++, Prolog e Haskell e upados nesse GIT.
As saídas estão em um dos dois formatos a seguir:
0's e 1's onde os 1 reresentam as rainhas no tabuleiro
0100
0001
1000
0010
Lista que representam em cada coluna qual a linha da rainha
[1,3,0,2]
As duas representação acima tem a mesma organização das rainhas.


Execução

Para compilar os programas foram usados compiladores online:
C++: https://www.onlinegdb.com/online_c++_compiler
    Copiar o código main.cpp para o site acima e clicar em 'Run'. Para tamanhos diferentes de tabuleiro basta mudar o inicio(6) para outro tamanho de tabuleiro.
Haskell: https://www.tutorialspoint.com/compile_haskell_online.php
    Copiar o código main.hs para o site acima e clicar em 'Run'. Para tamanhos diferentes de tabuleiro basta mudar o let n = 6 para outro tamanho de tabuleiro.
Prolog: https://swish.swi-prolog.org/
    Criar um novo Program no site acima, copiar o código main.hs, colocar o comando "rainhas(6, Rainhas)" e clicar em 'Run'. Para tamanhos diferentes de tabuleiro basta mudar o numero do parametro para outro tamanho de tabuleiro.
