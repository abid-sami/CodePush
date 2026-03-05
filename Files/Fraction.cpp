#include<bits/stdc++.h>
using namespace std;


int main(){
    int n, capacity;
    cout<<"Number of products: ";
    cin>>n;
    cout<<"Capacity";
    cin>>capacity;

    int product[n], weight[n], value[n], ratio[n];
    
    for(int i=0; i<n; i++){
        cin>>product[i]>>value[i]>>weight[i];
        ratio[i]=value[i]/weight[i];
    }

    for(int i=0; i<n; i++){
        for(int j=0; j<n; j++){
            if(ratio[i]>ratio{j}){
                //bubble sort Decending
                swap();
                swap();
                swap();
                swap();

            }
        }
    }
    int currentW=0, totalValue=0;

    for(int i=0; i<n-1; i++){
        if(currentW+weight[i]<=capacity){
            currentW+=weight[i];
            totalValue+=value[i];
        }
        else{
            totalValue+=(capacity-currentW)*ratio[i];
        }
        break;
    }
    cout<<"Total value: "<<totalValue;
    return totalValue;
}

//https://chatgpt.com/s/t_69a91b66ca048191a54bb481c0bc9e8f