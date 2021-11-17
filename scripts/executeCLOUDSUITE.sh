
#[branch_pred] [l1i_pref] [l1d_pref] [l2c_pref] [llc_pref] [itlb_pref] [dtlb_pref] [stlb_pref] [btb_repl] [l1i_repl] [l1d_repl] [l2c_repl] [llc_repl] [itlb_repl] [dtlb_repl] [stlb_repl] [num_core] <= binary name consists of.

#Running CLOUDSUITE simulations for 50-50M instructions
numwarmup=50
numsim=50

parallelismcount=24


#branch predictor
branchPredictor=hashed_perceptron

#cache prefetchers
l1dpref=(no)
l1ipref=(no)
l2cpref=(no)
llcpref=(no)

#tlb prefetchers
itlb_pref=(no)
dtlb_pref=(no)
stlb_pref=(no)

#cache replacement policies in the format: btb-l1i-l1d-l2c-llc
cache_repl=lru-lru-lru-srrip-drrip

#tlb replacement policies in the format: itlb-dtlb-stlb
tlb_repl=lru-lru-lru

numcore=1
tracedir=../cloudsuite_traces
traces=$(cat scripts/cloudsuite_trace_list.txt)

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
				./run_champsim.sh $branchPredictor-${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$cache_repl-$tlb_repl-1core $numwarmup $numsim $tracedir $trace -cloudsuite
			else
				./run_champsim.sh $branchPredictor-${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$cache_repl-$tlb_repl-1core $numwarmup $numsim $tracedir $trace -cloudsuite &
			fi
		done
		now=$(date)
		echo "Number of CLOUDSUITE traces simulated - $count in iteration $iterator at time: $now" 
		#>> results_saved/execution_log.txt
		count=0
	else
		for((i=0; i<$numofpref; i++))
		do
			./run_champsim.sh $branchPredictor-${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$cache_repl-$tlb_repl-1core $numwarmup $numsim $tracedir $trace -cloudsuite &
		done
	fi
done

echo "Done with count $count"
