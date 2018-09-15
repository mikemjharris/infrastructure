cat ~/blog/public/version.json >> ~/blog/public/releases.json

COMMIT_HASH=`cd ~/blog && git rev-parse HEAD`

DATE=`date +"%Y-%m-%d_%H-%M-%S"`
echo $COMMIT_HASH

cat ~/deployment/version.template  | sed -E "s/COMMIT_HASH/$COMMIT_HASH/" | sed -E "s/BRANCH_NAME/master/" | sed -E "s/DEPLOY_DATE/$DATE/" > ~/blog/public/version.json


