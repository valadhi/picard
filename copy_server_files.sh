#!/bin/bash
GIT_HEAD_REF=$(git ls-remote https://github.com/ServiceNow/picard HEAD | awk '{ print $1}')
CONTAINER_ID=$(docker ps -q --filter ancestor=tscholak/text-to-sql-eval:$GIT_HEAD_REF)
docker cp ./seq2seq $CONTAINER_ID:/app/seq2seq/
docker exec $CONTAINER_ID /bin/bash -c "python seq2seq/serve_seq2seq.py configs/serve.json"