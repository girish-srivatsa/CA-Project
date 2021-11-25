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

void BFSKernel(Graph &g, NodeID source, vector<bool> &bmap){
  pvector<int> depth(g.num_nodes(), -1);
  depth[source] = 0;
  vector<NodeID> to_visit;
  to_visit.reserve(g.num_nodes());
  to_visit.push_back(source);
  bmap[source] = 1;
  for (auto it = to_visit.begin(); it != to_visit.end(); it++) {
    NodeID u = *it;
    PIN_updateCurrDst(u);
    for (NodeID v : g.out_neigh(u)) {
      if (depth[v] == -1) {
        bmap[v] = true;
        depth[v] = depth[u] + 1;
        to_visit.push_back(v);
      }
    }
  }
}

int main(){
    MyReader r("test_g10_k3.sg");
    PIN_registerGraphs("test_g10_k3.sg",false);
    Graph g = r.ReadSerializedGraph();
    PIN_updateRegBaseBound((uint64_t)&g,(uint64_t)&g+sizeof(g));
    vector<bool> bmap(g.num_nodes(), false);
    for (NodeID source = 0; source < g.num_nodes(); ++source) {
        if (!bmap[source]) BFSKernel(g, source, bmap);
    }
    return 0;
}