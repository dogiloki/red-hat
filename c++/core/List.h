#include <iostream>
#include <string>

using namespace std;

template <class T>
class List{
	
public:
	int index=0;
	int size=0;
	T value=NULL;
	List<T> *next=NULL;
	
	List<T>();
	
	friend istream &operator>>(istream &read, List<T> &list){
		T value;
		read>>value;
		list.add(value);
		return read;
	}
	
	void add(T value){
		List<T> *new_list=new List<T>;
		new_list->index=index+1;
		new_list->value=value;
		new_list->next=NULL;
		if(next==NULL){
			next=new_list;
		}else{
			List<T> *temp=next;
			while(temp->next!=NULL){
				temp=temp->next;
			}
			temp->next=new_list;
		}
		size++;
	}
	
	T get(int _index){
		do{
			temp=next;
			cout<<temp->value;
			if(temp->index=_index){
				return temp->value;	
			}
		}while(temp!=null)
	}

};

template <class T>
List<T>::List():value(T()), next(NULL){
	
}
