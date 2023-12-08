#!/bin/sh
echo "パスワードマネージャーへようこそ！"
read -p "サービス名を入力してください：" service
read -p "ユーザー名を入力してください：" username
read -p "パスワードを入力してください：" password

echo "サービス名： $service" >> ./password.txt
echo "ユーザー名： $username" >> ./password.txt
echo "パスワード： $password" >> ./password.txt
echo "" >> ./password.txt
echo "Thank you!"


