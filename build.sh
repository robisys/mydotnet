#!/usr/bin/env bash
# dotnet restore && dotnet build
# dotnet new --info
dotnet  --info
dotnet  new --help
dotnet  test --help
# chmod +x ./src/bsp1/build.sh
cd src/bsp1
dotnet restore
dotnet run
cd ../bsp2
dotnet restore
dotnet run
