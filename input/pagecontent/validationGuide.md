

### Bundleリソースデータ(インスタンス)のValidation方法について

ここでのインスタンス Validationとは、本仕様(IG)にもとづいて作成されたデータファイル（JSON形式）が、仕様の各Profile に準拠しているかをFHIR公式Validatorを使用して検証することである。

Validationの具体的手順と、出力の解釈方法について説明する。ただし、対象となるデータにあるさまざまなエラーや多様な記述方法によって、出力されるメッセージは多岐にわたるため、ここではその一部の例を示すに過ぎない。今後、順次説明を追加している予定である。


#### 1. 手順（準備編）

##### 検証用HL7 FHIRコアパッケージ　を 以下のサイトからどちらかの圧縮形式のファイルをダウンロードする。解凍後の内容は同一である。このパッケージには、US FHIRで提供されるコアパッケージが含まれる。


    - zip形式 : https://jpfhir.jp/fhir/pkgValidation/fhir-core-pkg.zip （42MB）
    - tgz形式 : https://jpfhir.jp/fhir/pkgValidation/fhir-core-pkg.tgz （28MB）

#####  上記でダウンロードした検証用HL7　　FHIRコアパッケージを、適当なフォルダ内で解凍する。


  　 - fhir-core-pkgs-<span style="color: blue;">20231111-forV6.1.8-20230921</span> のような名前のフォルダが作成される。青字の部分はダウンロード時期により異なる。その中にpackagesフォルダが作成され、packagesフォルダ配下は以下のようなフォルダ構成になっていることを確認する。各フォルダ内にはさらにフォルダやファイルが存在するがここでは省略する。packageフォルダ内のフォルダ名や数は、ダウンロード時期による異なることがあるので、下図は一例である。

  
```
 packages
├── hl7.fhir.r4.core#4.0.1
├── hl7.fhir.uv.extensions#1.0.0
├── hl7.fhir.uv.extensions.r4#1.0.0
├── hl7.fhir.xver-extensions#0.0.12
├── hl7.terminology#5.3.0
├── hl7.terminology.r5#5.0.0
└── packages.ini

 ```

#####   Validationを実施するユーザのホームディレクトリ（ユーザディレクトリ）のトップ位置に、ドットで始まる.fhirというフォルダがなければ作成する。（前項でダウンロードしたパッケージ群はすべて、.fhirフォルダに移動する必要があるため、そのためのフォルダを作成する）
既に.fhirというフォルダが存在する場合＊には、別名のフォルダに変えて保存しておいた上で、新たに.fhirを作成する。ドットで始まるファイルやフォルダは通常は非表示となっているため、Windows ファイルエクスプロラーではフォルダ表示オプションを変更して、隠しファイルを表示するモードに変更しておく。MacOSのFinderでは、[コマンドキー]＋[Shiftキー]＋[ドットキー]を押して隠しファイル表示モードに変更しておく。また、いずれのOSの場合も、これとは別に、ファイルの拡張子表示をONにして作業するのがわかりやすい。<br><br>＊注：.fhirというフォルダが存在するのは、このコンピュータ上でFHIR関連のツール（sushiコマンド、validatoreコマンドなど）を動作させたことがあることを示している。その内容フォルダ名が同一でもその内容が異なる場合があるため、本Validation作業に使う.fhirフォルダと内容を混在させないように注意することが必要である。そのため、ここでは既存の.fhirフォルダは名前を変えて保存している。

#####   .fhirフォルダの中に、ダウンロード、解凍してできた上記packagesフォルダをpackagesフォルダごとすべてコピーする。
  以下のようになる。

```
.fhir
└── packages
    ├── hl7.fhir.r4.core#4.0.1
    ├── hl7.fhir.uv.extensions#1.0.0
    ├── hl7.fhir.uv.extensions.r4#1.0.0
    ├── hl7.fhir.xver-extensions#0.0.12
    ├── hl7.terminology#5.3.0
    ├── hl7.terminology.r5#5.0.0
    └── packages.ini

```
    
#####  Validation作業を行う起点となる作業フォルダを用意する。
ここでは [vwork] と書く。次に [vwork] 直下に、以下の３つのフォルダを作成する。フォルダ名は自由だが、ここでは以下のように　 [xxxx] 　と記載する。

  - 　IGパッケージを配置するフォルダ [pkgSample]
  -  検証対象となるJONSファイルを配置するフォルダ [targets]
  -  公式validatorのjarファイルを配置するフォルダ [prog]


#####  IGパッケージ群を [pkgSample] 直下にダウンロードする。

以下の３つのパッケージをOS種別にかかわらずダウンロードしする。(Windowsの場合も拡張子tgzのファイル）。ダウンロード後の解凍はしない。なお、ファイル名中のr4-x.x.xのバージョン番号部分はダウンロード時期により異なる。

  - jp-core.r4　パッケージ

    - tgz形式 : [https://jpfhir.jp/fhir/core/1.1.2/jp-core.r4-1.1.2.tgz](https://jpfhir.jp/fhir/core/1.1.2/jp-core.r4-1.1.2.tgz)

  - jpfhir-terminology.r4　パッケージ
      
    - tgz形式 : [https://jpfhir.jp/fhir/core/terminology/jpfhir-terminology.r4-1.1.1.tgz](https://jpfhir.jp/fhir/core/terminology/jpfhir-terminology.r4-1.1.1.tgz)
 　 
  - jp-sample.r4　パッケージ
      
    - tgz形式 : [https://jpfhir.jp/fhir/sample/jp-sample.r4-1.0.0.tgz](https://jpfhir.jp/fhir/sample/jp-sample.r4-1.1.1.tgz)

#####  検証対象となる json形式のファイルをひとつ以上、[targets] 直下に配置する。

直下ではなく、さらにサブフォルダを作成して配置してもよい。その場合には、以降では　[targets]　はそのサブフォルダを含めたパスであるとして読むこと。

#####  validatorをダウンロードし、[prog] 直下に配置する。
以下のリンクからvalidator_cli.jarファイルを[prog]フォルダにダウンロードする。
  - <https://github.com/hapifhir/org.hl7.fhir.core/releases/download/6.1.8/validator_cli.jar>
次にダウンロードしたプログラムのバージョンを明確にするため、ファイル名をvalidator_cli.jar から　validator_cli_6.1.8.jar に変更しておく。6.1.8　の部分はダウンロードしたバージョンに合わせること。

備考：
すべてのvalidatorバージョンは以下より各バージョンの項目の Assets からダウンロードできる。
  - [https://github.com/hapifhir/org.hl7.fhir.core/releases]

また、最新版validatorは以下のリンクからダウンロードできる。
  - [https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar]
 
しかし、更新の頻度は非常に多く、時には最新版にバグがあって、数日後に修正版がリリースされたりするため、ある程度安定した版で、動作確認がとれており、本仕様のValidationに問題がない過去のバージョンを使うことを勧める。<span style="color: blue;">ここでは、v6.1.8 (2023.9.21)版を採用している</span>ので、特に今後の変更記載がなく、他に理由がない限りこのバージョンをダウンロードすることを勧める。


##### Java実行環境の整備

  - Validationは、前項でダウンロードした、Java言語により開発されたプログラム　validator_cli_6.1.8.jar　をJava -jarコマンドで実行する。
対応するJavaのバージョンはJava 17（以降）である。
    - コンピュータに Java 17がインストールされていない場合には、Webサイトなどの情報を参考にしてJava 17 のRuntime環境をインストールし、コマンドプロンプト（Windowsの場合）、またはターミナル（MacOSの場合）などの上でJavaコマンドが実行できるようにしておくこと。
    - Javaのバージョン確認は、java --version コマンドで行う。以下は表示例であり、Java 17以上であることを確認する。
        java 17.0.5 2022-10-18 LTS
        Java(TM) SE Runtime Environment (build 17.0.5+9-LTS-191)


#### 手順（Validation編）

以降では、Validationの手順を説明する。

Validation の実行

  - 実行コマンド例
    [vwork] フォルダに位置した状態で、以下を途中で改行せず、１行で入力する。
    
    (行末の\は次行との継続の意味でいれてある記号である。１行で入力するので不要であれば削除すること)。適宜、バッチファイル（スクリプトファイル）を作成するとよい。

```  bash
 java -jar [prog]/validator_cli_6.1.8.jar \
    [targets]/*.json \
      -version 4.0.1 \
      -language ja   \
      -locale ja-JP  \
      -want-invariants-in-messages   \
      -no-extensible-binding-warnings   \
      -display-issues-are-warnings    \
      -level warnings   \
      -best-practice ignore \
      -tx n/a  \
      -ig [pkgSample]/jp-core.r4-1.1.2.tgz  \
      -ig [pkgSample]/jpfhir-terminology.r4-1.1.1.tgz  \
      -ig [pkgSample]/jp-sample.r4-1.0.0.tgz  
        
```

上記のパラメータの説明は以下のとおり。


Validationコマンドのパラメータ説明


  - -[targets]/*.json : Validation対象とするFHIR JSONファイル。[targets]フォルダ内にあるすべてのjsonファイルを指定する例。
    明示的に複数のファイルを指定する場合には、例えば、
      [targets]/jppartient.json  [targets]/jpobservation001.json などのように空白であけて複数を指定する。
      現在の [vwork] からの相対パス、または絶対パスで各ファイルのパスを指定する。
  - -version 4.0.1 : 適用するFHIRの基底仕様のバージョン。4.0.1を固定で指定する。

  - -language ja : Terminology (CodeSystem, ValueSet)のvalidation時の言語環境を指定する。 jaを固定で指定する。
  - -locale ja-JP : Validation結果のメッセージの言語を指定する。英語のままでよい場合には、このオプション自体を削除すること。
  - -want-invariants-in-messages : Profileの制約だけでは記述できない制約ルールのうち、invariantsで記述された制約ルールによる警告やエラーの結果を出力するよう設定するオプション。。あったほうが、どのような制約ルールに抵触したかわかりやすい。
  - -no-extensible-binding-warnings : FHIR基底仕様において拡張が許可されているValueSetにバインディングされている要素に、別のValueSetを使用した場合に警告を出さないよう設定するオプション。あったほうが、無視できる警告を省略できる。
  - -display-issues-are-warnings : 標準コードに対応する表示文字列がCodeSystemに登録されているdisplayと違っている場合に、Errorにせず、警告にする設定オプション。さまざまな理由で表示の不一致はやむを得ないことが多いため、エラーにせず注意にとどめることにする。
  - -level warnings : 警告とErrorだけ出力し、参考情報は出力しない設定オプション。
  - -best-practice ignore : FHIR基底仕様においてベストプラクティスとされる推奨事項に違反している場合の警告を出さないオプション。
  - -tx n/a ：　外部のTerminologyServer を参照しないよう設定するオプション。ここでの手順では、パッケージ [jpfhir-terminology-1.1.1]をロードしてローカルに配置しているので、外部のTerminologyServerへの参照は必要がない。
  - -ig [pkgSample]/jp-core.r4-1.1.2.tgz : jp-core.r4 v1.1.2 のパッケージ。必須。これがないとjp-coreを参照する際にエラーになる。
  - -ig [pkgSample]/jpfhir-terminology-1.1.1.tgz ： jp-core.r4、jp-sampleから参照されるterminologyのパッケージ。必須。これがないと日本版CodeSystemやValueSetを参照する際にエラーになる。このパッケージには、JLAC10、医薬品マスター、標準病名マスター、ICD10分類コード表なども含まれるので、定期的に適切なバージョンへのアプデートが必要である。
  - -ig [pkgSample]/jp-sample.r4-1.0.0.tgz : 電子カルテ情報共有サービスで送信される６情報と、BundleリソースのValidationのためのプロファイル等を格納したパッケージ。必須。なお、３文書のパッケージは別にある。

####  Validationの出力例の解説


これらのJSONファイルと [targets]フォルダ内に配置して　*.jsonを指定することにより実行する。

実行コマンド例：

``` {.copy} 
java -jar ../work/validator_cli_6.1.8.jar ExampleJson/*.json -version 4.0.1  -language ja  \
 -ig pkgValidation/jp-core.r4#1.1.2.tgz -ig pkgValidation/jpfhir-terminology#1.1.1.tgz \
 -ig pkgValidation/jp-sample.r4-1.0.0.tgz -locale ja-JP -tx n/a  -want-invariants-in-messages  \
 -no-extensible-binding-warnings  -display-issues-are-warnings   -level warnings  \
 -best-practice ignore
```

