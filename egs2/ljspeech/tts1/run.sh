#!/usr/bin/env bash
# Set bash to 'debug' mode, it will exit on :
# -e 'error', -u 'undefined variable', -o ... 'error in pipeline', -x 'print commands',
set -e
set -u
set -o pipefail

fs=22050
n_fft=1024
n_shift=256

opts=
if [ "${fs}" -eq 22050 ]; then
    # To suppress recreation, specify wav format
    opts="--audio_format wav "
else
    opts="--audio_format flac "
fi
opts+="--min_wav_duration 0.8 --tts_task gan_tts --write_collected_feats true "

train_set=tr_no_dev
valid_set=dev
test_sets="dev eval1"

train_config=conf/tuning/train_jets.yaml
inference_config=

# g2p=g2p_en # Include word separator
g2p=g2p_en_no_space # Include no word separator

./tts.sh \
    --lang en \
    --feats_type raw \
    --fs "${fs}" \
    --n_fft "${n_fft}" \
    --n_shift "${n_shift}" \
    --token_type phn \
    --cleaner tacotron \
    --g2p "${g2p}" \
    --train_config "${train_config}" \
    --inference_config "${inference_config}" \
    --train_set "${train_set}" \
    --valid_set "${valid_set}" \
    --test_sets "${test_sets}" \
    --srctexts "data/${train_set}/text" \
    ${opts} "$@"
