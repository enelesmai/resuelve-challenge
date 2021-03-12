FROM ruby:2.6.6-alpine3.13

RUN apk add --update --no-cache \
    yarn \
    build-base \
tzdata \
    && rm -rf /var/cache/apk/*

RUN gem install rails

WORKDIR ./usr/src/app

COPY Gemfile* ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails","s","-b","0.0.0.0"]