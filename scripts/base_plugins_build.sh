#!/bin/bash

replace()
{
    basedir=`pwd`
    for file in `find ./plugins -depth -type $1 -name "$2*" -print`
    do
        echo "$file"
        currdir=`dirname $file`
        currname=`basename $file`
        #echo "currdir:$currdir"
        #echo "currname:$currname"
        cd $currdir
        newname=`echo $currname | sed "s/$2/$3/g"`
        #echo "new:$newname"
        mv $currname $newname
        cd $basedir
    done
}

if [ $# -ne 1 ];then
    echo "input error.eg:base_plugins_build.sh [account_plugin|integral_plugin]."
    exit
fi

a=$1
b=${a:0-7}
base=${a%_*}
#转换成大写
ubase==${base^^}

if [ "$b" != "_plugin" ]; then
    printf "input error.must be _plugin end\n"
    exit 1
fi

#判断待配置的plugin及api_plugin目录应该不存在
c="plugins/"${base}_plugin
if [ -d $c ]; then
    printf "$c exist.not build\n"
    exit 1
fi

d="plugins/"${base}_api_plugin
if [ -d $d ]; then
    printf "$d exist.not build\n"
    exit 1
fi

#判断应该存在base_plugin和base_api_plugin目录
e="plugins/base_plugin"
if [ ! -d $e ]; then
    printf "$e need exist.not build\n"
    exit 1
fi

f="plugins/base_api_plugin"
if [ ! -d $f ]; then
    printf "$f need exist.not build\n"
    exit 1
fi

mkdir -p bak
cp -r -f plugins/base_plugin plugins/base_api_plugin bak

find ./plugins/base_plugin ! -path "*/\.*" -type f -print | xargs grep  base_plugin  -l | xargs sed -i "s/base_plugin/${base}_plugin/g"
find ./plugins/base_plugin ! -path "*/\.*" -type f -print | xargs grep  base_apis  -l | xargs sed -i "s/base_apis/${base}_apis/g"
find ./plugins/base_plugin ! -path "*/\.*" -type f -print | xargs grep  base_struct  -l | xargs sed -i "s/base_struct/${base}_struct/g"


find ./plugins/base_api_plugin ! -path "*/\.*" -type f -print | xargs grep  base_plugin  -l | xargs sed -i "s/base_plugin/${base}_plugin/g"
find ./plugins/base_api_plugin ! -path "*/\.*" -type f -print | xargs grep  base_api_plugin  -l | xargs sed -i "s/base_api_plugin/${base}_api_plugin/g"
find ./plugins/base_api_plugin ! -path "*/\.*" -type f -print | xargs grep  base_apis  -l | xargs sed -i "s/base_apis/${base}_apis/g"
find ./plugins/base_api_plugin ! -path "*/\.*" -type f -print | xargs grep  BASE_RO_CALL  -l | xargs sed -i "s/BASE_RO_CALL/${ubase}_RO_CALL/g"
find ./plugins/base_api_plugin ! -path "*/\.*" -type f -print | xargs grep  BASE_RW_CALL  -l | xargs sed -i "s/BASE_RW_CALL/${ubase}_RW_CALL/g"
find ./plugins/base_api_plugin ! -path "*/\.*" -type f -print | xargs grep  "CALL(base"  -l | xargs sed -i "s/CALL(base/CALL(${base}/g"
find ./plugins/base_api_plugin ! -path "*/\.*" -type f -print | xargs grep  "CALL_ASYNC(base"  -l | xargs sed -i "s/CALL_ASYNC(base/CALL_ASYNC(${base}/g"

sed -i "1s/^/add_subdirectory($(base)_plugin)\n/" ./plugins/CMakeLists.txt


replace d base_plugin ${base}_plugin
replace d base_api_plugin ${base}_api_plugin
replace f base_plugin ${base}_plugin
replace f base_api_plugin ${base}_api_plugin

`mv -f bak/base_plugin bak/base_api_plugin ./plugins`



