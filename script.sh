#!/bin/bash

echo -n "GitHub User: "
read USER

echo -n "GitHub Password: "
read -s PASS

echo ""
echo -n "GitHub Repo (e.g. foo/bar): "
read REPO 

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)


# ============== Delete old ============
# echo "DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug"
# curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug"
# echo "DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate"
# curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate"
# echo "DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement"
# curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement"
# echo "DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted"
# curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted"
# echo "DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid"
# curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid"
# echo "DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question"
# curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question"
# echo "DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix"
# curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix"

# ============== Create new ============
labels=( New Bug 1_point 2_points 3_points Priority_#1 Priority_#2 Priority_#3 In_progress Need_review Merged Test Re_open Done)
colors=( 207DE5 0052CC 5319E7 FBCA04 009800 F7C6C7 107DE5 159818 BFE5BF 89DC6C D4C5F9 FEAA04 E6E6E6 FC2929)

# get length of an array
arr_lenght=${#labels[@]}

# use for loop read all name of search engine
for (( i=0; i<${arr_lenght}; i++ ));
do
  curl --user "$USER:$PASS" --include --request POST --data '{"name":"'${labels[$i]}'","color":"'${colors[$i]}'"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
done

#how to run script
# bash script.sh
