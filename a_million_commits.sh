for Y in {2016..2018}
do
	mkdir $Y
	for M in {1..12}
	do
		cd $Y
		mkdir $M
		cd ../
		for D in {1..31}
		do
			cd $Y/$M
			mkdir $D
			cd $D
			echo "Committed on $M/$D/$Y" > commit.md
			cd ../../../
			export GIT_COMMITTER_DATE="$Y-$M-$D 12:00:00"
			export GIT_AUTHOR_DATE="$Y-$M-$D 12:00:00"
			git add $Y/$M/$D/commit.md -f
			git commit --date="$Y-$M-$D 12:00:00" -m "Committed on $M $D $Y"
		done
	done
done
