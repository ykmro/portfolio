#!/bin/bash
set -e

# マイグレーション実行
bundle exec rails db:migrate

# データが空の場合のみシード実行
bundle exec rails runner "Situation.count == 0 && Rails.application.load_seed"

# サーバー起動
exec bundle exec rails s -p 3000 -b 0.0.0.0
