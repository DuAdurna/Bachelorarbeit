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
Gd.Nodes.Meinungen=MeinungenD;
[Gd,plotdataD]=MeinungVerbreitenD(Gd,10,0,0,0);
%% Testet stochastisches Modell 
Gs = digraph(Netzwerk);
Gs.Nodes.Meinungen=MeinungenS;
[Gs,plotdataS]=MeinungVerbreitenS(Gs,100,0);
%% Zeichnen und Einfärben des Graphen
Zeichnung(Netzwerk, Meinungen, Gd, plotdataD, Gs, plotdataS);
%%





