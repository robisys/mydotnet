#!/usr/bin/env bash
# dotnet restore && dotnet build
# dotnet new --info
dotnet  --info
dotnet  new --help
dotnet  test --help
# chmod +x ./src/bsp1/build.sh
#cd src/bsp1
cd src/bsp2
dotnet restore
dotnet run
echo "--------------------"
# cd ../bsp2
# dotnet restore
# dotnet run
