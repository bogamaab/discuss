FROM elixir:1.6.6-alpine

WORKDIR /opt/app

COPY . .

RUN apk update \
    && apk add --virtual build-dependecies \
    build-base \
    wget \
    curl \
    git \
    unzip \
    nodejs \
    npm \
    postgresql-dev \
    inotify-tools && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new-1.2.5.ez --force && \
    rm entrypoint.sh

ENV PATH="/usr/local/elixir/bin:$PATH"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


CMD ["/entrypoint.sh"]

# copy from internet
# versions used in course: elixir1.3.4 erlang OTP 19
# FROM elixir:1.3.1
#
# WORKDIR /workspaces
#
# # Install Node.js, Hex and the Phoenix framework
# RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
#     && export NVM_DIR="$HOME/.nvm" \
#     && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
#     && nvm install 6.9.1 \
#     && wget https://github.com/phoenixframework/archives/raw/master/phoenix_new-1.2.5.ez \
#     && mix archive.install --force phoenix_new-1.2.5.ez \
#     && mix local.hex --force \
#     && rm phoenix_new-1.2.5.ez
#
# EXPOSE 4000
# EXPOSE 5432```
