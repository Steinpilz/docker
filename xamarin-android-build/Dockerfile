FROM runmymind/docker-android-sdk:ubuntu-lazydl

# Install Android tools
RUN echo "build-tools;30.0.3\nlldb\nplatform-tools\nplatforms;android-30\ntools" > /opt/tools/package-list-minimal.txt && \
    /opt/tools/entrypoint.sh built-in

# Clear list of default android tools to escape downloading after container start
RUN echo "" > /opt/tools/package-list.txt

RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    tzdata \
    dirmngr \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    xmlstarlet \
    && rm -rf /var/lib/apt/lists/* /tmp/*

# Dotnet SDK
# Uncomment if required
# RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
#     dpkg -i packages-microsoft-prod.deb && \
#     apt-get update && \
#     apt-get install -y dotnet-sdk-6.0 \
#     && rm -rf /var/lib/apt/lists/* /tmp/*

# Mono
# Use preview because stable does not support C# 9
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb [arch-=i386] https://download.mono-project.com/repo/ubuntu preview-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get install -y \
    mono-devel \
    nuget \
    && rm -rf /var/lib/apt/lists/* /tmp/*

# Xamarin Android
RUN apt-get update && apt-get install -y \
    unzip \
    jq \
    lxd \
    bzip2 \
    libzip4 \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir /usr/lib/xamarin.android && \
    mkdir /usr/lib/mono/xbuild/Xamarin/ && \
    mkdir /xamarin

# Use last successful build from https://dev.azure.com/xamarin/public/_build?definitionId=48&_a=summary
RUN curl -k "https://dev.azure.com/xamarin/public/_apis/build/builds/54953/artifacts?artifactName=Installers-unsigned%20-%20Linux&api-version=5.1" | curl -L $(jq -r '.resource.downloadUrl') -o xamarin-linux.zip && \
    unzip -q xamarin-linux.zip -d /tmp/xamarin-linux && \
    rm xamarin-linux.zip && \
    cd "/tmp/xamarin-linux/installers-unsigned - Linux/" && \
    tar xjf ./xamarin.android-oss-v*.tar.bz2 --strip 1 -C /xamarin && \
    cp -a /xamarin/bin/Release/lib/xamarin.android/. /usr/lib/xamarin.android/ && \
    rm -rf /usr/lib/mono/xbuild/Xamarin/Android && \
    rm -rf /usr/lib/mono/xbuild-frameworks/MonoAndroid && \
    ln -s /usr/lib/xamarin.android/xbuild/Xamarin/Android/ /usr/lib/mono/xbuild/Xamarin/Android && \
    ln -s /usr/lib/xamarin.android/xbuild-frameworks/MonoAndroid/ /usr/lib/mono/xbuild-frameworks/MonoAndroid && \
    rm -rf /tmp/xamarin-linux && \
    rm -rf /xamarin
