#!/usr/bin/env bash

git clone https://github.com/espnet/espnet.git
cd espnet; git checkout v.202204; cd ..

mv egs2/ljspeech/tts1/run.sh espnet/egs2/ljspeech/tts1/run.sh
mv egs2/ljspeech/tts1/conf/tuning/train_jets.yaml espnet/egs2/ljspeech/tts1/conf/tuning/
mv egs2/kss/tts1/run.sh espnet/egs2/kss/tts1/run.sh
mv egs2/kss/tts1/conf/tuning/train_jets.yaml espnet/egs2/kss/tts1/conf/tuning/

mv espnet2/gan_tts/jets espnet/espnet2/gan_tts/
mv tasks/gan_tts.py espnet/espnet2/tasks/gan_tts.py
mv tasks/tts.py espnet/espnet2/tasks/tts.py

rm -rf espnet2 egs2 tasks

echo finish patch.
