new_name="new_name"
n=1

for i in *.jpg
  do mv '$i' '$new_name$n.jpg'
  let "n++"
done
