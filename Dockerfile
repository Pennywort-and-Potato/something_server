FROM ruby:3.2.0-slim
LABEL name="API" version="1.0"
EXPOSE 4000
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /something_server
COPY Gemfile* .
RUN bundle install
COPY . .
CMD rm -f ./tmp/pids/server.pid; rails s -b 0.0.0.0