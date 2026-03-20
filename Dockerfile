FROM ruby:3.3.0-slim

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  curl \
  git \
  && rm -rf /var/lib/apt/lists/*

# Node.js インストール（Hotwire/assets用）
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get install -y nodejs

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
# CMD ["bash", "-c", "bundle exec rails db:migrate && bundle exec rails s -p 3000 -b '0.0.0.0'"]
CMD ["bash", "-c", "bundle exec rails db:migrate && RAILS_ENV=production bundle exec rails s -p 3000 -b '0.0.0.0'"]