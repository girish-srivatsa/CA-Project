#include <iostream>
using namespace std;

int main(int argc, char *argv[])  {
	
	char *c = (char*) "hello";
	cout << c << "\n";

	cout << argc << "\n";
	for (int i = 0; i < argc; ++i) {
		cout << argv[i] << " ";
	}
	cout << "\n";

}
