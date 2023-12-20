# Copy csproj and restore as distinct layers
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /sources

# Copy everything else and build website
COPY /UmbracoContainer/*.csproj .

COPY /UmbracoContainer/appsettings.json .
COPY /UmbracoContainer/Program.cs .
COPY /UmbracoContainer/Startup.cs .

COPY /UmbracoContainer/Properties ./Properties
COPY /UmbracoContainer/Views ./Views

# Build umbraco
RUN dotnet restore
RUN dotnet build
RUN dotnet publish -c release -o /output --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /output
COPY --from=build /output ./

# Copy the wait-for-it.sh script as an mssql prerequisite
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

ENTRYPOINT ["dotnet", "UmbracoContainer.dll"]