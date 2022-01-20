FROM elixir:1.13.1

RUN mix local.hex --force && mix local.rebar --force
  
WORKDIR /app