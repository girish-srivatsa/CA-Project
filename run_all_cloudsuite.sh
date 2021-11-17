traces=(cassandra classification cloud9 nutch streaming)
TRACE_DIR=~/cloudsuite_trace
n_warm=20
n_sim=50

mkdir -p results_cloudsuite

./build.sh lru 4 no-no-no

for trace in ${traces[*]}
do
	for((i=0;i<=5;i++));
	do
		./run_cloudsuite.sh ${trace} ${i} ${n_warm} ${n_sim}
	done
done

