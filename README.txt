# Bachelorarbeit
Matlab Code zur Batchelorarbeit "Meinungsverbreitung in deterministischen und stochastischen Modellen"

In der Funktion "Main" befinden sich verschiedene Code Blöcke und vorgefertigte Beispiele, sodass sie durch auswählen des Blocks und drücken von "strg"+"enter" ausgeführt werden können. 

Der Ordner Data beinhält Dateien mit Variablen welche in den Einzelnen Beispielen der Main aufgerufen werden.
Der Ordner Hilfsfunktionen beinhält alle Funktionen welche für das ausführen der verscheidenen Beispiele der Main Funktion oder anderen Teilen der Bachelorarbeit benötigt werden.

Diese Funktionenen sind:
    -AdjaZuLaplace diese Funktion erstellt aus eine Adjazenzmatrix eine Laplace Matrix
    -MeinungsRandom Randomisiert die Einträge einer Tabelle, wird hier benutzt um Startmeinungen zufällig zu wählen
    -MeinungVerbreitenD ist die Funktion welche für die deterministische Simulation verantwortlich ist, für diese Funktion wird auch die folgende gebraucht
    -MeinungsSchritt errechnet Anhand der gegebenen situation einen Schritt der deterministischen Simulation unter Berücksichtigung der Schrittdauer etc.
    -MeinungVerbreitenS ist die Funktione welche für die stochastische Simulation verantwortlich ist#
    -varGraph ermöglicht den Graphen während der Laufzeit der Simulation zu mutieren, kann von beiden Modellen benutzt werden
    -varGraphMod ist eine Modifizierte version der vorherigen Funktion speziell für das Beispiel mit 2 kontrahierenden, isolierten Meinungen
    -Zeichung zeichnet anhand der Gegebenen Daten verschiedene Plots zu den Simulationen
    -ErstellungFig82 erstellt ähnlich zu der Figur 8.2 aus "deterministic versus stochastic consensus dynamics on graphs" einen Plot.
    -BoundedConfidence errechnet din Beispiel mit bedingtem Vertrauen und visualisiert das Ergebnis.



