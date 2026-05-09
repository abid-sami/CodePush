#include<bits/stdc++.h>
using namespace std;

int main(){
    int t;
    cin>>t;
    while(t--){
        int n, x, y;
        cin>>n>>x>>y;
        string s;
        cin>>s;
        int c4=0, c8=0;
         for(int i=0; i<s.size(); i++){
                if(s[i]=='4'){
                c4++;
            }
                if(s[i]=='8'){
                c8++;
            }
         }
        int mx=max(abs(x),abs(y));

        if(n>=mx){
           
            int total=((c8*2)+(c4*1));
            if(total>=x+y){
                cout<<"YES"<<endl; 
            }
             
            
        }
        else{
                cout<<"NO"<<endl;
            }  
        

    }
    return 0;
}