# https://docs.docker.com/engine/examples/dotnetcore/
# Build runtime image
FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /app
COPY Bin/Release /app
ENTRYPOINT ["dotnet", "CarterHelloWorldWebApp.exe"]