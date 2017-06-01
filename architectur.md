

In diesem Dokument werden die allgemeinen Änderungen beschrieben, die der Wechsel von project.json zu MSBuild und zum .csproj-Projektsystem mit sich bringt. Erläutert wird die neue Weise, in der Tools in Schichten angeordnet sind, welche neuen Elemente verfügbar sind und wo sie sich im Gesamtbild einordnen. Nach der Lektüre dieses Artikels sollten Sie alle Elemente besser verstehen, die die .NET Core-Tools nach dem Wechsel zu MSBuild und .csproj bilden.
Abkehr von „project.json“

Die größte Änderung in den Tools für .NET Core ist sicherlich die Abkehr von „project.json“ hin zu „csproj“ als Projektsystem. Die neuesten Versionen der Befehlszeilentools unterstützen keine project.json-Dateien. Das heißt, dass diese Version nicht zum Erstellen, Ausführen und Veröffentlichen von auf „project.json“ basierenden Anwendungen und Bibliotheken verwendet werden kann. Um diese Version der Tools verwenden zu können, müssen Sie Ihre vorhandenen Projekte migrieren oder neue beginnen.

Im Rahmen dieses Wechsels wurde das benutzerdefinierte Buildmodul, das zum Erstellen von „project.json“-Projekten entwickelt wurde, durch ein ausgereiftes und vollausgestattetes Buildmodul namens MSBuild ersetzt. MSBuild ist ein bekanntes Modul in der .NET-Community, da es seit der ersten Version der Plattform eine wichtige Technologie darstellt. Da mit MSBuild .NET Core-Anwendungen erstellt werden müssen, wurde MSBuild zu .NET Core portiert und kann auf allen Plattformen genutzt werden, auf denen .NET Core ausgeführt wird. Eines der wichtigsten Ziele von .NET Core ist ein plattformübergreifender Entwicklungsstapel, und wir haben dafür gesorgt, dass auch nach diesem Wechsel dieses Ziel erfüllt wird.
Hinweis

Wenn Sie noch nicht mit MSBuild vertraut sind und mehr darüber erfahren möchten, lesen Sie zum Einstieg den Artikel MSBuild Concepts (MSBuild-Konzepte).
Die Toolschichten

Die Frage, die sich nach der Abkehr vom vorhandenen Projektsystem und aufgrund des Wechsels des Buildmoduls zwangsläufig stellt, ist, ob sich durch diese Änderungen die allgemeinen Schichten des gesamten Ökosystems von .NET Core-Tools ändern? Gibt es neue Bits und Komponenten?

Lassen Sie uns als schnelle Auffrischung mit den Schichten in Preview 2 beginnen, die die folgende Abbildung zeigt:

Allgemeine Architektur der Preview 2-Tools

Die Schichtung der Tools ist recht einfach. Ganz unten haben wir die .NET Core-Befehlszeilentools als Fundament. Alle anderen Tools auf höherer Ebene wie Visual Studio oder Visual Studio Code hängen zum Erstellen von Projekten, Wiederherstellen von Abhängigkeiten usw. von der CLI ab. Dies bedeutete, dass wenn Visual Studio z.B. eine Wiederherstellung durchführen wollte, der Befehl dotnet restore in der CLI aufgerufen werden musste.

Durch den Wechsel zum neuen Projektsystem ändert sich die vorherige Abbildung:

Grundlegende Architektur von .NET Core SDK 1.0.0

Der Hauptunterschied besteht darin, dass die CLI nicht mehr die Fundamentschicht darstellt. Diese Rolle wird jetzt von der „freigegebenen SDK-Komponente“ übernommen. Diese freigegebene SDK-Komponente ist eine Gruppe von Zielen und zugehörigen Aufgaben, die für das Kompilieren Ihres Codes, seine Veröffentlichung, das Packen von NuGet-Paketen usw. verantwortlich sind. Das SDK selbst ist Open Source und auf GitHub im Repository SDK verfügbar.
Hinweis

Ein „Ziel“ ist ein MSBuild-Ausdruck, der einen benannten Vorgang angibt, den MSBuild aufrufen kann. Es ist in der Regel an eine oder mehrere Aufgaben gekoppelt, die dem Ziel entsprechende Logik ausführen. MSBuild unterstützt viele vorgefertigte Ziele, z.B. Copy oder Execute. Außerdem können Benutzer mithilfe von verwaltetem Code eigene Aufgaben schreiben und Ziele definieren, um diese Aufgaben ausführen. Weitere Informationen finden Sie unter MSBuild-Aufgaben.

Alle Toolsets nutzen nun die freigegebene SDK-Komponente und ihre Ziele. Das gibt auch für die CLI. Beispielsweise ruft die nächste Version von Visual Studio nicht den Befehl dotnet restore auf, um die Abhängigkeiten für .NET Core-Projekte wiederherzustellen, sondern direkt das Ziel von „restore“. Da es sich MSBuild-Ziele handelt, können Sie MSBuild auch „roh“ verwenden, um sie mit dem Befehl dotnet msbuild auszuführen.
CLI-Befehle

Die freigegebene SDK-Komponente bedeutet, dass die meisten vorhandenen CLI-Befehle als MSBuild-Aufgaben und -Ziele neu implementiert wurden. Was bedeutet dies für die CLI-Befehle und Ihre Nutzung des Toolsets?

Aus Benutzersicht ändert sich nicht die Art der Verwendung der CLI. Die CLI weist noch immer die Hauptbefehle auf, die in der Preview 2-Version vorhanden sind:

    new
    restore
    run
    build
    publish
    test
    pack

Diese Befehle werden weiter wie erwartet ausgeführt (Erstellen, Veröffentlichen, Packen eines Projekts usw.). Die meisten Optionen haben sich nicht geändert und sind weiterhin vorhanden. Um sich mit den Änderungen vertraut zu machen, können Sie entweder die Hilfebildschirme der Befehle (über dotnet <command> --help) oder die Dokumentation auf dieser Website konsultieren.

Aus Sicht der Ausführung verwenden die CLI-Befehle ihre Parameter und erstellen einen Aufruf an „rohes“ MSBuild, woraufhin das Modul die benötigten Eigenschaften festlegt und das gewünschte Ziel ausführt. Um dies besser zu veranschaulichen, betrachten Sie den folgenden Befehl:

dotnet publish -o pub -c Release

Mit diesem Befehl wird eine Anwendung im Ordner pub mithilfe der Konfiguration „Release“ veröffentlicht. Intern wird dieser Befehl in den folgenden MSBuild-Aufruf übersetzt:

dotnet msbuild /t:Publish /p:OutputPath=pub /p:Configuration=Release

Die wichtige Ausnahme dieser Regel sind die Befehle new und run, da sie nicht als MSBuild-Ziele implementiert wurden.

    Bearbeiten
    Freigabe
    Design

In diesem Artikel

    Abkehr von „project.json“
    Die Toolschichten
