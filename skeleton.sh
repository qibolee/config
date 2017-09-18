#!/bin/bash
# -*- coding: gbk -*-


################################################
# File Name		: run.sh
# Author		: liqibo(liqibo@baidu.com)
# Create Time	: 2017/07/10
# Brief			: process data
################################################


set -x

# global config
[[ $# -eq 1 ]] && static_date=$1 || static_date=`date -d "1 day ago" +"%Y%m%d"`
local_dir=""
data_dir="${local_dir}/data"
bin_dir="${local_dir}/bin"



# log info
function log(){
	now_date=`date +"%Y/%m/%d %H:%M:%S"`
	echo -e "[${now_date}] $1"
}


# init work space
function init_work(){
	log "init work space..."
	log "change directory..."
	cd ${local_dir}
	log "change done"
	
	log "init done"
	log "pwd: `pwd`"
	log "pid: $$"
}


# main task
function main_task(){
	log "starting..."
	
	log "done"
}


# run
main_task


