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

void PullKernel(Graph &g, vector<int> &srcData, vector<int> &dstData) {
  for(int dst=0;dst<g.num_nodes();dst++){
    PIN_updateCurrDst(dst);
    for(auto src : g.in_neigh(dst)) {
      dstData[dst] += srcData[src];
      // cout<<"ADDR: "<<((uint64_t)&srcData[src]-(uint64_t)&srcData.front()+94842583265424)<<endl;
    }
  }
}

int main(){
<<<<<<< HEAD
    MyReader r("random_u16_k3.sg");
    Graph g = r.ReadSerializedGraph();
    PIN_registerGraphs("random_u16_k3.sg",true);
=======
    MyReader r("test_g18_k4.sg");
    Graph g = r.ReadSerializedGraph();
    PIN_registerGraphs("test_g18_k4.sg",true);
>>>>>>> 4665291916333887fb5ae931a8df4f5213679ffc
    vector<int> srcData(g.num_nodes(), 1);
    vector<int> dstData(g.num_nodes(), 0);
    PIN_updateRegBaseBound((uint64_t)&srcData.front(),(uint64_t)&srcData.back()+sizeof(int));
    // for (NodeID source = 0; source < g.num_nodes(); ++source) {
    //     if (depth[source]==-1) BFSKernel(g, source, depth);
    // }
    PullKernel(g,srcData,dstData);
    return 0;
}
