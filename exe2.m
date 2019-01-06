
    %% Clean-up MATLAB's environment
     close all; clc;  

    
    %% Define MFCC variables
    Tw = 25;                % analysis frame duration (ms)
    Ts = 10;                % analysis frame shift (ms)
    alpha = 0.97;           % preemphasis coefficient
    M = 20;                 % number of filterbank channels 
    C = 12;                 % number of cepstral coefficients
    L = 22;                 % cepstral sine lifter parameter
    LF = 100;               % lower frequency limit (Hz)
    HF = 3700;              % upper frequency limit (Hz)
    
    %% Define KMeans variables
    K = 3;                  % Number of clusters
    Thrsh = 1;             % Min error (percentage)
    maxITER = 20;            % Maximum iterations
    
    wav_file1 = 'shee_mono.wav';  % input audio filename
    wav_file2 = 'shoo_mono.wav';
    
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
    [Clusters_A,INDX_A, Err_A, debugVal_A]=CalcKmeans(A , K , Thrsh ,maxITER );
    [Clusters1,INDX1, Err1, debugVal1]=CalcKmeans(MFCCs_shee , K , Thrsh ,maxITER );
    [Clusters2,INDX2, Err2, debugVal2]=CalcKmeans(MFCCs_shoo , K , Thrsh ,maxITER );
    
    
    %wav_file3 = '04 Lelite_mono.wav';
    %[ speech_z, fs_z] = audioread( wav_file3 );
    %[ MFCCs_z, FBE_z, frames_z ] = mfcc( speech_z, fs_z, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
    %[Clusters3,INDX3, Err3, debugVal3]=CalcKmeans(MFCCs_z , K , Thrsh ,maxITER );
    
% EOF
