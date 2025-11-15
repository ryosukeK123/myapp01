FROM ruby:3.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y \
  curl gnupg2 build-essential libpq-dev libyaml-dev nodejs postgresql-client

# Yarnのインストール（apt-keyを使わない方式）
RUN curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y yarn

WORKDIR /myapp

# GemfileとGemfile.lockをコピーしてbundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install

# アプリ全体をコピー
COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]