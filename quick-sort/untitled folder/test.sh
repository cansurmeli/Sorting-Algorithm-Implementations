regex='/0\.[0-9]+/g'
string='0m0.007s'

[[ $string =~ $regex ]]
echo "${BASH_REMATCH[1]}"
