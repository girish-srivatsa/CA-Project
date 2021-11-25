#include "reader.h"
#include "MyOps.h"
#include <vector>
#include <iostream>

using namespace std;

typedef int32_t NodeID;
typedef int32_t WeightT;

typedef CSRGraph<NodeID> Graph;

typedef Reader<NodeID, NodeID, WeightT, true> MyReader; // defines Graph and WGraph

// O(|V|+|E|)
// Nodes = 10^9 -- do for all nodes - O(10^9) -- O(10^9) * 10^9
// let us pick one source per-component
// O(|C|+|C|^2)

void BFSKernel(Graph &g, NodeID source, vector<int> &depth){
  depth[source] = 0;
  vector<NodeID> to_visit;
  to_visit.reserve(g.num_nodes());
  to_visit.push_back(source);
  for (auto it = to_visit.begin(); it != to_visit.end(); it++) {
    NodeID u = *it;
    PIN_updateCurrDst(u);
    for (NodeID v : g.out_neigh(u)) {
      if (depth[v] == -1) {
        depth[v] = depth[u] + 1;
        to_visit.push_back(v);
      }
    }
  }
}

int main(){
    MyReader r("test_g20_k2.sg");
    Graph g = r.ReadSerializedGraph();
    PIN_registerGraphs("test_g20_k2.sg",false);
    vector<int> depth(g.num_nodes(), -1);
    PIN_updateRegBaseBound((uint64_t)&depth.front(),(uint64_t)&depth.back()+sizeof(int));
    for (NodeID source = 0; source < g.num_nodes(); ++source) {
        if (depth[source]==-1) BFSKernel(g, source, depth);
    }
    // BFSKernel(g,540428,bmap);
    return 0;
}
