# FROM：使用するイメージ、バージョン
FROM ruby:3.2.2

# RUN：任意のコマンド実行
RUN mkdir /app

# WORKDIR：作業ディレクトリを指定
WORKDIR /app

# COPY：コピー元とコピー先を指定
# ローカルのGemfileをコンテナ内の/app/Gemfileに
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# RubyGemsをアップデート
# Ruby 3.2.2のイメージが使用しているBundlerと異なるバージョンを使う場合、ここで指定する
ARG RUBYGEMS_VERSION=3.3.20
RUN gem update --system ${RUBYGEMS_VERSION}

# Gemfileに記述されたgemをインストール
RUN bundle install

# アプリケーションのコピー
COPY . /app

# CMD:コンテナ実行時、デフォルトで実行したいコマンド
# Rails サーバ起動
CMD ["rails", "server", "-b", "0.0.0.0"]
