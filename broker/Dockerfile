FROM elixir:1.14.2

# This should not be done in safe production environments

ENV MIX_ENV="prod"
ENV PORT=5000
ENV DATABASE_URL="ecto://postgres:postgres@livedb:5432/broker"  
ENV SECRET_KEY_BASE="KyGLWIRJXKcUTqfUtQ5AVkM+d8OB5nOcHBbLfFVPHehPjatG0tbI/udtcVQ3nF5Z"

RUN mix local.hex --force \
  && mix archive.install --force hex phx_new 1.7.2 \
  && apt-get update \
  && curl -sL https://deb.nodesource.com/setup_18.x | bash \
  && apt-get install -y apt-utils \
  && apt-get install -y nodejs \
  && apt-get install -y build-essential \
  && apt-get install -y inotify-tools \
  && mix local.rebar --force

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 5000

CMD ["elixir", "--name", "broker@broker", "--cookie", "leruaite_secret", "-S", "mix", "phx.server"]
