#!/bin/bash
export PYSPARK_DRIVER_PYTHON="/home/cloudera/anaconda2/bin/jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="lab --NotebookApp.token='' --port=8889 --ip=0.0.0.0 --notebook-dir=/home/cloudera/PyctureStream-master"
pyspark
