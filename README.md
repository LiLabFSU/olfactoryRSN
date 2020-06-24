# olfactoryRSN

README for the olfactory resting-state network pipeline

This document details how the pipeline can be applied to data from the Human Connectome Project (HCP) to generate adjacency matrices for network analysis.

DATA PREPARATION:
data must be downloaded from HCP (https://www.humanconnectome.org/) via the Amazon Web Services (AWS) S3 application. Instructions for using S3 to access HCP data can be found here: https://wiki.humanconnectome.org/display/PublicData/How+To+Connect+to+Connectome+Data+via+AWS. After setting up AWS S3, the main processing script HCP_automated.sh should be able to download all necessary files for processing.

PIPELINE ORGANIZATION:
Each subject is processed individually using HCP_automated.sh, which carries out all steps neccesary to generate functional connectivity adjacency matrices. Steps include downloading data from HCP, removing low SNR voxels, extracting ROI level timeseries, mean-centering and whitening timeseries, concatenating phase encodings, bandpass filtering, motion correction (http://rfmri.org/DPARSF), scrubbing spikes, and correlation of pairwise timeseries to form adjacency matrices. Subjects are processed serially in commandfile.sh, which can be altered to include the subjects of interest.

OUTPUT:
scripts output a .csv containing timeseries for the atlas specified regions of interest (ROIs) and an adjacency matrix corresponding to the pearsons correlation coefficient between all pairwise combinations of timeseries.

![alt text](https://github.com/tcama/olfactoryRSN/blob/master/Extended_data_table.JPG)
