= to fine-tune model = 
 - place fine-tune data in seq2seq/database/insurance/insurance.json
   (model provided) 
 - "make train" to open a docker container
 - in separate terminal run ./custom_train.sh

= to run predictions=
- "make serve" to open docker container
- in separate terminal run ./custom_serve.sh
- open "http://localhost:8000/docs#/default/ask_ask__db_id___question__get" in browser