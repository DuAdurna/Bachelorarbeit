%% Errechnen der Daten
clear;StrongConn;Netzwerk=StrCon;Meinungen=MeinungenSC; 
n=size(Meinungen,1);
Gd = digraph(Netzwerk);
Gd.Nodes.Meinungen=Meinungen;
[Gd,plotdataD]=MeinungVerbreitenD(Gd,50,0,0,1,[-0.5,0.5]);
%% Visualisieren der Daten
for i=1:n
   plot(plotdataD(1,:),plotdataD(i+3,:),'-', 'Linewidth', 1);
    hold on
end
plot(plotdataD(1,:),plotdataD(2,:),'--');
hold off