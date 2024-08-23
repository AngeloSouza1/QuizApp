# syntax = docker/dockerfile:1

# Certifique-se de que RUBY_VERSION corresponde à versão Ruby em .ruby-version e Gemfile
ARG RUBY_VERSION=3.1.0
FROM ruby:$RUBY_VERSION-slim AS base


LABEL fly_launch_runtime="rails"

# Diretório de trabalho para a aplicação Rails
WORKDIR /rails

# Definir ambiente de produção
ENV BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test" \
    RAILS_ENV="production"

# Atualizar gems e instalar bundler
RUN gem update --system --no-document && \
    gem install -N bundler

# Instalar pacotes necessários para construir gems e módulos node
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential curl libpq-dev libvips node-gyp pkg-config python-is-python3 imagemagick postgresql-client

# Instalar dependências JavaScript
ARG NODE_VERSION=18.19.1
ARG YARN_VERSION=1.22.22
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master

# Copiar Gemfile e Gemfile.lock para o diretório de trabalho
COPY Gemfile Gemfile.lock ./

# Instalar gems da aplicação
RUN bundle install --without development test

# Copiar arquivos relacionados ao Node.js e Yarn
COPY .yarnrc package.json yarn.lock ./
COPY .yarn/releases/* .yarn/releases/

# Instalar módulos Node.js
RUN yarn install --frozen-lockfile

# Copiar o código da aplicação
COPY . .

# Criar um usuário e grupo para a aplicação
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash

# Configurar permissões para desenvolvimento
RUN mkdir -p /rails/public/uploads/tmp && \
    chown -R rails:rails /rails/db /rails/log /rails/storage /rails/tmp /rails/public/uploads/tmp

# Remover o arquivo server.pid antes de iniciar o servidor
RUN rm -f /rails/tmp/pids/server.pid

# Alternar para o novo usuário
USER 1000:1000

# Configurar o entrypoint do container
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Expor a porta 3000 e iniciar o servidor
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]

