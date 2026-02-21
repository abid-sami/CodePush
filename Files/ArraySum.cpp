//Write a program in C to find the sum of all elements of the array.

#include<iostream>
using namespace std;

int main() {
    int n, sum=0;
    cout<<"Enter the amount of array: ";
    cin>>n;
    int arr[n];
    cout<<"Enter the elements of the array: ";
    for(int i=0; i<n; i++) {
        cin>>arr[i];
    }
    for(int i=0; i<n; i++) {
        sum+=arr[i];
    }
    cout<<"Sum: "<<sum<<endl;

}