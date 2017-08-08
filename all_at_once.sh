mkdir fake
cd fake
# you can't do more than 1000 commits at once as of august 8 2017
for i in {1..1000}
do
	echo "Hello" > $i.txt
	git add $i.txt
	git commit -m "added $i"
done
git push origin master
