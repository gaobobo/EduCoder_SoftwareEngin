#!/bin/bash

normal_pass() {

    source /tmp/download.sh \
    resource/DataFlow-1.4/step4.mdj \
    step4.mdj \
    ${DownloadSite} \
    ${Branch} \
    /home/headless/Desktop/workspace/myshixun/数据流图/submit/step_detail_4/step4.mdj

}

force_pass() {
 
    echo -e "\e[38;5;11;7m 警告: \e[0m虽然传入了--force，但该关卡尚未提供force模式。会以normal模式通关。"

    normal_pass

}


help() {

       echo \
'
Usage: '$0' [Option]
Options:
       (  Gitee|Github main|dev|<branch> --force  ) |
       (  Gitee|Github main|dev|<branch>  )         |
       (  Gitee|Github  )

       Gitee|Github             Repo mirror to download resource [default: Gitee]
       main|dev|<branch>        Repo branch where download resouce from [default: main]
       --force                  Change judge system kernel to pass if avaliable
'

}

DownloadSite=${1:-Gitee}
Branch=${2:-main}
Force=${3:+"--force"}

if [ $# -lt 1 ]; 
then
       help
       return 1
fi

if [ ${Force} ];
then
       echo -e "\e[38;5;11;7m 警告: \e[0m正在以 --force 模式运行。" \
       "这会修改评测系统内核。去掉-f或--force使用一般模式。"
       force_pass

else
       normal_pass
fi

return $?