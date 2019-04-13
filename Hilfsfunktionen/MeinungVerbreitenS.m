function [Netzwerk_Neu,plotdata] = MeinungVerbreitenS(Netzwerk,Dauer,mutationsKoef)
%MEINUNGVERBREITENS Simuliert die Meinungsverteilung in einem gegebenen Netzwerk mit hilfe des stochastischen Modells
%   Die simulation generiert wartezeiten die auf gurnd von
%   gedächtnislosigkeit jedes mal neu generiert werden dürfen. Da die
%   wartezeiten eines Poisson prozesses expo verteilt sind generieren wir
%   die wartezeiten so.
n=size(Netzwerk.Nodes,1);
zahldauer=0;
NTemp=Netzwerk;
nJumps=0;
%Netzwerk normieren sodass die Kanten Gewichte zwischen 0 und 1 haben
NTemp.Edges.Weight(:)=NTemp.Edges.Weight(:)/max(NTemp.Edges.Weight(:));
plotdata=zeros(n+3,1);
for i=1:n
    plotdata(2,1)=plotdata(2,1)+ NTemp.Nodes.Meinungen{i}/n;
end
while zahldauer <Dauer
    %lässt veränderung des Graphen zu während der Meinungsverbreitung da
    %dies nach jeder Meinungsveränderung gerufen wird hängt dies auch
    %indirekt von n und der Volatilität des Netzwerks zusammen
    if mutationsKoef~=0
        p=rand;
        if p<mutationsKoef*1/2
            NTemp=varGraph(NTemp,'a');
        elseif p>(1-mutationsKoef/2)
            NTemp=varGraph(NTemp,'r');
        end
    end
    %lambda der Poisson-Prozesse/Exponentialverteilungen errechnen
    Lambda=NaN(n, n);
    for j=1:n
        %für jede kante den einfluss berechnen und welche meinung welchen anteil hat
        [einflussKanten,~]=inedges(NTemp,j);
        for i=1:size(einflussKanten,1)
            einflussKnoten=NTemp.Edges{einflussKanten(i),1}(1,1);
            Lambda(einflussKnoten(1,1),j)=NTemp.Edges{einflussKanten(i),2}(1)*(NTemp.Nodes.Meinungen{einflussKnoten}-NTemp.Nodes.Meinungen{j});
        end
    end
    %wartezeiten durch exponentialverteilung generieren
    Wartezeiten = -1./abs(Lambda) .* log(1-rand(n,n));
    %kleinste Wartezeit finden
    [schritt,clm]=min(min(Wartezeiten));
    [~,row]=min(Wartezeiten(:,clm));
    %änderungen verarbeiten
    NTemp.Nodes.Meinungen{clm}=NTemp.Nodes.Meinungen{row};
    %zahldauer voranschreiten
    if zahldauer+schritt<Dauer
        %Änderungen nur annehmen falls noch zeit vorhanden ist um die änderungen durch zu führen danach Plotdata und Varianz erstellen
        zahldauer=zahldauer+schritt;
        Netzwerk_final = NTemp;
        nJumps=nJumps+1;
        plotdata(:,nJumps+1)=zeros(n+3,1);
        for p=1:n
            plotdata(2,nJumps+1)=plotdata(2,nJumps+1)+Netzwerk_final.Nodes.Meinungen{p}/n;
            plotdata(p+3,nJumps+1)=Netzwerk_final.Nodes.Meinungen{p};
            for j=1:n %varianz errechnen
                plotdata(3,nJumps+1)=plotdata(3,nJumps+1)+1/(2*n^2)*abs(Netzwerk_final.Nodes.Meinungen{p}-Netzwerk_final.Nodes.Meinungen{j})^2;
            end
        end
        if plotdata(3,nJumps+1)==0
            Dauer=-inf;
        end
        plotdata(1,nJumps+1)=zahldauer;
    else
        %Simulation beenden
        Dauer=-inf;
    end
end
Netzwerk_Neu=Netzwerk_final;
end

