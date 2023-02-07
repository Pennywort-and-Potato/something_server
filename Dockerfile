FROM ruby:3.2.0-slim
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /something_server
COPY Gemfile* .
RUN bundle install
COPY . .
RUN chmod +x ./docker/entrypoint.sh
ENTRYPOINT exec ./docker/entrypoint.sh