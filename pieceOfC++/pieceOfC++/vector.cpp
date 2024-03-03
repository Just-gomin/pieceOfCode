#include <iostream>
#include <stdlib.h>

using namespace std;

void printVector(vector<int> v);

int main()
{
    vector<int> myVector = {};

    myVector.push_back(4); // myVector {4}

    printVector(myVector);

    return 0;
}

void printVector(vector<int> v)
{
    for (int e : v)
    {
        cout << e << " ";
    }

    cout << endl;
}
