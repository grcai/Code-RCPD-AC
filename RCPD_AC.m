function [accuracy nmi] = RCPD_AC(X, labels, par)
%
% A function for the algorithm RCPD-AC by combining our 
% similarity with existing agglomerative clustering GDL

% Written by zhilingcai@126.com
%
pos = 0;
[d,n] = size(X);


beta=par.lambda2;
alpha=par.alpha;

    lambda=par.lambda1;
    % Z = ones(n,n)/n;
    Z = (ones(n,n)-eye(n))/(n-1);
        
    Z = RCPD(X, Z,lambda, beta, alpha);   
    coef=Z;
    coef = coef - eye(size(coef)).*coef;
    coef = coef./( repmat(sqrt(sum(coef.*coef)), [size(coef, 1),1]) );
    coef=roundn(coef,-4);
    
    
    for j=1:length(par.adjKnn)
        CKSym = BuildAdjacency(coef,par.adjKnn(j));
        CKSym=real(CKSym);
        %CKSym=roundn(CKSym,-8);
        % CKSym=roundn(CKSym,-4);
        %CKSym = bsxfun(@times, 1./sum(CKSym,2), CKSym);
        
        y1=[1:size(CKSym)];
        initialClusters=makeInitialClusters(y1);
        Predict_label=gdlMerging_c(CKSym, initialClusters, length(unique(labels)));
        %Predict_label = SpectralClustering(CKSym,length(unique(labels)));
        
        for ii = 1:size(Predict_label,1)
            for jj = 1:size(Predict_label,2)
                if isnan(Predict_label(ii,jj))==1
                    tmp = unique(labels);
                    tmp2= tmp(randperm(length(tmp)));
                    Predict_label(ii,jj) = tmp2(1);
                end;
            end
        end;
        [t_accuracy t_nmi]= CalMetricOfCluster(Predict_label,labels);
        t_accuracy = t_accuracy./100;
        accuracy(j) = t_accuracy;
        nmi(j) = t_nmi;
        pos = pos + 1;
        fprintf([' | the ' num2str(pos) 'th result '  ' | adjKnn = ' num2str(par.adjKnn(j)) '\n']);
        fprintf([' + The accuracy                      score is: ' num2str(t_accuracy) '\n']);
        fprintf([' + The normalized mutual information score is: ' num2str(t_nmi) '\n']);
        
        
    end
    

end