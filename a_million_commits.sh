NUMBER_OF_COMMITS_PER_DAY = 50
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
			for i in {1..$NUMBER_OF_COMMITS_PER_DAY}
			do
				cd $Y/$M/$D
				echo "Commit # $i on $M/$D/$Y" > commit$i.md
				cd ../../../
				export GIT_COMMITTER_DATE="$Y-$M-$D 12:00:00"
				export GIT_AUTHOR_DATE="$Y-$M-$D 12:00:00"
				git add $Y/$M/$D/commit$i.md -f
				git commit --date="$Y-$M-$D 12:00:00" -m "Committed $i on $M $D $Y"
			done
		done
	done
done
git push origin master
git rm -rf 20**
git rm -rf 19**
git add --all && git commit -m "cleanup"
git push origin master
