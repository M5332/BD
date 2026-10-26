
echo " checking file exist or not"

if [ -f "$1" ]; then
    echo "file exist"
else
    echo "file not exist"
fi 

name=( "heelo" "jllo" )

for j in ${name[@]} ;
 do 
    echo $j
done
for i in {1..10} ; do 
    echo $i
done  