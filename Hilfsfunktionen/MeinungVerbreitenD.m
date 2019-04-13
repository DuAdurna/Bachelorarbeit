function [Meinungen_Neu,plotdata] = MeinungVerbreitenD(Netzwerk,Dauer,mutationsKoef,Selbsterhalt,Schrittdauer)
% MEINUNGVERBREITEN Iteriert die Simulation der Meinungsverbreitung einen Schritt weiter
%   Input:  Netzwerk: Graph mit erweiterung Meinungen;
%           Selbsterhalt: Zahl zwischen 0 und 1 die den erhalt der
%           eigenen Meinung beschreibt, die Zahl 0.5 bedeutet dass beide
%           Meinungen gleich gewichtet werden
%           Dauer: die Iterationsanzahl der Schritte
%           mutationsKoeff: chance des Netzwerkes seine kanten zu �ndern

n=size(Netzwerk.Nodes,1);
NTemp=Netzwerk;
%normieren der Kantengewichte, sodass sie maximal 1 betragen
NTemp.Edges.Weight(:)=NTemp.Edges.Weight(:)/max(NTemp.Edges.Weight(:));
%plotdatas initialisieren
plotdata=zeros(n,1);
for j=1:n
    plotdata(2,1)=plotdata(2,1)+(NTemp.Nodes.Meinungen{j})./n;
    plotdata(j+2,1)=NTemp.Nodes.Meinungen{j};
end
for i=1:floor(Dauer/Schrittdauer)
    %simulationsschritt gehen
    NTemp=MeinungsSchritt(NTemp,Selbsterhalt,Schrittdauer);
    %plotdata erstellen
    plotdata(:,i+1)=zeros(n+2,1);
    for p=1:n
        plotdata(2,i+1)=plotdata(2,i+1)+(NTemp.Nodes.Meinungen{p})./n;
        plotdata(p+2,i+1)=NTemp.Nodes.Meinungen{p};
    end
    plotdata(1,i+1)=i*Schrittdauer;
    %evtl Netzwerk mutieren
    if mutationsKoef~=0
        p=rand;
        if p<mutationsKoef*Schrittdauer/2
            NTemp=varGraph(NTemp,'a');
        elseif p>(1-mutationsKoef*Schrittdauer/2)
            NTemp=varGraph(NTemp,'r');
        end
    end 
end
Meinungen_Neu=NTemp;
end

