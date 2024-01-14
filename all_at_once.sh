mkdir fake
cd fake

# a million commits
for Y in {2020..2020}
do
    for M in {1..5}
    do
        for D in {1..31}
        do
            mkdir $Y-$M-$D
            cd $Y-$M-$D

            # generate a random number of commits per day
            iter=$(shuf -i 1-20 -n 1)
            for ((i=0; i<$iter; i++))
            do
                echo "Commit $i on $M/$D/$Y" > commit_$i.txt
                export GIT_COMMITTER_DATE="$Y-$M-$D 12:00:00"
                export GIT_AUTHOR_DATE="$Y-$M-$D 12:00:00"
                git add commit_$i.txt
                git commit --date="$Y-$M-$D 12:00:00" -m "Committed $i on $M $D $Y"
            done

            cd ../
        done
    done
done
git push origin master
git rm -rf 20**
git rm -rf 19**
git add --all && git commit -m "cleanup"
git push origin master
