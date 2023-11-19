# eCS 診療情報・サマリー汎用：【傷病名情報】

## 背景および想定シナリオ
このプロファイルは、６情報をはじめ、診療情報提供書や退院時サマリーなどの2文書や、診療６情報・サマリー用に「傷病名情報」を記述するためのものである。
電子カルテ情報共有サービスに送信する情報に含まれる場合には、派生プロファイルである[CLINS電子カルテ情報共有サービス用: 【傷病名情報　JP_Condition_CLINS_eCS][JP_Condition_CLINS_eCS]　を使用すること。】


## スコープ

### 対象
電子カルテシステムで登録された病名、診断書、診療情報提供書、退院時サマリーなどの診療要約記録などに記述される診断病名、検査等のための疑い病名として記録される傷病名情報、診療録中に医師により記録されるプロブレムリストのひとつひとつなどを対象とする。

ある治療や処置後の臨床情報や患者の健康状態なども対象になる。


## プロファイル定義における必須要素と推奨要素
  - 必須要素は、その要素が必ず１個以上出現しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。
  - 推奨要素は、送信側はシステムに値が存在しているなら、値を格納した要素が必ず１個以上出現しなければならず、受信側は必ずその値を格納しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。

### 必須要素
  - resourceType : リソースタイプ "Condition"
  - meta.lastUpdated : 最終更新日時
  - meta.profile : 電子カルテ情報共有サービスでは必須
  - extension (eCS_InstitutionNumber) : 電子カルテ情報共有サービスでは必須。医療機関番号１０桁
  - identifier : インスタンス識別ID
  - clinicalStatus : 臨床的状態のステータスのコード化情報。コード化必須。ただし、verificationStatus要素が'entered-in-error'であれば、本要素は存在してはならない。
  - verificationStatus : 入力された臨床的状態に対する検証状況。コード化必須。疑い病名の場合には、unconfirmedを設定し、それ以外の場合には通常confirmedを設定する。
  - category : 臨床的状態に割り当てられたカテゴリー。設定する場合には、problem-list-item （プロブレムリスト）| encounter-diagnosis （診察時点での診断名）のいずれかを設定する。電子カルテ情報共有サービスでは'encounter-diagnosis'を設定すること。
  - code : 傷病名のコードと名称。code.texはコード化の有無にかかわらず病名入力文字列を必ずそのまま設定する。コード化は必須。
  - subject : 対象となる患者のFHIRリソースへの参照。患者リソースのidentifierを設定する。

### 条件により必須
  - meta.tag : 電子カルテ情報共有サービスで長期保存情報フラグの設定する場合に必須。
  - meta.tag : 電子カルテ情報共有サービスで未告知フラグを設定する場合に必須。
  - clinicalStatus : 臨床的状態(傷病の状態)のコード化情報。コード化必須。ただし、verificationStatus要素が'entered-in-error'であれば、本要素は存在してはならない。abatementDateTime要素に日付が設定されている場合にはその時点での状態を設定し、同要素がない場合にはactiveを設定する。
  - onsetDatetime : 電子カルテ情報共有サービスでは、病名開始日をdateTime型で記述することが必須。
  - abatementDateTime : 電子カルテ情報共有サービスでは、病名終了日や転帰日がある場合には、dateTime型で記述することが必須。

### 推奨要素
  - extension (eCS_Department) : 診療科情報
  - contained (JP_Encounter) : 傷病名登録時の入院外来区分情報
  - contained (JP_Practitioner) : 傷病名登録者の情報
  - encounter : 傷病名登録時の入院外来区分情報
  - onsetDatetime : この傷病名情報が同定された時期。電子カルテシステムの病名開始日をdateTime型で記述するのが一般的な方法である。
  - abatementDateTime : この傷病名情報による患者状態が終了したと同定された時期。電子カルテシステムの病名終了日をdateTime型で記述するのが一般的な方法である。
  - recordedDate : この状態が最初に記録された日時。
  - recorder : 傷病名登録者の情報。

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


<h3>表 「Condition」</h3>
<button id="mrc" type="button" onclick="details_open(true,'TableDetails','mrc')">表「Condition」開く</button>
<details id="TableDetails">
<button type="button" onclick="details_open(false,'TableDetails', 'mrc')">閉じる</button>
<summary></summary>


<div id="Table_18042" class="htmlTable" align=center x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=1928 style='border-collapse:
 collapse;table-layout:fixed;width:1446pt'>
 <col width=97 style='mso-width-source:userset;mso-width-alt:2669;width:73pt'>
 <col width=73 span=3 style='mso-width-source:userset;mso-width-alt:2011;
 width:55pt'>
 <col width=35 style='mso-width-source:userset;mso-width-alt:950;width:26pt'>
 <col width=87 style='mso-width-source:userset;mso-width-alt:2377;width:65pt'>
 <col width=359 style='mso-width-source:userset;mso-width-alt:9837;width:269pt'>
 <col width=36 style='mso-width-source:userset;mso-width-alt:987;width:27pt'>
 <col width=195 style='mso-width-source:userset;mso-width-alt:5339;width:146pt'>
 <col width=100 span=9 style='width:75pt'>
 <tr height=61 style='mso-height-source:userset;height:46.0pt'>
  <td colspan=9 height=61 class=xl446 align=left width=1028 style='height:46.0pt;
  width:771pt'><ruby>多重度<span style='display:none'><rt>タジュウド </rt></span></ruby>は、<ruby>親<span
  style='display:none'><rt>オヤ </rt></span></ruby><ruby>要素<span
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
  style='display:none'><rt>シュツゲン </rt></span></ruby>しなければならない。</td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=100 style='width:75pt'></td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl68 width=97 style='height:75.0pt;border-top:none;
  width:73pt'>要素Lv1</td>
  <td class=xl69 width=73 style='border-top:none;width:55pt'>要素Lv2</td>
  <td class=xl69 width=73 style='border-top:none;width:55pt'>要素Lv3</td>
  <td class=xl69 width=73 style='border-top:none;width:55pt'>要素Lv4</td>
  <td class=xl70 width=35 style='border-top:none;width:26pt'>多重度</td>
  <td class=xl69 width=87 style='border-top:none;width:65pt'>型</td>
  <td class=xl69 width=359 style='border-top:none;width:269pt'>説明</td>
  <td class=xl69 width=36 style='border-top:none;width:27pt'><ruby>固定値<span
  style='display:none'><rt class=font7>コテイチ</rt></span></ruby> <br>
    <ruby>／<span style='display:none'><rt class=font7>レイジ</rt></span></ruby> <ruby>例<span
  style='display:none'><rt class=font7>ジ</rt></span></ruby> 示</td>
  <td class=xl71 width=195 style='border-top:none;width:146pt'><ruby>固定値<span
  style='display:none'><rt class=font7>コテイチ</rt></span></ruby> または<ruby>例示<span
  style='display:none'><rt class=font7>レイジ</rt></span></ruby></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>resourceType</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl75 width=359 style='width:269pt'>Conditionリソースであることを示す。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;Condition&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>Meta</td>
  <td class=xl73 width=359 style='width:269pt'>　</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=340 style='height:255.0pt'>
  <td height=340 class=xl72 width=97 style='height:255.0pt;width:73pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>lastUpdated</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>instant</td>
  <td class=xl73 width=359 style='width:269pt'>最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz<br>
   
  この要素は、このリソースのデータを取り込んで蓄積していたシステムが、このリソースになんらかの変更があった可能性があった日時を取得し、このデータを再取り込みする必要性の判断をするために使われる。<ruby>本要素<span
  style='display:none'><rt>ホンヨウソ </rt></span></ruby>に前回取り込んだ時点より後の日時が設定されている場合には、なんらかの変更があった可能性がある（変更がない場合もある）ものとして判断される。したがって、内容になんらかの変更があった場合、またはこのリソースのデータが初めて作成された場合には、その時点以降の日時（たとえば、このリソースのデータを作成した日時）を設定しなければならない。内容の変更がない場合でも、このリソースのデータが作り直された場合や単に複写された場合にその日時を設定しなおしてもよい。ただし、内容に変更がないのであれば、日時を変更しなくてもよい。また、この要素の変更とmeta.versionIdの変更とは、必ずしも連動しないことがある。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;2015-02-07T13:28:17.239+09:00&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=160 style='height:120.0pt'>
  <td height=160 class=xl72 width=97 style='height:120.0pt;width:73pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>profile[+]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>canonical(StructureDefinition)</td>
  <td class=xl88 width=359 style='width:269pt'>準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。<br>
    http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Condition_eCS　を設定する。<br>
    <font class="font12">電子カルテ情報共有サービスに本リソースデータを送信する場合には、http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Condition_eCS　を設定すること。</font></td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Condition_eCS&quot;<br>
    または<br>
   
  &quot;http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Condition_eCS&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl73 width=359 style='width:269pt'><ruby>本リソースのタグ情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby></td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=97 style='height:45.0pt;width:73pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl78 width=359 style='width:269pt'>電子カルテ情報共有サービスで長期保存情報フラグの設定する場合に使用</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;http:/jpfhir.jp/fhir/clins/CodeSystem/JP_ehrshrs_indication&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>長期保存情報フラグ</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;LTS&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=97 style='height:45.0pt;width:73pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl78 width=359 style='width:269pt'>電子カルテ情報サービスで未告知情報または未説明フラグを設定する場合に使用</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;http:/jpfhir.jp/fhir/clins/CodeSystem/JP_ehrshrs_indication&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>未告知情報または未説明フラグ</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;UNINFORMED&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>contained[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl79 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>　</td>
  <td class=xl73 width=359 style='width:269pt'>　</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=97 style='height:90.0pt;width:73pt'>contained[+]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1*</td>
  <td class=xl73 width=87 style='width:65pt'>Resource(JP_Encounter)</td>
  <td class=xl73 width=359 style='width:269pt'>encounter要素から参照される場合には、そのJP_Encounterリソースの実体。JP_Encounterリソースにおける必要最小限の要素だけが含まれればよい。ここで埋め込まれるJP_Encounterリソースでは、Encounter.classにこの情報を記録したときの受診情報（入外区分など）を記述して使用する。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=97 style='height:45.0pt;width:73pt'>contained[+]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1*</td>
  <td class=xl73 width=87 style='width:65pt'>Resource(JP_Practitioner<span
  style='mso-spacerun:yes'>  </span>)</td>
  <td class=xl73 width=359 style='width:269pt'>recorder要素から参照される場合には、そのJP_Practitionerリソースの実体。JP_Practitionerリソースにおける必要最小限の要素だけが含まれればよい。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl162 align=left width=97 style='height:30.0pt;
  border-top:none;width:73pt'>extension[*]</td>
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
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl266 align=left width=97 style='height:20.0pt;
  width:73pt'>extension[+]</td>
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
  <td colspan=6 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=177 style='mso-height-source:userset;height:133.0pt'>
  <td height=177 class=xl266 align=left width=97 style='height:133.0pt;
  width:73pt'>extension[=]</td>
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
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=47 style='mso-height-source:userset;height:35.0pt'>
  <td height=47 class=xl156 align=left width=97 style='height:35.0pt;
  border-top:none;width:73pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueIdentifier</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl122 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Identifier</td>
  <td class=xl117 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>医療<span style='display:none'><rt>イリョウ </rt></span></ruby><ruby>機関<span
  style='display:none'><rt>キカｎ </rt></span></ruby><ruby>識別<span
  style='display:none'><rt>シキベツ </rt></span></ruby><ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>。</td>
  <td class=xl119 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl125 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=84 style='height:63.0pt'>
  <td height=84 class=xl156 align=left width=97 style='height:63.0pt;
  border-top:none;width:73pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueIdentifier</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl122 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl258 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl117 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>医療<span style='display:none'><rt>イリョウ </rt></span></ruby><ruby>機関<span
  style='display:none'><rt>キカｎ </rt></span></ruby>１０<ruby>桁<span
  style='display:none'><rt>ケタ </rt></span></ruby><ruby>番号<span
  style='display:none'><rt>バンゴウ </rt></span></ruby>を<ruby>示<span
  style='display:none'><rt>シメス </rt></span></ruby>すURL。</td>
  <td class=xl269 align=left width=36 style='border-left:none;width:27pt'><ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl270 align=left width=195 style='border-top:none;border-left:none;
  width:146pt'><a
  href="http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no"
  target="_parent">http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no</a></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=36 style='height:27.0pt'>
  <td height=36 class=xl164 align=left width=97 style='height:27.0pt;
  border-top:none;width:73pt'>extension[=]</td>
  <td class=xl165 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueIdentifier</td>
  <td class=xl165 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>value</td>
  <td class=xl165 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl136 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl126 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl127 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>医療機関１０桁番号。<span style='display:none'><rt>ケタ </rt></span></ruby></td>
  <td class=xl232 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl128 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;1318814790&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl154 align=left width=97 style='height:45.0pt;
  border-top:none;width:73pt'>extension[+]</td>
  <td class=xl161 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl161 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl161 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl308 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl151 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Extension</td>
  <td class=xl285 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>本情報を作成発行した診療科または<ruby>作成<span style='display:none'><rt>サクセイ </rt></span></ruby><ruby>発行<span
  style='display:none'><rt>ハッコウ </rt></span></ruby>者の診療科情報を記述するために使用する拡張「eCS_Department」。</td>
  <td class=xl271 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl135 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=112 style='height:84.0pt'>
  <td height=112 class=xl266 align=left width=97 style='height:84.0pt;
  width:73pt'>extension[=]</td>
  <td class=xl267 align=left width=73 style='border-left:none;width:55pt'>url</td>
  <td class=xl267 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl267 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl309 align=left width=35 style='border-left:none;width:26pt'>1..1</td>
  <td class=xl258 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl268 align=left width=359 style='border-left:none;width:269pt'>診療科情報を記述するために使用する拡張を識別するURL。</td>
  <td class=xl269 align=left width=36 style='border-left:none;width:27pt'><ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl272 width=195 style='border-left:none;width:146pt'><a
  href="http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_Department"
  target="_parent">http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_Department</a></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl156 align=left width=97 style='height:31.0pt;
  border-top:none;width:73pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl310 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl117 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>診療科情報。</td>
  <td class=xl119 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl125 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=36 style='height:27.0pt'>
  <td height=36 class=xl156 align=left width=97 style='height:27.0pt;
  border-top:none;width:73pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl157 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl310 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1*</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Coding</td>
  <td class=xl117 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>診療科のコード化記述+H26。</td>
  <td class=xl134 width=36 style='border-left:none;width:27pt'>　</td>
  <td class=xl125 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl156 align=left width=97 style='height:45.0pt;
  border-top:none;width:73pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl310 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl258 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl117 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JAMI 診療科コード表のURI。</td>
  <td class=xl134 align=left width=36 style='border-left:none;width:27pt'><ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl125 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=35 style='height:26.0pt'>
  <td height=35 class=xl156 align=left width=97 style='height:26.0pt;
  border-top:none;width:73pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl310 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl117 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JAMI 診療科コード。2<ruby>桁<span style='display:none'><rt>ケタ </rt></span></ruby>またh3桁コード。</td>
  <td class=xl119 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl125 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;08&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=35 style='height:26.0pt'>
  <td height=35 class=xl156 align=left width=97 style='height:26.0pt;
  border-top:none;width:73pt'>extension[=]</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl157 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>display</td>
  <td class=xl310 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl118 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl117 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JAMI 診療科コードでのコードに対応する表示名。</td>
  <td class=xl119 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl125 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;<ruby>循環器科<span
  style='display:none'><rt>ジュンカンキカ </rt></span></ruby>&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl164 align=left width=97 style='height:31.0pt;
  border-top:none;width:73pt'>extension[=]</td>
  <td class=xl165 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>valueCodeableConcept</td>
  <td class=xl165 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>text</td>
  <td class=xl165 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl311 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl126 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl127 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>コード<ruby>化<span style='display:none'><rt>カ </rt></span></ruby>の<ruby>有無<span
  style='display:none'><rt>ウム </rt></span></ruby>に<ruby>関<span
  style='display:none'><rt>カカワラズ </rt></span></ruby>わらず、<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>したい<ruby>診療科<span
  style='display:none'><rt>シンリョウカ </rt></span></ruby><ruby>名<span
  style='display:none'><rt>メイ </rt></span></ruby>の<ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby>。</td>
  <td class=xl232 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl128 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;<ruby>循環器<span
  style='display:none'><rt>ジュンカンキ </rt></span></ruby><ruby>診療<span
  style='display:none'><rt>シンリョウ </rt></span></ruby><ruby>科<span
  style='display:none'><rt>カ </rt></span></ruby>&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=261 style='height:196.0pt'>
  <td height=261 class=xl72 width=97 style='height:196.0pt;width:73pt'>identifier[*]</td>
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
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=84 style='height:63.0pt'>
  <td height=84 class=xl72 width=97 style='height:63.0pt;width:73pt'>identifier[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl289 width=359 style='width:269pt'>このリソース情報を他のリソース情報と一意に区別できるIDである場合に、system値を固定で設定する。1回の登録で複数のリソース情報が登録される場合に、それらは同一のIDで登録される場合でもこのsystem値を使用する。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl85 width=195 style='width:146pt'><a
  href="http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
  target="_parent">http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></a></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>identifier[=]</td>
  <td class=xl73 width=73 style='width:55pt'>value</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>このリソース情報IDの文字列。URI形式を使う場合には、urn:ietf:rfc:3986に準拠すること。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;1311234567-2020-00123456&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl72 width=97 style='height:60.0pt;width:73pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl79 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl73 width=359 style='width:269pt'>臨床的状態。病名最終日（abatementDateTime)での状態（転帰）。コードでの記述は必須。ただし、verificationStatus要素が'entered-in-error'であれば、本要素は存在してはな<ruby>らな<span
  style='display:none'><rt>ヨウソ &#0;l&#2;&#4;&#2;&#8;</rt></span></ruby>い。<font
  class="font12">それ以外では、必須。</font></td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl73 width=359 style='width:269pt'>臨床的状態のステータスのコード化情報</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=97 style='height:45.0pt;width:73pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>ur</td>
  <td class=xl73 width=359 style='width:269pt'>コードで記述が必須で、少なくともひとつのsystem値は固定値。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;http://terminology.hl7.org/CodeSystem/condition-clinical&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl72 width=97 style='height:75.0pt;width:73pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>コード表　http://terminology.hl7.org/CodeSystem/condition-clinical　から　active（存続）,
  remission(軽快、寛解), inactive（治癒以外での病名の終了）, resolved (治癒) 、unknown（<ruby>不明<span
  style='display:none'><rt>フメイ </rt></span></ruby>）のいずれかを選ぶ。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;active&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>display</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>Active|Remission|Resolved|Unknownのいずれかの文字列。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>”Active&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>clinicalStatus</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl103 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>コードだけでは記述できない情報がある場合にコードと併用してもよい。値が使用されない可能性はある。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl72 width=97 style='height:60.0pt;width:73pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl87 width=35 style='width:26pt'>1..1<ruby><font class="font7"><rt
  class=font7></rt></font></ruby></td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl73 width=359 style='width:269pt'>入力された臨床的状態に対する検証状況を示す。確からしさと考えられる。コード化記述が必須。clinicalStatusとの制約条件を参照のこと。<font
  class="font12">疑い病名フラグとしても使用される。</font></td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl87 width=35 style='width:26pt'>1..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl80>臨床的状態に対する検証状況のコード化情報</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=84 style='height:63.0pt'>
  <td height=84 class=xl72 width=97 style='height:63.0pt;width:73pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl87 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl73 width=359 style='width:269pt'>コードで記述が必須で、少なくともひとつのsystem値は固定値。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl85 width=195 style='width:146pt'><a
  href="http://terminology.hl7.org/CodeSystem/condition-ver-status"
  target="_parent">http://terminology.hl7.org/CodeSystem/condition-ver-status</a></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=160 style='height:120.0pt'>
  <td height=160 class=xl72 width=97 style='height:120.0pt;width:73pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl87 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>unconfirmed|confirmed|refuted|entered-in-error(未確認|確認済み|否定された|入力エラー)のいずれか（ValueSethttp://hl7.org/fhir/ValueSet/allergyintolerance-verificationより選択することが必須）。<br>
    疑い病名フラグがない病名には、confirmed を<ruby>必<span style='display:none'><rt>カナラズ </rt></span></ruby>ず設定する。<br>
    疑い病名フラグのある病名には、unconfirmed を必ず設定する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;Unconfirmed&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>display</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl87 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>Unconfirmed|Confirmed|Refuted|EnteredinErrorのいずれかの文字列。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>”Unconfirmed&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=97 style='height:45.0pt;width:73pt'>verificationStatus</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl106 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>コードだけでは記述できない情報がある場合や、コード化できない場合には本要素だけで記述してもよい。コードと併用してもよい</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl72 width=97 style='height:75.0pt;width:73pt'>category</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl87 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'><ruby>臨床<span style='display:
  none'><rt>リンショウ </rt></span></ruby><ruby>的<span style='display:none'><rt>テキ </rt></span></ruby>状態に割り当てられたカテゴリー。設定する<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>には、problem-list-item
  （プロブレムリスト）| encounter-diagnosis （<ruby>診察<span style='display:none'><rt>シンサツ </rt></span></ruby><ruby>時点<span
  style='display:none'><rt>ジテン </rt></span></ruby>での<ruby>診断名<span
  style='display:none'><rt>シンダンメイ </rt></span></ruby>）のいずれ<ruby>かを<span
  style='display:none'><rt>セッテイ </rt></span></ruby>設定する。電子カルテ情報サービスでは、'encounter-diagnosis'を<ruby>設定<span
  style='display:none'><rt>セッテイ </rt></span></ruby>すること。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;encounter-diagnosi&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=97 style='height:90.0pt;width:73pt'>severity</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>潜在的な臨床的危険性、致命度。記述する場合は、コード表：&quot;http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionSeverity_CS&quot;からMI：軽度、MO：中度、SE：重度、UK：不明のいずれかを<ruby>設定<span
  style='display:none'><rt>セッテイ </rt></span></ruby>する。<br>
    </td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;SE&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl73 width=359 style='width:269pt'>	傷病名のコードと名称。code.texはコード<ruby>化<span
  style='display:none'><rt>カ </rt></span></ruby>の<ruby>有無<span
  style='display:none'><rt>ウム </rt></span></ruby>にかかわらず<ruby>病名<span
  style='display:none'><rt>ビョウメイ </rt></span></ruby><ruby>入力<span
  style='display:none'><rt>ニュウリョク </rt></span></ruby><ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby>を<ruby>必<span
  style='display:none'><rt>カナラズ </rt></span></ruby>ずそのまま<ruby>設定<span
  style='display:none'><rt>セッテイ </rt></span></ruby>する。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=220 style='height:165.0pt'>
  <td height=220 class=xl72 width=97 style='height:165.0pt;width:73pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>coding[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl73 width=359 style='width:269pt'>MEDIS
  病名交換コード、病名管理番号、ICD10分類コード、レセプト電算処理用傷病名コード、またはレセプト電算処理用傷病名コードの未コード化コード(7桁all
  9)のいずれかまたは複数の組み合わせで表現することを<ruby>推奨<span style='display:none'><rt>スイショウ </rt></span></ruby>する。<br>
    電子カルテ情報サービスでは、コード<ruby>化<span style='display:none'><rt>カ </rt></span></ruby>は<ruby>必須<span
  style='display:none'><rt>ヒッス </rt></span></ruby>で、病名管理番号またはレセプト電算処理用傷病名コードのいずれかを必ず使用し、それ以外にICD10分類コードを<ruby>追加<span
  style='display:none'><rt>ツイカ </rt></span></ruby>することを<ruby>推奨<span
  style='display:none'><rt>スイショウ </rt></span></ruby>する。なお、<ruby>病名<span
  style='display:none'><rt>ビョウメイ </rt></span></ruby>のコード<ruby>化<span
  style='display:none'><rt>カ </rt></span></ruby>ができない<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>には、レセプト電算処理用傷病名コードとして、未コード化コード(7桁all
  9）を<ruby>使用<span style='display:none'><rt>&#0;k&#2;&#6;</rt></span></ruby>する。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=240 style='height:180.0pt'>
  <td height=240 class=xl72 width=97 style='height:180.0pt;width:73pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>coding[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl73 width=359 style='width:269pt'><ruby>M<span style='display:
  none'><rt>ttp://&#0;&#0;&#1;=~&#1;@ö&#2;Dö&#1;Hü&#1;Mþ&#2;QĄ&#2;&#0;&#0;&#0;&#0;&#14;耀&#14;&quot;牛乳・乳製品（詳細不明）&quot;&#1;&#12;&#28;5&#0;&#0;&#0;&#0;&#0;&#0;&#0;&#0;&#8;</rt></span></ruby>EDIS
  病名交換コード：http://medis.or.jp/CodeSystem/master-disease-exCode<br>
    病名管理番号：http://medis.or.jp/CodeSystem/master-disease-keyNumbe<ruby>r<span
  style='display:none'><rt>&#0;&#8;&quot;十二指腸潰瘍&quot;&#1;&#0;ĉ&#0;&#8;耀&#8;&quot;十二</rt></span></ruby><br>
    ICD10分類コード：http://jpfhir.jp/fhir/core/mhlw/CodeSystem/ICD10-2013-full<br>
   
  レセプト電算処理用傷病名コード：http://jpfhir.jp/fhir/core/mhlw/CodeSystem/masterB-disease<br>
    <br>
    </td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>http://medis.or.jp/CodeSystem/master-disease-keyNumber</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>コード</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;20064049&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>coding[=]</td>
  <td class=xl73 width=73 style='width:55pt'>display</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>コードに対応する表示名</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;十二指腸潰瘍&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>text</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'><ruby>傷病名<span style='display:
  none'><rt>ショウビョウメイ </rt></span></ruby>の<ruby>元<span style='display:none'><rt>モト
  </rt></span></ruby>の<ruby>入力<span style='display:none'><rt>ニュウリョク </rt></span></ruby><ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby><br>
    </td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;十二指腸潰瘍・<ruby>H1<span
  style='display:none'><rt>カツドウ </rt></span></ruby><ruby>期<span
  style='display:none'><rt>キ </rt></span></ruby>&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=97 style='height:90.0pt;width:73pt'>bodySite</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..*</td>
  <td class=xl73 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl73 width=359 style='width:269pt'>該当する状態が現れている解剖学的な場所を示す。<br>
   
  system値はMEDIS標準病名マスター修飾語交換用コードを使用する場合の例示。&quot;1244&quot;は、MEDIS標準病名マスター修飾語交換用コードで&quot;腹部&quot;のコード。&quot;腹部&quot;はそのテキスト記述の例。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>.coding[+].system =
  .coding[=].&quot;urn:oid:1.2.392.200119.4.201.5&quot;<br>
    .coding[=].code = &quot;1244&quot;<br>
    .coding[=].display =&quot;腹部&quot;<br>
    .text&quot;腹部&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl72 width=97 style='height:60.0pt;width:73pt'>subject</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl74 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>Reference(JP_Patient )</td>
  <td class=xl73 width=359 style='width:269pt'><ruby>対象<span style='display:
  none'><rt>タイショウ </rt></span></ruby>となる患者のFHIRリソースへの参照。Bundleリソースなどで本リソースから参照可能なPatientリソースが同時に存在する場合には、そのリソースの識別URI（fullUrl要素に指定されるUUID）を参照する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>例 <br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;urn: .....&quot;<br>
    }</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=280 style='height:210.0pt'>
  <td height=280 class=xl72 width=97 style='height:210.0pt;width:73pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>　</td>
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
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=97 style='height:90.0pt;width:73pt'>encounter</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Reference (JP_Encounter )</td>
  <td class=xl73 width=359 style='width:269pt'>この傷病名情報を記録したときの受診情報（入外区分など）を記述しているEncounterリソースへの参照。Bundleリソースなどで本リソースから参照可能なEncouertリソースが同時に存在する場合には、そのリソースの識別URIを参照する。Containedリソースが存在する場合には、それを参照する記述（次行の例）。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>例 1 <br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;urn: .....&quot;<br>
    }</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=220 style='height:165.0pt'>
  <td height=220 class=xl72 width=97 style='height:165.0pt;width:73pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>　</td>
  <td class=xl73 width=87 style='width:65pt'>　</td>
  <td class=xl73 width=359 style='width:269pt'>電子カルテシステムで入院時、外来受診時のいずれにおいて本情報が登録されたか記録さている場合にはその入院・外来区分をEncounter.class要素に設定し、そのEncounterリソースをContainedリソースとして本リソースに埋め込んで、それを参照すること。<br>
    <font class="font12">電子カルテ共有サービスにおける6情報のひとつとして本リソースが記述される場合には、JP_Encounterタイプのリソース（Encounter.idの値が&quot;#encounter203987&quot;と仮定）が本リソースのContainedリソースとして埋め込み記述されることが必須であるため、そのcontainedリソースのid値(Encounter.id)を記述する例2となる。</font></td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>例 2<br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;#encounter203987&quot;<br>
    }</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=340 style='height:255.0pt'>
  <td height=340 class=xl72 width=97 style='height:255.0pt;width:73pt'>(onset)</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl89 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>（dateTime、Age、Period、Range、string）のいずれかの型をとる。</td>
  <td class=xl73 width=359 style='width:269pt'>この傷病名情報が同定された時期。患者にこの<ruby>傷病<span
  style='display:none'><rt>ショウビョウ </rt></span></ruby>が出現した時期、あるいはなんらかのエビデンスによりこの<ruby>傷病<span
  style='display:none'><rt>ショウビョウ </rt></span></ruby>が患者にあると確認できた時期を記述する。<ruby><font
  class="font12">電子</font><span style='display:none'><rt>デンシ </rt></span></ruby><font
  class="font12">カルテシステムの</font><ruby><font class="font12">病名</font><span
  style='display:none'><rt>ビョウメイ </rt></span></ruby><ruby><font class="font12">開始日</font><span
  style='display:none'><rt>カイシビ </rt></span></ruby><font class="font12">をdateTime</font><ruby><font
  class="font12">型</font><span style='display:none'><rt>ガタ </rt></span></ruby><font
  class="font12">で</font><ruby><font class="font12">記述</font><span
  style='display:none'><rt>キジュツ </rt></span></ruby><font class="font12">するのが</font><ruby><font
  class="font12">一般的</font><span style='display:none'><rt>イッパンテキ </rt></span></ruby><font
  class="font12">な</font><ruby><font class="font12">方法</font><span
  style='display:none'><rt>ホウホウ </rt></span></ruby><font class="font12">である。電子カルテ共有サービスにおける6情報のひとつとして本リソースが記述される場合には、病名開始日をdateTime型で記述する。</font><br>
   
  記録を登録した日時は、別途recordedDateに記述する。記述方法として、1時点の日時、患者の年齢（曖昧な年齢時期の記述も可能）、開始時期と終了時期による期間、年齢の区間、（なんらかの出来事を引用して記述するような）文字列で時期を記述、の5通りのいずれかの要素（onsetDateTime、onseAge、onsetPeriod、onsetRange、onsetString）からひとつの記述方法を選択して、それにより記述する。複数を選択はできない。onset要素は記述しないで、直接onsetDateTime要素などonsetXXXXの要素により記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=8 style='mso-ignore:colspan'></td>
  <td class=xl273></td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl72 width=97 style='height:60.0pt;width:73pt'>onsetDateTime</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl89 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl73 width=359 style='width:269pt'>一時点の記述方式：<br>
   
  日付または日時。年や年月だけでもよい。例：2018,1973-06,1905-08-23,2015-02-07T13:28:17+09:00。<br>
    時刻に24:00の使用はできない。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;2018&quot;<br>
    &quot;1973-06&quot;<br>
    &quot;1989-08-23&quot;<br>
    &quot;2015-02-07T13:28:17+09:00&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Age</td>
  <td class=xl73 width=359 style='width:269pt'>年齢や年齢を基準にして記述する方式：<br>
    患者の申告による、状態が出現し始めた年齢。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>50歳 の例 、50歳 以上 の例 を以下 に示 す。</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>value</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>decimal</td>
  <td class=xl73 width=359 style='width:269pt'>年齢の値。月齢や週齢なども可能。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;50&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=97 style='height:90.0pt;width:73pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>comparator</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>valueの値と等しい年齢を表現したい場合には、=は不要でこの要素は出現しない。<br>
    そうでない指定をしたい場合には、&lt;、&lt;=、&gt;=、&gt;のいずれか。<br>
    要素valueの値の解釈方法。例では、「50歳以上で」と記述したい場合には、&gt;=を記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;&gt;=&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>unit</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>単位表現。文字列で単位文字列を記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;歳&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl73 width=359 style='width:269pt'>単位体系UCUMコード体系。固定値。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;http://unitsofmeasure.org&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetAge</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>単位体系における単位コード。min：minutes、h：hours、d：days、wk：weeks、mo：months、a：years</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;a&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetPeriod</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Preiod</td>
  <td class=xl73 width=359 style='width:269pt'>期間。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetPeriod</td>
  <td class=xl73 width=73 style='width:55pt'>start</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl73 width=359 style='width:269pt'>期間の開始日時</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetPeriod</td>
  <td class=xl73 width=73 style='width:55pt'>end</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl73 width=359 style='width:269pt'>期間の終了日時</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Range</td>
  <td class=xl73 width=359 style='width:269pt'>曖昧な時期を最小値と最大値とで記述する。以下の記述例は50歳台。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>SimpleQuantity</td>
  <td class=xl73 width=359 style='width:269pt'>下限値表現</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>value</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>decimal</td>
  <td class=xl73 width=359 style='width:269pt'>年齢の値。月齢や週齢なども可能</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;50&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>unit</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>単位表現</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;歳&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl73 width=359 style='width:269pt'>単位体系UCUMコード体系。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;http://unitsofmeasure.org&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>low</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>単位体系における単位コード。min：minutes、h：hours、d：days、wk：weeks、mo：months、a：years</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;a&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>SimpleQuantity</td>
  <td class=xl73 width=359 style='width:269pt'>　</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>value</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>decimal</td>
  <td class=xl73 width=359 style='width:269pt'>年齢の値。月齢や週齢なども可能</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;59&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>unit</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>単位表現</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;歳&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl73 width=359 style='width:269pt'>単位体系UCUMコード体系。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;http://unitsofmeasure.org&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl72 width=97 style='height:30.0pt;width:73pt'>onsetRange</td>
  <td class=xl73 width=73 style='width:55pt'>high</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl73 width=359 style='width:269pt'>単位体系における単位コード。min：minutes、h：hours、d：days、wk：weeks、mo：months、a：years</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;a&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>onsetString</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl81 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>string</td>
  <td class=xl73 width=359 style='width:269pt'>｀</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;70歳台&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=260 style='height:195.0pt'>
  <td height=260 class=xl72 width=97 style='height:195.0pt;width:73pt'>（abatement）</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl89 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>（dateTime、Age、Period、Range、string）のいずれかの型をとる。</td>
  <td class=xl73 width=359 style='width:269pt'>この傷病名情報による<ruby>患者<span
  style='display:none'><rt>カンジャ </rt></span></ruby><ruby>状態<span
  style='display:none'><rt>ジョウタイ </rt></span></ruby>が<ruby>終了<span
  style='display:none'><rt>シュウリョウ </rt></span></ruby>したと<ruby>同定<span
  style='display:none'><rt>ドウテイ </rt></span></ruby>された時期。患者にこの<ruby>傷病<span
  style='display:none'><rt>ショウビョウ </rt></span></ruby>のある<ruby>状態<span
  style='display:none'><rt>ジョウタイ </rt></span></ruby>が<ruby>終了<span
  style='display:none'><rt>シュウリョウ </rt></span></ruby>した時期、あるいはなんらかのエビデンスによりこの<ruby>傷病<span
  style='display:none'><rt>ショウビョウ </rt></span></ruby>のある<ruby>状態<span
  style='display:none'><rt>ジョウタイ </rt></span></ruby>が<ruby>改善<span
  style='display:none'><rt>カイゼン </rt></span></ruby>もしくはある<ruby>状態<span
  style='display:none'><rt>ジョウタイ </rt></span></ruby>になったと確認できた時期を記述する。<ruby><font
  class="font12">電子</font><span style='display:none'><rt>デンシ </rt></span></ruby><font
  class="font12">カルテシステムの</font><ruby><font class="font12">病名</font><span
  style='display:none'><rt>ビョウメイ </rt></span></ruby><ruby><font class="font12">終了</font><span
  style='display:none'><rt>シュウリョウ </rt></span></ruby><ruby><font class="font12">日</font><span
  style='display:none'><rt>カイシビ </rt></span></ruby><font class="font12">をdateTime</font><ruby><font
  class="font12">型</font><span style='display:none'><rt>ガタ </rt></span></ruby><font
  class="font12">で</font><ruby><font class="font12">記述</font><span
  style='display:none'><rt>キジュツ </rt></span></ruby><font class="font12">するのが</font><ruby><font
  class="font12">一般的</font><span style='display:none'><rt>イッパンテキ </rt></span></ruby><font
  class="font12">な</font><ruby><font class="font12">方法</font><span
  style='display:none'><rt>ホウホウ </rt></span></ruby><font class="font12">である。電子カルテ共有サービスにおける6情報のひとつとして本リソースが記述される場合には、病名</font><ruby><font
  class="font12">終了</font><span style='display:none'><rt>シュウリョウ </rt></span></ruby><font
  class="font12">日をdateTime型で記述する。この</font><ruby><font class="font12">終了日</font><span
  style='display:none'><rt>シュウリョウヒ </rt></span></ruby><font class="font12">における</font><ruby><font
  class="font12">転帰</font><span style='display:none'><rt>テンキ </rt></span></ruby><ruby><font
  class="font12">情報</font><span style='display:none'><rt>ジョウホウ </rt></span></ruby><font
  class="font12">をclinicalStatus</font><ruby><font class="font12">要素</font><span
  style='display:none'><rt>ヨウソ </rt></span></ruby><font class="font12">に</font><ruby><font
  class="font12">記述</font><span style='display:none'><rt>キジュツ </rt></span></ruby><font
  class="font12">すること。</font><ruby><font class="font12">通常</font><span
  style='display:none'><rt>ツウジョウ </rt></span></ruby><font class="font12">は、この</font><ruby><font
  class="font12">日付</font><span style='display:none'><rt>ヒヅケ </rt></span></ruby><font
  class="font12">がある</font><ruby><font class="font12">場合</font><span
  style='display:none'><rt>バアイ </rt></span></ruby><font class="font12">のclinicalStatus</font><ruby><font
  class="font12">要素</font><span style='display:none'><rt>ヨウソ </rt></span></ruby><font
  class="font12">は&quot;active&quot;</font><ruby><font class="font12">以外</font><span
  style='display:none'><rt>イガイ </rt></span></ruby><font class="font12">の</font><ruby><font
  class="font12">値</font><span style='display:none'><rt>アタイ </rt></span></ruby><font
  class="font12">となるが、</font><ruby><font class="font12">例外的</font><span
  style='display:none'><rt>レイガイテキ </rt></span></ruby><font class="font12">に&quot;active&quot;でもよい。</font><br>
    abatement要素は記述しないで、直接abatementDateTime要素などabatementXXXXの要素により記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl76 width=195 style='width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl72 width=97 style='height:90.0pt;width:73pt'>abatementDateTime</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl89 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl73 width=359 style='width:269pt'>一時点の記述方式：<br>
   
  日付または日時。年や年月だけでもよい。例：2018,1973-06,1905-08-23,2015-02-07T13:28:17+09:00。<br>
    時刻に24:00の使用はできない。<br>
    dateTime以外の方法で記述したい場合には、oncet要素の説明を参照のこと。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;1989-08-23&quot;<br>
    </td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl72 width=97 style='height:20.0pt;width:73pt'>recordedDate</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl89 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>dateTime</td>
  <td class=xl90 width=359 style='border-top:none;width:269pt'>この状態が記録された日時。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>&quot;1989-08-23&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl72 width=97 style='height:60.0pt;width:73pt'>recorder</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl77 width=35 style='width:26pt'>0..1</td>
  <td class=xl73 width=87 style='width:65pt'>Reference(JP_Practitioner )</td>
  <td class=xl73 width=359 style='width:269pt'>この状態を記録した人情報への参照。医療者のContainedリソースへの参照を記述する。またはdisplay要素に文字列を記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>例示</td>
  <td class=xl76 width=195 style='width:146pt'>{<br>
    <span style='mso-spacerun:yes'>   </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;#practitioner20394&quot;<br>
    }</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl91 width=97 style='height:90.0pt;width:73pt'>asserter</td>
  <td class=xl92 width=73 style='width:55pt'>　</td>
  <td class=xl92 width=73 style='width:55pt'>　</td>
  <td class=xl92 width=73 style='width:55pt'>　</td>
  <td class=xl93 width=35 style='width:26pt'>0..1</td>
  <td class=xl92 width=87 style='width:65pt'>Reference(JP_Patient|
  JP_Practitioner| |RelatedPerson|)</td>
  <td class=xl92 width=359 style='width:269pt'>この状態があると確認（主張）した人情報への参照。医療者、患者本人の場合にはそれぞれのContainedリソースへの参照を記述する。またはdisplay要素に文字列を記述する。</td>
  <td class=xl92 width=36 style='width:27pt'>例示</td>
  <td class=xl94 width=195 style='width:146pt'>{<br>
    <span style='mso-spacerun:yes'>   </span>&quot;display&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;本人 の母 &quot;<br>
    }</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl98 align=left width=97 style='height:20.0pt;width:73pt'>stage</td>
  <td class=xl95 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=35 style='border-left:none;width:26pt'>0..*</td>
  <td class=xl95 width=87 style='border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-left:none;width:269pt'>この状態の臨床的ステージやグレード表現。</td>
  <td class=xl96 width=36 style='border-left:none;width:27pt'>　</td>
  <td class=xl97 width=195 style='border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='height:28.0pt'>
  <td rowspan=3 height=91 class=xl98 width=97 style='height:68.0pt;border-top:
  none;width:73pt'>　</td>
  <td rowspan=3 class=xl95 align=left width=73 style='border-top:none;
  width:55pt'>summary</td>
  <td rowspan=3 class=xl95 width=73 style='border-top:none;width:55pt'>　</td>
  <td rowspan=3 class=xl95 width=73 style='border-top:none;width:55pt'>　</td>
  <td rowspan=3 class=xl95 align=left width=35 style='border-top:none;
  width:26pt'>0..1</td>
  <td rowspan=3 class=xl95 align=left width=87 style='border-top:none;
  width:65pt'>CodeableConcept</td>
  <td rowspan=3 class=xl95 align=left width=359 style='border-top:none;
  width:269pt'>system<font class="font10">値は</font><font class="font16">MEDIS</font><font
  class="font10">標準病名マスター修飾語交換用コードを使用する場合の例示。</font><font class="font16">&quot;1244&quot;</font><font
  class="font10">は、</font><font class="font16">MEDIS</font><font class="font10">標準病名マスター修飾語交換用コードで</font><font
  class="font16">&quot;</font><font class="font10">第１期</font><font
  class="font16">&quot;</font><font class="font10">のコード。</font><font
  class="font16">&quot;</font><font class="font10">第１期</font><font
  class="font16">&quot;</font><font class="font10">はそのテキスト記述の例。</font></td>
  <td rowspan=3 class=xl447 align=left width=36 style='border-bottom:.5pt solid black;
  border-top:none;width:27pt'>例示</td>
  <td class=xl97 align=left width=195 style='border-top:none;border-left:none;
  width:146pt'>&quot;http://medis.or.jp/CodeSystem/master-disease-modExCode&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl97 align=left width=195 style='height:20.0pt;
  border-top:none;border-left:none;width:146pt'>&quot;32GR&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl97 align=left width=195 style='height:20.0pt;
  border-top:none;border-left:none;width:146pt'>&quot;<font class="font10">第１期</font><font
  class="font16">&quot;</font></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=112 style='height:84.0pt'>
  <td height=112 class=xl98 width=97 style='height:84.0pt;border-top:none;
  width:73pt'>　</td>
  <td class=xl95 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>assessment</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl95 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Reference(ClinicalImpression | DiagnosticReport | Observation)</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>ステージ情報の根拠となる診断レポートや検査結果、または臨床評価情報への参照する。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl97 align=left width=195 style='border-top:none;border-left:none;
  width:146pt'>&quot;urn:...&quot;</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl98 width=97 style='height:45.0pt;border-top:none;
  width:73pt'>　</td>
  <td class=xl95 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>type</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl95 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>ステージ分類の種類。病理学的分類、臨床分類、<font class="font16">TNM</font><font
  class="font10">肺癌分類、など。当面コーディングをせず、text記述だけ必要に応じて行う。</font></td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl97 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl98 align=left width=97 style='height:30.0pt;border-top:
  none;width:73pt'>evidence</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl95 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>状態を確認または反駁した証拠など、状態の検証ステータスの基礎となる裏付けとなる証拠<font class="font16">/</font><font
  class="font10">兆候。</font></td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl97 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=96 style='height:72.0pt'>
  <td height=96 class=xl98 width=97 style='height:72.0pt;border-top:none;
  width:73pt'>　</td>
  <td class=xl95 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl95 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>状態を裏付ける症状や所見。system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。&quot;BOEF&quot;は、MEDIS標準病名マスター病名交換用コードで&quot;持続腹痛&quot;のコード。&quot;持続腹痛&quot;はそのテキスト記述の例。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl97 align=left width=195 style='border-top:none;border-left:none;
  width:146pt'>&quot;http://medis.or.jp/CodeSystem/master-disease-exCode&quot;<br>
    &quot;B0EF&quot;<br>
    &quot;<font class="font18">持続腹痛</font><font class="font16">&quot;<br>
    &quot;</font><font class="font18">長く続く腹部の痛み</font><font class="font16">&quot;</font></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl98 align=left width=97 style='height:20.0pt;border-top:
  none;width:73pt'>note</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl95 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>患者状態に関する追加的な情報</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl97 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl98 width=97 style='height:20.0pt;border-top:none;
  width:73pt'>　</td>
  <td class=xl95 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>author</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl95 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl95 width=359 style='border-top:none;border-left:none;width:269pt'>　</td>
  <td class=xl95 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl97 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=37 style='height:28.0pt'>
  <td height=37 class=xl98 width=97 style='height:28.0pt;border-top:none;
  width:73pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>authorString</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl95 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>記載者氏名などの文字列。必ずしも氏名でなくてもよい。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl97 align=left width=195 style='border-top:none;border-left:none;
  width:146pt'>&quot;<font class="font10">病理検査担当者</font><font class="font16">&quot;</font></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl98 width=97 style='height:20.0pt;border-top:none;
  width:73pt'>　</td>
  <td class=xl95 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>time</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl95 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl95 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>この追加的な情報が作成された日時。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl97 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl99 width=97 style='height:31.0pt;border-top:none;
  width:73pt'>　</td>
  <td class=xl100 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>text</td>
  <td class=xl100 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl100 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl100 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl100 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>markdown</td>
  <td class=xl101 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>追加的な情報の内容。<font class="font16">markdown</font><font
  class="font10">形式のテキストが使用できる。データとして</font><font class="font16">1M</font><font
  class="font10">バイト以内であること。</font></td>
  <td class=xl101 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl102 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>

</table>

</div>


<button type="button" onclick="details_open(false,'TableDetails','mrc')">閉じる</button>
</details>

<br>

## プロファイル
{% include markdown-link-references.md %}