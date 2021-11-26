#Neelu: Adding the list of variables here so you'll only need to modify the following to change anything.

#[branch_pred] [l1i_pref] [l1d_pref] [l2c_pref] [llc_pref] [itlb_pref] [dtlb_pref] [stlb_pref] [btb_repl] [l1i_repl] [l1d_repl] [l2c_repl] [llc_repl] [itlb_repl] [dtlb_repl] [stlb_repl] [num_core] <= binary name consists of.

#Running SPEC simulations for 50-100M instructions
numwarmup=50
numsim=50

parallelismcount=8


#branch predictor
branchPredictor=hashed_perceptron

#cache prefetchers
l1ipref=(no) # mana_32KB mana_32KB no mana_32KB no no mana_32KB mana_32KB)
l1dpref=(no) # no ipcp_crossPages ipcp_crossPages ipcp_crossPages ipcp_crossPages no no ipcp_crossPages)
l2cpref=(no) # no no no spp_tuned_aggr spp_tuned_aggr spp_tuned_aggr spp_tuned_aggr spp_tuned_aggr)
llcpref=(no) # no no no no no no no next_line)

#tlb prefetchers
itlb_pref=(no) # no no no no no no no next_line)
dtlb_pref=(no) # no no no no no no no next_line)
stlb_pref=(no) # no no no no no no no next_line)

#cache replacement policies in the format: btb-l1i-l1d-l2c-llc
cache_repl=lru-lru-lru-srrip-drrip

#tlb replacement policies in the format: itlb-dtlb-stlb
tlb_repl=lru-lru-lru

numcore=1

tracedir=./IPC-traces
#tracedir=/home/vishal/Desktop/Thesis/qualcomm_public_trace_list
traces=$(cat scripts/server_trace_list.txt)

numofpref=${#l1dpref[@]}


#Neelu: Variables ending now. Kindly add new variables above this line.


for((i=0; i<$numofpref; i++))
do
    ./build.sh ${cache_repl}-${tlb_repl} 1 ${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]} || exit
done

tracenum=0
count=0
iterator=0

#parallelismcount=16

for trace in $traces;
do 
	count=`expr $count + 1`
	tracenum=`expr $tracenum + 1`

	#if [ $tracenum -lt 36 ] && [ $tracenum -gt 2 ]
	#then
	#	continue
	#fi

	if [ $count -eq $parallelismcount ]
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
