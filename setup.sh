#!/bin/sh

mkdir figures
mkdir preprocessed
mkdir preprocessed/human_data
mkdir preprocessed/maps
mkdir preprocessed/texts
mkdir preprocessed/model_data
mkdir preprocessed/model_outputs
mkdir preprocessed/models-humans
mkdir preprocessed/models-humans/revisions-regressions/
mkdir preprocessed/models-humans/effective_revisions-regressions/
mkdir preprocessed/models-humans/revisions-regression_probs/
mkdir preprocessed/models-humans/effective_revisions-regression_probs/
mkdir preprocessed/models-humans/revisions-skip_probs/
mkdir preprocessed/models-humans/effective_revisions-skips_probs/
mkdir results

# create environment
conda create --name regressions python=3.9
conda activate regressions
pip install pandas==2
pip install Jinja2
pip install flair
pip install rdata
pip install osfclient
conda install ipykernel
conda install -c conda-forge ipywidgets
conda install -c conda-forge spacy
conda install -c conda-forge cupy
pip install seaborn
pip install stanza
pip install https://huggingface.co/explosion/pt_udv25_portuguesebosque_trf/resolve/main/pt_udv25_portuguesebosque_trf-any-py3-none-any.whl
pip install https://huggingface.co/explosion/de_udv25_germanhdt_trf/resolve/main/de_udv25_germanhdt_trf-any-py3-none-any.whl
pip install https://huggingface.co/explosion/es_udv25_spanishancora_trf/resolve/main/es_udv25_spanishancora_trf-any-py3-none-any.whl
pip install https://huggingface.co/explosion/nl_udv25_dutchalpino_trf/resolve/main/nl_udv25_dutchalpino_trf-any-py3-none-any.whl
pip install https://huggingface.co/explosion/en_udv25_englishewt_trf/resolve/main/en_udv25_englishewt_trf-any-py3-none-any.whl
pip install flair --upgrade
pip install pyreadr
# fix issue
# https://discourse.jupyter.org/t/traceback-wont-show-code-rather-no-such-file-or-directory-tmp-ipykernel/17460/2
pip uninstall rich
pip install jinja2 --upgrade