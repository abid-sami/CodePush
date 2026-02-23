//Binary Search

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
    int s;
    cout<<"Enter Search Number: "<<endl;
    cin>>s;

    int l=0, r=n-1, m; 
    bool found=0;
    while(l<=r){
        m=(l+r)/2;
        if(arr[m]==s){
            cout<<"Found at: "<<m<<endl;
            found=1;
            break;
        }
        else if(arr[m]<s){
            l=m+1;
        }
        else{
            r=m-1;
        }
    }
    
    if(!found){
        cout<<"Element not found"<<endl;
    }

}
