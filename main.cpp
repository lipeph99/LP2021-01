#include <iostream>
#include <cmath>
using namespace std;

void imprime(int **tab, int tam){
   for (int i = 0; i < tam; i++) {
      for (int j = 0; j < tam; j++){
         cout << tab[i][j] << " ";
      }
      cout << endl;
   }
   cout << endl;
}

/*
Checa se a nova linha e  coluna adicionadas conflitam com as que ja estao no board
*/
bool valido(int** tab, int tam, int lin, int col){
   for (int i=0;i<lin;i++){ //Checa a coluna
      if (tab[i][col]){
         return false;
      }
   }

   for (int i=1;i<=lin&&i<=col;i++) { //Checa a diagonal superior esquerda
      if(tab[lin-i][col-i]){
         return false;
      }
   }

   for (int i=1;i<=lin&&i<=(tam-col-1);i++) { //Checa a diagonal superior direita
      if(tab[lin-i][col+i]){
         return false;
      
      }
   }
   return true;
}

bool incrementa(int** tab, int tam, int conta){
   int div=1;
   bool b = false;
   for(int i = 0; i<tam; i++){
      for(int j = 0; j<tam; j++){
         tab[i][j] = 0;
      }
      tab[i][(conta/div)%tam] = 1;
      if (!valido(tab,tam,i,(conta/div)%tam)){
         return false;
      }
      div*=tam;
   }
   return true;
}

/*
Inicializa um tabuleiro com o tamanho lido por parametro todo com zeros.
Depois incrementa linha a linha todas as rainhas.
*/
bool inicio(int tam){
   int **tab = (int **)malloc(tam * sizeof(int*));
   for(int i = 0; i < tam; i++)
      tab[i] = (int *)malloc(tam * sizeof(int));
   
   for(int i = 0; i<tam; i++){
      for(int j = 0; j<tam; j++){
         tab[i][j] = 0;
      }
   }

   for (int conta=0; conta<pow(tam,tam); conta++){
      if (incrementa (tab,tam,conta)){
         imprime(tab,tam);
      }
   }

   delete (tab);
}

int main(){
   inicio(6);
}