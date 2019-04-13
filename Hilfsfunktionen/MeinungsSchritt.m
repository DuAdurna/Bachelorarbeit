function [Meinungen_Neu] = MeinungsSchritt(Netzwerk,Selbsterhalt,schrittDauer)
% MEINUNGVERBREITEN Iteriert die Simulation der Meinungsverbreitung einen Schritt weiter
%   Input:  Netzwerk = Graph mit erweiterung Meinungen;
%           Selbsterhaltung = Zahl zwischen 0 und 1 die den erhalt der
%           eigenen Meinung beschreibt, die Zahl 1 bedeutet dass die
%           eigene Meinung nicht verändert wird
%           schrittDauer = anteil einer zeiteinheit der simuliert werden
%           soll

n=size(Netzwerk.Nodes,1);
alpha=Selbsterhalt;
beta=(1-alpha)*schrittDauer;
MTemp=Netzwerk;
for i=1:n %für jede Kante wird der fremdeinfluss errechnet woraufhin eine meinungsänderung stattfindet
    eigenMeinung=Netzwerk.Nodes.Meinungen{i};
    [einflussKanten,~]=inedges(Netzwerk,i);
    edges=Netzwerk.Edges;
    gewichtNorm=0;
    aussenEinfluss=0;
    for j=1:size(einflussKanten,1)
        gewichtNorm=gewichtNorm+edges{einflussKanten(j),2};
    end 
    for j=1:size(einflussKanten,1)
        aussenEinfluss=aussenEinfluss+edges{einflussKanten(j),2}/gewichtNorm*(Netzwerk.Nodes.Meinungen{edges{einflussKanten(j),1}(1)}-eigenMeinung);
    end
    %hier wird der Einfluss normiert und an Selbsterhalt & simulationsdauer
    %angepasst
    normAussenEinfluss=beta*aussenEinfluss;
    if isnan(normAussenEinfluss)
        normAussenEinfluss=0;
    end
    MTemp.Nodes.Meinungen{i}=eigenMeinung + normAussenEinfluss;

end
Meinungen_Neu=MTemp;
end

