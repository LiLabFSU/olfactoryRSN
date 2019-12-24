#!/bin/bash
# This script is used to execute all necessary command for preprocessing and processing of a subject from HCP.
# The script should be run as follows:
#
# ./HCP_automated ###### tca11b
#
# The script functions by creating another script, echoing commands with the subject number into that script,
# executing the script, and then deleting the script. At this time large portions of data are left in the
# HCP_data folder for each subject. This should be removed for future use.

# Make directories for data
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/

# make directory for holding results
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"

# Download data via AWS
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/
#/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_RL/RibbonVolumeToSurfaceMapping/goodvoxels.nii.gz goodvoxels.nii.gz
#/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_RL/rfMRI_REST1_RL_hp2000_clean.nii.gz rfMRI_REST1_RL_hp2000_clean.nii.gz
#/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_RL/brainmask_fs.2.nii.gz brainmask_fs.2.nii.gz
#/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_RL/Movement_Regressors.txt Movement_Regressors.txt
#/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_1200/"$1"/MNINonLinear/ROIs/CSFReg.2.nii.gz CSFReg.2.nii.gz
#/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_1200/"$1"/MNINonLinear/ROIs/WMReg.2.nii.gz WMReg.2.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess-temp/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_RL/RibbonVolumeToSurfaceMapping/goodvoxels.nii.gz goodvoxels.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess-temp/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_RL/rfMRI_REST1_RL_hp2000_clean.nii.gz rfMRI_REST1_RL_hp2000_clean.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess-temp/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_RL/brainmask_fs.2.nii.gz brainmask_fs.2.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess-temp/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_RL/Movement_Regressors.txt Movement_Regressors.txt
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess-temp/HCP_1200/"$1"/MNINonLinear/ROIs/CSFReg.2.nii.gz CSFReg.2.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess-temp/HCP_1200/"$1"/MNINonLinear/ROIs/WMReg.2.nii.gz WMReg.2.nii.gz

# Move files into architecture consistent with DPARSFA
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/FunImgARW/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/FunImgARW/Subject001/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/SegmentationMasks/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/RealignParameter/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/RealignParameter/Subject001/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/rfMRI_REST1_RL_hp2000_clean.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/FunImgARW/Subject001/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/brainmask_fs.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/CSFReg.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/SegmentationMasks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/WMReg.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/SegmentationMasks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/Movement_Regressors.txt /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/RealignParameter/Subject001/

# gunzip DPARSFA files
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/FunImgARW/Subject001/rfMRI_REST1_RL_hp2000_clean.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/brainmask_fs.2.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/SegmentationMasks/CSFReg.2.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/SegmentationMasks/WMReg.2.nii.gz
# rename files as necessary
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/SegmentationMasks/CSFReg.2.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/SegmentationMasks/MNIFunSpace_ThrdMask_Subject001_CSF.nii
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/SegmentationMasks/WMReg.2.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/Masks/SegmentationMasks/MNIFunSpace_ThrdMask_Subject001_WM.nii
# call matlab command and move output to final destination
matlab -wait -nosplash -nojvm -nodisplay -r "cd('C:\Users\tca11b\Desktop\HCP\HCP_functions'); try; DPARSFA_processing_05202018('C:\Users\\"$2"\Desktop\HCP\HCP_data\\"$1"\rfMRI_REST1_RL\DPARSFA'); catch; quit; end; quit"
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/DPARSFA/FunImgARWFC/Subject001/CovRegressed_4DVolume.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/

# gunzip in HCP_process architecture (1_RL)
# gunzip rfMRI_REST1_RL_hp2000_clean.nii.gz (No longer needed, use CovRegressed_4DVolume.nii)
gunzip goodvoxels.nii.gz
# gunzip brainmask_fs.2.nii.gz
# gunzip CSFReg.2.nii.gz
# gunzip WMReg.2.nii.gz

# copy needed functions to data directory and begin processing (1_RL)
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_functions/* /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_RL/
./roi_preprocess_05202018 CovRegressed_4DVolume.nii AAL627_10202016.nii goodvoxels.nii basal_ganglion_06302016.nii
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/goodvoxels_new.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/goodvoxels_new1_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/mean_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/mean_data1_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/snr_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/snr_data1_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/roi_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/roi_data1_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/mc.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/meancenter1_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/voxels_summary.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/voxels_summary1_RL.csv
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/csv_read
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/csv_read.c
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/nifti1.h
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/roi_preprocess_05202018
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/roi_preprocess_05202018.cpp
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/AAL627_10202016.nii
#rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/rfMRI_REST1_RL_hp2000_clean.nii
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_RL/goodvoxels.nii

##
## 2_RL
##

# Download data via AWS
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST2_RL/RibbonVolumeToSurfaceMapping/goodvoxels.nii.gz goodvoxels.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST2_RL/rfMRI_REST2_RL_hp2000_clean.nii.gz rfMRI_REST2_RL_hp2000_clean.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST2_RL/brainmask_fs.2.nii.gz brainmask_fs.2.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST2_RL/Movement_Regressors.txt Movement_Regressors.txt
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_1200/"$1"/MNINonLinear/ROIs/CSFReg.2.nii.gz CSFReg.2.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_1200/"$1"/MNINonLinear/ROIs/WMReg.2.nii.gz WMReg.2.nii.gz

# Move files into architecture consistent with DPARSFA
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/FunImgARW/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/FunImgARW/Subject001/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/SegmentationMasks/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/RealignParameter/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/RealignParameter/Subject001/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/rfMRI_REST2_RL_hp2000_clean.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/FunImgARW/Subject001/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/brainmask_fs.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/CSFReg.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/SegmentationMasks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/WMReg.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/SegmentationMasks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/Movement_Regressors.txt /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/RealignParameter/Subject001/

# gunzip DPARSFA files
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/FunImgARW/Subject001/rfMRI_REST2_RL_hp2000_clean.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/brainmask_fs.2.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/SegmentationMasks/CSFReg.2.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/SegmentationMasks/WMReg.2.nii.gz
# rename files as necessary
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/SegmentationMasks/CSFReg.2.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/SegmentationMasks/MNIFunSpace_ThrdMask_Subject001_CSF.nii
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/SegmentationMasks/WMReg.2.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/Masks/SegmentationMasks/MNIFunSpace_ThrdMask_Subject001_WM.nii
# call matlab command and move output to final destination
matlab -wait -nosplash -nojvm -nodisplay -r "cd('C:\Users\tca11b\Desktop\HCP\HCP_functions'); try; DPARSFA_processing_05202018('C:\Users\\"$2"\Desktop\HCP\HCP_data\\"$1"\rfMRI_REST2_RL\DPARSFA'); catch; quit; end; quit"
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/DPARSFA/FunImgARWFC/Subject001/CovRegressed_4DVolume.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/

# gunzip in HCP_process architecture (2_RL)
# gunzip rfMRI_REST2_RL_hp2000_clean.nii.gz (No longer needed, use CovRegressed_4DVolume.nii)
gunzip goodvoxels.nii.gz
# gunzip brainmask_fs.2.nii.gz
# gunzip CSFReg.2.nii.gz
# gunzip WMReg.2.nii.gz

# copy needed functions to data directory and begin processing (2_RL)
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_functions/* /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_RL/
./roi_preprocess_05202018 CovRegressed_4DVolume.nii AAL627_10202016.nii goodvoxels.nii basal_ganglion_06302016.nii
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/goodvoxels_new.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/goodvoxels_new2_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/mean_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/mean_data2_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/snr_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/snr_data2_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/roi_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/roi_data2_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/mc.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/meancenter2_RL.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/voxels_summary.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/voxels_summary2_RL.csv
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/csv_read
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/csv_read.c
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/nifti1.h
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/roi_preprocess_05202018
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/roi_preprocess_05202018.cpp
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/AAL627_10202016.nii
#rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/rfMRI_REST2_RL_hp2000_clean.nii
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_RL/goodvoxels.nii

# change to resutls and concatenate processed results
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/
cat meancenter2_RL.csv meancenter2_RL.csv > meancenter_RL.csv

#
# :1_LR
#

# Download data via AWS
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_LR/RibbonVolumeToSurfaceMapping/goodvoxels.nii.gz goodvoxels.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_LR/rfMRI_REST1_LR_hp2000_clean.nii.gz rfMRI_REST1_LR_hp2000_clean.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_LR/brainmask_fs.2.nii.gz brainmask_fs.2.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST1_LR/Movement_Regressors.txt Movement_Regressors.txt
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_1200/"$1"/MNINonLinear/ROIs/CSFReg.2.nii.gz CSFReg.2.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_1200/"$1"/MNINonLinear/ROIs/WMReg.2.nii.gz WMReg.2.nii.gz

# Move files into architecture consistent with DPARSFA
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/FunImgARW/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/FunImgARW/Subject001/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/SegmentationMasks/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/RealignParameter/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/RealignParameter/Subject001/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/rfMRI_REST1_LR_hp2000_clean.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/FunImgARW/Subject001/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/brainmask_fs.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/CSFReg.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/SegmentationMasks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/WMReg.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/SegmentationMasks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/Movement_Regressors.txt /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/RealignParameter/Subject001/

# gunzip DPARSFA files
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/FunImgARW/Subject001/rfMRI_REST1_LR_hp2000_clean.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/brainmask_fs.2.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/SegmentationMasks/CSFReg.2.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/SegmentationMasks/WMReg.2.nii.gz
# rename files as necessary
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/SegmentationMasks/CSFReg.2.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/SegmentationMasks/MNIFunSpace_ThrdMask_Subject001_CSF.nii
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/SegmentationMasks/WMReg.2.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/Masks/SegmentationMasks/MNIFunSpace_ThrdMask_Subject001_WM.nii
# call matlab command and move output to final destination
matlab -wait -nosplash -nojvm -nodisplay -r "cd('C:\Users\tca11b\Desktop\HCP\HCP_functions'); try; DPARSFA_processing_05202018('C:\Users\\"$2"\Desktop\HCP\HCP_data\\"$1"\rfMRI_REST1_LR\DPARSFA'); catch; quit; end; quit"
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/DPARSFA/FunImgARWFC/Subject001/CovRegressed_4DVolume.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/

# gunzip in HCP_process architecture (1_LR)
# gunzip rfMRI_REST1_LR_hp2000_clean.nii.gz (No longer needed, use CovRegressed_4DVolume.nii)
gunzip goodvoxels.nii.gz
# gunzip brainmask_fs.2.nii.gz
# gunzip CSFReg.2.nii.gz
# gunzip WMReg.2.nii.gz

# copy needed functions to data directory and begin processing (1_LR)
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_functions/* /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST1_LR/
./roi_preprocess_05202018 CovRegressed_4DVolume.nii AAL627_10202016.nii goodvoxels.nii basal_ganglion_06302016.nii
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/goodvoxels_new.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/goodvoxels_new1_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/mean_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/mean_data1_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/snr_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/snr_data1_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/roi_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/roi_data1_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/mc.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/meancenter1_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/voxels_summary.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/voxels_summary1_LR.csv
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/csv_read
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/csv_read.c
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/nifti1.h
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/roi_preprocess_05202018
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/roi_preprocess_05202018.cpp
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/AAL627_10202016.nii
#rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/rfMRI_REST1_LR_hp2000_clean.nii
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST1_LR/goodvoxels.nii

#
# 2_LR
#

# Download data via AWS
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST2_LR/RibbonVolumeToSurfaceMapping/goodvoxels.nii.gz goodvoxels.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST2_LR/rfMRI_REST2_LR_hp2000_clean.nii.gz rfMRI_REST2_LR_hp2000_clean.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST2_LR/brainmask_fs.2.nii.gz brainmask_fs.2.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_900/"$1"/MNINonLinear/Results/rfMRI_REST2_LR/Movement_Regressors.txt Movement_Regressors.txt
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_1200/"$1"/MNINonLinear/ROIs/CSFReg.2.nii.gz CSFReg.2.nii.gz
/cygdrive/c/Program\ Files/Amazon/AWSCLI/aws s3 cp s3://hcp-openaccess/HCP_1200/"$1"/MNINonLinear/ROIs/WMReg.2.nii.gz WMReg.2.nii.gz

# Move files into architecture consistent with DPARSFA
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/FunImgARW/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/FunImgARW/Subject001/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/SegmentationMasks/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/RealignParameter/
mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/RealignParameter/Subject001/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/rfMRI_REST2_LR_hp2000_clean.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/FunImgARW/Subject001/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/brainmask_fs.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/CSFReg.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/SegmentationMasks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/WMReg.2.nii.gz /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/SegmentationMasks/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/Movement_Regressors.txt /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/RealignParameter/Subject001/

# gunzip DPARSFA files
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/FunImgARW/Subject001/rfMRI_REST2_LR_hp2000_clean.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/brainmask_fs.2.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/SegmentationMasks/CSFReg.2.nii.gz
gunzip /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/SegmentationMasks/WMReg.2.nii.gz
# rename files as necessary
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/SegmentationMasks/CSFReg.2.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/SegmentationMasks/MNIFunSpace_ThrdMask_Subject001_CSF.nii
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/SegmentationMasks/WMReg.2.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/Masks/SegmentationMasks/MNIFunSpace_ThrdMask_Subject001_WM.nii
# call matlab command and move output to final destination
matlab -wait -nosplash -nojvm -nodisplay -r "cd('C:\Users\tca11b\Desktop\HCP\HCP_functions'); try; DPARSFA_processing_05202018('C:\Users\\"$2"\Desktop\HCP\HCP_data\\"$1"\rfMRI_REST2_LR\DPARSFA'); catch; quit; end; quit"
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/DPARSFA/FunImgARWFC/Subject001/CovRegressed_4DVolume.nii /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/

# gunzip in HCP_process architecture (2_LR)
# gunzip rfMRI_REST2_LR_hp2000_clean.nii.gz (No longer needed, use CovRegressed_4DVolume.nii)
gunzip goodvoxels.nii.gz
# gunzip brainmask_fs.2.nii.gz
# gunzip CSFReg.2.nii.gz
# gunzip WMReg.2.nii.gz

# copy needed functions to data directory and begin processing (2_LR)
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/
cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_functions/* /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/rfMRI_REST2_LR/
./roi_preprocess_05202018 CovRegressed_4DVolume.nii AAL627_10202016.nii goodvoxels.nii basal_ganglion_06302016.nii
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/goodvoxels_new.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/goodvoxels_new2_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/mean_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/mean_data2_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/snr_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/snr_data2_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/roi_data.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/roi_data2_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/mc.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/meancenter2_LR.csv
mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/voxels_summary.csv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/voxels_summary2_LR.csv
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/csv_read
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/csv_read.c
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/nifti1.h
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/roi_preprocess_05202018
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/roi_preprocess_05202018.cpp
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/AAL627_10202016.nii
#rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/rfMRI_REST2_LR_hp2000_clean.nii
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/$1/rfMRI_REST2_LR/goodvoxels.nii

# concatenate meancentered data
cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/
cat meancenter1_LR.csv meancenter2_LR.csv > meancenter_LR.csv

# remove unnecessary files
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/voxel*
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/mean_*
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/mean_*
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/meancenter1*
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/meancenter2*
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/snr*
rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/goodvoxels*
rm -r /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"/*

#
# Generate FC matrices
#
matlab -wait -nosplash -nojvm -nodisplay -r "cd('C:\Users\tca11b\Desktop\HCP\HCP_functions'); try; fcMat = fcMat_generation_05202018('C:\Users\\"$2"\Desktop\HCP\HCP_results\\"$1"\meancenter_RL.csv'); csvwrite('C:\Users\\"$2"\Desktop\HCP\HCP_results\\"$1"\fcMat_RL.csv',fcMat); fcMat = fcMat_generation_05202018('C:\Users\\"$2"\Desktop\HCP\HCP_results\\"$1"\meancenter_LR.csv'); csvwrite('C:\Users\\"$2"\Desktop\HCP\HCP_results\\"$1"\fcMat_LR.csv',fcMat); fcMat = fcMat_generation_05202018('C:\Users\\"$2"\Desktop\HCP\HCP_results\\"$1"\meancenter_LR.csv'); csvwrite('C:\Users\\"$2"\Desktop\HCP\HCP_results\\"$1"\fcMat_LR.csv',fcMat); catch; quit; end; quit"

#  CALCULATES FC matrices
# # calculate correlation matrices
# cp /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_functions/* /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/
# ./csv_read meancenter_RL.csv
# mv fcMap.csv fcMap_RL.csv
# ./csv_read meancenter_LR.csv
# mv fcMap.csv fcMap_LR.csv
# 
# # remove functions
# rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/csv_read
# rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/csv_read.c
# rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/nifti1.h
# rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/roi_preprocess_05202018
# rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/roi_preprocess_05202018.cpp
# rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/AAL627_10202016.nii
# 
# # remove extraneous data files
# rm goodvoxels* meancenter*
# 
# # compress data files
# mkdir /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/compressed_data/
# mv roi_data* /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/compressed_data/
# rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/snr_data*
# rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/mean_data*
# rm /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/basal_ganglion_06302016.nii
# #echo zip compressed_data.zip compressed_data/
# #echo rm -R /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_results/"$1"/compressed_data
# 
# # move data files to HCP_raw_data and delete zipped downloads
# #echo mv /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1" /cygdrive/c/HCP_raw_data/
# cd /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/
# rm -R /cygdrive/c/Users/"$2"/Desktop/HCP/HCP_data/"$1"
# 