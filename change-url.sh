find . -name "*.md" -exec sed -i 's|\](/|\](/wzry.doc/|g' {} +

exit()

#!/bin/bash
##################################
# Author : cndaqiang             #
# Update : 2020-06-07            #
# Build  : 2020-06-07            #
# What   : 批量修改md文档中的](/in 为](/out      #
##################################
sh=$0
in=$1
out=$2
file=$3

#---- in and out
if [ $2 ]
then
    #----如果输入为none， 则不替换
    if [ ${in} == ${out} ]
    then
        echo "in == out"
        exit
    fi
    if [ ${in} == none ]
    then 
        unset in
    fi
    if [ ${out} == none ]
    then
        unset out
    fi

    echo "Replace ](/${in} by ](/${out}/"
    echo  "sed -i s/\]\(\\/${in}/\]\(\\/${out}\\//g"
else
    echo "Usage: $sh [out] [in] "
    echo "       to Replace ](/[in] by ](/[out]/ "
    exit
fi


#---- File
if [ $file ]
then
    file=($file)
else
    file=$( find . | grep md )
fi

for i in ${file[@]}
do
    echo "sed -i s/\]\(\\/${in}/\]\(\\/${out}\\//g $i"
    sed -i s/\]\(\\/${in}/\]\(\\/${out}\\//g $i
    sed -i s/\]\(\\/\\//\]\(\\//g $i
done
#echo ${in} ${out}
#sed -i s/\]\(${in}/\]\(${out}/g
