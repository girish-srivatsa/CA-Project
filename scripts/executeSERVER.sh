
#[branch_pred] [l1i_pref] [l1d_pref] [l2c_pref] [llc_pref] [itlb_pref] [dtlb_pref] [stlb_pref] [btb_repl] [l1i_repl] [l1d_repl] [l2c_repl] [llc_repl] [itlb_repl] [dtlb_repl] [stlb_repl] [num_core] <= binary name consists of.

#Running SERVER simulations for 50-50M instructions
numwarmup=50
numsim=50

parallelismcount=3


#branch predictor
branchPredictor=hashed_perceptron

#cache prefetchers
l1ipref=(mana_32KB mana_32KB no mana_32KB no no mana_32KB)
l1dpref=(no ipcp_crossPages ipcp_crossPages ipcp_crossPages ipcp_crossPages no no)
l2cpref=(no no no spp_tuned_aggr spp_tuned_aggr spp_tuned_aggr spp_tuned_aggr)
llcpref=(no no no no no no no)

#tlb prefetchers
itlb_pref=(no no no no no no no)
dtlb_pref=(no no no no no no no)
stlb_pref=(no no no no no no no)

#cache replacement policies in the format: btb-l1i-l1d-l2c-llc
cache_repl=lru-lru-lru-srrip-drrip

#tlb replacement policies in the format: itlb-dtlb-stlb
tlb_repl=lru-lru-lru

numcore=1

#tracedir=~/car3s/server_traces/
tracedir=../IPC-traces/
traces=$(cat scripts/ipc_trace_list.txt)

numofpref=${#l1dpref[@]}


#Neelu: Variables ending now. Kindly add new variables above this line.


for((i=0; i<$numofpref; i++))
do
	./build.sh ${cache_repl}-${tlb_repl} 1 ${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]} || exit
done

tracenum=0
count=0
iterator=0

for trace in $traces;
do 
	count=`expr $count + 1`
	if [ $count -lt 12 ]
	then
		iterator=`expr $iterator + 1`
		for((i=0; i<$numofpref; i++))
		do
			if [ $i -eq `expr $numofpref - 1` ]
                        then
				./run_champsim.sh $branchPredictor-${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$cache_repl-$tlb_repl-1core $numwarmup $numsim $tracedir $trace
			else
				./run_champsim.sh $branchPredictor-${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$cache_repl-$tlb_repl-1core $numwarmup $numsim $tracedir $trace &
			fi
		done
		now=$(date)
		echo "Number of SERVER traces simulated - $count in iteration $iterator at time: $now" 
		#>> results_saved/execution_log.txt
		count=0
	else
		for((i=0; i<$numofpref; i++))
		do
			./run_champsim.sh $branchPredictor-${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$cache_repl-$tlb_repl-1core $numwarmup $numsim $tracedir $trace &
		done
	fi

done

echo "Done with count $count"
