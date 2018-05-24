FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
RUN bundle exec rake db:migrate
#CMD [ "echo", "$PORT","&&", "bundle", "exec", "rails", "server", "port", "$PORT" ]
CMD [ "sh", "-c", "bundle exec rails s -b '0.0.0.0'" ]