# Cross-compile instead of emulating arm64.
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:11.0 AS build
ARG TARGETARCH
WORKDIR /src

# Restore first to cache the packages.
COPY ["ProjectsService.Api/ProjectsService.Api.csproj", "ProjectsService.Api/"]
COPY ["ProjectsService.Application/ProjectsService.Application.csproj", "ProjectsService.Application/"]
COPY ["ProjectsService.Domain/ProjectsService.Domain.csproj", "ProjectsService.Domain/"]
COPY ["ProjectsService.Infrastructure/ProjectsService.Infrastructure.csproj", "ProjectsService.Infrastructure/"]
COPY ["Directory.Build.props", "Directory.Packages.props", "./"]
RUN dotnet restore "ProjectsService.Api/ProjectsService.Api.csproj" -a $TARGETARCH

COPY . .
RUN dotnet publish "ProjectsService.Api/ProjectsService.Api.csproj" \
    -a $TARGETARCH \
    --configuration Release \
    --no-restore \
    -o /app/publish \
    /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:11.0 AS final
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/publish .
USER $APP_UID
ENTRYPOINT ["dotnet", "ProjectsService.Api.dll"]
