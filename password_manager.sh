#!/bin/sh
echo "パスワードマネージャーへようこそ！"

while [ "$select" != "Exit" ]
do
    read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" select
    case "$select" in
        "Add Password")
            # Add Passwordの処理
            read -p "サービス名を入力してください：" service
            read -p "ユーザー名を入力してください：" username
            read -p "パスワードを入力してください：" password
            echo "$service:$username:$password" >> ./password.txt
            echo "" >> ./password.txt
            echo "パスワードの追加は成功しました。"
            ;;
        "Get Password")
            # Get Passwordの処理
            read -p "サービス名を入力してください：" serviceName
            #　　サービス名と対応したパスワードを取得
            pass=$(grep "$serviceName" password.txt | cut -d: -f3)
            if [ -z "$pass" ]; then
                # サービス名が保存されていなかった場合
                echo "そのサービスは登録されていません。"
            else
                echo "サービス名：$serviceName" 
                echo "ユーザー名：$(grep "$serviceName" password.txt | cut -d: -f2)"  
                echo "パスワード：$pass"  
            fi
            ;;
        "Exit")
            echo "Thank you!"
            ;;
        *) 
            # Add Password/Get Password/Exit以外の処理
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    esac 
done;
    