# mydotnet
[![Build Status](https://secure.travis-ci.org/robisys/mydotnet.svg?branch=master)](https://travis-ci.org/robisys/mydotnet)

https://www.microsoft.com/net/download/core


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
