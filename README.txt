# Bachelorarbeit
Matlab Code zur Bachelorarbeit "Meinungsverbreitung in deterministischen und stochastischen Modellen"

In der Funktion "Main" befinden sich verschiedene Code Blöcke und vorgefertigte Beispiele, sodass sie durch auswählen des Blocks und drücken von "strg"+"enter" ausgeführt werden können. 

Der Ordner Data beinhält Dateien mit Variablen welche in den einzelnen Beispielen der Main aufgerufen werden.
Der Ordner Hilfsfunktionen beinhält alle Funktionen welche für das ausführen der verschiedenen Beispiele der Main Funktion oder anderen Teilen der Bachelorarbeit benötigt werden.

Diese Funktionieren sind:
    -AdjaZuLaplace diese Funktion erstellt aus einer Adjazenzmatrix eine Laplace Matrix  
    -MeinungsRandom randomisiert die Einträge einer Tabelle, wird hier benutzt, um Startmeinungen zufällig zu wählen
    -MeinungVerbreitenD ist die Funktion, welche für die deterministische Simulation verantwortlich ist, für diese Funktion wird auch die folgende gebraucht
    -MeinungsSchritt errechnet Anhand der gegebenen situation einen Schritt der deterministischen Simulation unter Berücksichtigung der Schrittdauer etc.
    -MeinungVerbreitenS ist die Funktione welche für die stochastische Simulation verantwortlich ist
    -varGraph ermöglicht den Graphen während der Laufzeit der Simulation zu mutieren, kann von beiden Modellen benutzt werden
    -varGraphMod ist eine modifizierte Version der vorherigen Funktion speziell für das Beispiel mit 2 kontrahierenden, isolierten Meinungen
    -Zeichnung zeichnet anhand der gegebenen Daten verschiedene Plots zu den Simulationen
    -ErstellungFig82 erstellt ähnlich zu der Figur 8.2 aus "deterministic versus stochastic consensus dynamics on graphs" einen Plot.
    -BoundedConfidence errechnet ein Beispiel mit beschränktem Vertrauen und visualisiert das Ergebnis
