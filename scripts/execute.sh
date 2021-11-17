
#./build_champsim.sh bimodal next_line next_line next_line no no no lru 1
#./build_champsim.sh bimodal no no no no no no lru 1
#./build_champsim.sh bimodal no no no no spp no lru 1
#./build_champsim.sh hashed_perceptron no no no no no no lru 1
 
traces=$(cat scripts/intensive_trace_list.txt)

count=0
iterator=0

for trace in $traces;
do 
	count=`expr $count + 1`
	if [ $count -lt 12 ]
	then
		iterator=`expr $iterator + 1`
		echo "Number of traces simulated - $count in iteration $iterator"
		#./run_champsim.sh bimodal-no-no-no-no-no-no-lru-1core 50 50 spec/$trace  &
		#count=0
		./run_champsim.sh hashed_perceptron-no-no-no-no-no-no-srrip-drrip-1core 50 50 tracer spec/$trace & 
	else
	        ./run_champsim.sh hashed_perceptron-no-no-no-no-no-no-srrip-drrip-1core 50 50 tracer spec/$trace & 	
		#./run_champsim.sh bimodal-no-no-no-no-no-no-lru-1core 50 50 spec/$trace  &
		#./run_champsim.sh bimodal-no-no-no-no-spp-no-lru-1core 50 50  experiment/$trace  -cloudsuite &  
	fi
done

echo "Done with count $count"
