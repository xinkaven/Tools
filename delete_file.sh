#!/bin/sh

img_dir=/usr/local/nginx/img
work_time=0200
del_img()
{
        count=`ls -lt $img_dir|grep -v total|wc -l`
        i=0
        if [ $count -gt 100 ]; then
           for shname in `ls -t $img_dir`
           do
             name=$img_dir/$shname
             i=`expr $i + 1`
             if [ $i -gt 100 ]; then
                rm -rf  $name
             fi
           done

         fi
}



while((1>0))
do
        curren=`date +'%H%M'`

        if [ "$curren" = "$work_time" ];then
                del_img
                sleep 120
        fi
        sleep 5
done
