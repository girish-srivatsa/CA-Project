#Neelu: Adding the list of variables here so you'll only need to modify the following to change anything.

numwarmup=50
numsim=50

parallelismcount=24

echo "NOT BUILDING BINARY for INDEX 0 to all. REMEMBER TO DO IT NEXT TIME"


branchPredictor=hashed_perceptron

l1dpref=(baseline final_ipcp final_ipcp  #(bingo_dpc3_48KB final_ipcp ipcp_crossPages ip_stride) # final_ipcp bingo_dpc3 idealL1D idealL1Dpref final_ipcp ipcp_crossPages no no) #(ipcp_crossPages ipcp_crossPages) 	#(baseline idealL1D idealL2C)

#(ipcp_8KBreg1 ipcp_16KBreg1 ipcp_32KBreg1 ipcp_64KBreg1 ipcp_128KBreg1 ipcp_256KBreg1 ipcp_512KBreg1 ipcp_1MBreg1) #(ipcp_crossPages final_ipcp no 4reg 16reg 64reg ipcp_crossPages_pb ipcp_aggr) #ipcp_no_cplx_cs_inc_degree ipcp_no_cplx)

l2cpref=(no spp_tuned_aggr spp_tuned_aggr spp_tuned_aggr) # no no no no ipcp_practical no spp_tuned_aggr ppf) #(spp_ta_stlb_hint_reg_cove spp_ta_stlb_hint_reg_accu) #spp_ta_stlb_hint_reg spp_stlb_hint_bitvec_reg) # spp_ta_sub_reg spp_tuned_aggr_demand) # no no no) # no no no) #ipcp_paper1)	 

llcpref=(no no no no) # no no no no no no no no) # no no no)	

itlb_pref=(no no no no) # no no no no no no no no) # no no no no no no no no no no)

dtlb_pref=(no no no no) # no no no no no no no no) # no no no no no no no no no no)

stlb_pref=(no no no no) # no no no no no no no no) # no no no no no no no no no no)


llcrepl=srrip-drrip
numcore=1

tracedir=../../SPEC2017

traces=$(cat scripts/intensive_trace_list.txt)

#traces=$(cat scripts/spec2017_trace_list.txt)


numofpref=${#l1dpref[@]}

#paralleslismcount=`expr 16 / $numofpref`
#echo "PCount: $paralleslismcount"
#Neelu: Variables ending now. Kindly add new variables above this line.


#for((i=0; i<$numofpref; i++))
#do 
#	./build_champsim.sh $branchPredictor ${l1dpref[i]} ${l2cpref[i]} ${llcpref[i]} ${itlb_pref[i]} ${dtlb_pref[i]} ${stlb_pref[i]} $llcrepl $numcore || exit
#done

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
				./run_champsim.sh $branchPredictor-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$llcrepl-1core $numwarmup $numsim $tracedir $trace 
			#	./run_champsim.sh hashed_perceptron-final_ipcp-no-no-no-no-no-hawkeye-1core $numwarmup $numsim $tracedir $trace
			else
				./run_champsim.sh $branchPredictor-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$llcrepl-1core $numwarmup $numsim $tracedir $trace &
			#	./run_champsim.sh hashed_perceptron-final_ipcp-no-no-no-no-no-hawkeye-1core $numwarmup $numsim $tracedir $trace &
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


			#./run_champsim.sh hashed_perceptron-final_ipcp-no-no-no-no-no-hawkeye-1core $numwarmup $numsim $tracedir $trace &
                        ./run_champsim.sh $branchPredictor-${l1dpref[i]}-${l2cpref[i]}-${llcpref[i]}-${itlb_pref[i]}-${dtlb_pref[i]}-${stlb_pref[i]}-$llcrepl-1core $numwarmup $numsim $tracedir $trace &
                done
	fi


done

echo "Done with count $count"
