FROM ocelotuproar/docker-alpine-mono:4.4

ENV SCRIPTCS_VERSION 0.16.1

RUN mkdir -p /tmp/src && \
      cd /tmp/src && \
      wget --progress=dot:mega https://github.com/scriptcs/scriptcs/archive/v$SCRIPTCS_VERSION.tar.gz && \
      tar xzf v$SCRIPTCS_VERSION.tar.gz && \
      cd /tmp/src/scriptcs-$SCRIPTCS_VERSION && \
      mono .nuget/NuGet.exe restore ./ScriptCs.sln && xbuild ./ScriptCs.sln /property:Configuration=Release /nologo /verbosity:normal && \
      cp -r /tmp/src/scriptcs-0.16.1/src/ScriptCs/bin/Release /usr/bin/scriptcs

ENV PATH $PATH:/usr/bin/scriptcs/
RUN echo '#!/usr/bin/env ash' > /usr/bin/scriptcs/scriptcs && echo 'mono "/usr/bin/scriptcs/scriptcs.exe"' >> /usr/bin/scriptcs/scriptcs && chmod +x /usr/bin/scriptcs/scriptcs
CMD "scriptcs"
