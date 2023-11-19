<style type="text/css">

table {
border: solid 1px black;
border-collapse: collapse;
}
 
table td {
border: solid 1px black;

}

table th {
border: solid 1px black;
}
 h1 {
counter-reset: chapter;
}

h2 {
counter-reset: sub-chapter;
}

h3 {
counter-reset: section;
}

h4 {
counter-reset: sub-section;
}

h5 {
counter-reset: composite;
}

h6 {
counter-reset: sub-composite;
}

h1:before {
color: black;
counter-increment: bchapter;
content:" ";
}

h2:before {
color: black;
counter-increment: chapter;
content: counter(chapter) ". ";
}

h3:before {
color: black;
counter-increment: sub-chapter;
content: counter(chapter) "."counter(sub-chapter) ". ";
}


h4:before {
color: black;
counter-increment: section;
content: counter(chapter) "."counter(sub-chapter) "."counter(section) " ";
}

h5:before {
color: black;
counter-increment: sub-section;
content: counter(chapter) "."counter(sub-chapter) "."counter(section) "."counter(sub-section) " ";
}

h6:before {
color: black;
counter-increment: sub-sub-section;
content: "　　"counter(sub-sub-section) "）";
}

</style>

# **リソース記述に関する表** 
**退院時サマリーHL7 FHIR記述仕様　第1版<br>診療情報提供書HL7FHIR記述仕様　 第1版（共通）** R1.001

**本表における****C****odeableConcept****型要素の略記法について**
リソースに出現するCodeableConcept型の要素は以下のような構造をとる。

|要素<br>Lv1|要素<br>Lv2|要素<br>Lv3|要素<br>Lv4|多重度|型 |値|説明|
|--|--|--|--|--|--|--|--|
|要素名 | | | |0..1|CodeableConcept||文書カテゴリ|
| |coding | | |0..\* |Coding ||表現したいコンセプトのコード記述。繰り返しにより複数のコード体系によるコーディングで記述できる。|
| | |system | |1..1|uri|"http:....."|コード体系。|
| | |code | |1..1|code |"B0EF"|コード。|
| | |display| |0..1|string |"持続腹痛"|コード体系におけるコードに対応するの表示名|
| |text | | |0..1|string |"長く続く腹部の痛み"|表現したいコンセプトのテキスト記述|

しかし、表を見やすくするため、この文書では、これを次のように1行で省略表記する。値の欄は、4つの行（子要素）に使う値を列挙するが、省略することもある。多重度の記載は、1段目にCodeableConcept型の要素自体の多重度、2段目にその子要素codingの多重度を転記している。
リソースに出現するCodeableConcept型の要素は以下のような構造をとる。

|要素名| | | |多重度|型 |値|説明|
|--|--|--|--|------|-----|----------|-------------------------|
|要素名| | | |0..1<BR>0..\*|CodeableConcept|"http:....."<BR>"00"<BR>"持続腹痛"<BR>"長く続く腹部の痛み"||

なお、codingの多重度の最小値が0（すなわち省略可能）の場合には、コードによる記述をせず、テキストだけで記述することも許されている。

<br><br><br>

# <a id="tbl-1">**表1　AllergyIntoleranceリソース　アレルギー情報**</a>


|要素<br>Lv1|要素<br>Lv2|要素<br>Lv3 |要素<br>Lv4 |多重度|型|値|説明 |
|---|---|---|---|---|---|---|---|
|resourceType|||||"AllergyIntolerance" |**AllergyIntolerance**リソースであることを示す |
|meta| |||1..1|Meta| | |
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile|||0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_AllergyIntolerance_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。|
|text| |||0..1|Narrative | |本リソースをテキストで表現したものを入れてもよい。入れる場合には、以降のリソースからシステムにより自動生成されたものに限ること。 |
||status |||1..1|code|"generated"|固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。 |
||div|||1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt;|値は例示。 |
|identifier| |||0..1\*|Identifier| |このアレルギー情報に付番されたID |
||system |||1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" | |
||value|||1..1||"1311234567-2020-00123456" |アレルギー情報IDの文字列。値は例示。 |
|clinicalStatus| |||0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"<br>"active"|臨床的状態のステータス。コードで記述する場合にはsyetem値は固定値。clinicalStatus.text のみで記述することもできる。。active \| inactive \| resolved現存、非現存、解消 |
|verificationStatus| |||0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"<br>"confirmed" |入力された臨床的状態に対する検証状況を示す。確からしさと考えられる。コードで記述する場合にはsystem値は固定値。verificationStatus.text のみで記述することもできる。。unconfirmed \| confirmed \| refuted \| entered-in-error未確認、確認ずみ、否定、エラー |
|type| |||0..1|code| "allergy" |副反応の生理的なメカニズムの種類（アレルギーによるものか不耐性によるものかどうか）。記述する場合は、コード表："http://hl7.org/fhir/allergy-intolerance-type"allergy \| intoleranceアレルギー反応、不耐性反応|
|category| |||0..1\*|code|"food" |特定された原因物質のカテゴリ。記述を可能な限り推奨する。コード表："http://hl7.org/fhir/allergy-intolerance-category"food \| medication \| environment \| biologic食物、医薬品、環境、生物学的 |
|cliticality | |||0..\* |code|"high" |潜在的な臨床的危険性、致命度。記述する場合は、コード表："http://hl7.org/fhir/allergy-intolerance-criticality"low \| high \| unable-to-assess低、高、評価不能 |
|code| |||1..1|CodeableConcept |http://jpfhir.jp/fhir<br>/core/CodeSystem/JP_JfagyFoodAllergen_CS  "J7F7311990"<br>"牛乳・乳製品（詳細不明）"|アレルギー・不耐反応の対象物の情報。jp-coreで定めるallergy-substanceコード表のコードを推奨する。コード化できない場合には、code.text のみで記述する。code.textは必須である。<br>使用するコード表（推奨）：<br>http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyFoodAllergen_CS 　（食物アレルギー）http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyMedicationAllergen_CS　（医薬品アレルギー）http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyNonFoodNonMedicationAllergen_CS　（その他のアレルギー）<br>のいずれかを使用できる。|
|patient | |||1..1|Reference(Patient)|"urn: ....." |対象となる患者リソースへの参照。 |
|encounter | |||0..1|Reference (Encounter) |"urn: ....." |このアレルギ情報が確認され記録された受診情報（入院詳細情報または外来受診情報）への参照.Encounterリソースのインスタンスを参照することでよい。 |
|(onset) | ||||（dateTime、Age、Period、Range、string）のいずれかの型をとる。| |このアレルギー・不耐性状態が同定された時期。5通りのいずれかの要素（onsetDateTime、onseAge、onsetPeriod、onsetRange、onsetString）ひとつを選択して、それにより記述する。複数を選択はできない。onset要素は記述しないで、直接onsetDateTime要素のレベルを記述する。|
||onsetDateTime|||0..1|dateTime| |日付または日時。年や年月だけでもよい。例：2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17+09:00。時刻に24:00 の使用はできない。 |
||onseAge|||0..1|Age | |年齢。患者の申告による、状態が出現し始めた年齢。 |
|| |value |||decimal |"50" |年齢の値。 |
|| |comparator|||code|"&gt;="|要素valueの値の解釈方法。<br>等しい場合には、= は不要。そうでない指定をしたい場合には、&lt; 、 &lt;=、 &gt;= 、 &gt;　のいずれか。<br>例では、「50歳以上で」と記述したい場合には、&gt;= を記述する。 |
|| |unit|||string|"歳" |単位表現 |
|| |system|||uri |"http://unitsofmeasure.org"|単位体系 UCUMコード体系。固定値。|
|| |code|||code|"a"|単位体系における単位コード。コードと意味min：minutesh：hoursd：dayswk：weeksmo：monthsa：years |
||onsetPeriod|||0..1|Preiod| |期間。 |
|| |start ||0..1|DateTime| |期間の開始日時 |
|| |end ||0..1|DateTime| |期間の終了日時 |
||onsetRange |||0..1|Range | |曖昧な時期を最小値と最大値とで記述する。以下の記述例は50歳台。 |
|| |low ||0..1|| | |
|| ||value ||decimal |"50" |年齢の値。 |
|| ||unit||string|"歳" |単位表現 |
|| ||system||uri |"http://unitsofmeasure.org"|単位体系 UCUMコード体系。固定値。|
|| ||code||code|"a"|単位体系における単位コード。コードと意味a：years |
|| |high||0..1|| | |
|| ||value ||decimal |"59" |年齢の値。 |
|| ||unit||string|"歳" |単位表現 |
|| ||system||uri |"http://unitsofmeasure.org"|単位体系 UCUMコード体系。固定値。|
|| ||code||code|"a"|単位体系における単位コード。コードと意味a：years |
||onsetString|||0..1|string|"50歳台" |文字列表現 |
|recordedDate| |||0..1|dateTime| |この状態が最初に記録された日時。 |
|recorder| |||0..1|Reference(Practitioner \| PractitionerRole \| Patient \| RelatedPerson)| |この状態を記録した人情報への参照。 |
|asserter| |||0..1|Reference(Practitioner \| PractitionerRole \| Patient \| RelatedPerson)| |この状態があると確認（主張）した人情報への参照。 |
|lastOccurrence| |||0..1|dateTime| |最後（直近）に知られている発生日時 |
|note| |||0..\* || |状態に関する追加的な情報で他の要素で記述できないような情報。 |
||author ||||| | |
|| |authorString||0..1|string|"看護担当者" |記載者氏名などの文字列。必ずしも氏名でなくてもよい。 |
||time |||0..1|dateTime| |この追加的な情報が作成された日時。 |
||text |||1..1|markdown| |追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。 |
|reaction| |||0..\* |BackboneElement | |対象物質に暴露したことに関連した有害反応の情報 |
||substance|||0..1|CodeableConcept |http://jpfhir.jp/fhir<br>/core/CodeSystem/JP_JfagyFoodAllergen_CS<br> "J7F7311154"<br>"モッツァレラチーズ" |有害反応イベントの原因であると考えられる特定の物質（または医薬品）。jp-coreで定めるallergy-substanceコード表のコードの使用で表現できる場合にはその使用を推奨する。<br>注：特定の反応の物質は、リスクの原因として特定された物質とは異なる場合があるが、それと一貫性がある必要がある。例えば、「reaction.substance」の物質は、**AllergyIntolerance** .code要素と比べて、より具体的な物質（例えば、ブランド薬）または特定された物質を含む複合製品であり得る。 **AllergyIntolerance** .code要素の記述（アレルギー・不耐反応の対象物の情報要素）のみを処理して「reaction.substance」の情報を無視しても、臨床的に安全でなければならない。このリソースを受信して処理するシステムが、もし「reaction.substance」と**AllergyIntolerance** .code要素の記述物質との意味的な包含関係を処理できないのであれば、システムはこの「reaction.substance」要素を無視しなければならない。|
||manifestation|||1..\* |CodeableConcept |"urn:oid:1.2.392.200119.4.101.6"<br>"B0EF"<br>"持続腹痛"<br>"長く続く腹部の痛み" |アレルギー反応に関連する症状や所見。system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。"BOEF"は、MEDIS標準病名マスター病名交換用コードで"持続腹痛"のコード。"持続腹痛"はそのテキスト記述の例。 |
||description|||0..1|string|"チーズを食べて1時間後から激しい腹痛と下痢がながく続いた。"|イベントの全体的な記述。 |
||onset|||0..1|dateTime|"2010-01-02" |関連する症状や所見が見られた日時。 |
||severity |||0..1|code|"severe" |反応の激しさ程度。コード表：http://hl7.org/fhir/reaction-event-severitymild \| moderate \| severe軽度、中等度、強度|
||exposureRoute|||0..1|CodeableConcept |"urn:oid:1.2.392.200250.2.2.20.40"<br>"10"<br>"内服経口"<br>"経口摂取" |物質の摂取経路の情報。JAMI標準用法の投与経路コード表（JAMI 用法コード表基本用法2桁コードに相当）を使用する。 |
||note |||0..\* || |他のフィールドで記述できないイベントに関するテキスト記述 |
|| |author||0..1|| |記載者の情報 |
|| ||authorString|0..1|string|"患者の母親" |記載者氏名などの文字列。必ずしも氏名でなくてもよい。 |
|| |time||0..1|dateTime| |この追加的な情報が作成された日時。 |
|| |text||1..1|markdown| |追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。 |

<br><br><br>

# <a id="tbl-2">**表2 Binaryリソース　 バイナリーデータ情報** </a>

|要素Lv1|要素Lv2|多重度|型|値|説明|
|-----|--|------|----|---|------------------------------------------------------------------------|
|meta||1..1|Meta| ||
||lastUpdated|1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
|resourceType | |||"Binary"|**Binary**リソースであることを示す。基底プロファイルのままで使用するためmeta.profile要素は不要。|
|contentType| |1..1|code||Mime-type コード。https://www.iana.org/assignments/media-types/media-types.xhtml 参照。コード仕様："urn:ietf:bcp:13"|
|securityContext| |0..1|Reference(Any)||アクセス制御を実施するときにプロキシとして使用する別のリソースを指定。通常不要。|
|data | |1..1|base64Binary||実際のコンテンツ、base64でエンコード。コンテンツタイプ自体が元々base64エンコーディングである場合、2回base64エンコードされることになる。コンテンツのbase64を解除して作成されるものは、Mime-typeコードで指定されたコンテンツタイプである必要がある。|

<br><br><br>

# <a id="tbl-3">**表3　　Bundleリソース　文書情報** </a>

本表の略記法について
Bundleリソースに出現するentry要素は以下のような構造（fullUrlとResource本体）をとる。

|entry|||1..1|| |文書作成医療機関情報エントリ|
|-----|--|------|----|---|---|---|
| |fullUrl ||1..1|uri |"urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720"|エントリリスト内のリソースを一意に識別するためのUUID。値は例示。|
| |resource||1..1|Resource|**Organization**リソース |文書作成医療機関情報|

しかし、表を見やすくするため、この文書では、これを次のように1行で省略表記する。


|entry|||1..1||**Organization**リソース|文書作成医療機関情報エントリ|
|-----|--|------|----|---|------------------------------------------------------------------------|---|
||||||||


<br><br><br>

Bundleリソース

|要素Lv1 |要素Lv2|要素Lv3|多重度|型|値 |説明|
|-------|--|----|------|----------|-----------------------------------------------------------|------------------------------------------------|
|resourceType| | |||"Bundle" |**Bundle**リソースであることを示す|
|meta| | |1..1|Meta| ||
||lastUpdated||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| |1..*|canonical(StructureDefinition)|退院時サマリー：　"http://jpfhir.jp/fhir<br>/eDischargeSummary/StructureDefinition<br>/JP_Bundle_eDischargeSummary"診療情報提供書："http://jpfhir.jp/fhir<br>/eReferral/StructureDefinition<br>/JP_Bundle_eReferral"|本文書のプロファイルを識別するURLを指定する。値は固定。 |
|type| | |1..1|code|"document" |**Bundle**リソースがDocumentタイプであることを示す|
|timestamp | | |1..1|instant |"2021-02-01T13:28:17.239+09:00"|このリソースを生成した日時。時刻の精度はミリ秒とし、タイムゾーンを含めること。値は例示。|
|entry | | |1..1\*|BackboneElement |**Composition**リソース|**Bundle**に含まれる全リソースエントリの参照リスト。|
|entry | | |1..1\*|BackboneElement |**Patient**リソース|患者情報エントリ|
|entry | | |1..\* |BackboneElement |**Practitioner**リソース |文書作成責任者、文書法的責任者、紹介先医師、紹介元医師を記述するエントリー|
|entry | | |1..\* |BackboneElement |**Organization**リソース |文書作成機関、文書管理責任機関、紹介先医療機関、紹介先診療科、紹介元医療機関、紹介元診療科、入院前や退院先の所在施設などを記述するエントリー|
|entry | | |0..1\*|BackboneElement |**Encounter**リソース|入院詳細情報エントリ(入院時または入院時または退院時の詳細情報、紹介目的、入院理由を含む)|
|entry | | |1..\* |BackboneElement |**Condition**リソース|入院期間中の診断情報（入院詳細情報エントリから参照される）、傷病名、主訴、現病歴、既往歴、感染症情報、を記述するエントリ|
|entry | | |0..\* |BackboneElement |**AllergyIntolerance**リソース |アレルギー・不耐性反応情報エントリ|
|entry | | |0..\* |BackboneElement |**MedicationStatement**リソース|服薬情報エントリ|
|entry | | |0..\* |BackboneElement |**Observation**リソース|身体所見、社会歴・生活習慣、検査結果を記述するエントリー|
|entry | | |0..\* |BackboneElement |**FamilyMemberHistory**リソース|家族歴情報エントリ|
|entry | | |0..\* |BackboneElement |**MedicationRequest** リソース |入院時または退院時投薬指示情報エントリ|
|entry | | |0..\* |BackboneElement |**Bundle**(処方箋データ) リソース|入院時または退院時の処方箋エントリ|
|entry | | |0..\* |BackboneElement |**CarePlan**リソース |入院時または退院時の方針指示情報エントリ|
|entry | | |0..\* |BackboneElement |**Procedure**リソース|入院中治療情報、手術記録、輸血治療歴、処置治療歴エントリ|
|entry | | |0..\* |BackboneElement |**Imag****ing****Study**リソース |画像診断報告書を記述するエントリー|
|entry | | |0..\* |BackboneElement |**DiagnosticReport**リソース |各種診断・検査報告書を記述するエントリー|
|entry | | |0..\* |BackboneElement |**Device**リソース |医療機器（デバイス）の情報を記述するエントリー|
|entry | | |0..\* |BackboneElement |**DeviceUseStatement**リソース |医療機器情報エントリ|
|entry | | |0..\* |BackboneElement |**Immunization**リソース |予防接種歴情報エントリ|
|entry | | |0..\* |BackboneElement |**Consent**リソース|事前指示情報エントリ|
|entry | | |0..\* |BackboneElement |**ResearchStudy**リソース|参加している臨床研究を記述するエントリー|
|entry | | |0..\* |BackboneElement |**ResearchSubject**リソース|臨床研究参加情報エントリ|
|entry | | |0..\* |BackboneElement |**DocumentReference**リソース|添付文書情報、PDF情報エントリ |
|entry | | |0..\* |BackboneElement |**Related****Peson**リソース |関連する親族などの情報を記述するエントリー|
|entry | | |0..\* |BackboneElement |**Binary**リソース |備考情報があれば記述する。添付データ情報エントリ|
|signature | | |1..1|| |本書全体に対する署名情報。本書全体ではなく特定のセクション部分を除いた対象に対する署名のこともあり、運用ルールで定める。|
||type | |1..1\*|Coding| |バリューセット SignatureTypeCodes（http://hl7.org/fhir/ValueSet/signature-type） から、文書の作成者の署名であることを意味する"1.2.840.10065.1.12.1.1" を指定。|
|| |system |1..1|uri |"urn:iso-astm:E1762-95:2013" |固定値|
|| |code |1..1|code|"1.2.840.10065.1.12.1.1" |固定値|
||when | |1..1|instant |"2021-08-21T12:28:18.345+09:00"|署名が生成された時刻。精度はミリ秒とし、タイムゾーンを含めること。値は例示。|
||who| |1..1|Reference(Practitioner) | |署名者を表す文書**法的**責任者**Practitioner**リソースへの参照。|
|| |reference|1..1|string|"urn:uuid:195a292d-169a-5cc4-0e10-7a1c0d3fcb2b"|**Practitioner**リソースのfullUrl要素に指定されたUUIDを指定。値は例示。 |
||data | |1..1|base64Binary|"dCjftJeZ4CVP-mB92K28uhbUJU1p1r_wW1gFWFODjXk"|署名データ。値は例示。|


<br><br><br>

# <a id="tbl-4">**表4　 　CarePlanリソース　診療方針指示情報**</a>

|要素Lv1 |要素Lv2|要素Lv3|要素Lv4|多重度|型|値 |説明 |
|-------|--|--|--|------|---------------|-----------------------------|---------------------------------------------------------------|
|resourceType| | | |||"CarePlan" |**CarePlan**リソースであることを示す |
|meta| | | |1..1|Meta| | |
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| | |0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_CarePlan_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。|
|text| | | |0..1|Narrative | |本リソースをテキストで表現したものを入れてもよい。 |
||status | | |1..1|code|"generated"|固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。 |
||div| | |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt;|値は例示。 |
|identifier| | | |0..1\*|Identifier| |この情報に付番されたID |
||system | | |1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier"| |
||value| | |1..1||"1311234567-2020-00123456" |情報IDの文字列。値は例示。 |
|status| | | |1..1|code|"active" |プランのステータス。コード表："http://hl7.org/fhir/request-status"draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown　など。案、有効、保留、取消、完了、エラー、不明|
|intent| | | |1..1|code|"plan" |趣旨区分。コード表："http://hl7.org/fhir/request-intent"proposal \| plan \| order \| option提案\|計画\|指示\|オプション入院時または退院時の方針では、内容によりいずれにもなりうるので、適切なコードを適宜選択して使用する。|
|category| | | |0..1\*|CodeableConcept |"http://jpfhir.jp/fhir<br>/code/CodeSystem/care-plan-category"<br>"hospital-plan"または"discharge-plan"|プランのタイプ"hospital-plan"(入院中のプラン)、または"discharge-plan"(退院時のプラン)のいずれか固定値。|
|title | | | |1..1|string|入院時方針"、または"退院時の方針"|プランの標題名称。 |
|description | | | |1..1|string| |プランのサマリー。ここに具体的な内容を叙述的に記述する。 |
|subject | | | |1..1|Reference(Patient)| |患者を表す**Patient**リソースへの参照。|
|encounter | | | |0..1|Reference(Encounter)| |対象となる入院情報または退院情報を含む入院詳細情報 |
|period| | | |1..1|Period| |このプランがカバーする期間 |
||start| | |1..0|dateTime| |入院日または、退院日または退院日以降のこのプランのカバー開始日付。 |
||end| | |0..1|dateTime| |退院日または退院日以降のこのプランのカバー終了日付。通常省略されるが、ひき続き、次のプランに引き継ぐ場合には終了日付が入る。 |
|created | | | |0..1|dateTime| |このプランが最初に作成された日付 |
|author| | | |0..1|Reference(Practitioner) | |このプランの責任者情報への参照 |
|contributor | | | |0..\* |Reference(Practitioner\|PractitionerRole)| |このプランの内容提供者情報への参照のリスト。当面未使用。 |
|careTeam| | | |0..\* |Reference(CareTeam) | |このプランに関わるケアチーム情報への参照のリスト。当面未使用。 |


<br><br><br>

# <a id="tbl-5">**表5　　Compositionリソース　文書構成情報**</a>

本表の略記法について
Compositionリソースに出現するsection要素は以下のような構造をとる。

|section| | | |0..1 |BackboneElement|
|---|------|----|---|-----|-----|
| |title| | |0..1 |string |
| |code | | |0..1 |CodeableConcept|
| | |coding | |0..1 |Coding |
| | | |system |0..1 |uri|
| | | |code |0..1 |code |
| | | |display|0..1 |string |
| |text | | |0..1 |Narrative|
| | |status | |1..1 |code |
| | |div| |1..1 |xhtml|
| |entry| | |0..\*|Reference(Any) |
| | |reference| |1..1 |string |
| |emptyReason| | |0..1 |CodeableConcept|


しかし、表を見やすくするため、この文書では、これを次のように1行で省略表記する。
多重度の記載は、1段目にsection要素自体の多重度、2段目に参照リソースの多重度（上表nn.4のsectoin.entryの多重度）を転記している。


|section||||0..\*1..\*|参照リソース名|"〇〇情報セクション"|簡単な説明|
|---|---|---|---|-----|----|----------|-----|
|||||||||


なお、sectionをネスト（入れ子）にする場合の親のsectionで参照リソースがない（entryがない）場合には、上記の参照リソース名を−とこの表に記述し、その不存在理由としてsectoin.emptyReason.coding.codeに" unavailable"を設定する。
また、各section要素におけるentry以外の要素の記述仕様については、表2の後に掲載の「表_Compositino_sectionの情報構造」を参照すること。


<br><br><br>

# <a id="tbl-5-1">**表5-1　 Compositionリソース　(退院時サマリー)**</a>

|要素Lv1 |要素Lv2|要素Lv3|要素Lv4|多重度|型 |値|説明|
|-------|------|--|--|------|------------------|-----------------------------|-------------------------------------------------------------------------------------------------------|
|resourceType| | | || |"Composition" |**Composition**リソースであることを示す |
|meta| | | |1..1|Meta |||
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| | |1..*|canonical(StructureDefinition) |"http://jpfhir.jp/fhir<br>/eDischargeSummary/StructureDefinition<br>/JP_Composition_eDischargeSummary"|本リソースのプロファイルを識別するURLを指定する。値は固定。 |
|extension | | | |1..1\*|Extension||文書バージョンを表す拡張「composition-clinicaldocument-versionNumber」。|
||url| | |1..1|uri|"http:// hl7.org/fhir/StructureDefinition<br>/composition-clinicaldocument-versionNumber" |拡張を識別するURL。固定値。 |
||valueString| | |1..1|string |"1" |文書のバージョン番号を表す文字列。値は例示。|
|identifier| | | |1..1|Identifier ||この文書の文書ID。|
||system | | |1..1|uri|"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" |文書IDの名前空間を表すURI。固定値。 |
||value| | |1..1|string |"1311234567-2020-00123456"|文書ID。値は例示。付番方法は本文を参照。|
|status| | | |1..1|code |"final" |この文書のステータス。最終版が登録される段階では、"final" でなければならない。|
|type| | | |1..1|CodeableConcept||文書区分コード|
||coding | | |1..1\*|Coding |||
|| |system | |1..1|uri|"http://jpfhir.jp/fhir<br>/Common/CodeSystem/doc-typecodes" |文書区分コードのコード体系を識別するUR（LOINCコードベース）。固定値 |
|| |code | |1..1|code |"18842-5"|文書区分コード。退院時サマリー："18842-5"、診療情報提供書＼："57133-1"を指定。固定値。|
|| |display| |0..1|string |"退院時サマリー"|文書区分コードの表示名。|
|category| | | |1..1\*|CodeableConcept||文書クラス（カテゴリー）|
||coding | | |1..1\*|Coding |||
|| |system | |1..1|uri|"http://jpfhir.jp/fhir<br>/eCS<br>/CodeSystem/eCS-category" |文書クラスのコード体系を識別するURI。固定値。 |
|| |code | |1..1|code |"18842-5"|文書カテゴリコード。退院時サマリー："18842-5"、診療情報提供書：　"57133-1"を指定。|
|| |display| |0..1|string |"退院時サマリー"|コードの表示名|
|subject | | | |1..1|Reference（Patient） ||患者情報を表す**Patient**リソースへの参照。 |
||reference| | |1..1|string |"urn:uuid:11f0a9a6-a91d-3aef-fc4e-069995b89c4f" |**Patient**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。|
|encounter | | | |0..1|Reference(Encounter) ||この退院時サマリーを作成する元となった入院情報を表す**Encounter**リソースへの参照。表2に出現のEncounterと同一インスタンスを参照する。 |
||reference| | |1..1|string |"urn:uuid:12f0a9a6-a91d-8aef-d14e-069795b89c9f" |**Encounter**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。|
|date| | | |1..1|dateTime |"2020-08-21T12:28:21+09:00" |このリソースを作成または最後に編集した日時。ISO8601に準拠し、秒の精度まで記録し、タイムゾーンも付記する。午前0時を"24:00"と記録することはできないため"00:00"と記録すること。|
|author| | | |2..2|Reference（Practioner\|Organizatoin） ||文書作成責任者を表す**Practitioner**リソースへの参照、および文書作成機関を表す**Organization**リソースへの参照の2つのReferenceを繰り返す。|
||reference| | |1..1|string |"urn:uuid:7f60d206-66c5-4998-931e-86bf2b2d0bdc" |作成者**Practitioner**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。 |
||reference| | |1..1|string |"urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720" |医療機関**Organization**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。 |
||reference| | |0..1|string |"urn:uuid:..." |診療科**Organization**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。 |
|title | | | |1..1|string |"退院時サマリー"|この文書の（人が読める）タイトル。固定値。|
|custodian | | | |1..1|Reference(Organization)||文書の作成・修正を行い、文書の管理責任を持つ機関（**Organization**リソース）への参照。文書作成機関と同一の組織の場合、custodian要素からは文書作成機関を表す**Organization**リソースへの参照となる。文書作成機関とは異なる組織である場合は、文書作成機関とは別の**Organization**リソースで表現し、custodian要素からはその**Organization**リソースを参照する。|
||reference| | |1..1|string |"urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720" |custodianに対応する**Organization**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。|
|event | | | |1..1\*|BackboneElement| |退院時サマリーの対象となった入院期間の情報|
||period | | |1..1|Period | ||
|| |start| |1..1|dateTime |"2020-08-21" |入院日。ISO8601に準拠yyyy-mm-dd形式で記述する。 |
|| |end| |1..1|dateTime |"2020-09-02" |退院日。ISO8601に準拠yyyy-mm-dd形式で記述する。 |
|section | | | |0..1\*|DocumentRefrence |"CDA参照セクション" |退院時サマリー全体を記述した文書ファイルへの参照。既存の厚労省標準CDA規約で作成されたXMLファイルをそのまま参照したい場合、この要素を使用する。他の場所に保存されているFHIRドキュメントを参照する場合にもこの要素を用いる。この要素が出現した場合、以降のセクションは、"添付情報セクション"を除き、出現してはならない。|
|section | | | |0..1\*|−|"構造情報セクション"|退院時サマリーをFHIRリソースの組み合わせにより記述する場合にこのセクションを記述する。この要素が出現した場合、"CDA参照セクション"は出現してはならない。|
||section| | |1..1\*|Encounter|"入院時詳細セクション"<br>"admissionDetailsSection" |Encounterはすべてこのインスタンスと同一インスタンスを参照する。<br>"構造情報セクション"が存在する場合、このセクションは必須。 |
||section| | |1..\* |Condition|"入院時診断セクション"<br>"admissionDiagnosesSection" |"構造情報セクション"が存在する場合、このセクションは必須。|
||section| | |0..\* |AllergyIntolerance |"アレルギー・不耐性反応セクション"<br>"allergyIntoleranceSection"||
||section| | |1..\* |Condition|"主訴セクション"<br>"chiefComplaintSection" |"構造情報セクション"が存在する場合、このセクションは必須。 |
||section| | |1..1\*|Encounter|"入院理由セクション"<br>"reasonForVisitSection" |Encounterはすべてこのインスタンスと同一インスタンスを参照する。<br>"構造情報セクション"が存在する場合、このセクションは必須。  |
||section| | |1..\* |Condition|"現病歴セクション"<br>"presentIllnessSection" |"構造情報セクション"が存在する場合、このセクションは必須。 |
||section| | |0..\* |Condition|"既往歴セクション"<br>"pastIllnessSection"||
||section| | |0..\* |MedicationStatement|"入院時服薬セクション"<br>"admissionMedicationsSection" ||
||section| | |0..\* |Observation|"社会歴・生活習慣セクション"<br>"socialHistorySection"||
||section| | |0..\* |Observation|"入院時身体所見セクション"<br>"admissinoPhysicalStatusSection"||
||section| | |0..\* |FamilyMemberHistory|"家族歴セクション"<br>"familiyHistorySection" ||
||section| | |1..\* |DocumentReference |"入院中経過セクション"<br>"hospitalCourseSection" |"構造情報セクション"が存在する場合、このセクションは必須。|
||section| | |1..1\*|Encounter|"退院時詳細セクション"<br>"dischargeDetailsSection" |Encounterはすべてこのインスタンスと同一インスタンスを参照する。<br>"構造情報セクション"が存在する場合、このセクションは必須。 |
||section| | |1..\* |Condition |"退院時診断セクション"<br>"dischargeDiagnosesSection" |"構造情報セクション"が存在する場合、このセクションは必須。|
||section| | |1..\* |MedicationRequest ｜Bundle(電子処方箋) |"退院時投薬指示セクション"<br>"dischargeMedicationSection" |"構造情報セクション"が存在する場合、このセクションは必須。|
||section| | |1..\* |CarePlan |"退院時方針指示セクション"<br>"dischargeInstructionSection" |"構造情報セクション"が存在する場合、このセクションは必須。|
||section| | |0..\* |Observation|"入院時または退院時の身体所見セクション"<br>"dischargePhysicalSection"||
||section| | |0..\* |Procedure|"入院中治療セクション"<br>"hospitalProcedureSection"||
||section| | |0..\* |Observation \| ImagingStudy \| DiagnosticReport \| Bundle (報告書)|"入院中検査結果セクション"<br>"hospitalStudySection"||
||section| | |0..\* |DeviceUseStatement |"医療機器セクション"<br>"medicalDeviceSection"||
||section| | |0..\* |Immunization |"予防接種歴セクション"<br>"immunizationSection" ||
||section| | |0..\* |Consent|"事前指示セクション"<br>"advanceDirectiveSection" ||
||section| | |0..\* |ResearchSubject|"臨床研究参加セクション"<br>"researchParticipationSection"||
|section | | | |0..\* |DocumentReference \| Binary  \| Bundle |"添付情報セクション"<br>"attachmentSection" |添付情報ファイルがある場合にここの格納または参照情報を設定する。|
|section | | | |0..\* |DocumentReference \| Binary |"PDFセクション"<br>"pdfSection" |文書情報全体を表示または印刷するためのPDFファイルがある場合にここの格納または参照情報を設定する。 |

<br><br><br>

# <a id="tbl-5-2">**表5-2　Compositionリソース　(診療情報提供書)**</a>

|要素Lv1 |要素Lv2|要素Lv3|要素Lv4|多重度|型 |値 |説明|
|-------|------|--|--|------|------------------|-------------------------|-------------------------------------------------------------------------------------------------------|
|resourceType| | | || |"Composition"|**Composition**リソースであることを示す |
|meta| | | |1..1|Meta | ||
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| | |1..*| |"http://jpfhir.jp/fhir<br>/eReferral/StructureDefinition<br>/JP_Composition_eReferral" |準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。 |
|extension | | | |1..1\*|Extension| |文書バージョンを表す拡張「composition-clinicaldocument-versionNumber」。|
||url| | |1..1|uri|"http:// hl7.org/fhir/StructureDefinition<br>/composition-clinicaldocument-versionNumber"|拡張を識別するURL。固定値。 |
||valueString| | |1..1|string |"1"|文書のバージョン番号を表す文字列。値は例示。|
|identifier| | | |1..1|Identifier | |この文書の文書ID。|
||system | | |1..1|uri|"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier"|文書IDの名前空間を表すURI。固定値。 |
||value| | |1..1|string |"1311234567-2020-00123456" |文書ID。値は例示。付番方法は本文を参照。|
|status| | | |1..1|code |"final"|この文書のステータス。最終版が登録される段階では、"final" でなければならない。|
|type| | | |1..1|CodeableConcept| |文書区分コード|
||coding | | |1..1\*|Coding | ||
|| |system | |1..1|uri|"http://jpfhir.jp/fhir<br>/Common/CodeSystem/doc-typecodes"|文書区分コードのコード体系を識別するUR（LOINCコードベース）。固定値 |
|| |code | |1..1|code |"57133-1" |文書区分コード。退院時サマリー："18842-5"、診療情報提供書＼："57133-1"を指定。固定値。|
|| |display| |0..1|string |"診療情報提供書" |文書区分コードの表示名。|
|category| | | |1..1\*|CodeableConcept| |文書クラス（カテゴリー）|
||coding | | |1..1\*|Coding | ||
|| |system | |1..1|uri|"http://jpfhir.jp/fhir<br>/Common/CodeSystem/doc-typecodes"|文書クラスのコード体系を識別するURI。固定値。 |
|| |code | |1..1|code |"57133-1" |文書カテゴリコード。退院時サマリー："18842-5"、診療情報提供書：　"57133-1"を指定。|
|| |display| |0..1|string |”診療情報提供書” |コードの表示名|
|subject | | | |1..1|Reference（Patient） | |患者情報を表す**Patient**リソースへの参照。 |
||reference| | |1..1|string |"urn:uuid:11f0a9a6-a91d-3aef-fc4e-069995b89c4f"|**Patient**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。|
|encounter | | | |0..1|Reference(Encounter) | |この診療情報提供書が作成された受診時状況を表す**Encounter**リソースへの参照。表12に出現のEncounterと同一インスタンスを参照する。 |
||reference| | |1..1|string |"urn:uuid:12f0a9a6-a91d-8aef-d14e-069795b89c9f"|**Encounter**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。|
|date| | | |1..1|dateTime |"2020-08-21T12:28:21+09:00"|このリソースを作成または最後に編集した日時。ISO8601に準拠し、秒の精度まで記録し、タイムゾーンも付記する。午前0時を"24:00"と記録することはできないため"00:00"と記録すること。|
|author| | | |2..2|Reference（Practioner\|Organizatoin） | |文書作成責任者を表す**Practitioner**リソースへの参照、および文書作成機関(必須)と診療科（任意）を表す最大２つの**Organization**リソースへの参照の合わせて最大３つのReferenceを繰り返す。|
||reference| | |1..1|string |"urn:uuid:7f60d206-66c5-4998-931e-86bf2b2d0bdc"|文書作成責任者**Practitioner**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。 |
||reference| | |1..1|string |"urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720"|文書作成機関**Organization**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。 |
||reference| | |1..1|string |"urn:uuid:...."|診療科**Organization**リソースのfullUrl要素に指定されるUUIDを指定。値は省略。 |
|title | | | |1..1|string |”診療情報提供書” |この文書の（人が読める）タイトル。固定値。|
|custodian | | | |1..1|Reference(Organization)| |文書の作成・修正を行い、文書の管理責任を持つ機関（**Organization**リソース）への参照。文書作成機関と同一の組織の場合、custodian要素からは文書作成機関を表す**Organization**リソースへの参照となる。文書作成機関とは異なる組織である場合は、文書作成機関とは別の**Organization**リソースで表現し、custodian要素からはその**Organization**リソースを参照する。|
||reference| | |1..1|string |"urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720"|custodianに対応する**Organization**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。|
|event | | | |1..1\*|BackboneElement| |診療情報提供書の発行イベントの情報|
||code | | |1..1\*|CodeableConcept| ||
|| |coding | |0..0*|Coding | |不要|
|| |text | |1..1|string |“診療情報提供書発行” |固定値。|
||period | | |1..1|Period | ||
|| |start| |1..1|dateTime |"2020-08-21" |診療情報提供書発行日。ISO8601に準拠yyyy-mm-dd形式で記述する。 |
|section | | | |1..1\*| |”紹介先情報セクション”<br>"referralToSection" |紹介先情報|
||entry| | |1..1\*|Organization | |紹介先医療機関|
||entry| | |0..1\*|Organization | |紹介先診療科|
||entry| | |0..1\*|Practitioner | |紹介先医師|
|section | | | |1..1\*| |”紹介元情報セクション”<br>"referralFromSection" |紹介元情報|
|| | | |1..1\*|Organization | |紹介元医療機関|
|| | | |0..1\*|Organization | |紹介元診療科|
|| | | |0..1\*|Practitioner | |紹介元医師|
|section | | | |0..1\*|DocumentRefrence |"CDA参照セクション"<br>"cdaSection"|既存の厚労省標準CDA規約で作成されたXMLファイルをそのまま参照したい場合、この要素を使用する。他の場所に保存されているFHIRドキュメントを参照する場合にもこの要素を用いる。この要素が出現した場合、以降のセクションは、"添付情報セクション"と"PDFセクション"を除き、出現してはならない。 |
|section | | | |0..1\*|−|"構造情報セクション"<br>"compositionSection" |診療情報提供書をFHIRリソースの組み合わせにより記述する場合にこのセクションを記述する。この要素が出現した場合、"CDA参照セクション"は出現してはならない。|
||section| | |1..1\*|Encounter|“紹介目的セクション"<br>"admissionDetailsSection”|紹介先に外来受診あるいは入院を意図した情報をその理由とともに記述する。<br>"構造情報セクション"が存在する場合、このセクションは必須。|
||section| | |1..\* |Condition|“傷病名・主訴セクション"<br>"admissionDiagnosesSection”|現在の傷病名や主訴を記述する。commonTablesFHIR_V113_wHistory.docx"構造情報セクション"が存在する場合、このセクションは必須。|
||section| | |1..\* |Condition|“現病歴セクション“<br>“presentIllnessSection”|現在までの傷病名と経過を記述する。commonTablesFHIR_V113_wHistory.docx"構造情報セクション"が存在する場合、このセクションは必須。|
||section| | |0..\* |Condition|“既往歴セクション“<br>“pastIllnessSection” |過去の傷病名を記述する。|
||section| | |0..\* |AllergyIntolerance |“アレルギー・不耐性反応セクション"<br>"allergyIntoleranceSection” |アレルギー情報を記述する。|
||section| | |0..\* |FamilyMemberHistory|“家族歴セクション“<br>“familiyHistorySection“|家族歴を記述する。|
||section| | |0..\* |Observation|“身体所見セクション“<br>“admissinoPhysicalStatusSection“ |現在の身体所見を記述する。|
||section| | |0..\* |ConditionObservation |“感染症情報セクション"<br>"infectiousDiseaseInformationSection" |感染症の保有状況、および検査結果を記述する。|
||section| | |0..\* |Observation|“社会歴・生活習慣セクション“<br>“socialHistorySection“ |社会歴、生活歴を記述する。|
||section| | |0..\* |Immunization |“予防接種歴セクション“<br>“immunizationSection“|予防接種情報を記述する。|
||section| | |0..\* |Procedure|“手術セクション“<br>“surgucalProcedureSection“ |手術記録を記述する。|
||section| | |0..\* |Procedure|“輸血歴セクション“<br>“bloodInfusionProcedureSection“|輸血治療歴を記述する。|
||section| | |0..\* |Procedure|“処置セクション“<br>“treatmentProcedureSection“|処置治療歴を記述する。|
||section| | |0..\* |MedicationRequest ｜Bundle(電子処方箋) |“投薬指示セクション“<br>“medicationSection“|現在の投薬状況を記録する。|
||section| | |0..\* |Observation \| ImagingStudy \| DiagnosticReport \| Bundle (報告書)|“検査結果セクション“<br>“examsStudySection“|主要な検査結果、画像診断報告書、各種検査報告書を記述する。|
||section| | |0..\* |DocumentReference |“臨床経過セクション“<br>“clinicalCourseSection“|これまでの臨床経過を叙述的に記述する。|
||section| | |0..\* |CarePlan |“診療方針指示セクション“<br>“clinicalInstructionSection“ |現在の治療方針を記述する。|
||section| | |0..\* |DeviceUseStatement |“医療機器セクション“<br>“medicalDeviceSection“ |使用中の医療機器（デバイス）の情報を記述する。|
||section| | |0..\* |Consent|“事前指示セクション“<br>“advanceDirectiveSection“|事前指示を（アドヴァンスディレクティブ）があれば記述する。|
||section| | |0..\* |ResearchSubject|“臨床研究参加セクション“<br>“researchParticipationSection“ |臨床研究への参加状況を記述する。|
|section | | | |0..\* |DocumentReference \| Binary  \| Bundle |"添付情報セクション"<br>"attachmentSection"|添付情報ファイルがある場合にここに格納または参照情報を設定する。|
|section | | | |0..\* |DocumentReference \| Binary |"備考・連絡情報セクション"<br>"remarksCommunicationSection"|備考・連絡情報がある場合にここに格納または参照情報を設定する。|
|section | | | |0..\* |DocumentReference \| Binary |"PDFセクション"<br>"pdfSection"|文書情報全体を表示または印刷するためのPDFファイルがある場合にここに格納または参照情報を設定する。 |

<br><br><br>

# <a id="tbl-5-3">**表5-3　Composition_sectionの情報構造**</a>
*composition.section.**（または**composition.section.section.**）の子要素のうち要素名が**section**でない要素を、下記表の「要素**Lv1**」の位置に記載する。*

|要素Lv1|要素Lv2|要素Lv3|多重度|型 |値 |説明|
|------|--|--|------|-----|------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
|title| | |1..1|string |"入院時診断" |○○セクション名のうち○○の部分文字列を設定する。|
|code | | |1..1|CodeableConcept| ||
| |coding | |1..1|Coding | ||
| | |system |1..1|uri|"http://jpfhir.jp/fhir/ eCS/CodeSystem/document-section"　 \|  "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section"|文書のセクションコードシステムの固定値。<br>退院時サマリーの場合には、"http://jpfhir.jp/fhir/eCS/CodeSystem/document-section"<br>診療情報提供書の場合には、"http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section"|
| | |code |1..1|code |"200"など。|「サマリー本体（ボディー部）でのセクション構成」または「診療情報提供書本体（ボディー部）でのセクション構成」のセクションコード。|
| | |display|1..1|string |"入院時診断" |コード表におけるセクションコードに対応する文字列。|
|text | | |1..1|Narrative| |このセクションに含められるすべてのテキスト（叙述的記述）表現。|
| |status | |1..1|code |"additional" |このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。 |
| |div| |1..1|xhtml| |xhtml簡略形式に従った叙述記述データ。-FHIR仕様書より-html要素のコンテンツは、HTML 4.0標準の第7-11章と第15章で説明されている基本的なhtmlフォーマット要素、&lt;a&gt;要素（nameまたはhref）、画像、および内部に含まれるスタイルシートのみを含むXHTMLフラグメントです。XHTMLコンテンツには、ヘッド、ボディ、外部スタイルシート参照、スクリプト、フォーム、ベース/リンク/ xlink、フレーム、iframe、およびオブジェクトを含めることはできません。空白以外のコンテンツが含まれている必要があります。--|
|entry| | |0..\* |Reference(Any) | |このセクションが含める情報リソースの参照のリスト。「サマリー本体（ボディー部）でのセクション構成」または「診療情報提供書本体（ボディー部）でのセクション構成」のFHIR リソース種別、多重度が適用される。セクションコード300のsectionにはentryは出現しない。 |
|emptyReason| | |0..1|CodeableConcept| |直前のentry要素が出現しない場合には、この要素は必須で、なぜentry要素が出現しないを記述する。|
| |coding | |1..1|Coding | ||
| | |system |1..1|uri|"http://terminology.hl7.org/CodeSystem/list-empty-reason"|コード表：http://hl7.org/fhir/valueset-list-empty-reason.html　を参照。 |
| | |code |1..1|code |"unavilable"など。 |直前のentry要素が出現しない場合、特に他の明示的な事由を示せない場合には、"unavailable"としておく。セクションコード300のsectionにはentryは出現しないので、この場合にも"unavailable"を設定すること。|
|section| | |0..1| | |sectionの下にsectionをネスト（階層化）する場合に使用する。セクションコード300のsectionにはサマリー本体（ボディー部）でのセクション構成」または「診療情報提供書本体（ボディー部）でのセクション構成」の表に示すネストするsectionが必ず出現する。|


<br><br><br>

# <a id="tbl-6">**表6　　Conditionリソース　患者状態情報**</a>

|要素Lv1 |要素Lv2|要素Lv3 |要素Lv4|多重度|型|値|説明|
|--------|-------|-------|--|------|-----------------------|------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|resourceType| || |||"Condition" |**Condition**リソースであることを示す |
|meta| || |1..1|Meta|||
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile|| |0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Condition_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text| || |0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。|
||status || |1..1|code|"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
||div|| |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; |値は例示。|
|identifier| || |0..1\*|Identifier||この患者状態に付番されたID|
||system || |1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" ||
||value|| |1..1||"1311234567-2020-00123456"|患者状態IDの文字列。値は例示。|
|clinicalStatus| || |0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/condition-clinical"<br>"active"|臨床的状態のステータス。Lv0 active: 状態による症状が現在継続している、または状態を裏付ける所見などが存在していることを指す。Lv1 recurrence: 過去に一回解消した問題が再発していることを指す。Lv1 relapse: 過去に改善または寛解を得た状態が再度悪化していることを指す。Lv0 inactive: 状態による症状が現在存在していない、または状態を裏付ける所見などが存在していないことを指す。Lv1 remission: 状態による症状が現在存在していないが、再発のリスクを有している場合を指す。Lv1 resolved: 状態による症状が現在存在していおらず、再発のリスクを考慮する必要がない場合を指す。|
|verificationStatus| || |0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/condition-ver-status"<br>"provisional" |入力された臨床的状態に対する検証状況を示す。確からしさと考えられる。Lv0 unconfirmed: 該当する状態の存在を確定とは言い切れないことを示す。Lv1 provisional: 該当する状態の存在は暫定的であることを示す。Lv1 differential: 該当する状態を鑑別するべき意図で記載されたことを示す。Lv0 confirmed: 該当する状態は十分な根拠によって確定されたものであることを示す。Lv0 refuted: 該当する状態は十分な根拠によって除外されたものであることを示す。Lv0 entered-in-error: 有効でない入力であることを示す。|
|code| || |1..1|CodeableConcept |"urn:oid:1.2.392.200119.4.101.6"<br>"B0EF"<br>"持続腹痛"<br>"長く続く腹部の痛み"|患者状態、プロブレム、診断のコード記述。system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。"BOEF"は、MEDIS標準病名マスター病名交換用コードで"持続腹痛"のコード。"持続腹痛"はそのテキスト記述の例。|
|bodySite| || |0..\* |CodeableConcept |"urn:oid:1.2.392.200119.4.201.5"<br>"1244"<br>"腹部"<br>"腹部"|該当する状態が現れている解剖学的な場所を示す。system値はMEDIS標準病名マスター修飾語交換用コードを使用する場合の例示。"1244"は、MEDIS標準病名マスター修飾語交換用コードで"腹部"のコード。"腹部"はそのテキスト記述の例。|
|subject | || |1..1|Reference(Patient)|"urn: ....."|対象となる患者リソースへの参照。|
|encounter | || |0..1|Reference (Encounter) |"urn: ....."|この状態が作成された受診情報（入院詳細情報または外来受診情報）への参照|
|（onset） | || |0..1|（dateTime、Age、Period、Range、string）のいずれかひとつ。||この状態が存在した時期。5通りのいずれかの子要素（onsetDateTime、onseAge、onsetPeriod、onsetRange、onsetString）ひとつを選択して、それにより記述する。複数を選択はできない。onset要素は記述しないで、直接onsetDateTime要素のレベルを記述する。 |
||onsetDateTime|| ||dateTime||日付または日時。年や年月だけでもよい。例：2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17+09:00。時刻に24:00 の使用はできない。|
||onsetAge || ||Age ||年齢。患者の申告による、状態が出現し始めた年齢。|
|| |value | ||decimal |"50"|年齢の値。|
|| |comparator| ||code|"&gt;=" |要素valueの値の解釈方法。<br>等しい場合には、= は不要。そうでない指定をしたい場合には、&lt; 、 &lt;=、 &gt;= 、 &gt;　のいずれか。例では、「50歳以上で」と記述したい場合には、&gt;= を記述する。|
|| |unit| ||string|"歳"|単位表現|
|| |system| ||uri |"http://unitsofmeasure.org" |単位体系 UCUMコード体系。固定値。 |
|| |code| ||code|"a" |単位体系における単位コード。コードと意味min：minutesh：hoursd：dayswk：weeksmo：monthsa：years|
||onsetPeriod|| ||Preiod||期間。|
|| |start | |0..1|DateTime||期間の開始日時|
|| |end | |0..1|DateTime||期間の終了日時|
||onsetRange || ||Range ||曖昧な時期を最小値と最大値とで記述する。以下の記述例は50歳台。|
|| |low | |0..1||||
|| ||value||decimal |"50"|年齢の値。|
|| ||unit ||string|"歳"|単位表現|
|| ||system ||uri |"http://unitsofmeasure.org" |単位体系 UCUMコード体系。固定値。 |
|| ||code ||code|"a" |単位体系における単位コード。コードと意味a：years|
|| |high| |0..1||||
|| ||value||decimal |"59"|年齢の値。|
|| ||unit ||string|"歳"|単位表現|
|| ||system ||uri |"http://unitsofmeasure.org" |単位体系 UCUMコード体系。固定値。 |
|| ||code ||code|"a" |単位体系における単位コード。コードと意味a：years|
||onsetString|| ||string|"50歳台"|文字列表現|
|（abatement） | || |0..1|（dateTime、Age、Period、Range、string）のいずれかひとつ。||状態が解決した、または寛解した日付または推定日。ある程度よくなった（軽減）状態になった日でもよい。5通りのいずれかの子要素（abatementDateTime、abatementAge、abatementPeriod、abatementRange、abatementString）のひとつを選択して、それにより記述する。複数を選択はできない。c |
||abatementDateTime|| ||dateTime||記述方法はonset要素と同じ。 |
||abatementAge || ||Age ||記述方法はonset要素と同じ。 |
||abatementPeriod|| ||Period||記述方法はonset要素と同じ。 |
||abatementRange || ||Range ||記述方法はonset要素と同じ。 |
||abatementString|| ||string||記述方法はonset要素と同じ。 |
|recordedDate| || |0..1|dateTime||この状態が最初に記録された日時。|
|recorder| || |0..1|Reference(Practitioner \| PractitionerRole \| Patient \| RelatedPerson)||この状態を記録した人情報への参照。|
|asserter| || |0..1|Reference(Practitioner \| PractitionerRole \| Patient \| RelatedPerson)||この状態があると確認（主張）した人情報への参照。|
|stage | || |0..\* |||この状態の臨床的ステージやグレード表現。|
||summary|| |0..1|CodeableConcept |"urn:oid:1.2.392.200119.4.201.5"<br>"32GR"<br>"第１期"|system値はMEDIS標準病名マスター修飾語交換用コードを使用する場合の例示。"1244"は、MEDIS標準病名マスター修飾語交換用コードで"第１期"のコード。"第１期"はそのテキスト記述の例。|
||assessment || |0..\* |Reference(ClinicalImpression \| DiagnosticReport \| Observation)|"urn:..." |ステージ情報の根拠となる診断レポートや検査結果、または臨床評価情報への参照する。|
||type || |0..1|CodeableConcept ||ステージ分類の種類。病理学的分類、臨床分類、TNM肺癌分類、など。当面コーディングをせず、text記述だけ必要に応じて行う。 |
|evidence| || |0..\* |||状態を確認または反駁した証拠など、状態の検証ステータスの基礎となる裏付けとなる証拠/兆候。 |
||code || |0..\* |CodeableConcept |"urn:oid:1.2.392.200119.4.101.6"<br>"B0EF"<br>"持続腹痛"<br>"長く続く腹部の痛み"|状態を裏付ける症状や所見。system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。"BOEF"は、MEDIS標準病名マスター病名交換用コードで"持続腹痛"のコード。"持続腹痛"はそのテキスト記述の例。|
||detail || |0..\* |Reference(Any)||状態を裏付ける根拠となった検査結果情報やレポート情報などへの参照。|
|note| || |0..\* |||患者状態に関する追加的な情報|
||author || |0..1||||
|| |authorString| |0..1|string|"病理検査担当者"|記載者氏名などの文字列。必ずしも氏名でなくてもよい。|
||time || |0..1|dateTime||この追加的な情報が作成された日時。|
||text || |1..1|markdown||追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。|


<br><br><br>

# <a id="tbl-7">**表7　　Consentリソース　同意情報**</a>

|要素Lv1|要素Lv2 |要素Lv3|要素Lv4|多重度|型 |値|説明|
|-------|------|--|--|------|----------------|----------------------------|--------------------------------------------------------|
|resourceType || | || |"Consent" |**Consent**リソースであることを示す |
|meta || | |1..1|Meta |||
| |profile | | |1..1\*|canonical(StructureDefinition) |"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Consent_eCS"|本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text || | |0..1|Narrative||本リソースをテキストで表現したものを入れてもよい。|
| |status| | |1..1|code |"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
| |div | | |1..1|xhtml|&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; |値は例示。|
|identifier || | |0..1\*|Identifier ||この同意情報に付番されたID|
| |system| | |1..1| |"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" ||
| |value | | |1..1| |"1311234567-2020-00123456"|同意情報IDの文字列。値は例示。|
|status || | |1..1|code |"final" |同意情報のステータス。コード表："http://hl7.org/fhir/consent-state-codes"draft \| proposed \| active \| rejected \| inactive \| entered-in-error作成中\|調整中\|承認され有効\|拒否\|有効期限終了か旧版\|エラー|
|scope|| | |1..1|CodeableConcept|"http://terminology.hl7.org/CodeSystem/consentscope"<br>"adr" |同意文書の範囲。adr:事前指示（Advanced Care Directive)research:研究同意patient-privacy:個人情報同意treatment:治療（医療行為）同意 |
|category || | |0..1\*|CodeableConcept||同意文書の分類区分（検索目的）http://hl7.org/fhir/valueset-consent-category.htmlを参考。当面、テキストのみで記述。|
|patient|| | |1..1|Reference(Patient) ||患者を表す**Patient**リソースへの参照。 |
|dateTime || | |0..1|dateTime ||同意を取得した日時。|
|performer|| | |0..\* |BackboneElement||同意した人の情報。一般的に、同意に関係する患者は同意者ですが、特に若者や高齢者の場合、それは他の人、たとえば法定後見人である可能性がある。|
| |actor | | |1..1|Reference(Organization \| Patient \| RelatedPerson \|)||同意した人への参照。|
|organization || | |0..1\*|Reference(Organization)||同意情報を管理する責任医療機関情報への参照。|
|sourceAttachiment|| | |0..1|Attachment ||同意書の原本情報|
|verification || | |0..\* | ||第三者確認情報。|
| |verified| | |1..1|boolean||同意は、performerで記述した同意者以外の、患者や家族に確認が取れている場合にtrue。 |
| |verifiedWith| | |0..1|Reference(Patient \| RelatedPerson) ||確認をした第三者情報への参照。|
| |verificationDate| | |0..1|dateTime ||確認がなされた日時。|

＊退院時サマリーに付与されている事前指示（Advanced Care Directive）情報においては、上記表の要素の範囲で記述する。


<br><br><br>

# <a id="tbl-8">**表8　　DeviceUseStatementリソース　医療機器使用歴情報**</a>

|要素Lv1|要素Lv2|要素Lv3 |要素Lv4|多重度|型 |値 |説明|
|-----|--|-------|--|------|--------------------------|-----------------------------|----------------------------------------------------------------------------------------------------------|
|resourceType | || || |"DeviceUseStatement" |**DeviceUseStatement**リソースであることを示す|
|meta | || |1..1|Meta | ||
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
| |profile|| |0..*|canonical(StructureDefinition) |"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_DeviceUseStatement_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text | || |0..1|Narrative| |本リソースをテキストで表現したものを入れてもよい。|
| |status || |1..1|code |"generated"|固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
| |div|| |1..1|xhtml|&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt;|値は例示。|
|identifier | || |0..1\*|Identifier | |この情報に付番されたID|
| |system || |1..1| |"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier"||
| |value|| |1..1| |"1311234567-2020-00123456" |この情報IDの文字列。値は例示。|
|status | || |1..1|code |"active" |臨床的使用状態のステータス。コード表："http://hl7.org/fhir/device-statement-status"active:使用中completed:終了entered-in-error:エラーintended:使用予定stopped:使用中止on-hold:使用保留|
|subject| || |1..1|Reference(Patient) |"urn: ....." |対象となる患者リソースへの参照。|
|timingPeriod | || |0..1|Peiod| |この医療機器の使用期間。|
| |start|| |0..1|dateTime | |開始日付。|
| |end|| |0..1|dateTime | |終了日付。|
|recoredeOn | || |0..1|daeTime| |この記録日時。|
|device | || |1..1|Reference(Device)| |医療機器情報への参照。|
|reasonCode | || |0..1\*|CodeableConcept| |医療機器の使用理理由。当面、textでのみ記述する。|
|reasonReference| || |0..1\*|Reference(Condition \| Observation \| DiagnosticReport \| DocumentReference \| Media)| |医療機器を使用する理由を説明できる検査結果や診断レポートなどへの参照。|
|bodySite | || |0..\* |CodeableConcept|"urn:oid:1.2.392.200119.4.201.5"<br>"1244"<br>"腹部"<br>"腹部" |医療機器を使用する解剖学的な場所を示す。system値はMEDIS標準病名マスター修飾語交換用コードを使用する場合の例示。"1244"は、MEDIS標準病名マスター修飾語交換用コードで"腹部"のコード。"腹部"はそのテキスト記述の例。機器交換などの操作対象部位の場合には、system値は外保連コード（STEM7）の先頭3桁コードを使用する。"http://jpfhir.jp/fhir<br>/Common/CodeSystem/stem7-procedure-site"|
|note | || |0..\* | | |この家族に関する一般的な情報のテキスト記述|
| |author || |0..1| | |記載者の情報|
| | |authorString| |0..1|string |"患者自身" |記載者氏名などの文字列。必ずしも氏名でなくてもよい。|
| |time || |0..1|dateTime | |この追加的な情報が作成された日時。|
| |text || |1..1|markdown | |追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。|

<br><br><br>

# <a id="tbl-9">**表9　Deviceリソース　医療機器情報**</a>

|要素Lv1 |要素Lv2 |要素Lv3|要素Lv4|多重度|型|値 |説明|
|--------|------|--|--|------|----------|---------------------------|----------------------------------------------------------|
|resourceType|| | |||"Device" |**Device**リソースであることを示す|
|meta|| | |1..1|Meta| ||
||profile | | |1..1\*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Device_eCS"|本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text|| | |0..1|Narrative | |本リソースをテキストで表現したものを入れてもよい。|
||status| | |1..1|code|"generated"|固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
||div | | |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt;|値は例示。|
|identifier|| | |0..1\*|Identifier| |この機器情報に付番されたID|
||system| | |1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" ||
||value | | |1..1||"1311234567-2020-00123456" |機器情報IDの文字列。値は例示。|
|udiCarrier|| | |0..\* |BacboneElement| |Unique Device Identifier(UDI)のバーコード文字列情報。 |
||deviceIdentifier| | |0..1|string| |UDIの必須固定部分の文字列。 |
||issuer| | |0..1|uri | |UDI発行組織。 |
||jurisdiction| | |0..1|uri | |地域（国）UDI管理組織 |
||carrierAIDC | | |0..1|base64Binary| |UDI Machine Readable Barcode String |
||carrierHRF| | |0..1|string| |UDI Machine Readable Barcode String |
||entryType | | |0..1|code| |UDIエントリータイプ　barcode:Barcode　rfid:RFID　manual:Manual　card:Card　self-reported:Self Reported　unknown:Unknown |
|status|| | |1..1|code|"final"|デバイスの使用状態。コード表："http://hl7.org/fhir/device-status"active \| inactive \| entered-in-error \| unknown使用許可中、使用許可終了、エラー、不明 |
|statusReason|| | |0..1\*|CodeableConcept |"http://terminology.hl7.org/CodeSystem/device-status-reason"<br>"online"<br>"接続中" |使用ステータスの事由。online \| paused \| standby \| offline \| not-ready \| transduc-discon \| hw-discon \| offオンライン\|一時停止\|スタンバイ\|オフライン\|準備中\| トランスデューサー接続断\| 機器-接続断 \|オフ|
|distinctIdentifier|| | |0..1|string| |個別識別ID。|
| manufacturer || | |0..1|string| |製造会社名。|
| manufactureDate|| | |0..1|dateTime| |製造年月日。|
| expirationDate || | |0..1|dateTime| |使用期限年月日。|
| lotNumber|| | |0..1|string| |製造ロット番号。|
| serialNumber || | |0..1|string| |製造会社により付番されたシリアル番号。|
| deviceName || | |0..\* |BackboneElement | |製造会社により付けられた機器名情報。|
|| name | | |1..1|string| |機器名称。|
|| type | | |1..1|code| |機器名称タイプ。udi-label-name \| user-friendly-name \| patient-reported-name \| manufacturer-name \| model-name \| otherユーザーラベル名 \|ユーザーフレンドリー名\|患者報告名\|メーカー名\|モデル名\|その他|
| modelNumber|| | |0..1|string| |製品モデル番号。|
| partNumber || | |0..1|string| |パーツ番号。|
| type || | |0..1|CodeableConcept | |医療機器のタイプ。一般的な機器種類名"ペースメーカー"などのレベルで、当面、テキストだけで記述する。|
| specialization || | |0..\* |BackboneElement | |デバイスでサポートされている機能、デバイスが特定の目的に準拠し、通信に使用される標準。未使用。|
|version || | |0..\* |BackboneElement | |デバイスの実際の設計またはデバイスで実行されているソフトウェアバージョン情報。|
||type| | |0..1|CodeableConcept | |ソフトウエアなどのタイプ。当面、テキスト情報のみで記述する。|
|| component| | |0..1|Identifier| |バージョンの単一部分。|
|| value| | |1..1|string| |バージョンのテキスト記述。|
|patient || | |0..1|Reference(Patient)| |装着・使用している患者情報への参照。|
|owner || | |0..1|Reference(Organization) | |使用管理に責任をもつ医療機関・機関情報への参照。|
|contact || | |0..1\*|ContactPoint| |連絡先の情報|
||system| | |1..1|code|"phone"|固定値。|
||value | | |1..1|string|"0123-456-7890"|値は例示。|
|uri || | |0..1|uri | |医療機器情報へのアクセス情報|
|note|| | |0..\* || |医療機器に関する注意情報やコメントテキスト記述|
||text| | |1..1|markdown| |追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。|
|safety|| | |0..\* |CodeableConcept | |医療機器の安全性に関する区分情報。当面未使用。|
|parent|| | |0..1|Reference(Device) | |親の医療機器がある場合にその情報への参照。|


<br><br><br>

# <a id="tbl-10">**表10　　　DiagnosticReportリソース　診断報告書情報**</a>

|要素Lv1 |要素Lv2|要素Lv3|要素Lv4|多重度|型|値 |説明 |
|--------|-------|--|--|------|------------------|--------------------------------|---------------------------------------------------------------------------------|
|resourceType| | | |||"DiagnostcReport"|**DiagnostcReport**リソースであることを示す|
|meta| | | |1..1|Meta| | |
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| | |0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/core<br>/StructureDefinition<br>/JP_DiagnosticReport_Common"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。検査種別によって適切なプロファイルがJP-Coreで定義されている場合にはそれを使用する。値は固定。|
|text| | | |0..1|Narrative | |本リソースをテキストで表現したものを入れてもよい。 |
||status | | |1..1|code|"generated"|固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。 |
||div| | |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt;|値は例示。 |
|identifier| | | |0..1\*|Identifier| |この検査レポート情報に付番されたID |
||system | | |1..1||" http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier"| |
||value| | |1..1||"1311234567-2020-00123456" |検査レポート情報IDの文字列。値は例示。 |
|status| | | |1..1|code|"final"|検査・観察のステータス。コード表："http://hl7.org/fhir/diagnostic-report-status"registered：登録済・参照不可partial：部分的に報告preliminary：暫定報告final：最終報告amended：修正版corrected：訂正版appended：承認済みcancelled：取消しentered-in-error：エラーunknown：不明、|
|category| | | |0..1\*|CodeableConcept |"http://terminology.hl7.org/CodeSystem/v2-0074" "CTH"|診断サービスの種類区分。【コード表：別表】http://hl7.org/fhir/valueset-diagnostic-service-sections.html|
|code| | | |1..1|CodeableConcept |"http://loinc.org" |検査・診断レポートの名称とコード。【コード表：別表】SS-MIX2文書コード表のうち報告書のカテゴリー部分を使用する。これはLOINCコードに準拠している。コード表に該当しない場合、テキスト記述だけでもよい。 |
|subject | | | |1..1|Reference | |患者を表す**Patient**リソースへの参照。|
|encounter | | | |0..1|Reference(Encounter)| |検査・観察が実施された受診情報（外来受診情報または入院詳細情報） |
|（effective） | | | ||| |このレポートの対象となった検査・診断が実施された時期。4通りのいずれかの子要素（effectiveDateTime、effectivePeriod）のひとつを選択して、それにより記述する。複数を選択はできない。effective要素は記述しないで、直接effectiveDateTime要素のレベルを記述する。|
||effectiveDateTime| | |0..1|dateTime| |日時 |
||effectivePeriod| | |0..1|Period| |期間 |
|| |start| |0..1|dateTime| |開始日時 |
|| |end| |0..1|dateTime| |終了日時 |
|performer | | | |0..1\*|Reference(Practitioner \| PractitionerRole \| Organization )| |このレポート診断内容に責任をもつ者。 |
|resultsInterpreter| | | |0..\* |Reference(Practitioner \| PractitionerRole)| |主たるレポート作成者（検査結果判断者） |
|specimen| | | |0..\* |Reference(Specimen) | |この検査の検体・対象情報 |
|result| | | |0..\* |Reference(Observation)| |検査の場合の検査結果情報への参照。 |
|imagingStudy| | | |0..\* |Reference(ImagingStudy) | |画像検査の場合の実施情報への参照。 |
|media | | | |0..\* |BackboneElement | |このレポートに関連するキー画像。 |
||component| | |0..1|string| |キー画像に対するコメント（説明）記述。 |
||link | | |1..1|Reference(Media)| |画像ソース情報への参照 |
|conclusion| | | |0..1|string| |臨床診断（解釈）の叙述的な記述。 |
|conclusionCode| | | |0..\* |CodeableConcept |"urn:oid:1.2.392.200119.4.101.6"<br>"E48A"<br>"胃癌" |臨床診断（解釈）、所見のコード表現。system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。" E48A"は、MEDIS標準病名マスター病名交換用コードで"胃癌"のコード。|
|presentationForm| | | |0..\* |Attachment| |診断レポートそのもののデータを添付情報として格納する。 |
||contentType| | |0..\* |code| |データのMime typeコード。|
||data | | |0..\* |base64Binary| |データを埋め込む場合、base64形式でここに埋め込む。データを埋め込まず、次の要素urlで参照する方式でもよい。|
||url| | |0..\* |url | |データを取得できるURL|
||title| | |0..\* |string| |診断レポート添付情報のタイトル |


<br><br><br>

# <a id="tbl-11">**表11　　　DocumentReferenceリソース　 文書参照情報**</a>

|要素Lv1 |要素Lv2 |要素Lv3|多重度|型|値 |説明|
|-------|-----|------|------|----------|--------------------------------|-------------------------------|
|resourceType|| |||"DocumentReference"|DocumentReferenceリソースであることを示す |
|meta|| |1..1|Meta| ||
||profile | |1..1\*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_DocumentReference_eCS"|本文書のプロファイルを識別するURLを指定する。値は固定。 |
|status|| |1..1|code|"current"|"current" 固定|
|description || |0..1|string|"退院時サマリー" |人が読むことのできる添付文書のタイトルなど。値は例示。|
|content || |1..1\*|BackboneElement | |参照する文書|
||attachment| |1..1|Attachment|"2021-02-01T13:28:17.239+09:00"|このリソースを生成した日時。時刻の精度はミリ秒とし、タイムゾーンを含めること。値は例示。|
|||contentType|1..1|code|"text/html"|文書データのMIMEタイプ（値は例示）|
|||data |0..1|base64Binary|"......."|base64Binary型でエンコードされた添付文書データ。データをリソースに埋め込む場合に使用する（推奨）|
|||url|0..1|url |"https://......"　"file:///....." など |文書の所在。このURLに直接アクセスすると文書が取得できなくてはならない。 |
|context || |0..1|BackboneElement | |必要に応じて、添付文書に関連する検査結果（Observationリソースなど）への参照を記録することが可能 |
||related | |1..1\*|Reference(Any)| ||
|||reference|1..1|string| |関連するリソースのuri |


<br><br><br>

# <a id="tbl-12">**表12　　Encounterリソース　受診時情報（診療情報提供書）/入院詳細情報(退院時サマリー)**</a>

|要素Lv1|要素Lv2 |要素Lv3|要素Lv4|多重度|型|値|説明|
|-----|----------|--|--|-----|--------------|------------------------------|---------------------------------------------------------------------------------|
|resourceType || | |||"Encounter" |**Encounter**リソースであることを示す |
|meta || | |1..1|Meta|||
| |profile | | |1..1\*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Encounter_eCS"|本文書のプロファイルを識別するURLを指定する。値は固定。 |
|identifier || | |0..1\*|Identifier||この医療機関における入院管理番号|
| |system| | |1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" |付番方法については「識別子名前空間一覧」を参照。値は例示。|
| |value | | |1..1||"1311234567-2020-00123456"|入院管理番号の文字列。値は例示。|
|status || | |1..1|code|"finished"|この情報のステータスEncounterStatus(http:// hl7.org/fhir/ValueSet/encouner-status)より"finished"を指定する。固定値。|
|class|| | |1..1|Coding||受診イベントの分類|
| |system| | |1..1|uri |"http://terminology. hl7.org/CodeSystem/v3-ActCode" |コード体系v3.ActEncounterCodeを識別するURI。固定値。|
| |code| | |1..1|code|“IMP” または”AMB” |「IMP:入院(inpatient Encounter)」または、「AMB:外来受診(ambulatory)」退院時サマリーで退院時を記述する場合には"IMP"を使用する。|
| |display | | |1..1|string|“入院” または”外来” ||
|classHistory || | |0..\* |||この入院期間までの外来受診履歴や入院履歴を記述したい場合にここに繰り返しで記述する。紹介先受診情報では不要。|
| |class | | |1..1|Coding||受診イベントの分類|
| ||system | |1..1|uri |"http://terminology. hl7.org/CodeSystem/v3-ActCode" |コード体系v3.ActEncounterCodeを識別するURI。固定値。|
| ||code | |1..1||“IMP” または”AMB” |「IMP:入院(inpatient Encounter)」または、「AMB:外来受診(ambulatory)」退院時サマリーで退院時を記述する場合には"IMP"を使用する。<br>* INPではなくIMPであることに注意。|
| ||display| |1..1||"入院"または"外来"||
| |period| | |0..1||||
| ||start| |1..1|dateTime|"2020-08-21"|上記イベントの開始日時。入院の場合には入院日、外来受診の場合には診療情報提供書の記載基準となった外来受診日に相当するがperiod要素自体は省略できる。|
| ||end| |0..1|dateTime|"2020-08-24"|上記イベントの終了日時。入院の場合には退院日、外来受診の場合には不要。|
|period || | |0..1|Priod ||入院期間を表す必要がある場合には必須。外来では必要な場合を除き省略可。|
| |start | | |1..1|dateTime|"202-09-01" |この入院の入院日時|
| |end | | |1..1|dateTime|"2020-09-18"|この入院の退院日時|
|length || | |0..1|Duration||この入院の在院日数|
| |value | | |1..1|decimal |7 |在院日数。値は例示。|
| |unit| | |1..1|string|"日"|在院日数の単位文字列。固定値。|
| |system| | |1..1|uri |"http://unitsofmeasure.org" |単位コードUCUMのコード体系を識別するURI。固定値。 |
| |code| | |1..1|code|"d" |日を意味する単位コード「d」。固定値。 |
|reasonCode || | |1..\*0..\*|CodeableConcept |"urn:oid:1.2.392.200119.4.101.6"<br>"B0EF"<br>"持続腹痛"|入院時主訴・入院理由。紹介する理由（主訴・目的）コードで記述できる場合にそのコード記述。system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。"BOEF"は、MEDIS標準病名マスター病名交換用コードで"持続腹痛"のコード。"持続腹痛"は、入院時主訴・入院理由のテキスト記述。|
|diagnosis|| | |0..\* |||入院期間中の診断情報。診療情報提供書では不要。|
| |condition | | |1..1|Reference(Condition)||患者状態（病態・疾患名・症状）への参照|
| |use | | |0..1|CodeableConcept ||診断の位置付け区分（DiagnosisRole）。これにより、入院時診断、退院時診断、などが区別される。入院中のすべての診断病名にこのコードが必須ではないが、少なくともAD:入院時診断、DD:退院時診断、CC:主訴、についてはそれぞれ1個以上はこのコードがついている必要がある。 |
| ||coding | |1..\* |||同じ診断名に複数の診断位置付けコードをつけることができる。|
| || |system |1..1||"http://terminology.hl7.org/CodeSystem/diagnosis-role"|診断位置付けValueSet（FHIR準拠の場合のコード表）|
| || |code |1..1||"DD"|AD:入院時診断、DD:退院時診断、CC:主訴、CM:併存症診断、pre-op:術前診断、post-op:術後診断、billing:会計請求診断（FHIR準拠の場合のコード表）。値は例示。 |
| || |display|1..1||"退院時診断"|コードに対する名称。値は例示。|
| |rank| | |0..1|positiveInt |1 |同じ診断位置付け内での順序数値（1から順）。順序は医療者の意図によりつけてよい。値は例示。 |
|hospitalization|| | |1..1|BackboneElement ||入退院詳細情報。診療情報提供書では不要。|
| |origin| | |0..1|Reference(Location \| Organization)||入院前の所在場所または施設への参照。|
| |admitSource | | |0..1|CodeableConcept |"http://jpfhir.jp/fhir<br>/Common/CodeSystem/admit-Source"<br>"1" |入院経路を表すコード情報。値は例示。コード表は一例（出典：厚労省DPC導入影響評価調査）0 院内の他病棟からの転棟1 家庭からの入院4 他の病院・診療所の病棟からの転院5 介護施設・福祉施設に入所中8 院内で出生9 その他 |
| |reAdmission | | |0..1|CodeableConcept ||再入院の場合の再入院種類。当面未使用|
| |specialCourtesy | | |0..1|CodeableConcept ||特別配慮を要する入院。VIP、職員、医療専門職といった区分。当面未使用 |
| |SpecialArrangement| | |0..1|CodeableConcept ||特別調整を要する入院。車椅子、増設ベッド、通訳、付き添い、盲導犬等の必要性。当面未使用|
| |destination | | |0..1|Reference(Location \| Organization)||退院先場所または施設への参照。|
| |dischargeDisposition| | |1..1|CodeableConcept |"http://jpfhir.jp/fhir<br>/Common/CodeSystem/discharge-disposition"<br>"3"|退院時転帰コード情報。コード表は暫定（出典：厚労省DPC導入影響評価調査）1傷病が治癒・軽快3:傷病（白血病、潰瘍性大腸炎、クローン病等）が寛解4:傷病が不変5:傷病が増悪6:傷病による死亡7:傷病以外による死亡9:その他（検査入院,正常分娩及び人間ドック含む） |
|location || | |0..\* |BackboneElement ||入院中の所在場所（病棟病室など）。診療情報提供書では不要。|
| |location| | |0..1|Reference(Location) ||入院中の所在場所（病棟病室など）への参照|
| |status| | |1..1|code|"completed" |planned \| active \| reserved \| completed のいずれかであるが、退院時サマリーなので"completed"。 |
| |physicalType| | |0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/location-physical-type"<br>"ro"|所在場所のタイプ。bu: 建物wa: 病棟ro: 病室bd: ベッドarea: エリア　など。|
| |preiod| | |0..1|Period||所在期間|
| ||start| |0..1|dateTime||所在期間の開始日時|
| ||end| |0..1|dateTime||所在期間の終了日時|


<br><br><br>

# <a id="tbl-13">**表13　　FamilyMemberHistoryリソース　家族歴情報**</a>

|要素Lv1 |要素Lv2 |要素Lv3 |要素Lv4 |多重度|型|値|説明 |
|------|--------|-------|-------|------|----------|------------------------------|-------------------------------------------------------------------------------------------------------------------|
|resourceType||||||"FamilyMemberHistory" |**FamiliMemberHistory**リソースであることを示す|
|meta||||1..1|Meta|| |
||profile |||1..1\*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_FamilyMemberHistory_eCS"|本文書のプロファイルを識別するURLを指定する。値は固定。|
|text||||0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。 |
||status|||1..1|code|"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。 |
||div |||1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; |値は例示。 |
|identifier||||0..1\*|Identifier||この情報に付番されたID |
||system|||1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" | |
||value |||1..1||"1311234567-2020-00123456"|この情報IDの文字列。値は例示。 |
|status||||1..1|code|"partial" |特定の家族構成メンバーの家族歴情報のステータス。コード表："http://hl7.org/fhir/history-status"partial \| completed \| entered-in-error \| health-unknown"一部情報が取得された \| 利用可能な家族健康情報はすべて取得された\|このリソース情報はエラーになる \| この家族の健康状態は不明。|
|dataAbsentReason||||0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/history-absent-reason"<br>"unable-to-obtain" |この家族の情報がとれない理由コード。subject-unknown：Subject Unknown 患者がこの家族を知らない。例えば、養子縁組された患者が生物学的親の情報を知らないなど。withheld：Information Withheld　患者は情報の共有を差し控えるか、または拒否した。unable-to-obtain：Unable To Obtain　情報を取得できない。例：意識不明の患者。deferred：Deferred　患者は現在情報を持っていませんが、後日情報を提供することがでる。|
|patient ||||1..1|Reference(Patient)|"urn: ....."|対象となる患者リソースへの参照。 |
|date||||0..1|dateTime||家族歴情報が取得された、または更新された日時。 |
|name||||0..1|string||この家族の名前。通称や患者からの呼び名でもよい（"スーザンおばさん"など）。 |
|relationship||||1..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/v3-RoleCode" |患者に対するこの家族の関係。例：DAU：娘コード表はhttp://terminology.hl7.org/ValueSet/v3-FamilyMember　を参照。 |
|sex ||||0..1|CodeableConcept |"http://hl7.org/fhir/administrative-gender"<br>"female" |家族の性別。male \| female \| other \| unknown|
|(born)||||0..1|(Period\| date\| string)||家族の（おおよその）誕生日。次の3つの要素のいずれかで記述する。born要素は記述しない。|
||bornPeriod||||Period||期間で表現したい場合。 |
||bornDate||||date||日付で表現したい場合。 |
||bornString||||string||文字列で記述したい場合。 |
|（age） ||||0..1|||家族の（おおよその）年齢。次の3つの要素のいずれかで記述する。age要素は記述しない。 |
||ageAge|||0..1|Age ||年齢で記述したい場合。 |
||ageRange|||0..1|Range ||数値の範囲で記述したい場合。 |
||ageString |||0..1|string|"40歳前後"|文字列で記述したい場合。 |
|estimatedAge||||0..1|boolean |true|上記年齢は（計算やアルゴリズムによる）推定値によるものであればtrue、それ以外はfalse。|
|（deceased）||||0..1|||家族が死亡している場合に、その真偽、年齢、時期などのいずれかひとつの要素で記述する。deceased 要素は記述しない。|
||deceasedBoolean |||0..1|boolean ||真偽値。 |
||deceasedAge |||0..1|Age ||死亡年齢。 |
||deceasedRange |||0..1|Range ||死亡時期の範囲。 |
||deceasedDate|||0..1|date||死亡日付。 |
||deceasedString|||0..1|string|"患者が60歳の頃。"|死亡時期についての文字列記述。 |
|note||||0..\* |||この家族に関する一般的な情報のテキスト記述 |
||author||||||記載者の情報 |
|||authorString||0..1|string|"患者自身"|記載者氏名などの文字列。必ずしも氏名でなくてもよい。 |
||time|||0..1|dateTime||この追加的な情報が作成された日時。 |
||text|||1..1|markdown||追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。 |
|condition ||||0..\* |BackboneElement ||家族が持っていた重要な状態（または状態）。複数記述できる。 |
||code|||1..1|CodeableConcept |"urn:oid:1.2.392.200119.4.101.6"<br>"E48A"<br>"胃癌"|患者状態、プロブレム、診断のコード記述。system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。" E48A"は、MEDIS標準病名マスター病名交換用コードで"胃癌"のコード。|
||outcome |||0..1|CodeableConcept |"術後生存、化学療法中"|この状態の結果（転帰）。Coding記述はせず、textにのみ記述する。 |
||contributedToDeath|||0..1|boolean ||死亡している場合に、この状態（疾患など）が原因もしくは寄与している場合にtrue。この要素を記述しない場合、不明とみなす。 |
||(onset) |||0..1|||この状態（疾患など）が最初に出現した時期。次の4つの要素のいずれかひとつで記述する。onset要素は記述しない。 |
|||onsetAge|||Age ||年齢で記述。 |
|||onsetRange|||Range ||年齢の範囲で記述。 |
|||onsetPeriod |||Period||時期の期間もしくは時期で記述。 |
|||onsetString |||string||文字列で時期を記述。 |
||note|||0..\* |||この状態に関する追加的な情報。 |
|||author||0..1||| |
||||authorString|0..1|string|"患者"|記載者氏名などの文字列。必ずしも氏名でなくてもよい。 |
|||time||0..1|dateTime||この追加的な情報が作成された日時。 |
|||text||1..1|markdown||追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。 |


<br><br><br>

# <a id="tbl-14">**表14　　ImagingStudyリソース　画像検査実施情報**</a>

|要素Lv1 |要素Lv2|要素Lv3|要素Lv4|多重度|型 |値 |説明|
|-------|--|--|--|------|------------------------|----------------------------|---------------------------------------------------------|
|resourceType| | | || |"ImagingStudy" |**ImagingStudy**リソースであることを示す|
|meta| | | |1..1|Meta | ||
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| | |0..*|canonical(StructureDefinition) |"http://jpfhir.jp/fhir<br>/core<br>/StructureDefinition<br>/JP_ImagingStudy_Radiology"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text| | | |0..1|Narrative| |本リソースをテキストで表現したものを入れてもよい。|
||status | | |1..1|code |"generated"|固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
||div| | |1..1|xhtml|&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt;|値は例示。|
|identifier| | | |0..1\*|Identifier | |この検査情報に付番されたID|
||system | | |1..1| |"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier"||
||value| | |1..1| |"1311234567-2020-00123456" |検査情報IDの文字列。値は例示。|
|status| | | |1..1|code |"final"|検査結果のステータス。コード表："http://hl7.org/fhir/imagingstudy-status"registered \| available \| cancelled \| entered-in-error \| unknown　など。登録済み\|利用可能\|キャンセル済み\|エラー発生\|不明|
|modality| | | |0..1\*|CodeableConcept|"urn:oid: 1.2.840.10008.6.1.19""CT"<br>"Computed Tomography" |画像取得装置区分。コード表は以下を参照。http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html|
|subject | | | |1..1|Reference| |患者を表す**Patient**リソースへの参照。 |
|encounter | | | |0..1|Reference(Encounter) | |検査・観察が実施された受診情報（外来受診情報または入院詳細情報）|
|started | | | |0..1|dateTime | |検査開始（実施）日時|
|basedOn | | | |0..\* |Reference(CarePlan \| ServiceRequest \| Appointment \| AppointmentResponse \| Task)| |検査リクエストが出された元の情報。当面未使用。|
|referrer| | | |0..1|Reference(Practitioner \| PractitionerRole) | |依頼医情報への参照|
|interpreter | | | |0..\* |Reference(Practitioner \| PractitionerRole) | |画像診断医、読影医、解釈医などの情報への参照|


<br><br><br>

# <a id="tbl-15">**表15　　Immunizationリソース　ワクチン接種情報**</a>

|要素Lv1 |要素Lv2|要素Lv3|要素Lv4|多重度|型|値 |説明|
|----|---------|--|--|------|---------------------|----------------------------|-----------------------------------------------------------------|
|resourceType| | | |||"Immunization" |**Immunization**リソースであることを示す|
|meta| | | |1..1|Meta| ||
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| | |0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Immunization_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text| | | |0..1|Narrative | |本リソースをテキストで表現したものを入れてもよい。|
||status | | |1..1|code|"generated"|固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
||div| | |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt;|値は例示。|
|identifier| | | |0..1\*|Identifier| |このワクチン接種情報に付番されたID|
||system | | |1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier"||
||value| | |1..1||"1311234567-2020-00123456" |ワクチン接種情報IDの文字列。値は例示。|
|status| | | |1..1|code|"final"|ワクチン接種情報のステータス。コード表："http://hl7.org/fhir/event-status"preparation \| in-progress \| not-done \| on-hold \| stopped \| completed \| entered-in-error \| unknown準備中\|進行中\|未完了\|保留中\|停止\|完了\|エラー\|不明|
|statusReason| | | |0..1|CodeableConcept | |ステータス事由。当面、textでのみ記述する。|
|vaccineCode | | | |1..1|CodeableConcept |" urn:oid:1.2.36.1.2001.1005.17"<br>"MMR II"<br>"麻疹＋風疹＋ムンプスワクチンII" |ワクチンコード。"http://hl7.org/fhir/sid/cvx"または" urn:oid:1.2.36.1.2001.1005.17"より。コード表http://hl7.org/fhir/valueset-vaccine-code.html 参照。|
|patient | | | |1..1|Reference(Patient)| |患者を表す**Patient**リソースへの参照。 |
|encounter | | | |0..1|Reference(Encounter)| |検査・観察が実施された受診情報（外来受診情報または入院詳細情報）|
|（occurrence）| | | |1..1|| |ワクチン接種が実施された（される予定だった、または予定の）時期。次の2通りのいずれかの要素のひとつを選択して、それにより記述する。複数を選択はできない。occurrence要素は記述しない。 |
||occurrence DateTime| | |0..1|dateTime| |日時|
||occurrence String| | |0..1|string| |時期を文字列で記述。|
|recoreded | | | |0..1|dateTime| |ワクチン接種をこの患者の記録として最初に記録した日付。|
|primarySource | | | |0..1|boolean | |この接種情報が患者から根拠ある記録として得られたオリジナル情報であればtrue。|
|reportOrigin| | | |0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/immunization-origin"|二次的な報告書から得られた情報の場合にその元情報区分。provider:他の医療者record:記録文書recall:患者を含む関係者の記憶school:学校での記録jurisdiction:記録管理システム |
|location| | | |0..1|Reference(Location) | |接種した場所情報への参照。|
|manufacturer| | | |0..1|Reference(Organization) | |製造会社情報への参照。|
|lotNumber | | | |0..1|string| |ロット番号。|
|expirationDate| | | |0..1|date| |使用有効期限。|
|site| | | |0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/v3-ActSite" |身体の接種部位。LA：左腕RA：右腕BU:臀部 |
|route | | | |0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/v3-RouteOfAdministration" |接種経路。IDINJ:皮内注射IM:筋肉内注射NASINHLC:経鼻吸入IVINJ:静脈注射PO:口腔飲用SQ:皮下注射TRNSDERM:経皮吸収 |
|doseQuantity| | | |0..1|SimpleQuantity| |ワクチン摂取量。|
|performer | | | |0..\* |BackboneElement | |実施した人の情報。|
||actor| | |1..1|Reference(Practitioner \| PractitionerRole \| Organization \| Device)| |実施した人への参照。|
|note| | | |0..\* |Annotation| |追加的な叙述的記述。|
|reaction| | | |0..\* |BackboneElement | |摂取後の副反応の情報。|
||date | | |0..1|dateTime| |副反応が始まった日時。|
||detail | | |0..1|Reference(Observation)| |副反応の所見詳細|
||reported | | |0..1|boolean | |患者自身による報告のときtrue。|


<br><br><br>

# <a id="tbl-16">**表16　　MedicationRequestリソース　処方依頼情報**</a>

|要素Lv1|要素Lv2 |要素Lv3 |要素Lv4|多重度|型|値|説明|
|----------|-------|-------|--|------|----------|---------------------------|-------------------------------------|
|resourceType ||| |||"MedicationRequest" |**MedicationRequest**リソースであることを示す |
|meta ||| |1..1|Meta|||
| |profile || |1..1\*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/ePrescription/StructureDefinition<br>/JP_MedicationRequest_ePrescriptionData"|本文書のプロファイルを識別するURLを指定する。値は固定。処方情報FHIR記述仕様のProfileを使用する。|
|text ||| |0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。|
| |status|| |1..1|code|"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
| |div || |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; ||
|identifier ||| |1..1\*|Identifier||剤グループ（Rp）番号。詳細は「4.9.2剤グループ構造とその番号」参照。 |
| |system|| |1..1|uri |"urn:oid:1.2.392.100495.20.3.81"|剤グループ番号の名前空間を識別するURI。固定値。 |
| |value || |1..1|string|"1" |剤グループ番号|
|identifier ||| |1..1\*|Identifier||剤グループ内連番。詳細は「4.9.2剤グループ構造とその番号」参照。 |
| |system|| |1..1|uri |"urn:oid:1.2.392.100495.20.3.82"|剤グループ内番号の名前空間を識別するURI。固定値。 |
| |value || |1..1|string|"1" |剤グループ内連番。|
|status ||| |1..1|code|"completed" |過去処方はcompleted固定値 |
|intent ||| |1..1|code|"order" |固定値|
|medicationCodeableConcept||| |1..1|CodeableConcept ||医薬品コードと医薬品名称。coding要素を繰り返すことでHOT9やYJコードなど複数のコード体系で医薬品コードを並記することが可能。|
| |coding|| |1..\* |Coding|||
| ||system| |1..1|uri |"urn:oid: 1.2.392.200119.4.403.1" |医薬品コード（HOT9）を識別するURI。値は例示。 |
| ||code| |1..1|code|"103831601" |医薬品コード（HOT9）。値は例示|
| ||display | |1..1|string|"カルボシステイン錠２５０ｍｇ"|医薬品名称。値は例示。|
|subject||| |1..1|Reference ||患者を表す**Patient**リソースへの参照。 |
| |reference || |1..1|string|"urn:uuid:1af0a9a6-a91d-3aef-fc4e-069995b89c4f" |**Patient**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。|
|authoredOn ||| |1..1|dateTime|"2020-08-21T12:28:17+09:00" |処方指示が最初に作成された日時。秒の精度まで記録する。タイムゾーンも付与しなければならない。値は例示。|
|note ||| |0..1\*|Annotation||薬剤単位の備考。詳細は「4.9.8.1薬剤単位の指示」 |
| |text|| |1..1|markdown|"4月1日から4日間服用。2週間休薬後、4月19日から4日間服用。患者に書面にて説明済み。"|備考文字列。値は例示。|
|dosageInstruction||| |0..\* |Dosage||用法や投与量を含む処方指示。詳細は表16-1に記載。|
|dispenseRequest||| |1..1|BackboneElement ||調剤情報|
| |extension || |0..\* |Extension ||調剤指示を表す拡張「InstructionForDispense」。表16-1に示す。|
| |extension || |0..1\*|Extension ||頓用回数を表現する拡張「ExpectedRepeatCount」。 |
| ||url | |1..1|uri |"http://jpfhir.jp/fhir<br>/eReferral/StructureDefinition<br>/ExpectedRepeatCount" |拡張を識別するURL。固定値。 |
| ||valueInteger| |1..1|integer |5 |頓用回数。値は例示。|
| |quantity|| |0..1|SimpleQuantity||調剤量|
| ||value | |1..1|decimal |21|調剤量。値は例示。|
| ||unit| |1..1|string|"錠"|単位文字列。値は例示。|
| ||system| |1..1|uri |"urn:oid:1.2.392.100495.20.2.101"|医薬品単位略号を識別するURL。固定値。 |
| ||code| |1..1|code|"TAB" |医薬品単位略号。値は例示。|
| |expectedSupplyDuration|| |0..1|Duration||調剤日数|
| ||value | |1..1|decimal |7 |調剤日数。値は例示。|
| ||unit| |1..1|string|"日"|調剤日数の単位。「日」固定。|
| ||system| |1..1|uri |"http://unitsofmeasure.org" |UCUM単位コードを識別するURI。固定値。 |
| ||code| |1..1|code|"d" |「日」を表すUCUM単位コード。固定値。|
|substitution ||| |0..1|BackboneElement ||後発医薬品への変更可否情報。詳細は「5.1後発品変更可否」参照。 |
| |allowedCodeableConcept|| |1..1|CodeableConcept |||
| ||| |1..1\*|Coding||後発品変更不可コード。|
| |||system |1..1|uri |"urn:oid:1.2.392.100495.20.2.41"|後発品変更不可コードを識別するURI。固定値。 |
| |||code |1..1|code|"1" |後発品変更不可コード。値は例示。|
| |||display|0..1|string|"変更不可"|値は例示。|
| |reason|| |0..1|CodeableConcept ||後発品変更不可の理由。|
| ||text| |1..1|string|"患者からの強い要望により"|理由を表す文字列。値は例示。|


<br><br><br>

# <a id="tbl-16-1">**表 16-1 MedicationRequest．dosageInstruction処方情報の用法指示情報**</a>


|要素Lv1 |要素 Lv2 |要素 Lv3|要素Lv4|多重度|型 |値 |説明|
|------|--------|----|--|------|-----|------------------------------------|--------------------------------------------------|
|extension| || |0..1\*|Extension| |投与開始日を明示したい場合に使用する拡張「PeriodOfUse」。詳細は処方情報HL７FHIR記述仕様を参照。 |
| |url|| |1..1\*|uri|"http://jpfhir.jp/fhir<br>/core/Extension/StructureDefinition<br>/JP_MedicationDosage_PeriodOfUse"|拡張を識別するURL。固定値。 |
| |valuePeriod|| |1..1|Period | |投与期間を表す|
| | |start | |1..1|dateTime |"2020-08-21" |処方期間の開始日|
|extension| || |0..1\*|Extension| |隔日投与など、服用開始日から終了日までの日数と実投与日数が異なる場合に、実投与日数を明示したい場合に使用する拡張 「UsageDuration」。詳細は処方情報HL７FHIR記述仕様を参照。|
| |url|| |1..1|uri|"http://jpfhir.jp/fhir<br>/core/Extension/StructureDefinition<br>/JP_MedicationRequest_DosageInstruction_UsageDuration"|拡張を識別するためのURL。固定値。 |
| |valueDuration|| |1..1|Duration | ||
| | |value | |1..1|decimal|7|実投与日数。例示。|
| | |unit| |1..1|string |"日" |単位「日」。|
| | |system| |1..1|uri|"http://unitsofmeasure.org"|単位コード UCUMを識別するURI。固定値。|
| | |code| |1..1|code |"d"|単位コードUCUMにおける実投与日数の単位を表すコード。固定値。|
|text | || |1..1|string |"内服・経口・１日３回朝昼夕食後　１回１錠　７日分" |dosageInstructionが表す処方指示の文字列表現。値は例示。 |
|additionalInstruction| || |0..\* |CodeableConcept| |補足的な処方指示。本文書では、不均等投与を1日用法として記載する場合に、補足用法コードを記録するために使用する。詳細は処方情報HL７FHIR記述仕様を参照。 |
| |coding || |1..1\*|Coding | ||
| | |system| |1..1|uri|"urn:oid:1.2.392.200250.2.2.20.22" |JAMI補足用法８桁コードを識別するURI。固定値 |
| | |code| |1..1|code |"V14NNNNN" |JAMI補足用法コード指定する。値は例示。|
| | |display | |0..1|string |"不均等・１回目・４錠" |コードの表示名。値は例示。|
| |text || |0..1|string |１日３回　毎食後　７錠（４錠－２錠－１錠） |不均等投与の表現文字列。|
|timing | || |1..1|Timing | |服用タイミングを記録する。|
| |event|| |0..\* |dateTime |"2020-08-21" |服用タイミングを具体的な日時で指定する場合に使用する。値は例示。詳細は処方情報HL７FHIR記述仕様を参照。|
| |repeat || |0..1|Element| ||
| | |boundsDuration| |0..1|Duration | |服用開始日から服用終了日までの全日数。実投与日数ではないことに注意する。詳細は処方情報HL７FHIR記述仕様を参照。|
| | ||value|1..1|decimal|7|投薬日数。値は例示。|
| | ||unit |1..1|string |"日" |投薬日数の単位文字列。固定値。|
| | ||system |1..1|uri|"http://unitsofmeasure.org"|単位コードUCUMのコード体系を識別するURI。固定値。 |
| | ||code |1..1|code |"d"|日を意味する単位コード「d」。固定値。 |
| |code || |1..1|CodeableConcept| |用法。JAMI標準用法コードを指定する。詳細は処方情報HL７FHIR記述仕様を参照。|
| | |coding| |1..1\*|Coding | ||
| | ||system |1..1|uri|"urn:oid:1.2.392.200250.2.2.20" |JAMI標準用法16桁コードを識別するURI。固定値。 |
| | ||code |1..1|code |"1013044400000000" |JAMI標準用法コード。値は例示。|
| | ||display|0..1|string |"内服・経口・１日３回朝昼夕食後" |JAMI標準用法コードの表示名。値は例示。|
|asNeededBoolean| || |0..1|boolean| |頓用型の用法を指定する場合に"true"を指定する。詳細は処方情報HL７FHIR記述仕様を参照。|
|site | || |0..1|CodeableConcept| |外用薬で部位を指定する場合に使用する。詳細は処方情報HL７FHIR記述仕様を参照。|
| |coding || |1..1\*|Coding | ||
| | |system| |1..1|uri|"urn:oid:1.2.392.200250.2.2.20.32" |JAMI外用部位３桁コードを識別するURI。固定値。 |
| | |code| |1..1|code |"950"|JAMI部位コード。値は例示。|
| | |display | |0..1|string |"膝" |JAMI部位コードの表示名。値は例示。|
| |text || |0..1|string |"膝" |部位のテキスト表現。|
|route| || |0..1|CodeableConcept| |投与経路|
| |coding || |1..1\*|Coding | ||
| | |system| |1..1|uri|"http://jpfhir.jp/fhir<br>/eReferral/CodeSystem/route-codes" |投与経路コード表のsystemを設定する。固定値。|
| | |code| |1..1|code |"PO" |投与経路コード表で規定するコード。値は例示。|
| | |display | |0..1|string |"口" |投与経路コード表で規定するコードの表示名。値は例示。|
| |text || |0..1|string |"経口" |投与経路の文字列表現。コードで指定できない場合、本要素で文字列として指定してもよい。|
|method | || |0..1|CodeableConcept| |投与方法|
| |coding || |1..1\*|Coding | ||
| | |system| |1..1|uri|"urn:oid:1.2.392.200250.2.2.20.30" |投与方法に対応するJAMI用法コード表基本用法１桁コードを識別するURI。同2桁コード（"urn:oid:1.2.392.200250.2.2.20.40"）を使用してもよい。|
| | |code| |1..1|code |"1"|JAMI用法コード表基本用法１桁コード。同2桁コード（"urn:oid:1.2.392.200250.2.2.20.40"）を使用してもよい。値は例示。 |
| | |display | |0..1|string |"内服" |JAMI用法コード表基本用法１桁コードの表示名。同2桁コード（"urn:oid:1.2.392.200250.2.2.20.40"）を使用してもよい。値は例示。 |
| |text || |0..1|string |"内服" |投与方法のテキスト表現。コードで指定できない場合、本要素で文字列として指定してもよい。|
|doseAndRate| || |0..\* |Element| |投与量を記録する。記録方法の詳細は、「6.9.3.2　内服薬　２)用量」参照。|
| |type || |1..1|CodeableConcept| |力価区分。|
| | |coding| |1..1\*|Coding | ||
| | ||system |1..1|uri|"urn:oid:1.2.392.100495.20.2.22" |力価区分コードのコード体系を識別するURI。固定値。 |
| | ||code |1..1|code |"1"|力価区分コード。値は例示。（1：製剤量　2：原薬量）|
| | ||display|0..1|string |"製剤量" |力価区分コードの表示名。値は例示。|
| |doseQuantity || |0..1|SimpleQuantity | |1回投与量 |
| | |value | |1..1|decimal|1|1回投与量。値は例示。 |
| | |unit| |1..1|string |"錠" |投与量の単位。値は例示。|
| | |system| |1..1|uri|"urn:oid:1.2.392.100495.20.2.101"|医薬品単位略号を識別するOID。 |
| | |code| |1..1|code |"TAB"|医薬品単位略号。値は例示。|
| |rateRatio|| |0..1|Ratio| |1日投与量を表す。 |
| | |numerator | |1..1|Quantity | |1日投与量。 |
| | ||value|1..1|decimal|3|1日投与量。値は例示。 |
| | ||unit |1..1|string |"錠" |投与量の単位。値は例示。|
| | ||system |1..1|uri|"urn:oid:1.2.392.100495.20.2.101"|医薬品単位略号を識別するOID。 |
| | ||code |1..1|code |"TAB"|医薬品単位略号。値は例示。|
| | |denominator | |1..1|Quantity | |1日投与量の分母である「1日」を表す。|
| | ||value|1..1|decimal|1|固定値。|
| | ||unit |1..1|string |"日" |固定値。|
| | ||system |1..1|uri|"http://unitsofmeasure.org"|UCUM単位コードを識別するURI。固定値。 |
| | ||code |1..1|code |"d"|「日」を表すUCUM単位コード。|


<br><br><br>

# <a id="tbl-16-2">**表 16-2 Extension　（InstructionForDispense） 調剤指示拡張情報**</a>

|要素Lv1|要素Lv2 |要素Lv3|要素Lv4|要素Lv5|多重度|型 |値|説明|
|----|----------|--|--|--|------|-----|--------------------------------------|------------------------|
|extension|| | | |0..1|Extension||拡張「InstructionForDispense」。|
| |url | | | |1..1|uri|"http://jpfhir.jp/fhir<br>/core/Extension/StructureDefinition<br>/JP_MedicationRequest_DispenseRequest_InstructionForDispense"|拡張を識別するURL。固定値。 |
| |valueCodeableConcept| | | |1..1|CodeableConcept||コード型の指示内容。|
| ||coding | | |1..1\*|Coding |||
| || |system | |1..1|uri|"urn:oid:1.2.392.200250.2.2.30.10"|調剤指示コードのコード体系を識別するURI。固定値。 |
| || |code | |1..1|code |"C" |調剤指示コード。値は例示。|
| || |display| |0..1|string |"粉砕指示"|コードの表示名。値は例示。|
| ||text | | |1..1|string |"嚥下障害のため、上記粉砕指示"|処方オーダ時に選択または入力し、実際に処方箋に印字される指示内容の文字列。値は例示。|


<br><br><br>

# <a id="tbl-17">**表17　　MedicationStatementリソース　　服薬情報**</a>

|要素Lv1|要素Lv2|要素Lv3 |要素Lv4|多重度|型|値|説明|
|----------|--|-------|--|------|----------|------------------------------|------------------------------------------------------------------------------|
|resourceType | || |||"Condition" |**MedicationStatement**リソースであることを示す |
|meta | || |1..1|Meta|||
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
| |profile|| |0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_MedicationStatement_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text | || |0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。|
| |status || |1..1|code|"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
| |div|| |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; |値は例示。|
|identifier | || |0..1\*|Identifier||この服薬情報に付番されたID|
| |system || |1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" ||
| |value|| |1..1||"1311234567-2020-00123456"|服薬情報IDの文字列。値は例示。|
|status | || |1..1|code|"completed" |服薬状態のステータス。値は例示。コード表："http://hl7.org/fhir/CodeSystem/medication-statement-status"active \| completed \| entered-in-error \| intended \| stopped \| on-hold \| unknown \| not-taken継続中、終了、エラー、今後服薬予定、中止、一時停止、不明、服用せず|
|statusReason | || |0..1\*|CodeableConcept |text:"アレルギーのため中止" |服薬状態のステータスとなった理由。コード化せずテキストのみで記述する。|
|medicationCodeableConcept| || |1..1|CodeableConcept ||医薬品コードと医薬品名称。coding要素を繰り返すことでHOT9やYJコードなど複数のコード体系で医薬品コードを並記することが可能。coding情報を記述せず医薬品名をtextで記述してもよい。|
| |coding || |0..\* |Coding|1 ||
| | |system| |1..1|uri |"urn:oid: 1.2.392.200119.4.403.1" |医薬品コード（HOT9）を識別するURI。値は例示。 |
| | |code| |1..1|code|"103831601" |医薬品コード（HOT9）。値は例示|
| | |display | |1..1|string|"カルボシステイン錠２５０ｍｇ"|医薬品名称。値は例示。|
| |text || |0..1|||医薬品名称テキスト情報|
|subject| || |1..1|Reference ||患者を表す**Patient**リソースへの参照。 |
|effectivePeriod| || |0..1|Period||服薬期間|
| |start|| |0..1|dateTime||開始日|
| |ebd|| |0..1|dateTime||終了日|
|reasonCode | || |0..\* |CodeableConcept |"urn:oid:1.2.392.200119.4.101.6"<br>"B0EF"<br>"持続腹痛"<br>"長く続く腹部の痛み"|この投薬の理由、対象疾患など。system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。"BOEF"は、MEDIS標準病名マスター病名交換用コードで"持続腹痛"のコード。"持続腹痛"はそのテキスト記述の例。|
|note | || |0..\* |||他のフィールドで記述できないイベントに関するテキスト記述|
| |author || |0..1|||記載者の情報|
| | |authorString| |0..1|string|"患者"|記載者氏名などの文字列。必ずしも氏名でなくてもよい。|
| |time || |0..1|dateTime||この追加的な情報が作成された日時。|
| |text || |1..1|markdown||追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。|
|dosage | || |0..1\*|Dosage||服薬指示情報の詳細。別表を参照のこと。|


<br><br><br>

# <a id="tbl-17-1">**表 17-1　MedicationStatement dosage　処方依頼情報の服薬用法情報**</a>

|要素 Lv1 |要素 Lv2|要素 Lv3|要素Lv4|多重度|型 |値|説明|
|------|-------|----|--|------|-----|---------------|----------------------------------------------|
|text ||| |1..1|string |"内服・経口・１日３回朝昼夕食後　１回１錠　７日分"|dosageが表す処方指示の文字列表現。値は例示。|
|additionalInstruction||| |0..\* |CodeableConcept||補足的な処方指示。本文書では、不均等投与を1日用法として記載する場合に、補足用法コードを記録するために使用する。詳細は「4.9.5均等分割用法と不均等用法」参照。|
| |coding|| |1..1\*|Coding |||
| ||system| |1..1|uri|"urn:oid:1.2.392.200250.2.2.20.22"|JAMI補足用法８桁コードを識別するURI。固定値 |
| ||code| |1..1|code |"V14NNNNN"|JAMI補足用法コード指定する。値は例示。|
| ||display | |0..1|string |"不均等・１回目・４錠"|コードの表示名。値は例示。|
|timing ||| |0..1|Timing ||服用タイミングを記録する。|
| |event || |0..\* |dateTime |"2020-08-21"|服用タイミングを具体的な日時で指定する場合に使用する。値は例示。詳細は「4.9.6.4指定日」参照。 |
| |repeat|| |0..1|Element|||
| ||boundsDuration| |0..1|Duration ||服用開始日から服用終了日までの全日数。実投与日数ではないことに注意する。詳細は「4.9.3.2内服薬３)投与日数」、及び、「4.9.3.3外用薬 ３)投与期間」を参照。 |
| |||value|1..1|decimal|7 |投薬日数。値は例示。|
| |||unit |1..1|string |"日"|投薬日数の単位文字列。固定値。|
| |||system |1..1|uri|"http://unitsofmeasure.org" |単位コードUCUMのコード体系を識別するURI。固定値。 |
| |||code |1..1|code |"d" |日を意味する単位コード「d」。固定値。 |
| |code|| |1..1|CodeableConcept||用法。JAMI標準用法コードを指定する。詳細は「4.9.3.2内服薬 １)用法」、及び、「4.9.3.3外用薬 １)用法」を参照。|
| ||coding| |1..1\*|Coding |||
| |||system |1..1|uri|"urn:oid:1.2.392.200250.2.2.20"|JAMI標準用法16桁コードを識別するURI。固定値。 |
| |||code |1..1|code |"1013044400000000"|JAMI標準用法コード。値は例示。|
| |||display|0..1|string |"内服・経口・１日３回朝昼夕食後"|JAMI標準用法コードの表示名。値は例示。|
|asNeededBoolean||| |0..1|boolean||頓用型の用法を指定する場合に"true"を指定する。詳細は「4.9.4.2頓用」を参照。 |
|site ||| |0..1|CodeableConcept||外用薬で部位を指定する場合に使用する。詳細は「4.9.3.3外用薬 ４)部位」参照。 |
| |coding|| |1..1\*|Coding |||
| ||system| |1..1|uri|"urn:oid:1.2.392.200250.2.2.20.32"|JAMI外用部位３桁コードを識別するURI。固定値。 |
| ||code| |1..1|code |"950" |JAMI部位コード。値は例示。|
| ||display | |0..1|string |"膝"|JAMI部位コードの表示名。値は例示。|
| |text|| |0..1|string |"膝"|部位のテキスト表現。|
|route||| |0..1|CodeableConcept||投与経路|
| |coding|| |1..1\*|Coding |||
| ||system| |1..1|uri|"urn:oid:1.2.392.200250.2.2.20.40"|JAMI用法コード表投与経路区分２桁コードを識別するURI。固定値。 |
| ||code| |1..1|code |"10"|JAMI用法コード表投与経路区分２桁コード。値は例示。|
| ||display | |0..1|string |"経口"|JAMI用法コード表投与経路区分２桁コードの表示名。値は例示。|
| |text|| |0..1|string |"経口"|投与経路の文字列表現。コードで指定できない場合、本要素で文字列として指定してもよい。|
|method ||| |0..1|CodeableConcept||投与方法|
| |coding|| |1..1\*|Coding |||
| ||system| |1..1|uri|"urn:oid:1.2.392.200250.2.2.20.30"|投与方法に対応するJAMI用法コード表基本用法１桁コードを識別するURI。 |
| ||code| |1..1|code |"1" |JAMI用法コード表基本用法１桁コード。値は例示。|
| ||display | |0..1|string |"内服"|JAMI用法コード表基本用法１桁コードの表示名。値は例示。|
| |text|| |0..1|string |"内服"|投与方法のテキスト表現。コードで指定できない場合、本要素で文字列として指定してもよい。|
|doseAndRate||| |0..\* |Element||投与量を記録する。記録方法の詳細は、「4.9.3.2内服薬 ２)用量」参照。 |
| |type|| |1..1|CodeableConcept||力価区分。|
| ||coding| |1..1\*|Coding |||
| |||system |1..1|uri|"urn:oid:1.2.392.100495.20.2.22"|力価区分コードのコード体系を識別するURI。固定値。 |
| |||code |1..1|code |"1" |力価区分コード。値は例示。（1：製剤量　2：原薬量）|
| |||display|0..1|string |"製剤量"|力価区分コードの表示名。値は例示。|
| |doseQuantity|| |0..1|SimpleQuantity ||1回投与量 |
| ||value | |1..1|decimal|1 |1回投与量。値は例示。 |
| ||unit| |1..1|string |"錠"|投与量の単位。値は例示。|
| ||system| |1..1|uri|"urn:oid:1.2.392.100495.20.2.101" |医薬品単位略号を識別するOID。 |
| ||code| |1..1|code |"TAB" |医薬品単位略号。値は例示。|
| |rateRatio || |0..1|Ratio||1日投与量を表す。 |
| ||numerator | |1..1|Quantity ||1日投与量。 |
| |||value|1..1|decimal|3 |1日投与量。値は例示。 |
| |||unit |1..1|string |"錠"|投与量の単位。値は例示。|
| |||system |1..1|uri|"urn:oid:1.2.392.100495.20.2.101" |医薬品単位略号を識別するOID。 |
| |||code |1..1|code |"TAB" |医薬品単位略号。値は例示。|
| ||denominator | |1..1|Quantity ||1日投与量の分母である「1日」を表す。|
| |||value|1..1|decimal|1 |固定値。|
| |||unit |1..1|string |"日"|固定値。|
| |||system |1..1|uri|"http://unitsofmeasure.org" |UCUM単位コードを識別するURI。固定値。 |
| |||code |1..1|code |"d" |「日」を表すUCUM単位コード。|


<br><br><br>

# <a id="tbl-18">**表18　　Observationリソース　　検査・観察情報**</a>

|要素Lv1 |要素Lv2 |要素Lv3 |要素Lv4|多重度|型|値|説明 |
|------|----------|-------|--|------|-----------------------------|----------------------------|---------------------------------------------------------------------------------------------------------------|
|resourceType||| |||"Observation" |**Observation**リソースであることを示す|
|meta||| |1..1|Meta|| |
||profile || |1..1\*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Observation_Common_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。設定する値は、検査結果のカテゴリーごとにJP-Coreの該当プロファイルURLとすること。|
|text||| |0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。 |
||status|| |1..1|code|"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。 |
||div || |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; |値は例示。 |
|identifier||| |0..1\*|Identifier||この検査・観察情報に付番されたID |
||system|| |1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" | |
||value || |1..1||"1311234567-2020-00123456"|検査・観察情報IDの文字列。値は例示。 |
|status||| |1..1|code|"final" |検査・観察のステータス。コード表："http://hl7.org/fhir/observation-status"registered \| preliminary \| final \| amended　など。結果未着、中間結果、最終結果、更新結果、エラー修正、キャンセル、エラー、不明、 |
|category||| |0..1\*|CodeableConcept |"http://terminology.hl7.org/CodeSystem/observation-category" "laboratory" |検査・観察の種類区分。social-history:社会生活歴vital-signs：バイタルサインimaging：画像検査laboratory：検査室検査procedure：手術処置治療survey：調査・評価exam：身体検査・観察therapy：非介入治療による観察結果activity：身体活動記録|
|code||| |1..1|CodeableConcept ||検査・観察の項目コードLOINCコードと国内標準コードがある場合には国内標準コードを併用することが望ましいが、適切な標準コード化ができない場合には、施設固有コード、テキスト記述を併用する。|
|subject ||| |1..1|Reference ||患者を表す**Patient**リソースへの参照。|
|encounter ||| |0..1|Reference(Encounter)||検査・観察が実施された受診情報（外来受診情報または入院詳細情報） |
|（effective） ||| ||||検査・観察が実施された時期。4通りのいずれかの子要素（effectiveDateTime、effectivePeriod、effectiveTimig、effectiveInstant）のひとつを選択して、それにより記述する。複数を選択はできない。effective要素は記述しないで、直接effectiveDateTime要素のレベルを記述する。|
||effectiveDateTime || |0..1|dateTime||日時 |
||effectivePeriod || |0..1|Period||期間 |
|||start | |0..1|dateTime||開始日時 |
|||end | |0..1|dateTime||終了日時 |
||effectiveTimig|| |0..1|Timing||繰り返しタイミングや回数を含む情報（本文書では使用しない） |
||effectiveInstant|| |0..1|instant ||システムが生成する瞬間日時情報 |
|performer ||| |0..1\*|Reference(Practitioner \| PractitionerRole \| Organization \| CareTeam \| Patient \| RelatedPerson)||この検査・観察結果に責任をもつ者 |
|(value) ||| ||||検査結果や観察結果。11通りのいずれかの子要素のひとつを選択して、それにより記述する。複数を選択はできない。value要素は記述しないで、直接valueQuantity要素のレベルを記述する。 |
||valueQuantity || |0..1|Quantity||結果が数量で記述できる場合。 |
||valueCodeableConcept|| |0..1|CodeableConcept ||結果がコード化されたコンセプトで記述できる場合。 |
||valueString || |0..1|string||結果が可読文字列（1Mバイト以内）で記述できる場合。 |
||valueBoolean|| |0..1|boolean ||結果が真偽値で記述できる場合。 |
||valueInteger|| |0..1|integer ||結果が整数値で記述できる場合。 |
||valueRange|| |0..1|Range ||結果が数量の範囲で記述できる場合。 |
||valueRatio|| |0..1|Ratio ||結果が数量の比率で記述できる場合。 |
||valueSampleeData|| |0..1|SampledData ||結果がサンプリングデータの場合。 |
||valueTime || |0..1|time||結果が時刻・時間値の場合。 |
||valueDateTime || |0..1|dateTime||結果が日時の場合。 |
||valuePeriod || |0..1|Period||結果が期間の場合。 |
|dataAbsentReason||| |0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/data-absent-reason"<br>"unknown" |検査結果値が欠落している理由。 |
|interpretation||| |0..1\*|CodeableConcept |"http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"<br>"H" |検査結果値の評価コード。基準値よりHighなど。 |
|note||| |0..\* |||結果に関するコメントテキスト記述 |
||author|| |0..1|||記載者の情報 |
|||authorString| |0..1|string|"患者"|記載者氏名などの文字列。必ずしも氏名でなくてもよい。 |
||time|| |0..1|dateTime||この追加的な情報が作成された日時。 |
||text|| |1..1|markdown||追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。 |
|bodySite||| |0..1|CodeableConcept |"urn:oid:1.2.392.200119.4.201.5"<br>"1244"<br>"腹部"<br>"腹部"|該当する状態が現れている解剖学的な場所を示す。system値はMEDIS標準病名マスター修飾語交換用コードを使用する場合の例示。"1244"は、MEDIS標準病名マスター修飾語交換用コードで"腹部"のコード。"腹部"はそのテキスト記述の例。 |
|method||| |0..1|CodeableConcept ||検査手法。Codingせずtext情報だけを必要に応じて記述する。 |
|specimen||| |0..1|Reference(Specimen) ||患者の何に対して検査を実施したかの情報。検体検査では検体材料のリソースへの参照となる。 |
|referenceRange||| |0..1\*|BackboneElement ||推奨範囲として結果値を解釈するためのガイダンス。基準値範囲。 |
||low || |0..1|SimpleQuantity|| |
|||value | |1..1|decimal ||下限値。 |
|||unit| |1..1|string|"mg/L"|検査下限値の単位 |
|||system| |1..1|uri |"http://unitsofmeasure.org" |単位体系 UCUMコード体系。固定値。|
|||code| |1..1|code|"mg/L"|医薬品単位略号。値は例示。 |
||high|| |0..1|impleQuantity ||上限値。（low と同じ記述方法なので省略） |
||type|| |0..1|CodeableConcept |"http://terminology.hl7.org/CodeSystem/referencerange-meaning"|参照値範囲の意味コードコード：コードの意味type:Type  normal:Normal Rangerecommended:Recommended Range  treatment:Treatment Range  therapeutic:Therapeutic Desired Level    pre:Pre Therapeutic Desired Level    post:Post Therapeutic Desired Levelendocrine:Endocrine  pre-puberty:Pre-Puberty  follicular:Follicular Stage  midcycle:MidCycle  luteal:Luteal  postmenopausal:Post-Menopause|
||text|| |0..1|string||テキストで記述した検査結果・観察値の基準範囲。 |
|hasMember ||| |0..\* |Reference(Observation\| QuestionnaireResponse\|)||この検査が複数の検査項目をグループ化したパネル検査もしくはバッテリー検査の場合に、このグループに含まれる個々の検査の参照へのリストである。この場合には、本Observationリソースのvalueは存在しない。 |
|derivedFrom ||| |0..\* |Reference(Observation\| QuestionnaireResponse\|)||この検査が他の1つ以上の検査値から派生している（BMIが体重と身長から派生して算出される場合など）場合に、その派生元の検査への参照のリスト。 |
|component ||| |0..\* |BackboneElement ||同じ検査・観察において、メソッドが1つ、観察が1つ、実行者が1つ、デバイスが1つ、時間が1つしかない１回の検査・観察で同時に複数の検査結果が得られる場合に、その各検査をcomponentをみなして、このObservationリソースのcomponent要素に記述する。たとえばこのObservationリソースが血圧である場合に、収縮期血圧値と拡張期血圧値の2つは、Observationリソース：血圧の2つのcomponentとして記述される。|
||code|| |1..1|CodeableConcept ||Observation.codeと同じ。 |
||(value) || |0..1|11種類のデータタイプのいずれかひとつ。||Observation.(value)と同じ。|
||dataAbsentReason|| |0..1|CodeableConcept ||Observation.dataAbsentReasonと同じ。 |
||interpretation|| |0..1\*|CodeableConcept ||Observation. interpretationと同じ。|
||referenceRange|| |0..1\*|BackboneElement ||Observation. referenceRangeと同じ。|

<br><br><br>


# <a id="tbl-19">**表19　　Organizationリソース　医療機関情報**</a>

|要素Lv1|要素 Lv2 |要素 Lv3|多重度|型|値|説明|
|-------|-----|---|------|----------|----------------------------------|------------------------|
|resourceType| ||||"Organization"|**Organization**リソースであることを示す|
|meta| ||1..1|Meta|||
||lastUpdated||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile||0..*|canonical(StructureDefinition)|診療情報提供書や退院時サマリーの作成元、紹介元、紹介先、その他の場合は<br>"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Organization_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text| ||0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。入れる場合には、以降のリソースからシステムにより自動生成されたものに限ること。|
||status ||1..1|code|"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
||div||1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; |値は例示。|
|extension | ||0..1\*|Extension ||都道府県番号２桁。**Identifier**型の拡張「PrefectureNo」を使用。|
||url||1..1|uri |"http://jpfhir.jp/fhir<br>/core/Extension/StructureDefinition<br>/JP_Organization_PrefectureNo" |拡張を識別するURL。固定値。 |
||valueCoding||1..1|Identifier|||
|| |system|1..1|uri |"urn:oid:1.2.392.100495.20.3.21"|都道府県番号の名前空間を識別するURIを指定。固定値。 |
|| |code |1..1|string|"13"|2桁にゼロパディングされた都道府県暗号。値は例示。 |
|extension | ||0..1\*|Extension ||点数表コード１桁。**Identifier**型の拡張「OrganizationCategory」を使用。|
||url||1..1|uri |"http://jpfhir.jp/fhir<br>/core/Extension/StructureDefinition<br>/JP_Organization_InsuranceOrganizationCategory"|拡張を識別するURL。固定値。 |
||valueCoding||1..1|Identifier|||
|| |system|1..1|uri |"urn:oid:1.2.392.100495.20.3.22"|点数表番号の名前空間を識別するURIを指定。固定値。 |
|| |code |1..1|string|"1" |点数表コード１桁「1：医科」、「3：歯科」。値は例示。|
|extension | ||0..1\*|Extension ||保険医療機関番号７桁。**Identifier**型の拡張「OrganizationNo」を使用。|
||url||1..1|uri |"http://jpfhir.jp/fhir<br>/core/Extension/StructureDefinition<br>/JP_Organization_InsuranceOrganizationNo"|拡張を識別するURL。固定値。 |
||valueIdentifier||1..1|Identifier|||
|| |system|1..1|uri |"urn:oid:1.2.392.100495.20.3.23"|保険医療機関コードの名前空間を識別するURIを指定。固定値。 |
|| |value |1..1|string|"1234567" |保険医療機関番号７桁。値は例示。|
|identifier| ||0..1\*|Identifier||保険医療機関番号10桁。|
||system ||1..1|uri |"http://jpfhir.jp/fhir<br>/core/IdSystem/insurance-medical-institution-no" |保険医療機関番号10桁の名前空間を識別するURL。固定値。 |
||value||1..1|string|"1311234567"|保険医療機関番号10桁。値は例示。|
|type| ||0..1\*|CodeableConcept ||施設種別|
||coding ||1..1\*||||
|| |system|1..1|uri |"http://terminology.hl7.org/CodeSystem/organization-type" |施設種別を表すコード体系を識別するURI。固定値。 |
|| |code|1..1|code|"prov"|バリューセットOrganizationType から、医療機関を表すコードを指定。 |
|name| ||1..1|string|"厚生労働省第一病院"|医療機関名称。値は例示。|
|telecom | ||0..1\*|ContactPoint||医療機関電話番号|
||system ||0..1|code|"phone" |固定値。|
||value||1..1|string|"0123-456-7890" |値は例示。|
|address | ||0..1\*|Address ||医療機関住所|
||text ||1..1|string|"神奈川県横浜市港区１－２－３"|住所文字列。値は例示。郵便番号は含めない。|
||postalCode ||0..1|string|"123-4567"|郵便番号。値は例示。|
||country||0..1|string|"JP"|住所が国内の場合「JP」固定。|


<br><br><br>

# <a id="tbl-20">**表20　　　Organizationリソース　診療科情報**<a>

|要素Lv1 |要素Lv2|要素Lv3|多重度|型|値|説明|
|-------|----|--|------|----------|--------------------------------|-------------------------------------------------------|
|resourceType| | |||"Organization"|**Organization**リソースであることを示す|
|meta| | |1..1|Meta|||
||lastUpdated||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| |0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Organization_eCS_department"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text| | |0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。入れる場合には、以降のリソースからシステムにより自動生成されたものに限ること。|
||status | |1..1|code||固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
||div| |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt;|値は例示。|
|type| | |1..1\*|CodeableConcept ||施設種別|
||coding | |1..1\*|Coding|||
|| |system |1..1|uri |"http://terminology.hl7.org/CodeSystem/organization-type" |施設種別を表すコード体系を識別するURI。固定値。 |
|| |code |1..1|code|"dept"|バリューセットOrganizationType(http://hl7.org/fhir/ValueSet/organization-type) から、診療科を表すコードを指定。固定値。 |
|type| | |0..1\*|CodeableConcept ||診療科コード。コードで記述できる場合に記録してもよい。利用可能なコード体系の一例として、電子処方箋CDA記述仕様第1版の別表10診療科コード（urn:oid:1.2.392.100495.20.2.51）の例を示す。<br>SS-MIX2診療科コード（2桁または3桁）（urn:oid:1.2.392.200250.2.2.2）も使用できる。（これ以外のローカルコードでもよい）|
||coding | |1..1\*|coding|||
|| |system |1..1|uri |"urn:oid:1.2.392.100495.20.2.51"|診療科コードのコード体系を識別するURI。値は電子処方箋CDA記述仕様第1版の別表10診療科コードの例示。 |
|| |value|1..1|code|"01"|値は例示。|
|name| | |1..1|string|"内科"|診療科名称。値は例示。|
|partOf| | |0..1|Reference ||医療機関を表す**Organization**リソースへの参照。|
||reference| |1..1|string|"urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720" |医療機関を表す**Organization**リソースのfullUrl要素に指定されるUUIDを指定。値は例示。 |

<br><br><br>

# <a id="tbl-21">**表21　　Patientリソース　患者情報**</a>

|要素Lv1|要素Lv2 |要素Lv3|多重度|型 |値|説明 |
|---------|----------|----|------|-----------------|----------------------------|----------------------------------------------------------------------|
|resourceType || || |"Patient" |**Patient**リソースであることを示す|
|meta || |1..1|Meta || |
| |profile | |1..1\*|canonical(StructureDefinition) |"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Patient_eCS"|本文書のプロファイルを識別するURLを指定する。値は固定。|
|identifier || |0..\* |Identifier ||医療機関における患者番号。その他の番号も繰り返しで記述してよい。 |
| |system| |1..1| |"urn:oid:1.2.392.100495.20.3.51.11311234567"|付番方法については「識別子名前空間一覧」を参照。値は医療機関における患者番号を記述する場合の例示。 |
| |value | |1..1| |"00000010"|患者番号の文字列。値は例示。 |
|name || |1..1\*|HumanName||患者氏名　漢字表記 |
| |extension | |1..1\*|Extension||氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。 |
| ||url|1..1|uri|"http:// hl7.org/fhir/StructureDefinition<br>/iso21090-EN-representation" |拡張を識別するURL。固定値。|
| ||valueCode|1..1|code |#IDE |漢字表記であることを示す固定値。 |
| |use | |1..1|code |"official"または"usual"|氏名が正式名称であることを明示するために、NameUseバリューセット（http:// hl7.org/fhir/ValueSet/name-use）より「official」または「usual」を必須で設定する。|
| |text| |1..1|string |"東京 太郎"|氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。姓と名の間には原則として半角空白を1個挿入する。|
| |family| |0..1|string |"東京"|氏名の姓。 |
| |given | |0..\* |string |"太郎"|氏名の名。ミドルネームがある場合には、ミドルネーム、名の順で原則として半角空白をいれて連結する文字列とする。 |
|name || |0..1\*|HumanName||よみ（カタカナ） |
| |extension | |1..1\*|Extension||氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。 |
| ||url|1..1|uri|"http:// hl7.org/fhir/StructureDefinition<br>/iso21090-EN-representation" |拡張を識別するURL。固定値。|
| ||valueCode|1..1|code |"SYL" |カナ表記であることを示す固定値。 |
| |use | |1..1|code |"official"または"usual"|氏名が正式名称であることを明示するために、NameUseバリューセット（http:// hl7.org/fhir/ValueSet/name-use）より「official」または「usual」を必須で設定する。|
| |text| |1..1|string |トウキョウ タロウ|カナ氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。カタカナはJIS X 0208のカタカナ（全角カナ）みとし、JIS X 0201のカタカナ（半角カナ）は使用してはならない。姓と名の間には原則として半角空白を1個挿入する。|
| |family| |1..1|string |トウキョウ|カナ氏名の姓。 |
| |given | |1..1\*|string |タロウ|カナ氏名の名。ミミドルネームがある場合には、ミドルネーム、名の順で原則として半角空白をいれて連結する文字列とする。 |
|telecom|| |0..\* |ContactPoint ||患者連絡先電話番号。複数を繰り返せる。 |
| |system| |0..1|uri|"phone" |連絡手段 phone \| fax \| email \| pager \| url \| sms \| other |
| |value | |1..1|string |"090-9090-123"|電話番号 |
| |use | |0..1|code |"home"|用途　home \| work \| temp \| old \| mobile|
| |rank| |0..1|positiveInt||連絡優先順位（1が最優先）|
| |period| |0..1|Period ||連絡先がある時間帯や日時期間だけ有効な場合にその期間。 |
| ||start|0..1|dateTime ||開始日時。 |
| ||end|0..1|dateTime ||終了日時。 |
|gender || |1..1|code |"male"|患者の性別。"male"または"female"。値は例示。 |
|birthdate|| |1..1|dateTime |"1920-02-11"|患者の生年月日。ISO8601に準拠して"yyyy-mm-dd"形式。値は例示。|
|address|| |1..1\*|Address||患者の住所。 |
| |text| |1..1|string |"神奈川県横浜市港区１－２－３"|住所文字列。値は例示。郵便番号は含めない。 |
| |line| |0..1|string |"１－２－３"|番地・通り名他。丁目、番地、通り名、マンション名、部屋番号、そのほか住所を構成するcityまでの部分以外のすべての文字列 |
| |city| |0..1|string |"横浜市港区"|市町村郡名、区名、大字名など。丁目や番地などを除く。 |
| |state | |0..1|string |"神奈川県"|都道府県名で、都道府県の文字を含む。例：東京都　など（「東京」ではなく）。 |
| |postalCode| |1..1|string |"123-4567"|郵便番号。値は例示。 |
| |country | |0..1|string |"JP"|居住地が国内の場合「JP」固定。 |
|maritalStatus|| |0..1|codableConcept |uri="http://terminology.hl7.org/CodeSystem/v3-MaritalStatus"code="M"|婚姻状態A:結婚破棄、D:離婚、I:離婚調停中、L:別居中、M:結婚、S:未婚、T:同棲、U:現在結婚していない、W:寡婦 |
|(multipleBirth)|| |0..1| ||多胎情報。以下の2つの要素のどちらか一方だけを使用すること。両方同時に出現してはならない。multipleBirth要素は出現しない。 |
| |multipleBirthBoolean| |0..1|boolean|"true"|患者が多胎児のうちの一人である場合に true|
| |multipleBirthInteger| |0..1|integer|"2" |患者が多胎児のうちの一人である場合にその出生順番（1以上）|
|contact|| |0..1\*|BackboneElement||連絡のとれる患者以外の関係者 |
| |relationShip| |0..1\*| || |
| |name| |0..1|HumanName||関係者の氏名情報（患者の氏名情報の記述構造を参照のこと） |
| |telecom | |0..1\*|ContactPoint ||関係者の連絡先情報（患者の連絡先情報の記述構造を参照のこと） |
| |address | |0..1|Address||関係者の住所情報（患者の住所情報の記述構造を参照のこと） |
| |gender| |0..1|code |"male"|関係者の性別情報。"male"または"female"。 |
| |organizaton | |0..1|Reference(Organization)||関係者に関係のある組織情報（たとえば勤務先など）への参照 |
| |period| |0..1|Period ||関係者の連絡可能な時間帯（患者の連絡先情報のtelecom.periodの記述構造を参照のこと） |
|commucation|| |0..1\*|BackboneElement||患者とコミュニケーションをとる際に使用する優先言語（日本語以外で明記したい場合に使用する） |
| |language| |1..1|CodeableConcept|"urn:ietf:bcp:47"<br>"ja" |言語のコード記述。ja:日本語、en:英語、zh:中国語、ko:韓国語、fr:フランス語、など。[http://hl7.org/fhir/valueset-languages.html](http://hl7.org/fhir/valueset-languages.html)参照。|
|generalPractitioner|| |0..\* |Reference(Organization \| Practitioner \| PractitionerRole)|Reference(Organization) |患者が自身で選択したかかりつけ医またはかかりつけ医療機関への参照 |

<br><br><br>

# <a id="tbl-22">**表22　　Practitionerリソース　　文書作成責任者情報/文書法的責任者情報**</a>

|要素Lv1 |要素Lv2|要素Lv3|要素Lv4|多重度|型|値|説明|
|-------|----|----|--|------|----------|------------------------------|----------------------------------------------------------|
|resourceType| | | |||"Practitioner"|**Practitioner**リソースであることを示す|
|meta| | | |1..1|Meta|||
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| | |0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Practitioner_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。 |
|text| | | |0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。|
||status | | |1..1|code|"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。|
||div| | |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; ||
|name| | | |1..1\*|HumanName ||氏名|
||extension| | |1..1\*|Extension ||氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。|
|| |url| |1..1|uri |"http://hl7.org/fhir/StructureDefinition<br>/iso21090-EN-representation"|拡張を識別するURL。固定値。 |
|| |valueCode| |1..1|code|#IDE |漢字表記であることを示す固定値。|
||text | | |1..1|string|"神奈川　花子"|氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。|
||family | | |0..1|string|"神奈川"|氏名の姓。|
||given| | |0..\* |string|"花子"|氏名の名。ミドルネームがある場合には、ミドルネーム、名の順で繰り返す。|
|name| | | |0..1\*|HumanName ||よみ（カタカナ）|
||extension| | |1..1\*|Extension ||氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。|
|| |url| |1..1|uri |"http://hl7.org/fhir/StructureDefinition<br>/iso21090-EN-representation"|拡張を識別するURL。固定値。 |
|| |valueCode| |1..1|code|"SYL" |固定値|
||text | | |1..1|string|"カナガワ　ハナコ"|カナ氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。カタカナはJIS X 0208のカタカナ（全角カナ）みとし、JIS X 0201のカタカナ（半角カナ）は使用してはならない。|
||family | | |0..1|string|"カナガワ"|カナ氏名の姓。|
||given| | |0..\* |string|"ハナコ"|カナ氏名の名。ミドルネームがある場合には、ミドルネーム、名の順で繰り返す。|

<br><br><br>

# <a id="tbl-23">**表23　　Procedureリソース　　入院中治療処置情報**</a>

|要素Lv1 |要素Lv2|要素Lv3|要素Lv4|多重度|型 |値 |説明 |
|--------|-------|--|--|------|-------------------------|--------------------------------|------------------------------------------------------------------------------------------------------|
|resourceType| | | || |"Procedure"|**Procedure**リソースであることを示す|
|meta| | | |1..1|Meta | | |
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| | |0..*|canonical(StructureDefinition) |"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_Procedure_eCS" |準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。|
|text| | | |0..1|Narrative| |本リソースをテキストで表現したものを入れてもよい。 |
||status | | |1..1|code |"generated"|固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。 |
||div| | |1..1|xhtml|&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt;|値は例示。 |
|identifier| | | |0..1\*|Identifier | |この情報に付番されたID |
||system | | |1..1| |"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier"| |
||value| | |1..1| |"1311234567-2020-00123456" |情報IDの文字列。値は例示。 |
|status| | | |1..1|code |"completed"|この治療処置情報の実施ステータス。コード表："http://hl7.org/fhir/event-status"preparation \| in-progress \| not-done \| on-hold \| stopped \| completed \| entered-in-error \| unknown準備中\|進行中\|未完了\|保留中\|停止\|完了\|エラー\|不明 |
|statusReason| | | |0..1|CodeableConcept|text:"発熱のため延期"|中止や保留ステータスとなった理由。コード化せずテキストのみで記述する。 |
|category| | | |0..1|CodeableConcept|"http://jpfhir.jp/fhir<br>/core/CodeSystem/JP_ProcedureCategory_CS"<br>"JPPCC004"<br>"外科的処置" |治療処置のカテゴリー。JP Core Procedure Category CodeSystemの使用を推奨する。<br>例）JPPCC001	精神療法<br>JPPCC002	カウンセリング<br>JPPCC003	教育<br>JPPCC004	外科的処置<br>JPPCC005	診断的処置<br>JPPCC006	カイロプラクティック<br>JPPCC007	社会サービス介入<br>|
|code| | | |1..1|CodeableConcept|"http://jpfhir.jp/fhir/core/CodeSystem/JP_ProcedureCodesMedical_CS"<br>"150165210"<br>"胃切除術（単純切除術)"|治療処置情報。保険診療対象の治療処置においては以下のレセプト電算コード（診療行為コード等）を推奨する。<br>さらに手術処置については、STEM7コードまたはK分類コードの併用を推奨する。<br>医科診療行為コード（レセ電算）：system= http://jpfhir.jp/fhir/core/CodeSystem/JP_ProcedureCodesMedical_CS<br>歯科診療行為コード（レセ電算）：http://jpfhir.jp/fhir/core/CodeSystem/JP_ProcedureCodesDental_CS<br>看護行為マスタ（MEDIS）: urn:oid:1.2.392.200119.4.701<br>STEM7コード:http://jpfhir.jp/fhir/core/CodeSystem/JP_ProcedureCodesSTEM7_CS<br>コーディングせず、textだけ記述することも可能。|
|subject | | | |1..1|Reference(Patient) | |患者を表す**Patient**リソースへの参照。|
|encounter | | | |0..1|Reference(Encounter) | |対象となる治療処置が実施された入院詳細情報、または外来受診情報。 |
|（performed） | | | |1..1|dateTime\|Period\|string\|Age\|Range | |治療処置を実施した時期を次の5つのいずれかひとつの要素で記述する。performed要素は記述しない。 |
||performedDateTime| | |0..1|dateTime | |日付、日時で記述する場合。 |
||performedPeriod| | |0..1|Period | |期間で記述する場合。 |
||performedString| | |0..1|string | |文字列で記述する場合。 |
||performedAge | | |0..1|Age| |患者の年齢で記述する場合。 |
||performedRange | | |0..1|Range| |患者の年齢期間で記述する場合。 |
|recorder| | | |0..1|Reference(Practitioner \| PractitionerRole \| Patient \| RelatedPerson) | |この状態を記録した人情報への参照。 |
|asserter| | | |0..1|Reference(Practitioner \| PractitionerRole \| Patient \| RelatedPerson) | |この状態があると確認（主張）した人情報への参照。 |
|performer | | | |0..\* |BackboneElement| |治療処置を実施した人々や機器の情報。 |
||function | | |0..1| | |治療実施者の役割コード。未使用。 |
||actor| | |1..1|Reference(Practitioner \| PractitionerRole \| Organization \| Device) | |治療処置を実施した人々や機器情報への参照。 |
||onBehalfOf | | |0..1|Reference(Organization)| |治療処置を実施した人々や機器が行為を実施した医療機関情報への参照。未使用。 |
|location| | | |0..1|Reference(Location)| |治療処置を実施した場所。 |
|reasonCode| | | |0..\* |CodeableConcept| |治療処置を実施した理由。当面コード化せず、text だけに記述する。|
|reasonReference | | | |0..\* |Reference(Condition \| Observation \| Procedure \| DiagnosticReport \| DocumentReference)| |治療処置を実施する根拠となった診療情報への参照。当面未使用。 |
|bodySite| | | |0..\* |CodeableConcept|"urn:oid:1.2.392.200119.4.201.5"<br>"1244"<br>"腹部"<br>"腹部" |該当する状態が現れている解剖学的な場所を示す。system値はMEDIS標準病名マスター修飾語交換用コードを使用する場合の例示。"1244"は、MEDIS標準病名マスター修飾語交換用コードで"腹部"のコード。"腹部"はそのテキスト記述の例。手術操作の場合には、system値は外保連コード（STEM7）の先頭3桁コードを使用してもよい。system="http://jpfhir.jp/fhir/Common/CodeSystem/stem7-procedure-site-codes"|
|outcome | | | |0..1|CodeableConcept|"http://jpfhir.jp/fhir<br>/core/CodeSystem/JP_ProcedureOutcome_CS"<br>" JPPOC001"|治療処置の結果カテゴリ。JP Core Procedure Outcome CodeSystem を使用推奨。<br>system="http://jpfhir.jp/fhir/core/CodeSystem/JP_ProcedureOutcome_CS"<br>JPPOC001	成功<br>JPPOC002	不成功<br>JPPOC003	一部成功<br>|
|report| | | |0..\* |Reference(DiagnosticReport \| DocumentReference \| Composition \| Bundle) | |治療処置の実施レポート情報への参照 |
|complicaton | | | |0..\* |CodeableConcept|"urn:oid:1.2.392.200119.4.101.6"<br>"TVQ7"<br>"術後血腫"<br>"術後腹壁の血腫" |治療処置の伴う合併症。MEDIS標準病名マスター病名交換用コードを使用する場合の例示。"BOEF"は、MEDIS標準病名マスター病名交換用コードで"持続腹痛"のコード。"持続腹痛"はそのテキスト記述の例。コーディングせずtextだけでもよい。 |
|complicationDetail| | | |0..\* |Reference(Condition) | |治療処置の実施後の合併症を記述する患者状態情報への参照。 |
|followUp| | | |0..\* |CodeableConcept| |治療処置の実施後の経過観察や必要な術後処置（例えば抜糸や抜釘など）に関する記述。コーディングせず、textのみで記述する。 |
|note| | | |0..\* |Annotation | |治療処置に関する追加的な叙述的記述。 |
|focalDevice | | | |0..\* |BackboneElement| |治療処置で使用したり、埋め込んだり取り外されたりした医療機器の情報。 |
||action | | |0..1|CodeableConcept|"処置−交換"<br>"CVカテーテル交換"|治療処置で当該機器の操作（取り外し、挿入など）。コーディングせず、textのみで記述する。 |
||manipulated| | |0..1|Reference(Device)| |操作対象となった医療機器（器材）への参照。 |
|usedReference | | | |0..\* |Reference(Device \| Medication \| Substance) | |治療処置中に使用された（主要な）医療器材や薬品。当面未使用。 |
|usedCode| | | |0..\* |CodeableConcept| |治療処置中に使用された（主要な）医療器材や薬品のコード情報。未使用。 |

<br><br><br>

# <a id="tbl-24">**表24　　RelatedPersonリソース　　患者関係者情報**</a>

|要素Lv1 |要素Lv2 |要素Lv3|多重度|型|値 |説明 |
|-------|-----|----|------|--------|------------------------|----------------------------------------------------------------------|
|resourceType|| |||"RelatedPerson"|**Related****P****erson**リソースであることを示す|
|meta|| ||1..1|Meta | |
||profile | ||1..1\*|canonical(StructureDefinition) |"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_RelatedPerson_eCS" |
|active|| |0..1|booleam | |この関係者情報が有効なときtrue。要素がなければ有効か無効かを利用者は考慮しない。 |
|patient || |1..1|Reference(Patient)| |患者情報への参照。 |
|relationship|| |1..1\*|CodeableConcept |"同居の友人" |患者との関係。Codingせず、text記述のみとする。 |
|name|| |1..1\*|HumanName | |関係者氏名　漢字表記 |
||extension | |1..1\*|Extension | |氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。 |
|||url|1..1|uri |"http:// hl7.org/fhir/StructureDefinition<br>/iso21090-EN-representation"|拡張を識別するURL。固定値。|
|||valueCode|1..1|code|#IDE|漢字表記であることを示す固定値。 |
||use | |1..1|code |"official"または"usual"|氏名が正式名称であることを明示するために、NameUseバリューセット（http:// hl7.org/fhir/ValueSet/name-use）より「official」または「usual」を必須で設定する。|
||text| |1..1|string|"東京 太郎" |氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。姓と名の間には原則として半角空白を1個挿入する。|
||family| |0..1|string|"東京" |氏名の姓。 |
||given | |0..\* |string|"太郎" |氏名の名。ミドルネームがある場合には、ミドルネーム、名の順で原則として半角空白をいれて連結する文字列とする。 |
|name|| |0..1\*|HumanName | |よみ（カタカナ） |
||extension | |1..1\*|Extension | |氏名が漢字表記かカナ表記かを区別するための拡張「iso21090-EN-representation」。 |
|||url|1..1|uri |"http:// hl7.org/fhir/StructureDefinition<br>/iso21090-EN-representation"|拡張を識別するURL。固定値。|
|||valueCode|1..1|code|"SYL"|カナ表記であることを示す固定値。 |
| |use | |1..1|code |"official"または"usual"|氏名が正式名称であることを明示するために、NameUseバリューセット（http:// hl7.org/fhir/ValueSet/name-use）より「official」または「usual」を必須で設定する。|
||text| |1..1|string|トウキョウタロウ |カナ氏名全体の文字列をtext要素に入れる。氏名の姓と名が分離できない場合は本要素のみを使用する。カタカナはJIS X 0208のカタカナ（全角カナ）みとし、JIS X 0201のカタカナ（半角カナ）は使用してはならない。姓と名の間には原則として半角空白を1個挿入する。|
||family| |1..1|string|トウキョウ |カナ氏名の姓。 |
||given | |1..1\*|string|タロウ |カナ氏名の名。ミミドルネームがある場合には、ミドルネーム、名の順で原則として半角空白をいれて連結する文字列とする。 |
|telecom || |0..\* |ContactPoint| |関係者連絡先電話番号。複数を繰り返せる。 |
||system| |1..1|uri |"phone"|連絡手段 phone \| fax \| email \| pager \| url \| sms \| other |
||value | |1..1|string|"090-9090-123" |電話番号 |
||use | |1..1|code|"home" |用途　home \| work \| temp \| old \| mobile|
||rank| |0..1|positiveInt | |連絡優先順位（1が最優先）|
||period| |0..1|Period| |連絡先がある時間帯や日時期間だけ有効な場合にその期間。 |
|||start|0..1|dateTime| |開始日時。 |
|||end|0..1|dateTime| |終了日時。 |
|gender|| |1..1|code|"male" |関係者の性別。"male"または"female"または"unknown"。値は例示。|
|birthdate || |1..1|dateTime|"1920-02-11" |関係者の生年月日。ISO8601に準拠して"yyyy-mm-dd"形式。値は例示。|
|address || |0..\* |Address | |関係者の住所。 |
||text| |1..1|string|"神奈川県横浜市港区１－２－３" |住所文字列。値は例示。郵便番号は含めない。 |
||line| |0..1|string|"１－２－３" |番地・通り名他。丁目、番地、通り名、マンション名、部屋番号、そのほか住所を構成するcityまでの部分以外のすべての文字列 |
||city| |0..1|string|"横浜市港区" |市町村郡名、区名、大字名など。丁目や番地などを除く。 |
||state | |0..1|string|"神奈川県" |都道府県名で、都道府県の文字を含む。例：東京都　など（「東京」ではなく）。 |
||postalCode| |1..1|string|"123-4567" |郵便番号。値は例示。 |
||country | |1..1|string|"JP" |居住地が国内の場合「JP」固定。 |
|period|| |0..1|Period| |関係者と患者との関係が有効である（あった）期間。 |
|commucation || |0..1\*|BackboneElement | |関係者とコミュニケーションをとる際に使用する優先言語（日本語以外で明記したい場合に使用する）。 |
||language| |1..1|CodeableConcept |" urn:ietf:bcp:47"<br>"ja" |言語のコード記述。ja:日本語、en:英語、zh:中国語、ko:韓国語、fr:フランス語、など。[http://hl7.org/fhir/valueset-languages.html](http://hl7.org/fhir/valueset-languages.html)参照。|

<br><br><br>

# <a id="tbl-25">**表25　　ResearchStudyリソース　　研究対象情報**</a>

|要素Lv1|要素Lv2|要素Lv3|要素Lv4|多重度|型|値|説明 |
|------|--|--|--|------|------------|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------|
|resourceType | | | |||"ResearchStudy" |**ResearchStudy**リソースであることを示す|
|meta | | | |1..1|Meta|| |
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
| |profile| | |0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_ResearchStudy_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。|
|text | | | |0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。 |
| |status | | |1..1|code|"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。 |
| |div| | |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; |値は例示。 |
|identifier | | | |0..1\*|Identifier||この情報に付番されたID |
| |system | | |1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier" | |
| |value| | |1..1||"2020-10-002933"|情報IDの文字列。値は例示。 |
|title| | | |1..1||"X1234の臨床試験" |この研究（Study）の名前。|
|status | | | |1..1|code|"active"|臨床研究のステータス。コード表："http://hl7.org/fhir/ValueSet/research-study-status"active \| administratively-completed \| approved \| closed-to-accrual \| closed-to-accrual-and-intervention \| completed \| disapproved \| in-review \| temporarily-closed-to-accrual \| temporarily-closed-to-accrual-and-intervention \| withdrawnアクティブ\|管理上完了\|承認済み\|登録まで閉鎖\|登録・介入まで閉鎖\|完了\|完了\|不承認\|レビュー中\|登録まで一時閉鎖\|登録・介入まで一時閉鎖\|取りやめ|
| | | | |||| |
|description| | | |0..1|markdown||研究の内容記述。 |
|period | | | |0..1|Period||研究の開始と終了日付。 |
|sponsor| | | |0..1|Reference(Organization) ||研究を主導し法的に責任を持つ機関情報への参照。 |
|principalInvestigator| | | |0..1|Reference(Practitioner \| PractitionerRole)||研究代表者情報への参照。 |
|note | | | |0..1\*|Annotation||研究に関する付帯情報や作成されたコメント。 |

＊本リソース情報は、退院時サマリーや診療情報提供書に含められる研究対象情報から参照される必要最小限の要素だけで構成している。

<br><br><br>

# <a id="tbl-26">**表26　　ResearchSubjectリソース　　研究対象情報**</a>

|要素Lv1 |要素Lv2|要素Lv3|要素Lv4|多重度|型|値|説明 |
|-------|--|--|--|------|----------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------|
|resourceType| | | |||"ResearchSubject" |**ResearchSubject**リソースであることを示す|
|meta| | | |1..1|Meta|| |
||lastUpdated|||1..1|instant| |最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz (例. 2015-02-07T13:28:17.239+09:00)|
||profile| | |0..*|canonical(StructureDefinition)|"http://jpfhir.jp/fhir<br>/eCS<br>/StructureDefinition<br>/JP_ResearchSubject_eCS"|準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。値は固定。|
|text| | | |0..1|Narrative ||本リソースをテキストで表現したものを入れてもよい。 |
||status | | |1..1|code|"generated" |固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。 |
||div| | |1..1|xhtml |&lt;div xmlns="http://www.w3.org/1999/xhtml"&gt;xxx&lt;/div&gt; |値は例示。 |
|identifier| | | |0..1\*|Identifier||この情報に付番されたID |
||system | | |1..1||"http://jpfhir.jp/fhir<br>/core/IdSystem/resourceInstance-identifier"|付番方法については「識別子名前空間一覧」を参照。値は例示。 |
||value| | |1..1||"1311234567-2020-00123456"|情報IDの文字列。値は例示。 |
|status| | | |1..1|code|"on-study-intervention" |臨床研究のステータス。コード表："http://hl7.org/fhir/event-status"i candidate \| eligible \| follow-up \| ineligible \| not-registered \| off-study \| on-study \| on-study-intervention \| on-study-observation \| pending-on-study \| potential-candidate \| screening \| withdrawn候補者\|適格基準者\|フォローアップ\|不適格\|未登録\|オフスタディ\|研究中\|研究中-介入試験\|研究中-観察研究\|中断中\|潜在的な候補者\|スクリーニング\|取りやめ者|
|period| | | |0..1|Period||研究参加期間。 |
|study | | | |1..1|Reference(ResearchStudy)||研究情報。 |
|individual| | | |1..1|Reference(Patient)||参加者（患者）情報への参照。 |
|assignedArm | | | |0..1|string||参加者がこの研究の一部として従うことが期待される研究アームの名前。 |
|actualArm | | | |0..1|string||参加者がこの研究の一部として実際に参加した研究アームの名前。 |
|consent | | | |0..1|Reference(Consent)||研究参加の同意情報。本文書での範囲では未使用。 |


