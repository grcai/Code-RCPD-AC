% =========================================================================
% An example code for the algorithm RCPD-AC
%
%
% Written by zhilingcai@126.com
% 


% =========================================================================

clc;  close all; clear;
currentFolder = pwd;
addpath(genpath(currentFolder));
% --------------------------------------------------------------------------


fprintf('Beginning!\n');


% % % ==================================  

load('wine_uni.mat')

X = Data_Normalized_h1(X);
dat=X';
labels=Y;

% -----parameters configuration
par.nClass             =   3;

par.lambda1             =   [0.01];
par.lambda2             =   [10];
par.adjKnn             =   [10];
par.alpha=1;

% % ================================== 
% % 
% load('iris.mat')
% 
% X = Data_Normalized_h2(X);
% dat=X';
% labels=Y;
% 
% % -----parameters configuration
% par.nClass             =   3;
% par.lambda1             =   [0.1];
% par.lambda2             =   [1];
% par.adjKnn             =   [10];
% par.alpha=0.1;

% % ================================== 
% load('TOX_171.mat')
% 
% X = Data_Normalized_h1(X);
% dat=X';
% labels=Y;
% 
% %-----parameters configuration
% par.nClass             =   4;
% par.lambda1             =   [0.01];
% par.lambda2             =   [1];
% par.adjKnn             =   [3];
% par.alpha=1;
% par.nDim               =   50;% feature dimensionality of PCA
% dat = FeatureEx(dat, par);

% % ================================== 
% load('lung.mat')
% 
% X = Data_Normalized_h1(X);
% dat=X';
% labels=Y;
% 
% % -----parameters configuration
% par.nClass             =   5;
% par.lambda1             =   [1];
% par.lambda2             =   [10];
% par.adjKnn             =   [15];
% par.alpha=1;
% par.nDim               =   20;% feature dimensionality of PCA
% dat = FeatureEx(dat, par);
% 
%  ================================== 
% load('jaffe_32.mat')
% X = double(reshape(X,size(X,2)*size(X,1),size(X,3)));
% X = Data_Normalized_h1(X');
% dat=X';
% labels=Y;
% 
% % -----parameters configuration
% par.nClass             =   10;
% par.lambda1             =   [0.1];
% par.lambda2             =   [0.1];
% par.adjKnn             =   [5];
% par.alpha=1;
% 
% par.nDim               =   50;% feature dimensionality of PCA
% dat = FeatureEx(dat, par);
% % ==================================  

% load('ORL.mat')
% X = double(reshape(X,size(X,2)*size(X,1),size(X,3)));
% X = Data_Normalized_h1(X');
% dat=X';
% labels=Y;
% 
% % -----parameters configuration
% par.nClass             =   40;
% par.lambda1             =   [0.1];
% par.lambda2             =   [1];
% par.adjKnn             =   [8];
% par.alpha=1;
% 
% par.nDim               =   50;% feature dimensionality of PCA
% dat = FeatureEx(dat, par);

%==============================================
% load('Umist.mat')
% 
% X = Data_Normalized_h1(X);
% dat=X';
% labels=Y;
% 
% % -----parameters configuration
% par.nClass             =   20;
% par.lambda1             =   [0.1];
% par.lambda2             =   [0.1];
% par.adjKnn             =   [5];
% par.alpha=0.1;
% 
% par.nDim               =   50;% feature dimensionality of PCA
% dat = FeatureEx(dat, par);
%===============================================
% load('PalmData25_uni.mat')
% X = Data_Normalized_h1(X);
% dat=X';
% labels=Y;
% 
% % -----parameters configuration
% par.nClass             =   100;% the first nClass subjects are used to test
% par.lambda1             =   [0.01];
% par.lambda2             =   [1];
% par.adjKnn             =   [15];
% par.alpha=1;
% 
% par.nDim               =   50;% feature dimensionality of PCA
% dat = FeatureEx(dat, par);
% % ================================== 

% load('uspst_uni.mat')
% X = Data_Normalized_h1(X);
% dat=X';
% labels=Y+1;
% 
% % -----parameters configuration
% par.nClass             =   10;
% par.lambda1             =   [0.1];
% par.lambda2             =   [1];
% par.adjKnn             =   [10];
% par.alpha=1;
% 
% par.nDim               =   50;% feature dimensionality of PCA
% dat = FeatureEx(dat, par);

%====================================

% load('coil20.mat')
% X = double(reshape(X,size(X,2)*size(X,1),size(X,3)));
% X = Data_Normalized_h1(X');
% dat=X';
% labels=Y;
% 
% % -----parameters configuration
% par.nClass             =   20;
% par.lambda1             =   [1];
% par.lambda2             =   [1];
% par.adjKnn             =   [3];
% par.alpha=1;
% 
% par.nDim               =   70;% feature dimensionality of PCA
% dat = FeatureEx(dat, par);
% % ================================== 



% load('COIL100_32.mat')
% X=double(fea);
% X = Data_Normalized_h1(X);
% dat=X';
% labels=gnd;
% 
% % -----parameters configuration
% par.nClass             =   100;
% par.lambda1             =   [1];
% par.lambda2             =   [0.1];
% par.adjKnn             =   [3];
% par.alpha=1;
% 
% par.nDim               =   70;% feature dimensionality of PCA
% dat = FeatureEx(dat, par);

% % ==================================  

%% --------------------


clear DATA;

[accuracy nmi] = RCPD_AC(dat, labels, par);




