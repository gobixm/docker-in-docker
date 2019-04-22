FROM mcr.microsoft.com/dotnet/core/runtime:2.2

COPY ./dist /user/share/uno
COPY ./entrypoint.sh /user/share/uno

WORKDIR /user/share/uno

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
# ENTRYPOINT [ "dotnet", "AppUno.dll" ]