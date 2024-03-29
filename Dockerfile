FROM ruby:3.2.0-slim
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs ruby-pg
WORKDIR /something_server
COPY Gemfile* .
RUN bundle install
COPY . .
CMD rm -f ./tmp/pids/server.pid; rails s -p 4000 -b 0.0.0.0;