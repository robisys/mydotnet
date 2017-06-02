https://www.microsoft.com/net/download/linux

https://download.microsoft.com/download/E/7/8/E782433E-7737-4E6C-BFBF-290A0A81C3D7/dotnet-dev-opensuse.42.1-x64.1.0.4.tar.gz

.NET Core install script

You can use the install script to download either the SDK or just the runtime on any supported Linux distribution. Be sure to check out the script documentation for all the supported options.
Quick example: install the latest SDK

./dotnet-install.sh
Quick example: install just the shared runtime

./dotnet-install.sh --shared-runtime

https://docs.microsoft.com/de-de/dotnet/core/tools/dotnet-install-script

Die dotnet-install Skripts werden verwendet, um ohne Administratorrechte eine Installation der CLI-Toolkette und der freigegebenen Laufzeit auszuführen. Sie können die Skripts aus dem CLI-GitHub-Repository herunterladen.

Diese Skripts sind vor allem in Szenarios für die Automatisierung und Nicht-Administrator-Installationen nützlich. Es gibt zwei Skripts: Das eine ist ein PowerShell-Skript, das unter Windows funktioniert. Das andere Skript ist ein Bash-Skript, das auf Linux/OS X funktioniert. Beide Skripts weisen dasselbe Verhalten auf. Das Bash-Skript liest auch PowerShell-Schalter, sodass Sie PowerShell-Schalter mit dem Skript auf Linux/OS X-Systemen verwenden können.

Die Installationsskripts laden die ZIP/Tarball-Datei vom CLI-Build-Ablagespeicherort herunter und installieren sie entweder am Standardspeicherort oder an einem in -InstallDir|--install-dir angegebenen Speicherort. In der Standardeinstellung laden die Installationsskripts das SDK herunter und installieren es. Wenn Sie nur die freigegebene Laufzeit abrufen möchten, geben Sie das --shared-runtime-Argument an.

In der Standardeinstellung fügt das Skript den Installationsort dem $PATH für die aktuelle Sitzung hinzu. Überschreiben Sie dieses Standardverhalten, indem sie das --no-path-Argument angeben.

Bevor Sie das Skript ausführen, installieren Sie die erforderlichen Abhängigkeiten.

Installieren Sie eine bestimmte Version mithilfe des Arguments --version. Die Version muss als dreiteilige Version (z.B. 1.0.0-13232) angegeben werden. Wenn nicht angegeben, wird standardmäßig die erste global.json-Datei verwendet, die in der Hierarchie über dem Ordner gefunden wird, in dem das Skript aufgerufen wird, das die Eigenschaft version enthält. Wenn nicht vorhanden, wird die neueste Version verwendet.

Sie können dieses Skript auch zum Abrufen des SDK oder der freigegebenen Laufzeit-Debugbinärdateien mit Debugsymbolen mithilfe des Arguments --debug verwenden. Wenn Sie dies bei der ersten Installation nicht getan haben und Sie später die Debugsymbole benötigen, können Sie das Skript mit dem --debug-Argument und der installierten SDK-Version erneut ausführen, um die Debugsymbole zu erhalten. 



    sudo zypper install libunwind libicu
    curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?linkid=848824

2
Install the SDK and put it on the $PATH

    sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet.tar.gz -C /opt/dotnet
    sudo ln -s /opt/dotnet/dotnet /usr/local/bin

nitialize some code

Let's initialize a sample Hello World application!

    dotnet new console -o hwapp
    cd hwapp

4
Run the app

The first command will restore the packages specified in the project file, and the second command will run the actual sample:

    dotnet restore
    dotnet run

And you're ready!

You now have .NET core running on your machine!

Visit the .NET Documentation to get access to additional tutorials, samples and the full .NET Core documentation.
Want some tools?

Get an editor to help you be more productive with .NET Core.
The Visual Studio Code logo.
Visual Studio Code

Learn Download

Visual Studio Code has full support for .NET Core. Install the C# extension to get the best experience.
The OmniSharp logo.
OmniSharp

Learn Download

The OmniSharp project enables cross-platform .NET development in editors such as Atom, Brackets, Sublime Text, Emacs, and Vim.
The JetBrains Rider logo.
JetBrains Rider

Learn Download

JetBrains Rider is a cross-platform .NET IDE built using IntelliJ and ReSharper technology. It offers support for .NET and .NET Core applications on all platforms.


https://www.microsoft.com/net/tutorials/csharp/getting-started/types-variables
-------------

ASP.NET Core

Build web applications that run on Windows, Linux, and macOS using HTML, CSS, and JavaScript.

You can also create Web APIs and mobile sites, use real-time technologies like Web Sockets, and more.

Learn more

Visual Studio Code and the .NET Core CLI can be used to develop on Linux, macOS, or Windows. If you're developing on Windows, we recommend Visual Studio.

Get Visual Studio Get Visual Studio Code Get .NET Core CLI

https://www.microsoft.com/net/learn/apps/web

https://docs.microsoft.com/de-de/dotnet/core/

https://docs.microsoft.com/de-de/dotnet/samples-and-tutorials/

https://github.com/dotnet/docs/tree/master/samples/core/console-apps
