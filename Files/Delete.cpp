//Delete an item of array

#include<iostream>
using namespace std;

int main(){
    int n;
    cout<<"Enter array Index: "<<endl;
    cin>>n;
    int arr[n];
    cout<<"Enter array Elements: "<<endl;
    for(int i=0; i<n; i++){
        cin>>arr[i];
    }

    int d;
    cout<<"Enter Deleting Number: "<<endl;
    cin>>d;
    for(int i=d; i<n-1; i++){
        arr[i]=arr[i+1];
    }
    n--;
    cout<<"Result: "<<endl;
    for(int i=0; i<n; i++){
        cout<<arr[i]<<endl;
    }

}
