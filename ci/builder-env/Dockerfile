FROM buildpack-deps as builder

# dotnet
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libc6 \
    libgcc1 \
    libgssapi-krb5-2 \
    libicu57 \
    liblttng-ust0 \
    libssl1.0.2 \
    libstdc++6 \
    zlib1g \
    && rm -rf /var/lib/apt/lists/*

ENV DOTNET_SDK_VERSION 2.2.203

RUN curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-sdk-$DOTNET_SDK_VERSION-linux-x64.tar.gz \
    && dotnet_sha512='8da955fa0aeebb6513a6e8c4c23472286ed78bd5533af37d79a4f2c42060e736fda5fd48b61bf5aec10bba96eb2610facc0f8a458823d374e1d437b26ba61a5c' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

RUN echo 'export PATH=$PATH:/root/.dotnet/tools' >> /etc/profile

# docker
RUN curl -sL https://get.docker.com | bash -

# nodejs
RUN apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt install nodejs

# sonar qube scanner
RUN dotnet tool install --global dotnet-sonarscanner

# cache npm packages, for build speed optimization
COPY ./Source/Ui/package.json /app/Source/Ui/package.json
COPY ./Source/Ui/package-lock.json /app/Source/Ui/package-lock.json

WORKDIR /app/Source/Ui

RUN npm i

#copy all sources
COPY . /app

WORKDIR /app