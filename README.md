# igTemplateFHIRBundle

# Bundle(type:document)リソースによる医療系文書のFHIR ImplementationGuideを作成するためのサンプルIG

## IG作成手順　　

### STEP　1 

　- このレポジトリを複製して、自分の作業用のレポジトリ　[myRepo]を作成する。
　- [myRepo] に以下の環境変数、レポジトリsecretを設定する。これらは、いずれもhttps://jpfhir.jp/fhir/のサイトに、IGをアップロードする場合に必要となる。
　      環境変数：
　　
        - JAMIWG_USERID_AT_WEBHOST=xxxx
        - JAMIWG_WEBPATH=/home/xxxx/public_html
        - SSH_PORT_JPFHIR=xxxx

        レポジトリsecret:

        - SSH_PRIVATE_KEY_TO_JPFHIR = XXXX

　　　設定内容は別途問い合わせられたい

### STEP 2

  - .github/workflows/develop.yml の以下の部分を必要に応じて変更する。
  
        - 14 行目：　release_version : 1.0.0
以下まだ作成中