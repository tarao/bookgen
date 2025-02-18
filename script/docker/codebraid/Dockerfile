FROM ubuntu AS pandoc-bin

WORKDIR /download

RUN apt-get -q --no-allow-insecure-repositories update \
  && DEBIAN_FRONTEND=noninteractive \
     apt-get install --assume-yes --no-install-recommends \
       ca-certificates \
       curl \
       jq \
  && rm -rf /var/lib/apt/lists/*

RUN TAG_NAME=$(curl -sL https://api.github.com/repos/jgm/pandoc/releases/latest | jq -r '.tag_name') \
  && curl -sL https://github.com/jgm/pandoc/releases/download/${TAG_NAME}/pandoc-${TAG_NAME}-linux-amd64.tar.gz -o pandoc.tar.gz \
  && tar xfz pandoc.tar.gz --strip=2 pandoc-${TAG_NAME}/bin/pandoc \
  && rm pandoc.tar.gz

FROM continuumio/miniconda3

RUN mkdir -p /opt/workspace && \
  conda install -y --quiet -c conda-forge \
  codebraid && \
  conda clean -i -t -y

COPY --from=pandoc-bin \
  /download/pandoc \
  /usr/local/bin/

WORKDIR /opt/workspace

CMD [ "codebraid" ]
