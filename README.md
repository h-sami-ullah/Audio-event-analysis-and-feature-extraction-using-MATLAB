# Audio processing in MATLAB
SVM based gunshot detection and classification using hand designed features. 


This repo contains SVM based audio event detection and classification. It has dataset including positives and negative examples. The main is to detect the gunshot in an audio  signal and classify them into two type of gun i.e., sniper and rifle. 

# How to use the codes?
To run the code please compile the **"classify.m"** file which loads the precomputed feature matrix from the given files and produce the result. If you want to extract the feature from scratch, that is also possible. Below are the features used for training, one can also add other features that represent more enriched information in each signal. 

# Features Extraction

This project extracts feature matrix to train support vector machine. The feature used to represent the audio bag are given below:

(1) **Spectral Roll-Off**

(2) **energy**

(3) **Zero Crossing Rate**

(4) **Spectral Roll-Off**

(5) **Spectral Centroid**

(6) **Spectral Spread**

(7) **Volume**

(8) **Spectral Flux**


Other than the presented features it is easy to add **"IMFCC"** coefficients to improve the results.  The see how the feature extraction works please go through **"all_parameters.m"** file.


