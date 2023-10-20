# Revising with a Backward Glance

This repository accompanies the publication:

Revising with a Backward Glance: Regressions and Skips during Reading as Cognitive Signals for Revision Policies in Incremental Processing.

by Brielen Madureira, Pelin Çelikkol and David Schlangen at CoNLL 2023.

# Set Up

1. Create the preprocessed directory structure. Commands are in the first block of ```setup.sh```.
2. Create the Python environment. The steps we used are in ```setup.sh```. Alternatively, install via conda or pip using ```environment.yml``` and ```requirements.txt```, repectively.
3. Download the data. Follow the instructions in ```data/README.md```.

# Data Preprocessing

1. Extract human regressions and number of fixations. Run the ```preprocess_human_data.ipynb``` notebook. Human data will be saved into ```preprocessed/human_data```.
2. Extract models outputs, revisions and edits. Run the ```preprocess_model_data.ipynb``` notebook. Models data will be saved into ```preprocessed/model_data``` and ```preprocessed/model_outputs```.
3. Merge the files. Run the ```merge_data.ipynb``` notebook.

Data preprocessing for models, humans and merge run on June 27, 2023.

# Analysis

1. Run the R scripts for the analysis. Results should be saved into ```results/```.
2. Create plots and tables. Run the ```plots-tables.ipynb``` notebook.
