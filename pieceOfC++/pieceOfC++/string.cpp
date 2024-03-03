#include <iostream>
#include <string>
#include <vector>
#include <sstream>
using namespace std;

// 문자열 나누기
vector<string> split(string str, char Delimiter)
{
    istringstream iss(str); // istringstream에 str을 담는다.
    string buffer;          // 구분자를 기준으로 절삭된 문자열이 담겨지는 버퍼

    vector<string> result;

    // istringstream은 istream을 상속받으므로 getline을 사용할 수 있다.
    while (getline(iss, buffer, Delimiter))
    {
        result.push_back(buffer); // 절삭된 문자열을 vector에 저장
    }

    return result;
}

int main()
{

    string str = "AAA,BBB,CCC,DDD,EEE,FFF,GGG";

    vector<string> result = split(str, ',');

    for (int i = 0; i < result.size(); i++)
    {
        cout << result[i] << "\n";
    }
}