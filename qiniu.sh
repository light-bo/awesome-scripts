#!/bin/zsh
# The script is use to upload a image or delete a image on https://www.qiniu.com
# 这个脚本用于在七牛云上上传或者删除一张图片

echo "Upload a new image ==> 1"
echo "Delete a image ==> 2"
read INPUT_TYPE

# ak: Access Key
# sk: Secret Key
qshell account ak sk

case $INPUT_TYPE in
  "1" )
    echo "Input image name: "
    read IMAGE_NAME

    TARGET_NAME="macpro_$IMAGE_NAME"

    # your_bucket: <Bucket>
    # Document: https://github.com/qiniu/qshell
    qshell fput your_bucket $TARGET_NAME $IMAGE_NAME &&
    echo "url: http://7xskiu.com1.z0.glb.clouddn.com/$TARGET_NAME"
    ;;

  "2" )
    echo "Input the file name you want to delete:"
    read KEY_NAME

    # your_bucket: <Bucket>
    # Document: https://github.com/qiniu/qshell
    qshell delete your_bucket $KEY_NAME &&
    echo "Delete successfully!!!"
    ;;

  *  )
  echo "Input error， please input 1 or 2 only"
  ;;
esac
