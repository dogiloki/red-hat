#include <iostream>
#include "core/TUI.cpp"
#include "core/List.h"

using namespace std;

int main() {
	
	setlocale(LC_ALL,"");
	
	List<string> alumnos;
	cout<<"\nIngrese un nombre: ";
	cin>>alumnos;
	cout<<"\nIngrese un nombre: ";
	cin>>alumnos;
	
	string name=alumnos.get(0);
	
	cout<<"\n"<<name;
	
	return 0;
}
