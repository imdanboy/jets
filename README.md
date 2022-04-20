# JETS: Jointly Training FastSpeech2 and HiFi-GAN for End to End Text to Speech

Pytorch implementation based on ESPNet (https://github.com/espnet/espnet) toolkit; tag: v.202204

paper: https://arxiv.org/abs/2203.16852

demo: https://imdanboy.github.io/interspeech2022/
<p align="center"><img src="figures/jets_fig.002.jpeg" alt="figure" width="500"/></p>

JETS consists of FastSpeech2, HiFi-GAN and an Alignment Module. The model files are located at `espnet2/gan_tts/jets/`

## How to run
tested on 4 V100 gpu
```
# LJSPEECH training
cd egs2/ljspeech/tts1
./run.sh --stage 1 --stop_stage 6 --ngpu 4
# KSS training
cd egs2/kss/tts1
./run.sh --stage 1 --stop_stage 6 --ngpu 4
```
