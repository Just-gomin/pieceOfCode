#include <queue>
#include <cstdio>     // less
#include <functional> // greater
#include <iostream>
#include <vector>

using namespace std;

template <typename TP, typename ContainerTP, typename CompareTP>
void printQ(priority_queue<TP, vector<ContainerTP>, CompareTP> pq)
{
    while (pq.size() > 0)
    {
        TP x = pq.top();
        pq.pop();
        cout << x << " ";
    }

    cout << '\n';
}

int main()
{
    priority_queue<int, vector<int>, greater<int>> pqg; // 오름차순 우선 순위 큐
    priority_queue<int, vector<int>, less<int>> pql;    // 내림차순 우선 순위 큐

    pqg.push(1);
    pqg.push(2);
    pqg.push(3);
    pqg.push(4);
    pqg.push(5);

    pql.push(1);
    pql.push(2);
    pql.push(3);
    pql.push(4);
    pql.push(5);

    printQ<int, int, greater<int>>(pqg); // 1 2 3 4 5
    printQ<int, int, less<int>>(pql);    // 5 4 3 2 1

    return 0;
}