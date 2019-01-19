
%% Clean-up MATLAB's environment
close all; clc;


%% Define MFCC variables
Tw = 20;                % analysis frame duration (ms)
Ts = 10;                % analysis frame shift (ms)
alpha = 0.97;           % preemphasis coefficient
M = 20;                 % number of filterbank channels
C = 12;                 % number of cepstral coefficients
L = 22;                 % cepstral sine lifter parameter
LF = 100;               % lower frequency limit (Hz)
HF = 3700;              % upper frequency limit (Hz)

%% Define KMeans variables
K = 4;                  % Number of clusters
Thrsh = 0.05;             % Min error (percentage)
maxITER = 20;            % Maximum iterations

wav_file1 = 'shee_mono_test.wav';  % input audio filename
wav_file2 = 'shoo_mono_test.wav';

%% Question #2
% A1 = (2,10) ; A2 = (2,5) ; A3 = (8,4) ; A4 = (5,8) ; A5 = (7,5) ;
% A6 = (6,4) ; A7 = (1,2) ; A8 = (4,9)
A = [2 10; 2 5 ; 8 4; 5 8; 7 5; 6 4; 1 2; 4 9]; % Matrix of A values for test
A=A.';

%% Read speech samples, sampling rate and precision from file
[ speech_shee, fs_shee ] = audioread( wav_file1 );
[ speech_shoo, fs_shoo ] = audioread( wav_file2 );


%% Feature extraction (feature vectors as columns)
[ MFCCs_shee, FBE_shee, frames_shee ] = mfcc( speech_shee, fs_shee, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
[ MFCCs_shoo, FBE_shoo, frames_shoo ] = mfcc( speech_shoo, fs_shoo, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );

%% Cluster data
disp("Running Kmeans on example matrix A ");
[Clusters_A,INDX_A, Err_A]=CalcKmeansForA(A , Thrsh ,3 );

MFCC_shee_MFCC_shoo = [MFCCs_shee MFCCs_shoo]; %unify data MFCC_shee and MFCCs_shoo matrices for clustering
disp(" ");
disp("Running Kmeans on shee and shoo ");
[Clusters1,INDX1, Err1]=CalcKmeans(MFCC_shee_MFCC_shoo , K , Thrsh ,maxITER );

% EOF
