#include <iostream>

using namespace std;

const int N = 1000000;

int main() {
    vector<int> g[N];

    for (int i = 0; i < N; i += 2) {
        g[i].pb(i + 1);
        g[i + 1].pb(i);
    }

    vector<bool> vis(N, false);
    for (int i = 0; i < N; ++i) {
        if (!vis[i]) continue;
        queue<int> q;
        q.push(i);
        vis[i] = false;

        while (!q.empty()) {
            int u = q.front();
            for (auto x: g[u]) {
                if (!vis[x]) continue;
                vis[u] = 1;
                q.push(u);
            }
        }
    }
}