FROM mcr.microsoft.com/dotnet/core/runtime:2.2

COPY ./dist /user/share/duo
COPY ./entrypoint.sh /user/share/duo

WORKDIR /user/share/duo

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]