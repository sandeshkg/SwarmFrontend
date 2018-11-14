FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY FrontEndAPP/*.csproj ./FrontEndAPP/
RUN dotnet restore

# copy everything else and build app
COPY FrontEndAPP/. ./FrontEndAPP/
WORKDIR /app/FrontEndAPP
RUN dotnet publish -c Release -o out


FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/FrontEndAPP/out ./
ENTRYPOINT ["dotnet", "FrontEndAPP.dll"]