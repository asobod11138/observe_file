#!/bin/sh

filename='/home/***/.bashrc'
command='echo "てめぇ!勝手にbashrc書き換えやがったな！ぶっ○○ぞこの野郎！！！！！！！！！！！！！！！！！！！！"'

update() {
  echo `openssl sha256 -r $filename | awk '{print $filename}'`
}

INTERVAL=0.5 #監視間隔, 秒で指定
no=0
last=`update $filename`

while true;
do
  sleep $INTERVAL
  current=`update $filename`
  if [ "$last" != "$current" ];
  then
    nowdate=`date '+%Y/%m/%d'`
    nowtime=`date '+%H:%M:%S'`
    for((i=0;i<100;i++));
    do
      eval $command
    done
    last=$current
    no=`expr $no + 1`
  fi  
done
