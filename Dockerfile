FROM ruby:3.2.0-slim
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /something_server
COPY Gemfile* .
RUN bundle install
COPY . .
RUN rm -rf /something_server/tmp/pids/server.pid
EXPOSE 4000
CMD ["rails", "server", "-b", "0.0.0.0"]