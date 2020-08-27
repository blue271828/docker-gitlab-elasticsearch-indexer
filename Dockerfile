FROM golang:buster
LABEL maintainer="blue271828"

# Install dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    git \
    libicu-dev \
    make \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install GitLab Elasticsearch Indexer
RUN cd /tmp \
 && git clone --depth 1 https://gitlab.com/gitlab-org/gitlab-elasticsearch-indexer.git \
 && cd gitlab-elasticsearch-indexer \
 && make && make install \
 && rm -rf /tmp/gitlab-elasticsearch-indexer

WORKDIR /
