#include <iostream>
#include <ctime>

using namespace std;

int funcion(int n);

int main(){

    int n;

    cout<<"Digite tamaño de la matriz cuadrada: ";
    cin>>n;

    float matriz[n][n];

   
    for(int i = 0; i < n; ++i){
        for(int j = 0; j < n; ++j){
            cout<<"ingrese el valor de la posicion : "<<i<<", "<<j<<" :";
            cin>>matriz[i][j];
            cout<<endl;
        }
    }


    int acomulado = 0;
    int num = 0;
    int aux = 0;
    int j;
    int contador;

    // evaluacion de eficiencia
	clock_t startTime = clock( );

	

    for(int i = n-1; i >= 0; i--){
        aux++;
        contador = 0;
        j = n-1;
        while (contador < aux){
            acomulado += matriz[i][j];
            num++;
             j--;
            contador++;
        }
    }

    // fin de la operacion
	clock_t endTime = clock( );

	double ellapsedSeconds = double( endTime - startTime ) / double( CLOCKS_PER_SEC );

    cout<<endl<<"el Resultado de la suma "<<acomulado<<". operaciones realizadas "<<num<<". Tiempo de ejecucion = "<<ellapsedSeconds<< " milisegundos"<<endl;

    //parte c

    cout<<endl<<"El numero de operaciones realizadas (calculado) es igual a "<<funcion(n)<<endl<<endl;

    return 0;
}

//parte c
int funcion(int n){
    return (n*(n+1))/2;
}