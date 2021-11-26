

traces=$(cat scripts/${1})

count=0
iterator=0
mix=0
for trace in $traces;
do
        if [ $count -lt 12 ]
        then
                iterator=`expr $iterator + 1`
                echo "Number of traces simulated - $count in iteration $iterator"
                ./run_champsim.sh hashed_perceptron-no-no-no-no-no-no-no-lru-lru-lru-srrip-hawkeye-lru-lru-lru-1core  50 100   ../../Champsim-Prefetcher-Thesis/tracer/experiment $trace ${2}  & 
        else
                ./run_champsim.sh hashed_perceptron-no-no-no-no-no-no-no-lru-lru-lru-srrip-hawkeye-lru-lru-lru-1core  50 100  ../../Champsim-Prefetcher-Thesis/tracer/experiment $trace  ${2} &
        fi
done

echo "Done with count $count"
