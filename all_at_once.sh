mkdir fake
cd fake
for i in {1..20000}
do
	echo "Hello" > $i.txt
	git add $i.txt
	git commit -m "added $i"
done
git push origin master
