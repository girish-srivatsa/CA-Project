

directories=(inc src replacement prefetcher branch)

for directory in ${directories[*]}
do
	for file in $directory/*
	do
		clang-format -i $file		
	done
done

