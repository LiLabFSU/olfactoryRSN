# olfactoryRSN

README for the olfactory resting-state network pipeline

This document details how the pipeline can be applied to data from the Human Connectome Project (HCP) to generate adjacency matrices for network analysis.

DATA PREPARATION:
data must be downloaded from HCP (https://www.humanconnectome.org/)

PIPELINE ORGANIZATION:
subjects are processed serially in commandfile.sh

OUTPUT:
scripts output a .csv containing timeseries for the atlas specified regions of interest (ROIs). To form an adjacency matrix take the pearsons correlation coefficient between all pairwise combinations of timeseries.
