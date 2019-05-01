% Dies ist die Main Funkton,von hier aus können alle funktionen benutzt werden  
%% Beispiel wie Figur 1A auswählen
clear;Bild1;Netzwerk=Figur1A;Meinungen=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 1B auswählen
clear;Bild1;Netzwerk=Figur1B;Meinungen=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 1C auswählen
clear;Bild1;Netzwerk=Figur1C;Meinungen=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 1D auswählen
clear;Bild1;Netzwerk=Figur1D;Meinungen=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 5 auswählen
clear;Bild5;Netzwerk=Figur5;Meinungen=MeinungenF5;      %#ok<NASGU>
%% Beispiel wie Figur 6.1 auswählen
clear;Bild6;Netzwerk=Figur61;Meinungen=MeinungenF61;    %#ok<NASGU>
%% Beispiel wie Figur 6.2 auswählen
clear;Bild6;Netzwerk=Figur62;Meinungen=MeinungenF62;    %#ok<NASGU>
%% Beispiel wie Figur 9 auswählen
clear;Bild9;Netzwerk=Figur9;Meinungen=MeinungenF9;       %#ok<NASGU>
%% Beispiel mit nur einem isolierten Block
clear;BspIsoBlock;Netzwerk=IsoBlock;Meinungen=MeinungenIB;    %#ok<NASGU>
%% Beispiel mit stark zusammenhängendem Graphen
clear;StrongConn;Netzwerk=StrCon;Meinungen=MeinungenSC;   
%% Meinungen Randomisieren 
Meinungen=MeinungsRandom(Meinungen);
%% Test zu AdjaZuLaplace Funktion
L=AdjaZuLaplace(Netzwerk);
[EigVekt,~]=eig(L);
EigVal=eig(L);
lamda2=sort(EigVal(:));
lamda2=lamda2(2);
%% Testet deterministisches Modell 
Gd = digraph(Netzwerk);
Gd.Nodes.Meinungen=Meinungen;
[Gd,plotdataD]=MeinungVerbreitenD(Gd,10,0,0,0.25,[-0.75,0.75]);
%% Testet stochastisches Modell 
Gs = digraph(Netzwerk);
Gs.Nodes.Meinungen=Meinungen;
[Gs,plotdataS]=MeinungVerbreitenS(Gs,5,0);
%% Zeichnen und Einfärben des Graphen
Zeichnung(Netzwerk, Meinungen, Gd, plotdataD, Gs, plotdataS);
%% 10-facher Durschschnitt für Figur 9
Bild9;Netzwerk=Figur9;
load('./Data/MeinungenStart.mat');
Gs = digraph(Netzwerk);
Gs.Nodes.Meinungen=MeinungenCopy;
%Kanten der isolierten Blöcke zum absorbierenden hin
%Rot
Gs.Edges.Weight(7) = 1;
Gs.Edges.Weight(8) = 1;
Gs.Edges.Weight(9) = 1;
Gs.Edges.Weight(10) = 1;
Gs.Edges.Weight(11) = 1;
Gs.Edges.Weight(12) = 1;
%Blau
Gs.Edges.Weight(1) = 1;
Gs.Edges.Weight(2) = 1;
Gs.Edges.Weight(3) = 1;
Gs.Edges.Weight(4) = 1;
Gs.Edges.Weight(5) = 1;
Gs.Edges.Weight(6) = 1;
%Simulation der Daten 
%WICHTIG für manche Beispiele muss in der Funktion MeinungVerbreitengS gewisser Code auskommentiert werden
[Gs0,plotdataS0]=MeinungVerbreitenS(Gs,10,0); 
[Gs1,plotdataS1]=MeinungVerbreitenS(Gs,10,0);
[Gs2,plotdataS2]=MeinungVerbreitenS(Gs,10,0);
[Gs3,plotdataS3]=MeinungVerbreitenS(Gs,10,0);
[Gs4,plotdataS4]=MeinungVerbreitenS(Gs,10,0);
[Gs5,plotdataS5]=MeinungVerbreitenS(Gs,10,0);
[Gs6,plotdataS6]=MeinungVerbreitenS(Gs,10,0);
[Gs7,plotdataS7]=MeinungVerbreitenS(Gs,10,0);
[Gs8,plotdataS8]=MeinungVerbreitenS(Gs,10,0);
[Gs9,plotdataS9]=MeinungVerbreitenS(Gs,10,0);
average=(plotdataS0(:,end)+plotdataS1(:,end)+plotdataS2(:,end)+plotdataS3(:,end)+plotdataS4(:,end)+...
    plotdataS5(:,end)+plotdataS6(:,end)+plotdataS7(:,end)+plotdataS8(:,end)+plotdataS9(:,end))./10;
%% 