#include <algorithm>
#include <cstdlib>
#include <iostream>
#include <limits>
#include <list>
#include <queue>
#include <unordered_set>
#include <vector>

using namespace std;

//Change values for your processes below

#define QUANTUM_TIME numeric_limits<int>::max() // No quantum time (don't change this if non-premptive process)

/* Add or remove processes and add as many {CPU, IO} sequences. For ex - {10, 0} is a {CPU, IO} sequence.
If you want CPU, IO, CPU then you can use two {CPU, IO} like this - {10, 5}, {1, 0}
If there are no IO or CPU burst times in between, simply write 0.
*/
const vector<vector<pair<int, int>>> PROCESSES = {{{10, 0}}, // P0
                                                  {{6, 0}},  // P1
                                                  {{7, 0}},  // P2
                                                  {{3, 0}}}; // P3

const vector<int> ARRIVAL_TIMES = {0, 5, 2, 7}; // For all processes in order
/*
Reprsented as ->
| Processes | Arrival | CPU | I/O | 
|     P0    |    0    |  10 |  0  |
|     P1    |    5    |  6  |  0  |
|     P2    |    2    |  7  |  0  |
|     P3    |    7    |  3  |  0  |
*/

struct Process
{
    int id;
    int num_sequences;
    int arrival_time;
    int turnaround_time;
    int response_time;
    int waiting_time;
    list<pair<int, int>> burst_times;

    Process()
    {
        this->id = 0;
        this->num_sequences = 0;
        this->arrival_time = 0;
        this->turnaround_time = 0;
        this->response_time = 0;
        this->waiting_time = 0;
        list<pair<int, int>> temp_burst_times;
        this->burst_times = temp_burst_times;
    }

    Process(int p, vector<pair<int, int>> burst_times, int arrival_time)
    {
        this->id = p;
        this->num_sequences = burst_times.size();
        this->arrival_time = arrival_time;
        this->turnaround_time = -arrival_time;
        this->waiting_time = 0;
        this->response_time = 0;
        list<pair<int, int>> temp_burst_times;
        for (int i = 0; i < this->num_sequences; ++i)
        {
            this->waiting_time -= burst_times[i].first;
            temp_burst_times.push_back(burst_times[i]);
        }
        this->burst_times = temp_burst_times;
    }

    void updateResponseTime(int curr_time)
    {
        this->response_time = curr_time - this->arrival_time;
    }

    void updateTurnaroundTime(int curr_time)
    {
        this->arrival_time = -this->turnaround_time;
        this->turnaround_time += curr_time;
    }

    void updateWaitingTime()
    {
        this->waiting_time += this->turnaround_time;
    }

    void print()
    {
        std::cout << "[ P" << this->id << " ] | ";
        std::cout << "Arrival : " << this->arrival_time << " | ";
        if (this->burst_times.size() > 0)
        {
            std::cout << "Bursts : ({CPU, I/O}) : [ ";
            std::for_each(burst_times.begin(), burst_times.end(), [&](std::pair<int, int> p) { std::cout << "{" << p.first << " ," << p.second << "} "; });
            std::cout << "] | ";
        }
        std::cout << "TT : " << this->turnaround_time << " | ";
        std::cout << "RT : " << this->response_time << " | ";
        std::cout << "WT : " << this->waiting_time << std::endl;
    }
};

struct IO
{
    int id;
    int time;
    IO()
    {
        this->id = 0;
        this->time = 0;
    }
    IO(int id, int time)
    {
        this->id = id;
        this->time = time;
    }
};

struct Queue
{
    list<Process> curr_processes;
    int quantum_time;
    Queue(int qt)
    {
        list<Process> temp_processes;
        this->curr_processes = temp_processes;
        this->quantum_time = qt;
    }
};

struct compareProcess
{
    bool operator()(const Process &p1, const Process &p2)
    {
        if (p1.arrival_time == p2.arrival_time)
        {
            return p1.id > p2.id;
        }
        return p1.arrival_time > p2.arrival_time;
    }
};

struct compareIO
{
    bool operator()(const IO &io1, const IO &io2)
    {
        if (io1.time == io2.time)
        {
            return io1.id > io2.id;
        }
        return io1.time > io2.time;
    }
};

void printQueue(const Queue &ready_queue)
{
    cout << "Quantum time : " << QUANTUM_TIME << endl;
    for (auto curr_process : ready_queue.curr_processes)
    {
        cout << curr_process.id << " ";
    }
    cout << endl;
}

void printProcesses(priority_queue<Process, vector<Process>, compareProcess> processes)
{
    vector<Process> temp_processes(processes.size());
    Process temp;
    while (!processes.empty())
    {
        temp = processes.top();
        temp_processes[temp.id] = temp;
        processes.pop();
    }
    for (Process &process : temp_processes)
    {
        process.print();
    }
}

void printIO()
{
}

void printGanntChart(const vector<char> &gannt_chart, priority_queue<IO, vector<IO>, compareIO> &completed_start_io, priority_queue<IO, vector<IO>, compareIO> &completed_end_io)
{
    int i = 0;
    cout << "\tGannt Chart\n";
    cout << "Start Time : " << i << endl;
    while (i < gannt_chart.size() || completed_start_io.size() || completed_end_io.size())
    {
        cout << "Time : " << i;
        if (i < gannt_chart.size())
        {
            if (gannt_chart[i] == 'I')
            {
                cout << " | CPU Idle";
            }
            else
            {
                cout << " | Executing P" << gannt_chart[i];
            }
        }
        while (completed_start_io.size() > 0 && i == completed_start_io.top().time)
        {
            cout << " | IO Start P" << completed_start_io.top().id;
            completed_start_io.pop();
        }
        while (completed_end_io.size() > 0 && i == completed_end_io.top().time)
        {
            cout << " | IO End P" << completed_end_io.top().id;
            completed_end_io.pop();
        }
        cout << endl;
        ++i;
    }
    cout << "End Time : " << i << endl;
}

char intNumToCharNum(int num)
{
    return num + 48;
}

bool isQueueEmpty(const Queue &ready_queue)
{
    return ready_queue.curr_processes.size() == 0;
}

void insertArrivedProcessesInQueue(Queue &ready_queue, priority_queue<Process, vector<Process>, compareProcess> &processes, int curr_time)
{
    while (!processes.empty() && processes.top().arrival_time <= curr_time)
    {
        ready_queue.curr_processes.push_back(processes.top());
        processes.pop();
    }
}

Process findCurrProcess(Queue &ready_queue)
{
    Process curr_process;
    curr_process = ready_queue.curr_processes.front();
    ready_queue.curr_processes.pop_front();
    return curr_process;
}

vector<Process> simulation(Queue &ready_queue, priority_queue<Process, vector<Process>, compareProcess> &processes)
{
    int curr_time = 0;
    Process curr_process;
    vector<Process> completed_processes(processes.size());
    priority_queue<IO, vector<IO>, compareIO> completed_start_io;
    priority_queue<IO, vector<IO>, compareIO> completed_end_io;

    int time_curr_process_executing = 0, is_process_executing = false;
    vector<char> gannt_chart;

    insertArrivedProcessesInQueue(ready_queue, processes, curr_time);

    while (1)
    {
        if (!is_process_executing && isQueueEmpty(ready_queue) && processes.empty())
        {
            printGanntChart(gannt_chart, completed_start_io, completed_end_io);
            return completed_processes;
        }

        if (!is_process_executing)
        {
            while (isQueueEmpty(ready_queue))
            {
                ++curr_time;
                gannt_chart.push_back('I');
                insertArrivedProcessesInQueue(ready_queue, processes, curr_time);
            }
            time_curr_process_executing = 0;
            is_process_executing = true;
            curr_process = findCurrProcess(ready_queue);
            curr_process.updateResponseTime(curr_time);
        }
        if (curr_process.burst_times.front().first > 0)
        {
            curr_process.burst_times.front().first -= 1;
            ++time_curr_process_executing;
            ++curr_time;
            gannt_chart.push_back(intNumToCharNum(curr_process.id));
            // newly arrived processes or those who have done their I/O
            insertArrivedProcessesInQueue(ready_queue, processes, curr_time);
        }

        if (curr_process.burst_times.front().first == 0)
        {
            if (curr_process.burst_times.front().second > 0)
            {
                IO curr_io_start(curr_process.id, curr_time);
                IO curr_io_end(curr_process.id, curr_time + curr_process.burst_times.front().second);
                completed_start_io.push(curr_io_start);
                completed_end_io.push(curr_io_end);
            }
            curr_process.arrival_time = curr_process.burst_times.front().second + curr_time;
            curr_process.burst_times.pop_front();
            if (curr_process.burst_times.size() > 0)
            {
                // process gets pushed again to execute after completing I/O
                processes.push(curr_process);
            }
            //process complete
            else
            {
                curr_process.updateTurnaroundTime(curr_time);
                curr_process.updateWaitingTime();
                completed_processes[curr_process.id] = curr_process;
            }
            is_process_executing = false;
        }
        else if (QUANTUM_TIME == time_curr_process_executing)
        {
            // quantum time is up so push again to back of queue
            is_process_executing = false;
            ready_queue.curr_processes.push_back(curr_process);
        }
    }
    return completed_processes;
}

int main(int argc, char *argv[])
{
    Queue ready_queue(QUANTUM_TIME);
    priority_queue<Process, vector<Process>, compareProcess> processes;

    for (int i = 0; i < PROCESSES.size(); ++i)
    {
        Process temp_process(i, PROCESSES[i], ARRIVAL_TIMES[i]);
        processes.push(temp_process);
    }
    //printQueue(ready_queue);
    vector<Process> completed_processes = simulation(ready_queue, processes);
    cout << "\tStats\n";
    for (Process &process : completed_processes)
    {
        process.print();
    }

    return 0;
}