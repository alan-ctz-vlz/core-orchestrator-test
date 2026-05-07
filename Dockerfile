# 1. Usamos la imagen del SDK para compilar
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# 2. Copiamos los archivos del proyecto y restauramos
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

# 3. Usamos la imagen ligera de ejecución para la Raspberry (ARM64)
FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=build /app/out .

# 4. Comando para arrancar la app
ENTRYPOINT ["dotnet", "CoreOrchestrator.dll"]
