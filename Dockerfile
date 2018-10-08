FROM madnight/docker-alpine-wkhtmltopdf as wkhtmltopdf

FROM ruby:2.5.1-alpine3.7
ENV RAILS_ENV production

RUN apk add --no-cache \
  build-base \
  nodejs \
  git \
  sqlite-dev \
  tzdata \
  mariadb \
  nodejs \
  mariadb-dev

COPY --from=wkhtmltopdf /bin/wkhtmltopdf /bin/

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile* ./
RUN bundle install --without development test
ADD . .

EXPOSE 3000
RUN chmod +x start.sh
CMD ["/usr/src/app/start.sh"]