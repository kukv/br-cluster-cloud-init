# br-cluster-cloud-init

cloud-initの設定を管理するリポジトリ

## ディレクトリ構成

```txt
.
├── generated/                  # テンプレートから生成されたcloud-initの設定ファイルが格納されている場所
├── templates/                  # cloud-initのテンプレートが置かれている場所 
├── values/                     # jinja2で置き換えたい値を格納している場所
├── values-secret/              # jinja2で置き換えたい値(シークレットな)を格納している場所
|                               #  https://github.com/kukv/br-cluster-cloud-init-secret
├── generate.sh                 # 自動生成実行シェル
├── network-generator.yml       # network-config生成用docker compose
└── user-data-generator.yml     # user-data生成用docker compose
```

### generated

ここにjinja2で生成されたcloud-init用のファイルが格納される

### templates

ファイル名の命名規則は特に無し

jinja2に準拠したテンプレートファイルを作成して格納する

### values

ファイル名の規則は以下のようになっている

```txt
<<gateway-list, clusetr-list記載のserver名>>.json
```

シークレットな値に関するキーも含めてjsonに記載すること(値はわかりやすければなんでも良い)

### values-secret

サブモジュールとなっているため、サブモジュール先で編集すること

ファイル名の規則は以下のようになっている

```txt
<<gateway-list, clusetr-list記載のserver名>>.json
```

## cloud-init用のファイル生成方法

ひとつ上のディレクトリ階層(br-clusterディレクトリ直下)に`gateway-list`, `cluster-list`ファイルが必要

上記のディレクトリ構成通りに構成できるのであればbuild.shを叩けばすぐ動く

```sh
./generate.sh
```
