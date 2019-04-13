% Dies ist die Main Funkton,von hier aus k�nnen alle funktionen benutzt werden  
%% Beispiel wie Figur 1A ausw�hlen
clear;Bild1;Netzwerk=Figur1A;MeinungenD=MeinungenF1; MeinungenS=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 1B ausw�hlen
clear;Bild1;Netzwerk=Figur1B;MeinungenD=MeinungenF1;MeinungenS=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 1C ausw�hlen
clear;Bild1;Netzwerk=Figur1C;MeinungenD=MeinungenF1; MeinungenS=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 1D ausw�hlen
clear;Bild1;Netzwerk=Figur1D;MeinungenD=MeinungenF1; MeinungenS=MeinungenF1;     %#ok<NASGU>
%% Beispiel wie Figur 5 ausw�hlen
clear;Bild5;Netzwerk=Figur5;MeinungenD=MeinungenF5;MeinungenS=MeinungenF5;      %#ok<NASGU>
%% Beispiel wie Figur 6.1 ausw�hlen
clear;Bild6;Netzwerk=Figur61;MeinungenD=MeinungenF61;MeinungenS=MeinungenF61;    %#ok<NASGU>
%% Beispiel wie Figur 6.2 ausw�hlen
clear;Bild6;Netzwerk=Figur62;MeinungenD=MeinungenF62;MeinungenS=MeinungenF62;    %#ok<NASGU>
%% Beispiel wie Figur 9 ausw�hlen
clear;Bild9;Netzwerk=Figur9;MeinungenD=MeinungenF9; MeinungenS=MeinungenF9;       %#ok<NASGU>
%% Beispiel mit nur einem isolierten Block
clear;BspIsoBlock;Netzwerk=IsoBlock;MeinungenD=MeinungenIB; MeinungenS=MeinungenIB;    %#ok<NASGU>
%% Beispiel mit stark zusammenh�ngendem Graphen
clear;StrongConn;Netzwerk=StrCon;MeinungenS=MeinungenSC;MeinungenS=MeinungenSC;   %#ok<NASGU>
%% Meinungen Randomisieren 
MeinungenD=MeinungsRandomD(MeinungenD);
MeinungenS=MeinungsRandomS(MeinungenS);
%% Test zu AdjaZuLaplace Funktion
L=AdjaZuLaplace(Netzwerk);
[EigVekt,~]=eig(L);
EigVal=eig(L);
lamda2=sort(EigVal(:));
lamda2=lamda2(2);
%% Testet deterministisches Modell 
Gd = digraph(Netzwerk);
Gd.Nodes.Meinungen=MeinungenD;
[Gd,plotdataD]=MeinungVerbreitenD(Gd,10,0,0,0.5);
%% Testet stochastisches Modell 
Gs = digraph(Netzwerk);
Gs.Nodes.Meinungen=MeinungenD;
[Gs,plotdataS]=MeinungVerbreitenS(Gs,10,0);
%% Zeichnen und Einf�rben des Graphen
Zeichnung(Netzwerk, MeinungenD, MeinungenS, Gd, plotdataD, Gs, plotdataS);
%%





