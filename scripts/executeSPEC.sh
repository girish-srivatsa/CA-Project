#Neelu: Adding the list of variables here so you'll only need to modify the following to change anything.

numwarmup=5
numsim=5

parallelismcount=16
#[branch_pred] [l1i_pref] [l1d_pref] [l2c_pref] [llc_pref] [itlb_pref] [dtlb_pref] [stlb_pref] [btb_repl] [l1i_repl] [l1d_repl] [l2c_repl] [llc_repl] [itlb_repl] [dtlb_repl] [stlb_repl] [num_core] <= binary name consists of.

#Running SPEC simulations for 50-100M instructions
numwarmup=50
numsim=100

parallelismcount=3


#branch predictor
branchPredictor=hashed_perceptron

#cache prefetchers
l1ipref=(no mana_32KB mana_32KB no mana_32KB no no mana_32KB)
l1dpref=(no no ipcp_crossPages ipcp_crossPages ipcp_crossPages ipcp_crossPages no no)
l2cpref=(no no no no spp_tuned_aggr spp_tuned_aggr spp_tuned_aggr spp_tuned_aggr) 
llcpref=(no no no no no no no no)	

#tlb prefetchers
itlb_pref=(no no no no no no no no)
dtlb_pref=(no no no no no no no no)
stlb_pref=(no no no no no no no no)

#cache replacement policies in the format: btb-l1i-l1d-l2c-llc
cache_repl=lru-lru-lru-srrip-drrip
cache_repl_str="lru lru lru srrip drrip"

#tlb replacement policies in the format: itlb-dtlb-stlb
tlb_repl=lru-lru-lru
tlb_repl_str="lru lru lru"


numcore=1

#tracedir=~/car3s/spec2006_traces/
tracedir=../SPEC_2006_2017/

#traces=$(cat scripts/intensive_trace_list.txt)

traces=$(cat scripts/spec2017_trace_list.txt)	#spec_2006_2017_trace_list.txt)


numofpref=${#l1dpref[@]}

#paralleslismcount=`expr 16 / $numofpref`
#echo "PCount: $paralleslismcount"
#Neelu: Variables ending now. Kindly add new variables above this line.

echo "NOT BUILDING BINARY for INDEX 0 to all. REMEMBER TO DO IT NEXT TIME"

#for((i=0; i<$numofpref; i++))
#do 
#	./build_champsim.sh $branchPredictor ${l1ipref[i]} ${l1dpref[i]} ${l2cpref[i]} ${llcpref[i]} ${itlb_pref[i]} ${dtlb_pref[i]} ${stlb_pref[i]} $cache_repl_str $tlb_repl_str $numcore || exit
#done

#echo "Done building binaries"

#exit

count=0
iterator=0
totalcount=0

for trace in $traces;
do 
	count=`expr $count + 1`
	#totalcount=`expr $totalcount + 1`

	#if [ $totalcount -lt 5 ]
	#	continue
	#temp_parallelismcount=$parallelismcount
	if [ $count -eq $parallelismcount ]
	then
		iterator=`expr $iterator + 1`
		for((i=0; i<$numofpref; i++))
		do
			#GREP OR NOT START
#			if [ $i -eq `expr $numofpref - 1` ]
#			then
#				if grep -q -r "CPU 0 cumulative IPC" results_100M/$trace-$branchPredictor-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-$llcrepl-1core.txt
#				then
 #       				echo "NOT EMPTY"
#				else
 #       				echo "EMPTY"
#					./run_champsim.sh $branchPredictor-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-$llcrepl-1core $numwarmup $numsim $tracedir $trace
#				fi

#			else
#				if grep -q -r "CPU 0 cumulative IPC" results_100M/$trace-$branchPredictor-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-$llcrepl-1core.txt
#				then
 #       				echo "NOT EMPTY"
#				else
 #       				echo "EMPTY"
#					./run_champsim.sh $branchPredictor-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-$llcrepl-1core $numwarmup $numsim $tracedir $trace &
#				fi
#			fi
			#GREP OR NOT END

			if [ $i -eq `expr $numofpref - 1` ]
			then
				./run_champsim.sh $branchPredictor-${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$cache_repl-$tlb_repl-1core $numwarmup $numsim $tracedir $trace 
			else
				./run_champsim.sh $branchPredictor-${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$cache_repl-$tlb_repl-1core $numwarmup $numsim $tracedir $trace &
			fi
		done
		now=$(date)
		echo "Number of SPEC traces simulated - $count in iteration $iterator at time: $now" 
		#>> results_saved/execution_log.txt
		count=0
	else
		for((i=0; i<$numofpref; i++))
                do
			#GREP OR NOT START
        #                if grep -q -r "CPU 0 cumulative IPC" results_100M/$trace-$branchPredictor-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-$llcrepl-1core.txt
	#		then
         #                       echo "NOT EMPTY"
          #              else    
           #                     echo "EMPTY"
            #                    ./run_champsim.sh $branchPredictor-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-$llcrepl-1core $numwarmup $numsim $tracedir $trace &
             #           fi

			#GREP OR NOT END


			./run_champsim.sh $branchPredictor-${l1ipref[i]}-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$cache_repl-$tlb_repl-1core $numwarmup $numsim $tracedir $trace &
                done
	fi


done

echo "Done with count $count"
