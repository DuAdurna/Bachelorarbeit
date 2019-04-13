function [Meinung_neu]=MeinungsRandomD(Meinung)
tMeinMat=2.*rand(size(Meinung))-1;
Meinung_neu=num2cell(tMeinMat);
end