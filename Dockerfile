# Copy csproj and restore as distinct layers
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
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
RUN dotnet build -c release
RUN dotnet publish -c release -o /output --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:9.0
USER $APP_UID

WORKDIR /output
COPY --from=build --chown=$APP_UID:$APP_UID /output ./

RUN mkdir /output/umbraco

ENTRYPOINT ["dotnet", "UmbracoContainer.dll", "--urls", "http://0.0.0.0:8080"]