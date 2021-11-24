#include "MyOps.h"

int main(){
	char* t="temp";
	PIN_registerGraphs(t,1);
	for(int i=0;i<10;i++){
		PIN_updateCurrDst(i);
		for(int j=0;j<2;j++){
			PIN_updateRegBaseBound(i,j);
		}
	}
	return 0;
}