paramparser() {
    # Define default values
    count=${count:- 10}
    fileinput=${fileinput:- ""}
    fileout=${fileout:- "testing file nr"}
    filetype=${filetype:- "docx"}

    # Assign the values given by the user
    while [ $# -gt 0 ]; do
        if [[ $1 == *"--"* ]]; then
            param="${1/--/}"
            declare -g $param="$2"
        fi  
        shift
    done
}

paramparser $@

i=1
while [ $i -le $count ]
do
    cp "$fileinput" "Files/$fileout $i.$filetype"
    i=$((i+1))
done

echo " $count files successfully created"
