#!/bin/bash

wget https://guilhermelawless.github.io/introduction-robotics/docs/lab2/bash_utils.sh && wget https://guilhermelawless.github.io/introduction-robotics/docs/lab2/update_bashrc.sh

ROBOTS=(11 12 13 14)
printf "\nWhich one is your turtlebot? Pick 1-4\n\n"
select R in ${ROBOTS[@]}; do
    if [ -z "$R" ]; then
        echo 'Wrong choice'
        continue
    fi
    break
done

echo "Installing utility functions to ~/.bash_utils.sh"
cp bash_utils.sh ~/.bash_utils.sh && source ~/.bash_utils.sh

echo "Updating ~/.bashrc..."
echo "export TURTLEBOT3_NUMBER=${R}" >> ~/.bashrc
cat update_bashrc.sh >> ~/.bashrc
echo "Done! You're all set"
