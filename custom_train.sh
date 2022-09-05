#!/bin/bash
GIT_HEAD_REF=$(git ls-remote https://github.com/ServiceNow/picard HEAD | awk '{ print $1}')
CONTAINER_ID=$(docker ps -q --filter ancestor=tscholak/text-to-sql-train:$GIT_HEAD_REF)

docker cp ./seq2seq/. $CONTAINER_ID:/app/seq2seq/
docker cp ./third_party/spider/process_sql.py $CONTAINER_ID:/app/third_party/spider/process_sql.py

docker exec $CONTAINER_ID /bin/bash -c "pkill -f run_seq2seq.py"
docker exec $CONTAINER_ID /bin/bash -c "python seq2seq/run_seq2seq.py configs/train.json"
