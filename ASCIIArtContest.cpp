#include<bits/stdc++.h>
using namespace std;

int main(){
    int g,c,l;
    cin>>g>>c>>l;
    int max=g, min=g;

    if(c>max){
        max=c;
    }
    if(l>max){
        max=l;
    }
    if(c<min){
        min=c;
    }
    if(l<min){
        min=l;
    }
    if(max-min>=10){
        cout<<"check again"<<endl;
    }
    else{
        int mid=g+c+l-max-min;
        cout<<"final "<<mid;
    }
}