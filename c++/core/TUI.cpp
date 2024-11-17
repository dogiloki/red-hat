#include <iostream>
#include <string>

using namespace std;

void displayMenu();

class TUI{
	
public:
	string title;
	string options[10];
	
	TUI(){}
	
	void displayMenu(){
		cout<<"\t"<<title<<endl;
	}
	
};

