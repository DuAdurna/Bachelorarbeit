function [LaplaceMatrix] = AdjaZuLaplace(Adjazenzmatrix)
%ADJAZULAPLACE eine kurze funktion die aus einer Adjazentmatrix eine
%laplace matrix macht
GradMatrix=zeros(size(Adjazenzmatrix));
binAdja=zeros(size(Adjazenzmatrix));
binAdja(Adjazenzmatrix~=0)=1;
for i=1:size(Adjazenzmatrix,1)
    GradMatrix(i,i)=sum(binAdja(:,i));
end
LaplaceMatrix=GradMatrix - binAdja;
end

