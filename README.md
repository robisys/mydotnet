# mydotnet
[![Build Status](https://secure.travis-ci.org/robisys/mydotnet.svg?branch=master)](https://travis-ci.org/robisys/mydotnet)

https://www.microsoft.com/net/download/core

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



-------------
[copy from](https://rimdev.io/building-net-core-on-travis-ci/)



.NET Core is a cross-platform runtime, and if you play your developer cards right, you can take advantage of running your application on Windows, macOS, and Linux. We enjoy writing many open source projects. Sometimes we opt to use our internal TeamCity CI server and other times we use Travis CI for more transparency. This post will help you get your .NET Core application building in Travis CI by showing you the files you need in your publicly accessible Git repository.
Build.sh

You need a build script to the root of our repository for Travis CI to execute. It is quite simple.

You can add additional steps to the build.sh to run tests, but this is the simplest command you need.
.travis.yml

We do a few things in the configuration file:

    set the language to csharp
    set the linux distribution to trusty
    allow for sudo access
    turn off mono; we are running .NET Core now
    select the dotnet container
    execute our build script

Note, we could forgo calling our build.sh file and put the calls to dotnet in the script section of our configuration. We chose not to in this case. The Trusty version of Ubuntu is 14.04. Ubuntu 16.04 was released back in April of 2016, but Travis CI does not support it yet. Travis CI default distribution is 12.04, which is not supported by the .NET Core installer.
Conclusion

After adding the files, you can follow this basic tutorial to setting up your project. If everything goes right, you should have a successful build on Travis CI. It really takes very little effort and will help your contributors know if they broke the application.

https://docs.microsoft.com/en-us/dotnet/core/index

https://docs.microsoft.com/de-de/dotnet/

https://www.microsoft.com/net

https://docs.microsoft.com/de-de/dotnet/core/

https://docs.microsoft.com/de-de/dotnet/core/tutorials/

https://docs.microsoft.com/de-de/dotnet/core/porting/

https://docs.microsoft.com/de-de/aspnet/core/getting-started

https://docs.microsoft.com/de-de/dotnet/standard/library

## dist.nuget.org

https://dist.nuget.org/index.html
## Willkommen bei .NET

https://docs.microsoft.com/de-de/dotnet/welcome

## Erste Schritte mit .NET Core unter Windows/Linux/Mac OS unter Verwendung der Befehlszeile

https://docs.microsoft.com/de-de/dotnet/core/tutorials/using-with-xplat-cli

## Organisieren und Testen von Projekten mit der .NET Core-Befehlszeile

https://docs.microsoft.com/de-de/dotnet/core/tutorials/testing-with-cli

Cross platform .NET development!

## OmniSharp 
is a family of Open Source projects, each with one goal: To enable a great .NET experience in YOUR editor of choice

http://www.omnisharp.net/
