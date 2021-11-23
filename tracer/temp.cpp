#include<iostream>

using namespace std;

void UpdateRegIndex(int32_t index,int tid){
	cout<<"fail"<<endl;
}

int main(){
	for(int i=0;i<10;i++){
		UpdateRegIndex(i,0);
	}
	return 0;
}