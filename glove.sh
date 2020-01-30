mkdir "glove_dir"
wget http://nlp.stanford.edu/data/glove.6B.zip
unzip glove.6B.zip -d "glove_dir"

onmt_preprocess -train_src data/asl_train.txt -train_tgt data/en_train.txt -valid_src data/asl_val.txt -valid_tgt data/en_val.txt -save_data data/data

./tools/embeddings_to_torch.py -emb_file_both "glove_dir/glove.6B.100d.txt" \
-dict_file "data/data.vocab.pt" \
-output_file "data/embeddings"