#include <iostream>
using namespace std;

void findWaitingTime(int processes[], int n,
                     int bt[], int wt[])
{
    wt[0] = 0;

    for (int i = 1; i < n; i++)
        wt[i] = bt[i - 1] + wt[i - 1];
}

void findTurnAroundTime(int processes[], int n,
                        int bt[], int wt[], int tat[])
{
    for (int i = 0; i < n; i++)
        tat[i] = bt[i] + wt[i];
}

void findavgTime(int processes[], int n, int bt[])
{
    int wt[n], tat[n], total_wt = 0, total_tat = 0;

    findWaitingTime(processes, n, bt, wt);

    findTurnAroundTime(processes, n, bt, wt, tat);

    cout << "Processes "
         << " Burst time "
         << " Waiting time "
         << " Turn around time\n";

    for (int i = 0; i < n; i++)
    {
        total_wt = total_wt + wt[i];
        total_tat = total_tat + tat[i];
        cout << " " << i + 1 << "\t\t" << bt[i] << "\t "
             << wt[i] << "\t\t " << tat[i] << endl;
    }

    cout << "Average waiting time = "
         << (float)total_wt / (float)n;
    cout << "\nAverage turn around time = "
         << (float)total_tat / (float)n;
}

int main()
{
    int processes[] = {1, 2, 3, 4, 5};
    int n = sizeof processes / sizeof processes[0];
    int burst_time[] = {5, 7, 2, 13, 8};

    cout << "\n\t\t=======OUTPUT=======\n";
    findavgTime(processes, n, burst_time);
    return 0;
}

// int main()
// {
//     //process id's
//     int processes[] = {1, 2, 3};
//     int n = sizeof processes / sizeof processes[0];

//     //Burst time of all processes
//     int burst_time[n];
//     cout << "Enter the Burst Times for " << n << " processes : ";
//     for (int i = 0; i < n; i++)
//     {
//         cin >> burst_time[i];
//     }
//     // int burst_time[] = {3, 5, 8};
//     cout << "\n\t\t=======OUTPUT=======\n";
//     findavgTime(processes, n, burst_time);
//     return 0;
// }