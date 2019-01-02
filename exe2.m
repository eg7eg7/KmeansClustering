
    % Clean-up MATLAB's environment
     close all; clc;  

    
    % Define MFCC variables
    Tw = 20;                % analysis frame duration (ms)
    Ts = 10;                % analysis frame shift (ms)
    alpha = 0.97;           % preemphasis coefficient
    M = 20;                 % number of filterbank channels 
    C = 12;                 % number of cepstral coefficients
    L = 22;                 % cepstral sine lifter parameter
    LF = 100;               % lower frequency limit (Hz)
    HF = 3700;              % upper frequency limit (Hz)
    
    % Define KMeans variables
    K = 20;                  % Number of clusters
    Thrsh = 1;              % Min error (percentage)
    maxITER = 100;          % Maximum iterations
    
    wav_file1 = 'shee_mono.wav';  % input audio filename
    wav_file2 = 'shoo_mono.wav';
 
    % Read speech samples, sampling rate and precision from file
    [ speech_shee, fs_shee ] = audioread( wav_file1 );
    [ speech_shoo, fs_shoo ] = audioread( wav_file2 );
    
    % Feature extraction (feature vectors as columns)
    [ MFCCs_shee, FBE_shee, frames_shee ] = mfcc( speech_shee, fs_shee, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
    [ MFCCs_shoo, FBE_shoo, frames_shoo ] = mfcc( speech_shoo, fs_shoo, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
    
    % m is vector size, n is data size
    [m_shee,n_shee] = size(MFCCs_shee); 
    [m_shoo,n_shoo] = size(MFCCs_shoo);
   
    % Cluster data
    [Clusters,INDX, Err]=CalcKmeans(MFCCs_shee , K , Thrsh ,maxITER );
    [Clusters,INDX, Err]=CalcKmeans(MFCCs_shoo , K , Thrsh ,maxITER );
    
% EOF
