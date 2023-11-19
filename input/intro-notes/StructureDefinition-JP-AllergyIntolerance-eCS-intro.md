
# eCS 診療情報・サマリー汎用：【アレルギー情報・薬剤禁忌情報】

## 背景および想定シナリオ
このプロファイルは、６情報をはじめ、診療情報提供書や退院時サマリーなどの2文書や、診療６情報・サマリー用に、「アレルギー情報と薬剤禁忌情報」を記述するためのものである。
電子カルテ情報共有サービスに送信する情報に含まれる場合には、派生プロファイルである[CLINS電子カルテ情報共有サービス用: 【アレルギー情報と薬剤禁忌情報　JP_AllergyIntolerance_CLINS_eCS][JP_AllergyIntolerance_CLINS_eCS]　を使用すること。】

## スコープ
### 対象
以下のような医学的、もしくは健康上の情報。
 - アレルギー情報：食品、薬剤、金属、環境、そのほかあらゆる接触または非接触に生体が受ける物質や刺激によって、通常の多くの人には見られない好ましくない生体反応が観察されたという情報。あるいは観察されるかもしれないというリスクが存在するという情報。いずれもその生体内での機序の種類を問わない。
 ただし、薬剤禁忌情報に該当する情報を除く。
 - 不耐(性)情報：本来ならば代謝することが可能な物質に対する代謝能力が弱い、または代謝過程に異常があるなどの理由で、その物質に対して通常では見られない生体反応が観察されたという情報。あるいは観察されるかもしれないというリスクが存在するという情報。いずれもその生体内での機序の種類を問わない。例）乳糖不耐症）
 ただし、アレルギー情報と区別がつけられないことも多い。
 - 薬剤禁忌情報：薬剤使用に際して通常では見られない好ましくない生体反応が観察されたという情報があるために、その薬剤を使用しないように注意すべきとする情報。また、本人の状態や条件が、その薬剤の適用条件に合わないために使用すべきでないという場合を含む。例）妊婦にとっての、催奇形性の可能性があるために妊婦への投与を控えるようにされている薬剤。


### 対象としないこと
以下のような明らかに本人の嗜好や習慣に起因すると考えられる情報。
 - 辛いものが嫌いで食べたくない。
 - タバコは吸わない。
 - 思想や感情上の理由で金のピアスはつけない。
ただし、「カレーを含む食品を食べると腹痛が起こりやすいので嫌い」、といった場合には、不耐情報またはアレルギー情報なのか嗜好に過ぎないのか区別できないので、対象として記述することはありうる。


## プロファイル定義における必須要素と推奨要素
  - 必須要素は、その要素が必ず１個以上出現しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。
  - 推奨要素は、送信側はシステムに値が存在しているなら、値を格納した要素が必ず１個以上出現しなければならず、受信側は必ずその値を格納しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。

### 必須要素
  - resourceType : リソースタイプ "AllergyIntolerance"
  - meta.lastUpdated : 最終更新日時
  - meta.profile : 電子カルテ情報共有サービスでは必須
  - extension (eCS_InstitutionNumber) : 電子カルテ情報共有サービスでは必須。医療機関番号１０桁
  - identifier : インスタンス識別ID
  - clinicalStatus : 臨床的状態のステータスのコード化情報。コード化必須。ただし、verificationStatus要素が'entered-in-error'であれば、本要素は存在してはならない。
  - code : アレルギー・不耐反応の対象物の情報
  - patient : このアレルギー不耐症を有する患者のFHIRリソースへの参照。３文書６情報の作成では、 contained (JP_Patient)リソースへのリテラル参照を設定する。

### 条件により必須
  - meta.tag : 電子カルテ情報共有サービスで長期保存情報フラグの設定する場合に必須。
  - category : 電子カルテ情報共有サービス、薬剤禁忌情報として本リソース種別を使用する場合には、必ず本要素は"medication"として存在しなければならず、criticality要素は"high"を設定しなければならない。
  - criticality :  同上

### 推奨要素
  - contained (JP_Encounter) : アレルギー登録時の入院外来区分情報
  - contained (JP_Practitioner) : アレルギー登録者の情報
  - verificationStatus : 入力された臨床的状態に対する検証状況。コード化必須。
  - encounter : アレルギー登録時の入院外来区分情報。
  - recordedDate : この状態が記録された日時
  - recorder : アレルギー登録者の情報。
  - asserter : この状態があると確認（主張）した人情報への参照。

### MustSupport要素
　- 必須要素、条件により必須要素、推奨要素は、自動的にMustSupport要素である。それ以外に以下の要素がMustSupport要素である。
  - 該当なし。

## 要素の説明とプロファイル
  - 多重度欄の背景色：
    - 濃い黄色＝「必須要素」に対応する。
    - 薄い黄色＝「条件により必須要素」に対応する。
    - 薄い緑＝「推奨要素」に対応する。
    - 無色＝本要素を記述する場合の説明を参考までに記載しているが多重度は0..1または0..*であるため出現してもしなくてもよい。ただし、MustSupport要素の場合には、MustSupport要素としての仕様を満たす必要がある。MustSupport要素でなければ、データ設定と送信は任意であり、送信しても受信側では無視（破棄）されるかもしれないことに注意すること。
  - この表に現れない要素であるが、JP-Coreでは出現してもよい（多重度が0..1または0..*の）要素は、データ設定と送信は任意であり、送信しても受信側では無視（破棄）されるかもしれないことに注意すること。
  - この表で要素名のあとに[ ]表記があるものは、値が１個であっても、JSONデータのリスト型の値で記述しなければならない。
  - 要素[*] ：　この要素は繰り返し可能であり、値の記述はリストとなる。
  - 要素[+] ：　（繰り返し可能な要素において）新たなひとつの要素の子要素値として記述される。
  - 要素[=] ：　（繰り返し可能な要素において）すぐ上の要素と同じ要素の子要素値として記述される。


## 詳細説明


<script>
function details_open(onoff, idname, idCloseButton){
  var elem = document.getElementById(idname);
  elem.open = onoff;
  if (onoff == true){
    document.getElementById(idCloseButton).style.display = 'none';
  } else {
    document.getElementById(idCloseButton).style.display = 'inline';
  }
}
</script>

<h3>表「AllergyIntolerance」</h3>
<button id="mrc" type="button" onclick="details_open(true,'TableDetails','mrc')">表「AllergyIntolerance」開く</button>
<details id="TableDetails">
<button type="button" onclick="details_open(false,'TableDetails', 'mrc')">閉じる</button>
<summary></summary>


<div id="Table_16675" class="htmlTable" align=center x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=1338 style='border-collapse:
 collapse;table-layout:fixed;width:1003pt'>
 <col width=107 style='mso-width-source:userset;mso-width-alt:2925;width:80pt'>
 <col width=73 span=3 style='mso-width-source:userset;mso-width-alt:2011;
 width:55pt'>
 <col width=35 style='mso-width-source:userset;mso-width-alt:950;width:26pt'>
 <col width=87 style='mso-width-source:userset;mso-width-alt:2377;width:65pt'>
 <col width=359 style='mso-width-source:userset;mso-width-alt:9837;width:269pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:987;width:27pt'>
 <col width=195 style='mso-width-source:userset;mso-width-alt:5339;width:146pt'>
 <col width=100 span=3 style='width:75pt'>
 <tr height=61 style='mso-height-source:userset;height:46.0pt'>
  <td colspan=9 height=61 class=xl446 align=left width=1038 style='height:46.0pt;
  width:778pt'><a name="Print_Area"><ruby>多重度<span style='display:none'><rt>タジュウド
  </rt></span></ruby>は、<ruby>親<span style='display:none'><rt>オヤ </rt></span></ruby><ruby>要素<span
  style='display:none'><rt>ヨウソ </rt></span></ruby>が<ruby>出現<span
  style='display:none'><rt>シュツゲン </rt></span></ruby>した<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>の<ruby>多重度<span
  style='display:none'><rt>タジュウド </rt></span></ruby>。たとえばある<ruby>子要素<span
  style='display:none'><rt>コヨウソ </rt></span></ruby>の<ruby>多重度<span
  style='display:none'><rt>タジュウド </rt></span></ruby>が1..1であっても<ruby>親要素<span
  style='display:none'><rt>オヤヨウソ </rt></span></ruby>が<ruby>出現<span
  style='display:none'><rt>シュツゲン </rt></span></ruby>しない<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>にはその<ruby>子要素<span
  style='display:none'><rt>コヨウソ </rt></span></ruby>は<ruby>出現<span
  style='display:none'><rt>シュツゲン </rt></span></ruby>しない。<ruby>逆<span
  style='display:none'><rt>ギャク </rt></span></ruby>に<ruby>親要素<span
  style='display:none'><rt>オヤヨウソ </rt></span></ruby>が<ruby>出現<span
  style='display:none'><rt>シュツゲン </rt></span></ruby>する<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>には、この<ruby>子要素<span
  style='display:none'><rt>コヨウソ </rt></span></ruby>は<ruby>出現<span
  style='display:none'><rt>シュツゲン </rt></span></ruby>しなければならない。</a></td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl68 width=107 style='height:75.0pt;border-top:none;
  width:80pt'>要素Lv1</td>
  <td class=xl69 width=73 style='border-top:none;width:55pt'>要素Lv2</td>
  <td class=xl69 width=73 style='border-top:none;width:55pt'>要素Lv3</td>
  <td class=xl69 width=73 style='border-top:none;width:55pt'>要素Lv4</td>
  <td class=xl70 width=35 style='border-top:none;width:26pt'>多重度</td>
  <td class=xl69 width=87 style='border-top:none;width:65pt'>型</td>
  <td class=xl283 width=359 style='border-top:none;width:269pt'>説明</td>
  <td class=xl69 width=36 style='border-top:none;width:27pt'><ruby>固定値<span
  style='display:none'><rt class=font7>コテイチ</rt></span></ruby> <br>
    <ruby>／<span style='display:none'><rt class=font7>レイジ</rt></span></ruby> <ruby>例<span
  style='display:none'><rt class=font7>ジ</rt></span></ruby> 示</td>
  <td class=xl293 width=195 style='border-top:none;width:146pt'><ruby>固定値<span
  style='display:none'><rt class=font7>コテイチ</rt></span></ruby> または<ruby>例示<span
  style='display:none'><rt class=font7>レイジ</rt></span></ruby></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>resourceType</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl284 width=359 style='width:269pt'>AllergyIntoleranceリソースであることを示す。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;AllergyIntolerance&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>Meta</td>
  <td class=xl88 width=359 style='width:269pt'>　</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=335 style='mso-height-source:userset;height:251.0pt'>
  <td height=335 class=xl72 width=107 style='height:251.0pt;width:80pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>lastUpdated</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>instant</td>
  <td class=xl88 width=359 style='width:269pt'>最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz<br>
   
  この要素は、このリソースのデータを取り込んで蓄積していたシステムが、このリソースになんらかの変更があった可能性があった日時を取得し、このデータを再取り込みする必要性の判断をするために使われる。本要素に前回取り込んだ時点より後の日時が設定されている場合には、なんらかの変更があった可能性がある（変更がない場合もある）ものとして判断される。したがって、内容になんらかの変更があった場合、またはこのリソースのデータが初めて作成された場合には、その時点以降の日時（たとえば、このリソースのデータを作成した日時）を設定しなければならない。内容の変更がない場合でも、このリソースのデータが作り直された場合や単に複写された場合にその日時を設定しなおしてもよい。ただし、内容に変更がないのであれば、日時を変更しなくてもよい。また、この要素の変更とmeta.versionIdの変更とは、必ずしも連動しないことがある。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;2015-02-07T13:28:17.239+09:00&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=160 style='height:120.0pt'>
  <td height=160 class=xl72 width=107 style='height:120.0pt;width:80pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>profile[+]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>canonical(StructureDefinition)</td>
  <td class=xl88 width=359 style='width:269pt'>準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。<br>
   
  http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_AllergyIntolerance_eCS　を設定する。<br>
    <font class="font12">電子カルテ情報共有サービスに本リソースデータを送信する場合には、http://jpfhir.jp/fhir/clins/StructureDefinition/JP_AllergyIntolerance_eCS　を設定すること。</font></td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_AllergyIntolerance_eCS&quot;<br>
    または<br>
   
  &quot;http://jpfhir.jp/fhir/clins/StructureDefinition/JP_AllergyIntolerance_eCS&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl88 width=359 style='width:269pt'>本リソースのメタデータ</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl78 width=359 style='width:269pt'>電子カルテ情報共有サービスで長期保存情報フラグの設定する場合に使用</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http:/jpfhir.jp/fhir/clins/CodeSystem/JP_ehrshrs_indication&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>長期保存情報フラグ</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;LTS&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>contained[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl79 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>　</td>
  <td class=xl88 width=359 style='width:269pt'>　</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=107 style='height:90.0pt;width:80pt'>contained[+]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1*</td>
  <td class=xl73 width=87 style='width:65pt'>Resource(JP_Encounter )</td>
  <td class=xl88 width=359 style='width:269pt'>encounter要素から参照される場合には、そのJP_Encounterリソースの実体。JP_Encounterリソースにおける必要最小限の要素だけが含まれればよい。ここで埋め込まれるJP_Encounterリソースでは、Encounter.classにこの情報を記録したときの受診情報（入外区分など）を記述して使用する。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>contained[+]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1*</td>
  <td class=xl73 width=87 style='width:65pt'>Resource(JP_Practitioner )</td>
  <td class=xl88 width=359 style='width:269pt'>recorder要素から参照される場合には、そのJP_Practitionerリソースの実体。JP_Practitionerリソースにおける必要最小限の要素だけが含まれればよい。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl162 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>extension[*]</td>
  <td class=xl163 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl163 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl163 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl118 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl142 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl312 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>電子カルテ情報サービスでは、<ruby>作成<span style='display:none'><rt>サクセイ </rt></span></ruby><ruby>発行<span
  style='display:none'><rt>ハッコウ </rt></span></ruby>した<ruby>医療<span
  style='display:none'><rt>イリョウ </rt></span></ruby><ruby>機関<span
  style='display:none'><rt>キカｎ </rt></span></ruby><ruby>番号<span
  style='display:none'><rt>バンゴウ </rt></span></ruby>や<ruby>診療科<span
  style='display:none'><rt>シンリョウカ </rt></span></ruby><ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>を<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>する<ruby>拡張<span
  style='display:none'><rt>カクチョウ </rt></span></ruby>。</td>
  <td class=xl119 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl297 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl266 align=left width=107 style='height:20.0pt;
  width:80pt'>extension[+]</td>
  <td class=xl302 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl302 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl302 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl307 align=left width=35 style='border-left:none;width:26pt'>0..1</td>
  <td class=xl303 align=left width=87 style='border-left:none;width:65pt'>Extension</td>
  <td class=xl304 style='border-left:none'>　</td>
  <td class=xl305 width=36 style='border-left:none;width:27pt'>　</td>
  <td class=xl306 width=195 style='border-left:none;width:146pt'>　</td>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td align=left>ｓ</td>
 </tr>
 <tr height=177 style='mso-height-source:userset;height:133.0pt'>
  <td height=177 class=xl266 align=left width=107 style='height:133.0pt;
  width:80pt'>extension[=]</td>
  <td class=xl267 align=left width=73 style='border-left:none;width:55pt'>url</td>
  <td class=xl267 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl267 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl307 align=left width=35 style='border-left:none;width:26pt'>1..1</td>
  <td class=xl258 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl286 align=left width=359 style='border-left:none;width:269pt'><ruby>本<span
  style='display:none'><rt>ホｎ </rt></span></ruby><ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>を<ruby>作成<span
  style='display:none'><rt>サクセイ </rt></span></ruby><ruby>発行<span
  style='display:none'><rt>ハッコウ </rt></span></ruby>した<ruby>医療<span
  style='display:none'><rt>イリョウ </rt></span></ruby><ruby>機関<span
  style='display:none'><rt>キカｎ </rt></span></ruby>の<ruby>識別<span
  style='display:none'><rt>シキベツ </rt></span></ruby><ruby>番号<span
  style='display:none'><rt>バンゴウ </rt></span></ruby>を記述するために使用する拡張「eCS_InstitutionNumber」。<br>
    本<ruby>情<span style='display:none'><rt>ホｎ </rt></span></ruby><ruby>報は<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>、ServiceRequestの要<ruby>素と<span
  style='display:none'><rt>ヨウソ </rt></span></ruby>して記<ruby>述す<span
  style='display:none'><rt>キジュツ </rt></span></ruby>ることも可<ruby>能で<span
  style='display:none'><rt>カノウ </rt></span></ruby>あるが、その場<ruby>合も<span
  style='display:none'><rt>バアイ </rt></span></ruby>この拡<ruby>張<span
  style='display:none'><rt>カクチョウ </rt></span></ruby>で記<ruby>述す<span
  style='display:none'><rt>キジュツ </rt></span></ruby>ることとする。<br>
    <font class="font24">電子カルテ情報サービスでは、この</font><ruby><font class="font24">拡張</font><span
  style='display:none'><rt>カクチョウ </rt></span></ruby><font class="font24">による</font><ruby><font
  class="font24">記述</font><span style='display:none'><rt>キジュツ </rt></span></ruby><font
  class="font24">は</font><ruby><font class="font24">必須</font><span
  style='display:none'><rt>ヒッス </rt></span></ruby><font class="font24">。</font></td>
  <td class=xl269 align=left width=36 style='border-left:none;width:27pt'><ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl296 width=195 style='border-left:none;width:146pt'><a
  href="http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber"
  target="_parent"><span style='color:black'>http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber</span></a></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=35 style='height:26.0pt'>
  <td height=35 class=xl156 align=left width=107 style='height:26.0pt;
  border-top:none;width:80pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueIdentifier</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl122 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Identifier</td>
  <td class=xl287 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>医療<span style='display:none'><rt>イリョウ </rt></span></ruby><ruby>機関<span
  style='display:none'><rt>キカｎ </rt></span></ruby><ruby>識別<span
  style='display:none'><rt>シキベツ </rt></span></ruby><ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>。</td>
  <td class=xl119 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl297 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=84 style='height:63.0pt'>
  <td height=84 class=xl156 align=left width=107 style='height:63.0pt;
  border-top:none;width:80pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueIdentifier</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl122 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl258 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl287 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>医療<span style='display:none'><rt>イリョウ </rt></span></ruby><ruby>機関<span
  style='display:none'><rt>キカｎ </rt></span></ruby>１０<ruby>桁<span
  style='display:none'><rt>ケタ </rt></span></ruby><ruby>番号<span
  style='display:none'><rt>バンゴウ </rt></span></ruby>を<ruby>示<span
  style='display:none'><rt>シメス </rt></span></ruby>すURL。</td>
  <td class=xl269 align=left width=36 style='border-left:none;width:27pt'><ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl298 align=left width=195 style='border-top:none;border-left:none;
  width:146pt'><a
  href="http://jpfhir.jp/fhir%3cbr%3e/core/IdSystem/insurance-medical-institution-no"
  target="_parent"><span style='color:black'>http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no</span></a></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=36 style='height:27.0pt'>
  <td height=36 class=xl164 align=left width=107 style='height:27.0pt;
  border-top:none;width:80pt'>extension[=]</td>
  <td class=xl165 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueIdentifier</td>
  <td class=xl165 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>value</td>
  <td class=xl165 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl136 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl126 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl288 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>医療機関１０桁番号。<span style='display:none'><rt>ケタ </rt></span></ruby></td>
  <td class=xl232 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl299 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;1318814790&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl154 align=left width=107 style='height:45.0pt;
  border-top:none;width:80pt'>extension[+]</td>
  <td class=xl161 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl161 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl161 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl131 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl151 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Extension</td>
  <td class=xl285 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>本情報を作成発行した診療科または<ruby>作成<span style='display:none'><rt>サクセイ </rt></span></ruby><ruby>発行<span
  style='display:none'><rt>ハッコウ </rt></span></ruby>者の診療科情報を記述するために使用する拡張「eCS_Department」。</td>
  <td class=xl271 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl295 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=112 style='height:84.0pt'>
  <td height=112 class=xl266 align=left width=107 style='height:84.0pt;
  width:80pt'>extension[=]</td>
  <td class=xl267 align=left width=73 style='border-left:none;width:55pt'>url</td>
  <td class=xl267 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl267 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl258 align=left width=35 style='border-left:none;width:26pt'>1..1</td>
  <td class=xl258 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl286 align=left width=359 style='border-left:none;width:269pt'>診療科情報を記述するために使用する拡張を識別するURL。</td>
  <td class=xl269 align=left width=36 style='border-left:none;width:27pt'><ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl296 width=195 style='border-left:none;width:146pt'><a
  href="http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_Department"
  target="_parent"><span style='color:black'>http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_Department</span></a></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl156 align=left width=107 style='height:31.0pt;
  border-top:none;width:80pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl118 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl287 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>診療科情報。</td>
  <td class=xl119 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl297 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=36 style='height:27.0pt'>
  <td height=36 class=xl156 align=left width=107 style='height:27.0pt;
  border-top:none;width:80pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl118 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1*</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Coding</td>
  <td class=xl287 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>診療科のコード化記述+H26。</td>
  <td class=xl134 width=36 style='border-left:none;width:27pt'>　</td>
  <td class=xl297 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl156 align=left width=107 style='height:45.0pt;
  border-top:none;width:80pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl118 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl258 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl287 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JAMI 診療科コード表のURI。</td>
  <td class=xl134 align=left width=36 style='border-left:none;width:27pt'><ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl297 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=35 style='height:26.0pt'>
  <td height=35 class=xl156 align=left width=107 style='height:26.0pt;
  border-top:none;width:80pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl118 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl287 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JAMI 診療科コード。2<ruby>桁<span style='display:none'><rt>ケタ </rt></span></ruby>また3桁コード。</td>
  <td class=xl119 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl297 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;08&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=35 style='height:26.0pt'>
  <td height=35 class=xl156 align=left width=107 style='height:26.0pt;
  border-top:none;width:80pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>display</td>
  <td class=xl118 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl287 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JAMI 診療科コードでのコードに対応する表示名。</td>
  <td class=xl119 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl297 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;<ruby>循環器科<span
  style='display:none'><rt>ジュンカンキカ </rt></span></ruby>&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl164 align=left width=107 style='height:31.0pt;
  border-top:none;width:80pt'>extension[=]</td>
  <td class=xl165 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl165 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>text</td>
  <td class=xl165 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl126 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl126 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl288 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>コード<ruby>化<span style='display:none'><rt>カ </rt></span></ruby>の<ruby>有無<span
  style='display:none'><rt>ウム </rt></span></ruby>に<ruby>関<span
  style='display:none'><rt>カカワラズ </rt></span></ruby>わらず、<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>したい<ruby>診療科<span
  style='display:none'><rt>シンリョウカ </rt></span></ruby><ruby>名<span
  style='display:none'><rt>メイ </rt></span></ruby>の<ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby>。</td>
  <td class=xl232 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl299 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;<ruby>循環器<span
  style='display:none'><rt>ジュンカンキ </rt></span></ruby><ruby>診療<span
  style='display:none'><rt>シンリョウ </rt></span></ruby><ruby>科<span
  style='display:none'><rt>カ </rt></span></ruby>&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=261 style='height:196.0pt'>
  <td height=261 class=xl72 width=107 style='height:196.0pt;width:80pt'>identifier[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..*</td>
  <td class=xl73 width=87 style='width:65pt'>Identifier</td>
  <td class=xl88 width=359 style='width:269pt'>このリソース情報の一意識別ID。<br>
    少なくともひとつのidentifierは以下に記載の一意識別IDの仕様に従う値を設定すること。<br>
   
  一意識別IDは、このリソース情報を作成した施設内で、このリソース情報を他のリソース情報と一意に区別できるIDを想定しているが、１回の登録で発生する複数の病名情報が同一IDを持っていてもよい。<br>
    このID情報をキーとして、このIDが同一である本リソース情報ひとつまたは複数に対して、一括して更新・削除が実施されることがある。1回の登録で複数のリソース情報が登録される場合に、それらは同一のIDでも構わない。この場合、更新や削除は同一IDの情報すべてに対して実施される。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=84 style='height:63.0pt'>
  <td height=84 class=xl72 width=107 style='height:63.0pt;width:80pt'>identifier[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl289 width=359 style='width:269pt'>このリソース情報を他のリソース情報と一意に区別できるIDである場合に、system値を固定で設定する。1回の登録で複数のリソース情報が登録される場合に、それらは同一のIDで登録される場合でもこのsystem値を使用する。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl300 width=195 style='width:146pt'><a
  href="http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
  target="_parent"><span style='color:black'>http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></span></a></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>identifier[=]</td>
  <td class=xl73 width=73 style='width:55pt'>value</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>このリソース情報IDの文字列。URI形式を使う場合には、urn:ietf:rfc:3986に準拠すること。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;1311234567-2020-00123456&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl79 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl88 width=359 style='width:269pt'>臨床的状態のステータス。コードで記述は必須。ただし、verificationStatus要素が'entered-in-error'であれば、本要素は存在してはならない。<font
  class="font12">それ以外では必須。</font></td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl88 width=359 style='width:269pt'>臨床的状態のステータスのコード化情報</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>ur</td>
  <td class=xl88 width=359 style='width:269pt'>コードで記述が必須で、少なくともひとつのsystem値は固定値。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl72 width=107 style='height:75.0pt;width:80pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>active|inactive|resolved(アクティブ|非アクティブ|解決済み)のいずれか（ValueSethttp://hl7.org/fhir/ValueSet/allergyintolerance-clinicalより選択することが必須）。「解決済み」は「非アクティブ」に含まれる。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;active&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>display</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>Active|Inactive|Resolvedのいずれかの文字列。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>”Active&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>コードだけでは記述できない情報がある場合にコードと併用してもよい。値が使用されない可能性はある。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl86 width=35 style='width:26pt'>0..1<ruby><font class="font7"><rt
  class=font7></rt></font></ruby></td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl88 width=359 style='width:269pt'>入力された臨床的状態に対する検証状況を示す。確からしさと考えられる。コード化記述が必須。clinicalStatusとの制約条件を参照のこと。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl86 width=35 style='width:26pt'>1..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl290>臨床的状態に対する検証状況のコード化情報</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl86 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl88 width=359 style='width:269pt'>コードで記述が必須で、少なくともひとつのsystem値は固定値。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http://terminology.hl7.org/CodeSystem/allergyintolerance-verification&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl72 width=107 style='height:60.0pt;width:80pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl86 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>unconfirmed|confirmed|refuted|entered-in-error(未確認|確認済み|否定された|入力エラー)のいずれか（ValueSethttp://hl7.org/fhir/ValueSet/allergyintolerance-verificationより選択することが必須）。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;Unconfirmed&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>display</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl86 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>Unconfirmed|Confirmed|Refuted|EnteredinErrorのいずれかの文字列。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>”Unconfirmed&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>コードだけでは記述できない情報がある場合や、コード化できない場合には本要素だけで記述してもよい。コードと併用してもよい</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=140 style='height:105.0pt'>
  <td height=140 class=xl72 width=107 style='height:105.0pt;width:80pt'>type</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>副反応の生理的なメカニズムの種類（アレルギーによるものか不耐性によるものかどうか）。記述する場合は、コード表：&quot;http://hl7.org/fhir/allergy-intolerance-type&quot;から、allergy|intolerance（アレルギー反応、不耐性反応）のいずれか。メカニズムの種類を正確に決めることは難しいので、この情報はあくまで情報登録側の判断に依存する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'><span
  style='mso-spacerun:yes'> </span>&quot;allergy&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=260 style='height:195.0pt'>
  <td height=260 class=xl72 width=107 style='height:195.0pt;width:80pt'>category</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>特定された原因物質のカテゴリ。記述を可能な限り推奨する。コード表：&quot;http://hl7.org/fhir/allergy-intolerance-category&quot;からfood|medication|environment|biologic（食物、医薬品、環境、バイオロジー物質）のいずれかを選択する。電子カルテシステムで、これらのカテゴリーが区別されて登録されている場合には可能な限りコードを設定すること。<br>
    <font class="font12">電子カルテ情報サービスでは、薬剤禁忌情報として本リソース種別を使用する場合には、必ず本要素は&quot;medication&quot;として存在しなければならず、criticality要素は&quot;high&quot;を設定しなければならない。これ以外の場合には、本リソースの情報はや薬剤禁忌以外のアレルギー情報として取り扱われる。</font></td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;food&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=140 style='height:105.0pt'>
  <td height=140 class=xl72 width=107 style='height:105.0pt;width:80pt'>criticality</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>潜在的な臨床的危険性、致命度。記述する場合は、コード表：&quot;http://hl7.org/fhir/allergy-intolerance-criticality&quot;からlow|high|unable-to-assessのいずれかを選択する。（低、高、評価不能）。<br>
    <font class="font12">電子カルテ情報サービスでは、薬剤禁忌情報として本リソース種別を使用する場合には、category要素の記述を参照すること。</font></td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;high&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl88 width=359 style='width:269pt'>アレルギー・不耐反応の対象物の情報。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl72 width=107 style='height:75.0pt;width:80pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>coding[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl87 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl88 width=359 style='width:269pt'>JP-Coreで定めるallergy-substanceコード表のコードを使用を推奨する。コード化できない場合には、code.textのみで記述する。コード化の有無にかかわらず、電子カルテシステム等で登録され表示されている文字列をcode.textに必ず設定すること。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=220 style='height:165.0pt'>
  <td height=220 class=xl72 width=107 style='height:165.0pt;width:80pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>coding[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl88 width=359 style='width:269pt'>使用するコード表（推奨）：ValueSethttp://jpfhir.jp/fhir/core/ValueSet/JP_AllergyIntolerance_VS<br>
   
  CodeSystemは、category要素に対応して、http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyFoodAllergen_CS<br>
    http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyNonFoodNonMedicationAllergen_CS<br>
   
  http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyMedicationAllergen_CSの3つのいずれかから選択することが推奨されている。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyFoodAllergen_CS<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>コード</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;J7F7311990&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>display</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>コードに対応する表示名</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;牛乳・乳製品（詳細不明）&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>コード化の有無にかかわらず、電子カルテシステム等で登録され表示されている文字列をcode.textに必ず設定すること。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;牛乳 &quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl72 width=107 style='height:75.0pt;width:80pt'>patient</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl313 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>Reference(JP_Patient )</td>
  <td class=xl88 width=359 style='width:269pt'>このアレルギー不耐症を有する患者のFHIRリソースへの参照。Bundleリソースなどで本リソースから参照可能なPatientリソースが同時に存在する場合には、そのリソースの識別URI（fullUrl要素に指定されるUUID）を参照する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>例 <br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;urn: .....&quot;<br>
    }</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=280 style='height:210.0pt'>
  <td height=280 class=xl72 width=107 style='height:210.0pt;width:80pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl314 width=35 style='width:26pt'>　</td>
  <td class=xl73 width=87 style='width:65pt'>　</td>
  <td class=xl88 width=359 style='width:269pt'>保険個人識別子(例では、保険者等番号＝12345、被保険者証等の記号＝あいう、被保険者証等の番号＝１８７、枝番＝05の患者)を記述した外部にある患者リソースを参照する場合の例。<ruby><font
  class="font12">電子</font><span style='display:none'><rt>デンシカルテ </rt></span></ruby><font
  class="font12">カルテ</font><ruby><font class="font12">情報</font><span
  style='display:none'><rt>ジョウホウ </rt></span></ruby><font class="font12">サービスでは、この</font><ruby><font
  class="font12">記述</font><span style='display:none'><rt>キジュツ </rt></span></ruby><ruby><font
  class="font12">方法</font><span style='display:none'><rt>ホウホウ </rt></span></ruby><font
  class="font12">を</font><ruby><font class="font12">用</font><span
  style='display:none'><rt>モチイル </rt></span></ruby><font class="font12">いる。</font></td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>例 <br>
    {<br>
    <span style='mso-spacerun:yes'>    </span>&quot;type&quot;:
  &quot;Patient&quot;,<span style='mso-spacerun:yes'>  </span><br>
    <span style='mso-spacerun:yes'>     </span>&quot;identifier&quot;:{<br>
    <span style='mso-spacerun:yes'>         </span>&quot;system&quot;:
  &quot;http:/jpfhir.jp/fhir/clins/Idsystem/JP_Insurance_member/00012345&quot;,<br>
    <span style='mso-spacerun:yes'>          </span>&quot;value&quot;:
  &quot;00012345:あいう:１８７:05&quot;<br>
    <span style='mso-spacerun:yes'>       </span>}<br>
    }<br>
    </td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=107 style='height:90.0pt;width:80pt'>encounter</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Reference (JP_Encounter )</td>
  <td class=xl88 width=359 style='width:269pt'>このアレルギ情報を記録したときの受診情報（入外区分など）を記述しているEncounterリソースへの参照。Bundleリソースなどで本リソースから参照可能なEncouertリソースが同時に存在する場合には、そのリソースの識別URIを参照する。Containedリソースが存在する場合には、それを参照する記述（次行の例）。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>例 1 <br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;urn: .....&quot;<br>
    }</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=220 style='height:165.0pt'>
  <td height=220 class=xl72 width=107 style='height:165.0pt;width:80pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>　</td>
  <td class=xl73 width=87 style='width:65pt'>　</td>
  <td class=xl88 width=359 style='width:269pt'>電子カルテシステムで入院時、外来受診時のいずれにおいて本情報が登録されたか記録さている場合にはその入院・外来区分をEncounter.class要素に設定し、そのEncounterリソースをContainedリソースとして本リソースに埋め込んで、それを参照すること。<br>
    <font class="font12">電子カルテ共有サービスにおける6情報のひとつとして本リソースが記述される場合には、JP_Encounterタイプのリソース（Encounter.idの値が&quot;#encounter203987&quot;と仮定）が本リソースのContainedリソースとして埋め込み記述されることが</font><ruby><font
  class="font12">必須</font><span style='display:none'><rt>ヒッス </rt></span></ruby><font
  class="font12">であるため、そのcontainedリソースのid値(Encounter.id)を記述する例2となる。</font></td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>例 2<br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;#encounter203987&quot;<br>
    }</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=260 style='height:195.0pt'>
  <td height=260 class=xl72 width=107 style='height:195.0pt;width:80pt'>(onset)</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>（dateTime、Age、Period、Range、string）のいずれかの型をとる。</td>
  <td class=xl88 width=359 style='width:269pt'>このアレルギー・不耐性状態が同定された時期。患者に反応が出現した時期、あるいはなんらかのエビデンスによりこの反応が患者にあると確認できた時期を記述する。記録を登録した日時は、別途recordedDateに記述する。記述方法として、1時点の日時、患者の年齢（曖昧な年齢時期の記述も可能）、開始時期と終了時期による期間、年齢の区間、（なんらかの出来事を引用して記述するような）文字列で時期を記述、の5通りのいずれかの要素（onsetDateTime、onseAge、onsetPeriod、onsetRange、onsetString）からひとつの記述方法を選択して、それにより記述する。複数を選択はできない。onset要素は記述しないで、直接onsetDateTime要素などonsetXXXXの要素により記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl72 width=107 style='height:60.0pt;width:80pt'>onsetDateTime</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl88 width=359 style='width:269pt'>一時点の記述方式：<br>
   
  日付または日時。年や年月だけでもよい。例：2018,1973-06,1905-08-23,2015-02-07T13:28:17+09:00。<br>
    時刻に24:00の使用はできない。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>2018<br>
    1973-06<br>
    1905-08-23<br>
    2015-02-07T13:28:17+09:00</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Age</td>
  <td class=xl88 width=359 style='width:269pt'>年齢や年齢を基準にして記述する方式：<br>
    患者の申告による、状態が出現し始めた年齢。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>50歳 の例 、50歳 以上 の例 を以下 に示 す。</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>value</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>decimal</td>
  <td class=xl88 width=359 style='width:269pt'>年齢の値。月齢や週齢なども可能。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;50&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=107 style='height:90.0pt;width:80pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>comparator</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>valueの値と等しい年齢を表現したい場合には、=は不要でこの要素は出現しない。<br>
    そうでない指定をしたい場合には、&lt;、&lt;=、&gt;=、&gt;のいずれか。<br>
    要素valueの値の解釈方法。例では、「50歳以上で」と記述したい場合には、&gt;=を記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;&gt;=&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>unit</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>単位表現。文字列で単位文字列を記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;歳&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl88 width=359 style='width:269pt'>単位体系UCUMコード体系。固定値。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http://unitsofmeasure.org&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>単位体系における単位コード。min：minutes、h：hours、d：days、wk：weeks、mo：months、a：years</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;a&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetPeriod</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Preiod</td>
  <td class=xl88 width=359 style='width:269pt'>期間。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetPeriod</td>
  <td class=xl73 width=73 style='width:55pt'>start</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl88 width=359 style='width:269pt'>期間の開始日時</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetPeriod</td>
  <td class=xl73 width=73 style='width:55pt'>end</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl88 width=359 style='width:269pt'>期間の終了日時</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Range</td>
  <td class=xl88 width=359 style='width:269pt'>曖昧な時期を最小値と最大値とで記述する。以下の記述例は50歳台。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>SimpleQuantity</td>
  <td class=xl88 width=359 style='width:269pt'>下限値表現</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>value</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>decimal</td>
  <td class=xl88 width=359 style='width:269pt'>年齢の値。月齢や週齢なども可能</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;50&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>unit</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>単位表現</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;歳&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl88 width=359 style='width:269pt'>単位体系UCUMコード体系。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http://unitsofmeasure.org&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>単位体系における単位コード。min：minutes、h：hours、d：days、wk：weeks、mo：months、a：years</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;a&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>SimpleQuantity</td>
  <td class=xl88 width=359 style='width:269pt'>　</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>value</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>decimal</td>
  <td class=xl88 width=359 style='width:269pt'>年齢の値。月齢や週齢なども可能</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;59&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>unit</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>単位表現</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;歳&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl88 width=359 style='width:269pt'>単位体系UCUMコード体系。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http://unitsofmeasure.org&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>単位体系における単位コード。min：minutes、h：hours、d：days、wk：weeks、mo：months、a：years</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;a&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>onsetString</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>｀</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;70歳台&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>recordedDate</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl88 width=359 style='width:269pt'>この状態が最初に記録された日時</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl72 width=107 style='height:60.0pt;width:80pt'>recorder</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Reference(JP_Practitioner )</td>
  <td class=xl88 width=359 style='width:269pt'>この状態を記録した人情報への参照。医療者のContainedリソースへの参照を記述する。またはdisplay要素に文字列を記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>{<br>
    <span style='mso-spacerun:yes'>   </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;#practitioner20394&quot;<br>
    }</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=107 style='height:90.0pt;width:80pt'>asserter</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Reference(JP_Patient|
  JP_Practitioner| RelatedPerson|)</td>
  <td class=xl88 width=359 style='width:269pt'>この状態があると確認（主張）した人情報への参照。医療者、患者本人の場合にはそれぞれのContainedリソースへの参照を記述する。またはdisplay要素に文字列を記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>{<br>
    <span style='mso-spacerun:yes'>   </span>&quot;display&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;本人 の母 &quot;<br>
    }</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>lastOccurrence</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl88 width=359 style='width:269pt'>最後（直近）に知られている発生日時</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>note[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>Annotation</td>
  <td class=xl88 width=359 style='width:269pt'>状態に関する追加的な情報で他の要素で記述できないような情報</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>note[+]</td>
  <td class=xl73 width=73 style='width:55pt'>authorString</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>記載者氏名などの文字列。必ずしも氏名でなくてもよい。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;看護担当者&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>note[=]</td>
  <td class=xl73 width=73 style='width:55pt'>time</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl88 width=359 style='width:269pt'>この追加的な情報が作成された日時</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>note[=]</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>markdown</td>
  <td class=xl88 width=359 style='width:269pt'>追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>BackboneElement</td>
  <td class=xl88 width=359 style='width:269pt'>対象物質に暴露したことに関連して派生した有害反応の履歴事実に関する情報。複数記述できる。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=300 style='height:225.0pt'>
  <td height=300 class=xl72 width=107 style='height:225.0pt;width:80pt'>reaction[+]</td>
  <td class=xl73 width=73 style='width:55pt'>substance</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl88 width=359 style='width:269pt'>有害反応の原因と考えられる物質（または医薬品）。<br>
    <br>
   
  注：特定の有害反応を誘発する物質は、原因として特定された物質と異なっていてもよいが、整合がとれていなければならない。たとえば、より具体的な物質（ブランド薬など）や、特定された物質を含む複合製品の場合がある。AllergyIntolerance.codeのみを処理し、AllergyIntolerance.reaction.substanceを無視しても、臨床的に安全でなければならない。受信システムがAllergyIntolerance.reaction.substanceがAllergyIntolerance.codeのセマンティックスコープ内に（前者が後者の意味的な下位概念にあること）を確認できない場合、受信システムはAllergyIntolerance.reaction.substanceを無視する必要がある。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>substance</td>
  <td class=xl73 width=73 style='width:55pt'>coding[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl88 width=359 style='width:269pt'>有害反応の原因物質のコード化情報</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=260 style='height:195.0pt'>
  <td height=260 class=xl72 width=107 style='height:195.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>substance</td>
  <td class=xl73 width=73 style='width:55pt'>coding[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>ur</td>
  <td class=xl88 width=359 style='width:269pt'>jpfhir.jpでのアレルゲンコード表のコードを使用できる。<br>
   
  使用するコード表（例）：ValueSethttp://jpfhir.jp/fhir/core/ValueSet/JP_AllergyIntolerance_VS<br>
   
  CodeSystemは、category要素に対応して、http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyFoodAllergen_CS<br>
    http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyNonFoodNonMedicationAllergen_CS<br>
   
  http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyMedicationAllergen_CSの3つのいずれかから選択することができる。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyFoodAllergen_CS<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>substance</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>コード</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;J7F7311154&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>substance</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>display</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>コードに対応する表示名</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;モッツァレラチーズ&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>substance</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>有害反応の原因物質の文字列による記述</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;モッツァレラチーズ&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>manifestation[*]<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>1..*</td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl88 width=359 style='width:269pt'>アレルギー反応に関連する症状や所見</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>manifestation[+]</td>
  <td class=xl73 width=73 style='width:55pt'>coding[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl88 width=359 style='width:269pt'>アレルギー反応に関連する症状や所見のコード化情報</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>manifestation<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl73 width=73 style='width:55pt'>coding[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>ur</td>
  <td class=xl291 width=359 style='width:269pt'>system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。&quot;BOEF&quot;は、MEDIS標準病名マスター病名交換用コードで&quot;持続腹痛&quot;のコード</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http://medis.or.jp/CodeSystem/master-disease-exCode&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>manifestation [=]</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl291 width=359 style='width:269pt'>&quot;持続腹痛&quot;はその表示名の例</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;B0EF&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>manifestation[=]</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>display</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl291 width=359 style='width:269pt'>　</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;持続腹痛&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>manifestation[=]</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl291 width=359 style='width:269pt'>アレルギー反応に関連する症状や所見症状のテキスト表現</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;長く続く腹部の痛み&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>description</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>イベントの全体的な記述</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;チーズを食べて1時間後から激しい腹痛と下痢がながく続いた。&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>onset</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl88 width=359 style='width:269pt'>関連する症状や所見が見られた日時</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;2010-01-02&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl72 width=107 style='height:75.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>severity</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>反応の激しさ程度。mild|moderate|severe(ofeventasawhole)（軽度|中度|重度）ValueSethttp://hl7.org/fhir/ValueSet/reaction-event-severityから選択する。(コード表：http://hl7.org/fhir/reaction-event-severity)</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;severe&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>exposureRoute</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl88 width=359 style='width:269pt'>物質の摂取経路の情報</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>exposureRoute</td>
  <td class=xl73 width=73 style='width:55pt'>coding[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl88 width=359 style='width:269pt'>物質の摂取経路のコード化情報</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>exposureRoute</td>
  <td class=xl73 width=73 style='width:55pt'>coding[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>ur</td>
  <td class=xl88 width=359 style='width:269pt'>JAMI標準用法の投与経路コード表（JAMI用法コード表基本用法2桁コードに相当）を使用する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http://jami.jp/CodeSystem/MedicationMethodDetailUsage&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>exposureRoute</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl291 width=359 style='width:269pt'>摂取経路コード</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;10&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>exposureRoute</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>display</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl291 width=359 style='width:269pt'>摂取経路コードに対応する表示名</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;内服経口&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>exposureRoute</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl291 width=359 style='width:269pt'>接種経路の文字列表現</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;経口摂取&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>note[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>Annotation</td>
  <td class=xl88 width=359 style='width:269pt'>他のフィールドで記述できないイベントに関するテキスト記述</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=107 style='height:30.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>note[+]</td>
  <td class=xl73 width=73 style='width:55pt'>authorString</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl88 width=359 style='width:269pt'>記載者氏名などの文字列。必ずしも氏名でなくてもよい。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;患者の母親&quot;</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=107 style='height:20.0pt;width:80pt'>reaction[=]</td>
  <td class=xl73 width=73 style='width:55pt'>note[=]</td>
  <td class=xl73 width=73 style='width:55pt'>time</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl88 width=359 style='width:269pt'>この追加的な情報が作成された日時</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl82 width=107 style='height:31.0pt;width:80pt'>reaction[=]</td>
  <td class=xl83 width=73 style='width:55pt'>note[=]</td>
  <td class=xl83 width=73 style='width:55pt'>text</td>
  <td class=xl83 width=73 style='width:55pt'>　</td>
  <td class=xl84 width=35 style='width:26pt'>1..1</td>
  <td class=xl83 width=87 style='width:65pt'>markdown</td>
  <td class=xl292 width=359 style='width:269pt'>追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。</td>
  <td class=xl83 width=36 style='width:27pt'>　</td>
  <td class=xl301 width=195 style='width:146pt'>　</td>
  <td colspan=3 style='mso-ignore:colspan'></td>
 </tr>


</table>

</div>


<button type="button" onclick="details_open(false,'TableDetails','mrc')">閉じる</button>

</details>

## プロファイル

<br>

## プロファイル

{% include markdown-link-references.md %}