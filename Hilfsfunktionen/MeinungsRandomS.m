function [Meinung_neu]=MeinungsRandomS(Meinung)
tMeinMat=rand(size(Meinung));
tMeinMat(tMeinMat<0.5)=-1;
tMeinMat(tMeinMat>=0.5)=1;
Meinung_neu=num2cell(tMeinMat);
