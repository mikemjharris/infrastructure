cat ~/books/public/version.json >> ~/books/public/releases.json

COMMIT_HASH=`cd ~/blog && git rev-parse HEAD`

DATE=`date +"%Y-%m-%d_%H-%M-%S"`
echo $COMMIT_HASH

cat ~/deployment/version.template  | sed -E "s/COMMIT_HASH/$COMMIT_HASH/" | sed -E "s/BRANCH_NAME/master/" | sed -E "s/DEPLOY_DATE/$DATE/" > ~/books/public/version.json


