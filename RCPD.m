function Z = RCPD(X, Z, lambda, beta, alpha)
%
% A function for computing matrix Z which is used to construct 
% our similarity

% Written by zhilingcai@126.com
%
P=L2_distance_1(X,X);
P=P-diag(diag(P));
maxIters=50;
numOfSamples = size(X, 2);

X = [X; alpha*ones(1, numOfSamples)];
XZ=X*Z;
XX=X.*X;
XX=sum(XX);
for it=1:maxIters
    row=numOfSamples;   
    for j=1:row       
        z = Z(j,:);
        p = P(:,j);
        x = X(:,j);
        temp=XZ-x*z;
        X_1 = X-temp;
        v = (X_1'*x)/(XX(j)+beta); 
        tmp = abs(v)-lambda*p/2;
        Z(j,:) = sign(v).*tmp.*(tmp>0);
        Z(j,j)=0;
        XZ=temp+x*Z(j,:);  
    end
end
end


