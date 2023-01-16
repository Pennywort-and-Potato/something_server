FROM ruby:3.2.0-slim
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /something_server
COPY Gemfile* .
RUN bundle install
COPY . .
RUN bundle exec figaro install
EXPOSE 4000
CMD ["rails", "server", "-b", "0.0.0.0"]