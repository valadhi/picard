#!/bin/bash
#GIT_HEAD_REF=$(git rev-parse HEAD)
GIT_HEAD_REF=6a252386bed6d4233f0f13f4562d8ae8608e7445
CONTAINER_ID=$(docker ps -q --filter ancestor=tscholak/text-to-sql-eval:$GIT_HEAD_REF)
docker cp ./seq2seq $CONTAINER_ID:/app/seq2seq/
docker exec $CONTAINER_ID /bin/bash -c "python seq2seq/serve_seq2seq.py configs/serve.json"