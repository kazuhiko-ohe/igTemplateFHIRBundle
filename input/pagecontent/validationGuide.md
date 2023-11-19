

### 電子カルテ情報共有サービス（CLINS）における６情報とBundleリソースデータのValidation方法について

ここでのCLINS Validationとは、本仕様(JP CLINS IG)にもとづいて作成されたデータファイル（JSON形式）が、仕様の各Profile に準拠しているかをFHIR公式Validatorを使用して検証することである。なお、３文書のValidationは別に文書ごとにIGがあるため、別に記載する。

CLINS Validationの具体的手順と、出力の解釈方法について説明する。ただし、対象となるデータにあるさまざまなエラーや多様な記述方法によって、出力されるメッセージは多岐にわたるため、ここではその一部の例を示すに過ぎない。今後、順次説明を追加している予定である。

ここでのValidation手順は、手順（準備編）を完了すれば、

#### 手順（準備編）

##### CLINS検証用FHIRコアパッケージ　を 以下のサイトからどちらかの圧縮形式のファイルをダウンロードする。解凍後の内容は同一である。


    - zip形式 : https://jpfhir.jp/fhir/clins/pkgValidation/fhir-core-pkg.zip （42MB）
    - tgz形式 : https://jpfhir.jp/fhir/clins/pkgValidation/fhir-core-pkg.tgz （28MB）

#####  ダウンロードしたCLINS検証用FHIRコアパッケージを、適当なフォルダ内で解凍する。


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

#####   Validationを実施するユーザのホームディレクトリ（ユーザディレクトリ）のトップ位置に、ドットで始まる.fhirというフォルダがなければ作成する。
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

  -  CLINS検証用パッケージを配置するフォルダ [pkgClins]
  -  検証対象となるJONSファイルを配置するフォルダ [targets]
  -  公式validatorのjarファイルを配置するフォルダ [prog]


#####  CLINS検証用パッケージ群を [pkgClins] 直下にダウンロードする。

以下の３つのパッケージをOS種別にかかわらずダウンロードしする。(Windowsの場合も拡張子tgzのファイル）。ダウンロード後の解凍はしない。なお、ファイル名中のr4-x.x.xのバージョン番号部分はダウンロード時期により異なる。

  - jp-core.r4　パッケージ

    - tgz形式 : [https://jpfhir.jp/fhir/core/1.1.2/jp-core.r4-1.1.2.tgz](https://jpfhir.jp/fhir/core/1.1.2/jp-core.r4-1.1.2.tgz)

  - jpfhir-terminology.r4　パッケージ
      
    - tgz形式 : [https://jpfhir.jp/fhir/core/terminology/jpfhir-terminology.r4-1.1.1.tgz](https://jpfhir.jp/fhir/core/terminology/jpfhir-terminology.r4-1.1.1.tgz)
 　 
  - jp-clins.r4　パッケージ
      
    - tgz形式 : [https://jpfhir.jp/fhir/clins/jp-clins.r4-0.9.7.tgz](https://jpfhir.jp/fhir/clins/jp-clins.r4-0.9.7.tgz)

#####  検証対象となる json形式のファイルをひとつ以上、[targets] 直下に配置する。

直下ではなく、さらにサブフォルダを作成して配置してもよい。その場合には、以降では　[targets]　はそのサブフォルダを含めたパスであるとして読むこと。

#####  validatorをダウンロードし、[prog] 直下に配置する。
以下のリンクからvalidator_cli.jarファイルを[prog]フォルダにダウンロードする。
  - <https://github.com/hapifhir/org.hl7.fhir.core/releases/download/6.1.8/validator_cli.jar>
次にダウンロードしたプログラムのバージョンを明確にするため、ファイル名をvalidator_cli.jar から　validator_cli_6.1.8.jar に変更しておく。6.1.8　の部分はダウンロードしたバージョンに合わせること。

備考：
すべてのバージョンは以下より各バージョンの項目の Assets からダウンロードできる。
  - [https://github.com/hapifhir/org.hl7.fhir.core/releases]

また、最新版は以下のリンクからダウンロードできる。
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
      -ig [pkgClins]/jp-core.r4-1.1.2.tgz  \
      -ig [pkgClins]/jpfhir-terminology.r4-1.1.1.tgz  \
      -ig [pkgClins]/jp-clins.r4-0.9.7.tgz  
        
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
  - -ig [pkgClins]/jp-core.r4-1.1.2.tgz : jp-core.r4 v1.1.2 のパッケージ。必須。これがないとjp-coreを参照する際にエラーになる。
  - -ig [pkgClins]/jpfhir-terminology-1.1.1.tgz ： jp-core.r4、jp-clinsから参照されるterminologyのパッケージ。必須。これがないと日本版CodeSystemやValueSetを参照する際にエラーになる。このパッケージには、JLAC10、医薬品マスター、標準病名マスター、ICD10分類コード表なども含まれるので、定期的に適切なバージョンへのアプデートが必要である。
  - -ig [pkgClins]/jp-clins.r4-0.9.7.tgz : 電子カルテ情報共有サービスで送信される６情報と、BundleリソースのValidationのためのプロファイル等を格納したパッケージ。必須。なお、３文書のパッケージは別にある。

####  Validationの出力例の解説

以下では、本IGに含まれる以下のサンプルファイルを対象に一括Validationを行った例を示す。
  - JP-Condition-CLINS-eCS-01
  - JP-Condition-CLINS-eCS-02
  - JP-MedReq-ExtAnus-AsNeeded-Total1
  - JP-MedReq-ExtSkin-Total2
  - JP-MedReq-PO-BID-10days-AsNeeded
  - Observation-ErrorExample-ObsLabo-eGFR
  - Observation-Example-ObsLabo-Alb
  - Observation-Example-ObsLabo-K
  - Patient-standard-ErrorInsuranceNo
  - Patient-standard

これらのJSONファイルと [targets]フォルダ内に配置して　*.jsonを指定することにより実行する。

実行コマンド例：

``` {.copy} 
java -jar ../work/validator_cli_6.1.8.jar ExampleJson/*.json -version 4.0.1  -language ja  \
 -ig pkgValidation/jp-core.r4#1.1.2.tgz -ig pkgValidation/jpfhir-terminology#1.1.1.tgz \
 -ig pkgValidation/jp-clins.r4-0.9.7-diff.tgz -locale ja-JP -tx n/a  -want-invariants-in-messages  \
 -no-extensible-binding-warnings  -display-issues-are-warnings   -level warnings  \
 -best-practice ignore
```

出力結果を、説明の便宜上、[環境準備フェーズ]、[対象ファイルValidation途中フェーズ]、[結果報告フェーズ]の３つのブロックに分けて示す。


#####  環境準備フェーズ

説明作成中


```

FHIR Validation tool Version 6.1.8 (Git# 8413995d8bcf). Built 2023-09-21T19:52:22.833Z (54 days old)
  Java:   17.0.5 from /Library/Java/JavaVirtualMachines/jdk-17.0.5.jdk/Contents/Home on aarch64 (64bit). 4096MB available
  Paths:  Current = /Users/kohe/clinsVTest, Package Cache = /Users/kohe/.fhir/packages
  Params: Targets/Condition-Example-JP-Condition-CLINS-eCS-01.json Targets/Condition-Example-JP-Condition-CLINS-eCS-02.json Targets/MedicationRequest-Example-JP-MedReq-ExtAnus-AsNeeded-Total1.json Targets/MedicationRequest-Example-JP-MedReq-ExtSkin-Total2.json Targets/MedicationRequest-Example-JP-MedReq-PO-BID-10days-AsNeeded.json Targets/Observation-ErrorExample-ObsLabo-eGFR.json Targets/Observation-Example-ObsLabo-Alb.json Targets/Observation-Example-ObsLabo-K.json Targets/Patient-Example-Patient-standard-ErrorInsuranceNo.json Targets/Patient-Example-Patient-standard.json -version 4.0.1 -language ja -locale ja-JP -want-invariants-in-messages -no-extensible-binding-warnings -display-issues-are-warnings -level warnings -best-practice ignore -tx n/a -ig pkgClins/jp-core.r4-1.1.2.tgz -ig pkgClins/jpfhir-terminology.r4-1.1.1.tgz -ig pkgClins/jp-clins.r4-0.9.7.tgz
  Locale: 日本/JP
  Jurisdiction: Japan
Loading
  Load FHIR v4.0 from hl7.fhir.r4.core#4.0.1 - 4576 resources (00:03.302)
  Load hl7.fhir.uv.extensions.r4#1.0.0 - 1328 resources (00:01.331)
  Load hl7.terminology#5.3.0 - 4201 resources (00:00.704)
  Load hl7.terminology.r5#5.0.0 - 4174 resources (00:00.566)
  Load hl7.fhir.uv.extensions#1.0.0 - 1328 resources (00:00.840)
  Terminology server null - Version n/a: No Terminology Server (00:00.000)
  Load pkgClins/jp-core.r4-1.1.2.tgz - 159 resources (00:00.197)
  Load pkgClins/jpfhir-terminology.r4-1.1.1.tgz - 175 resources (00:03.988)
  Load pkgClins/jp-clins.r4-0.9.7.tgz - 148 resources (00:00.081)
  Package Summary: [hl7.fhir.r4.core#4.0.1, hl7.fhir.xver-extensions#0.0.12, hl7.fhir.uv.extensions.r4#1.0.0, hl7.terminology#5.3.0, hl7.terminology.r5#5.0.0, hl7.fhir.uv.extensions#1.0.0]
  Get set...  go (00:01.131)
```

#####  対象ファイルValidation途中フェーズ　


説明作成中

```

Validating
  Validate Targets/Condition-Example-JP-Condition-CLINS-eCS-01.json
Validate Condition against http://hl7.org/fhir/StructureDefinition/Condition|4.0.1..........20..........40..........60..........80.........|
Validate Condition against http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Condition_eCS..........20..........40..........60..........80..........100|
 00:00.791
   :
  中略
   :
  Validate Targets/Patient-Example-Patient-standard.json
Validate Patient against http://hl7.org/fhir/StructureDefinition/Patient|4.0.1..........20..........40..........60..........80.........|
Validate Patient against http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Patient_eCS..........20..........40..........60..........80..........100|
 00:00.016
Done. Times: Loading: 00:12.264, validation: 00:01.189 (#10). Memory = 1Gb

```

#####  結果報告フェーズ

説明作成中


```

-- ExampleJson/Condition-Example-JP-Condition-CLINS-eCS-01.json --------------------------------------------------------------------
Success: 0 errors, 0 warnings, 1 notes
  Information: すべてOK
------------------------------------------------------------------------------------------------------------------------------------

-- ExampleJson/Condition-Example-JP-Condition-CLINS-eCS-02.json --------------------------------------------------------------------
Success: 0 errors, 2 warnings, 0 notes
  Warning @ Condition.code.coding[0] (line 104, col8): http://jpfhir.jp/fhir/core/mhlw/CodeSystem/ICD10-2013-full#C169 の誤ったdisplay '胃の悪性新生物＜腫瘍＞，胃，部位不明' - 1 の選択肢のうちの一つであるべきです: '胃，部位不明' (言語 'ja' のため) for 'http://jpfhir.jp/fhir/core/mhlw/CodeSystem/ICD10-2013-full#C169'
  Warning @ Condition.code.coding[0] (line 104, col8): http://jpfhir.jp/fhir/core/mhlw/CodeSystem/ICD10-2013-full#C169 の誤ったdisplay '胃の悪性新生物＜腫瘍＞，胃，部位不明' - 1 の選択肢のうちの一つであるべきです: '胃，部位不明' (言語 'ja' のため)
------------------------------------------------------------------------------------------------------------------------------------

-- ExampleJson/MedicationRequest-Example-JP-MedReq-ExtAnus-AsNeeded-Total1.json ------------------------------------------------------------------------------------
Success: 0 errors, 4 warnings, 0 notes
  Warning @ MedicationRequest.medication.ofType(CodeableConcept).coding[0] (line 158, col8): urn:oid:1.2.392.200119.4.403.1#104937401 の誤ったdisplay '新レシカルボン坐剤' - 1 の選択肢のうちの一つであるべきです: '新レシカルボン坐剤・ゼリア新薬' (ja) (言語 'ja' のため) for 'urn:oid:1.2.392.200119.4.403.1#104937401'
  Warning @ MedicationRequest.medication.ofType(CodeableConcept) (line 156, col4): urn:oid:1.2.392.200119.4.403.1#104937401 の誤ったdisplay '新レシカルボン坐剤' - 1 の選択肢のうちの一つであるべきです: '新レシカルボン坐剤・ゼリア新薬' (ja) (言語 'ja' のため)
  Warning @ MedicationRequest.medication.ofType(CodeableConcept).coding[0] (line 158, col8): urn:oid:1.2.392.200119.4.403.1#104937401 の誤ったdisplay '新レシカルボン坐剤' - 1 の選択肢のうちの一つであるべきです: '新レシカルボン坐剤・ゼリア新薬' (ja) (言語 'ja' のため)
  Warning @ MedicationRequest.medication.ofType(CodeableConcept).coding[1].system (line 165, col80): URL値 'http://jpfhir.jp/fhir/clins/CodeSystem/DrugCode/19911234567' は解決できません
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ExampleJson/MedicationRequest-Example-JP-MedReq-ExtSkin-Total2.json ---------------------------------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ MedicationRequest.medication.ofType(CodeableConcept).coding[0].system (line 131, col80): URL値 'http://jpfhir.jp/fhir/clins/CodeSystem/DrugCode/19911234567' は解決できません
--------------------------------------------------------------------------------------------------------------------------------------------------

-- ExampleJson/MedicationRequest-Example-JP-MedReq-PO-BID-10days-AsNeeded.json -----------------------------------------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ MedicationRequest.medication.ofType(CodeableConcept).coding[0].system (line 163, col80): URL値 'http://jpfhir.jp/fhir/clins/CodeSystem/DrugCode/19911234567' は解決できません
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ExampleJson/Observation-ErrorExample-ObsLabo-eGFR.json --------------------------------------------------------------
*FAILURE*: 1 errors, 0 warnings, 0 notes
  Error @ Observation.code (line 35, col4): Observation.code.coding:localLaboCode: 最小必要値 = 1、見つかった値 = 0 (from http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Observation_LabResult_eCS)
------------------------------------------------------------------------------------------------------------------------

-- ExampleJson/Observation-Example-ObsLabo-Alb.json --------------------------------------------------------
Success: 0 errors, 1 warnings, 0 notes
  Warning @ Observation.code.coding[0].system (line 51, col94): URL値 'http://jpfhir.jp/fhir/clins/CodeSystem/JP_CLINS_ObsLabResult_LocalCode_CS' は解決できません
------------------------------------------------------------------------------------------------------------

-- ExampleJson/Observation-Example-ObsLabo-K.json ------------------------------------------------------
Success: 0 errors, 4 warnings, 0 notes
  Warning @ Observation.code.coding[2] (line 60, col8): urn:oid:1.2.392.200119.4.504#3H015000002326101 の誤ったdisplay 'K' - 1 の選択肢のうちの一つであるべきです: 'カリウム_血清_電位差測定_定量値' (言語 'ja' のため) for 'urn:oid:1.2.392.200119.4.504#3H015000002326101'
  Warning @ Observation.code (line 48, col4): urn:oid:1.2.392.200119.4.504#3H015000002326101 の誤ったdisplay 'K' - 1 の選択肢のうちの一つであるべきです: 'カリウム_血清_電位差測定_定量値' (言語 'ja' のため)
  Warning @ Observation.code.coding[0].system (line 51, col94): URL値 'http://jpfhir.jp/fhir/clins/CodeSystem/JP_CLINS_ObsLabResult_LocalCode_CS' は解決できません
  Warning @ Observation.code.coding[2] (line 60, col8): urn:oid:1.2.392.200119.4.504#3H015000002326101 の誤ったdisplay 'K' - 1 の選択肢のうちの一つであるべきです: 'カリウム_血清_電位差測定_定量値' (言語 'ja' のため)
--------------------------------------------------------------------------------------------------------

-- ExampleJson/Patient-Example-Patient-standard-ErrorInsuranceNo.json --------------------------------------------------------------------------
*FAILURE*: 1 errors, 0 warnings, 0 notes
  Error @ Patient (line 1, col2): Rule valid-value-insurance-patientIdentifier: 'identifier.value 被保険者識別子情報の形式は、"保険者等番号:被保険者記号:被保険者番号:被保険者証等枝番"で、それぞれ半角英数字8桁固定、半角または全角文字列(空白を含まない)、半角または全角文字列(同)、半角数字2桁固定(1文字目は0)であり、それぞれ存在しない場合には、空文字列とする。' Failed (defined in http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Patient_eCS) (inv = ((identifier.where(system = 'http://jpfhir.jp/fhir/eCS/Idsysmem/JP_Insurance_memberID').count() = 1) and identifier.where(system = 'http://jpfhir.jp/fhir/eCS/Idsysmem/JP_Insurance_memberID').value.matches('^[0-9]{8}:[^:^\\s^\u3000]*:[^:^\\s^\u3000]*:0[0-9]$'))) (log:  (inv = ((identifier.where(system = 'http://jpfhir.jp/fhir/eCS/Idsysmem/JP_Insurance_memberID').count() = 1) and identifier.where(system = 'http://jpfhir.jp/fhir/eCS/Idsysmem/JP_Insurance_memberID').value.matches('^[0-9]{8}:[^:^\\s^\u3000]*:[^:^\\s^\u3000]*:0[0-9]$'))))
------------------------------------------------------------------------------------------------------------------------------------------------

-- ExampleJson/Patient-Example-Patient-standard.json ---------------------------------------------------------
Success: 0 errors, 0 warnings, 1 notes
  Information: すべてOK
--------------------------------------------------------------------------------------------------------------

Done. Times: Loading: 00:17.636, validation: 00:18.173 (#10). Max Memory = 4Gb

```

