#!/bin/bash

echo -e "étape 1 ok\n"

while IFS="," read -r rec_column1 rec_column2 rec_column3 rec_column4 rec_column5

do

echo -e "étape 2 ok\n"
if [[ "$rec_column5" =~ .*Admin.* ]]

then

echo -e "utilisateur est Admin\n"

G="sudo"

else

echo -e "utilisateur est User\n"

G="Plateformeurs"

fi
sudo useradd -p $rec_column4 $rec_column2 --uid $rec_column1 --create-home --groups $G --shell /bin/bash

done < <(tail -n +2 Shell_Userlist.csv)
