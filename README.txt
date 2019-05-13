# Bachelorarbeit
Matlab Code zur Bachelorarbeit "Meinungsverbreitung in deterministischen und stochastischen Modellen"

In der Funktion "Main" befinden sich verschiedene Code Bl�cke und vorgefertigte Beispiele, sodass sie durch ausw�hlen des Blocks und dr�cken von "strg"+"enter" ausgef�hrt werden k�nnen. 

Der Ordner Data beinh�lt Dateien mit Variablen welche in den einzelnen Beispielen der Main aufgerufen werden.
Der Ordner Hilfsfunktionen beinh�lt alle Funktionen welche f�r das ausf�hren der verschiedenen Beispiele der Main Funktion oder anderen Teilen der Bachelorarbeit ben�tigt werden.

Diese Funktionieren sind:
    -AdjaZuLaplace diese Funktion erstellt aus einer Adjazenzmatrix eine Laplace Matrix  
    -MeinungsRandom randomisiert die Eintr�ge einer Tabelle, wird hier benutzt, um Startmeinungen zuf�llig zu w�hlen
    -MeinungVerbreitenD ist die Funktion, welche f�r die deterministische Simulation verantwortlich ist, f�r diese Funktion wird auch die folgende gebraucht
    -MeinungsSchritt errechnet Anhand der gegebenen situation einen Schritt der deterministischen Simulation unter Ber�cksichtigung der Schrittdauer etc.
    -MeinungVerbreitenS ist die Funktione welche f�r die stochastische Simulation verantwortlich ist
    -varGraph erm�glicht den Graphen w�hrend der Laufzeit der Simulation zu mutieren, kann von beiden Modellen benutzt werden
    -varGraphMod ist eine modifizierte Version der vorherigen Funktion speziell f�r das Beispiel mit 2 kontrahierenden, isolierten Meinungen
    -Zeichnung zeichnet anhand der gegebenen Daten verschiedene Plots zu den Simulationen
    -ErstellungFig82 erstellt �hnlich zu der Figur 8.2 aus "deterministic versus stochastic consensus dynamics on graphs" einen Plot.
    -BoundedConfidence errechnet ein Beispiel mit beschr�nktem Vertrauen und visualisiert das Ergebnis
