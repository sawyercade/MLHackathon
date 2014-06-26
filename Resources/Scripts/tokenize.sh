#!/usr/bin/sh
#
# Tokenize input file - Option is to keep all occurences or unique tokens only
# Example: ./tokenize.sh 12345678.ztrace100.log unique
# Default: Include all occurences
#
# To tokenize all files matching the extension ztrace100.log, use the following:
# files=`ls *.ztrace100.log
# for file in $files; do ./tokenize.sh $file >> testtokenize.txt; done
# for file in $files; do ./tokenize.sh $file unique >> testuniquetokenize.txt; done

file="$1"
id=`echo $file | cut -f1 -d "."`

if test $# -gt 1
then
    mode="$2"
else
    mode="all"
fi

if [ "$mode" == "unique" ]
then
    tokens=`sed -e 's/\[Z!.\]//g' -e 's/^.*"\(.*\)"/\1/g' -e 's/::/:/g' -e 's/@/ /g' -e 's/0x........//g' -e 's/\W/ /g' -e 's/[0-9]//g' -e 's/^ *//g' $file | tr '[A-Z]' '[a-z]' | tr -cd '\11\12\15\40-\176' | tr -d '\r' | tr -s ' ' | tr ' ' '\n' | sort | uniq | tr '\n' ' '`
else
    tokens=`sed -e 's/\[Z!.\]//g' -e 's/^.*"\(.*\)"/\1/g' -e 's/::/:/g' -e 's/@/ /g' -e 's/0x........//g' -e 's/\W/ /g' -e 's/[0-9]//g' -e 's/^ *//g' $file | tr '[A-Z]' '[a-z]' | tr -cd '\11\12\15\40-\176' | tr -d '\r' | tr '\n' ' ' | tr -s ' '`
fi

echo "$id,$tokens" | tr ',' '\t'