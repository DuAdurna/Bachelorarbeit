function [Meinung_neu]=MeinungsRandom(Meinung)
tMeinMat=randi(20,size(Meinung))./20 -1;
Meinung_neu=num2cell(tMeinMat);
end