#include<iostream>

void UpdateRegIndex(int32_t index,int tid){
	cout<<"fail"<<endl;
}

void main(){
	for(int i=0;i<10;i++){
		UpdateRegIndex(i,0);
	}
	return 0;
}