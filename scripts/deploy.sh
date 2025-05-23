#!/bin/bash

BUILD_DIR=/home/ubuntu/app/build/libs
DEPLOY_DIR=/home/ubuntu/app

BUILD_JAR=$(ls $BUILD_DIR/*.jar | grep -v plain | head -n 1)
JAR_NAME=$(basename $BUILD_JAR)

echo ">>> build 파일명: $JAR_NAME" >> /home/ubuntu/deploy.log

echo ">>> build 파일 복사" >> /home/ubuntu/deploy.log
cp $BUILD_JAR $DEPLOY_DIR/

echo ">>> 현재 실행중인 애플리케이션 pid 확인 후 일괄 종료" >> /home/ubuntu/deploy.log
sudo ps -ef | grep java | grep -v grep | awk '{print $2}' | xargs -r kill -15

DEPLOY_JAR=$DEPLOY_DIR/$JAR_NAME
echo ">>> DEPLOY_JAR 배포" >> /home/ubuntu/deploy.log
echo ">>> $DEPLOY_JAR의 $JAR_NAME를 실행합니다" >> /home/ubuntu/deploy.log
nohup java -jar $DEPLOY_JAR >> /home/ubuntu/deploy.log 2>> /home/ubuntu/deploy_err.log &