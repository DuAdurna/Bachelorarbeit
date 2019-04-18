% Dies ist die Main Funkton,von hier aus k�nnen alle funktionen benutzt werden  
%% Beispiel wie Figur 1A ausw�hlen
clear;Bild1;Netzwerk=Figur1A;Meinungen=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 1B ausw�hlen
clear;Bild1;Netzwerk=Figur1B;Meinungen=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 1C ausw�hlen
clear;Bild1;Netzwerk=Figur1C;Meinungen=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 1D ausw�hlen
clear;Bild1;Netzwerk=Figur1D;Meinungen=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 5 ausw�hlen
clear;Bild5;Netzwerk=Figur5;Meinungen=MeinungenF5;      %#ok<NASGU>
%% Beispiel wie Figur 6.1 ausw�hlen
clear;Bild6;Netzwerk=Figur61;Meinungen=MeinungenF61;    %#ok<NASGU>
%% Beispiel wie Figur 6.2 ausw�hlen
clear;Bild6;Netzwerk=Figur62;Meinungen=MeinungenF62;    %#ok<NASGU>
%% Beispiel wie Figur 9 ausw�hlen
clear;Bild9;Netzwerk=Figur9;Meinungen=MeinungenF9;       %#ok<NASGU>
%% Beispiel mit nur einem isolierten Block
clear;BspIsoBlock;Netzwerk=IsoBlock;Meinungen=MeinungenIB;    %#ok<NASGU>
%% Beispiel mit stark zusammenh�ngendem Graphen
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
[Gd,plotdataD]=MeinungVerbreitenD(Gd,25,0,0,1);
%% Testet stochastisches Modell 
Gs = digraph(Netzwerk);
Gs.Nodes.Meinungen=Meinungen;
[Gs,plotdataS]=MeinungVerbreitenS(Gs,10,0);
%% Zeichnen und Einf�rben des Graphen
Zeichnung(Netzwerk, Meinungen, Gd, plotdataD, Gs, plotdataS);
%% 10facher durschschnitt f�r figur 9
Gs = digraph(Netzwerk);
Gs.Nodes.Meinungen=MeinungenCopy;
Gs.Edges.Weight(7) = 1;
Gs.Edges.Weight(8) = 1;
Gs.Edges.Weight(9) = 1;
Gs.Edges.Weight(10) = 1;
Gs.Edges.Weight(11) = 1;
Gs.Edges.Weight(12) = 1;
Gs.Edges.Weight(1) = 1;
Gs.Edges.Weight(2) = 1;
Gs.Edges.Weight(3) = 1;
Gs.Edges.Weight(4) = 1;
Gs.Edges.Weight(5) = 1;
Gs.Edges.Weight(6) = 1;
[~,plotdataS0]=MeinungVerbreitenS(Gs,1,0); 
[~,plotdataS1]=MeinungVerbreitenS(Gs,10,0);
[~,plotdataS2]=MeinungVerbreitenS(Gs,10,0);
[~,plotdataS3]=MeinungVerbreitenS(Gs,10,0);
[~,plotdataS4]=MeinungVerbreitenS(Gs,10,0);
[~,plotdataS5]=MeinungVerbreitenS(Gs,10,0);
[~,plotdataS6]=MeinungVerbreitenS(Gs,10,0);
[~,plotdataS7]=MeinungVerbreitenS(Gs,10,0);
[~,plotdataS8]=MeinungVerbreitenS(Gs,10,0);
[Gs,plotdataS9]=MeinungVerbreitenS(Gs,10,0);
average=(plotdataS0(:,end)+plotdataS1(:,end)+plotdataS2(:,end)+plotdataS3(:,end)+plotdataS4(:,end)+...
    plotdataS5(:,end)+plotdataS6(:,end)+plotdataS7(:,end)+plotdataS8(:,end)+plotdataS9(:,end))./10;
%% 