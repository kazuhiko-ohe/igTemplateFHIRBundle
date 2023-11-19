
# eCS 診療情報・サマリー汎用：【入退院／受診歴情報】

## 背景および想定シナリオ
このプロファイルは、６情報をはじめ、診療６情報・サマリー用に患者の入退院や外来受診の情報を記述するためのものである。
電子カルテ情報共有サービスに送信する情報に含まれる場合、６情報として送信されるリソースのいずれかのContainedリソースとして記述するか、２文書（診療情報提供書や退院時サマリー）のBundleリソースのentryに記述することを想定している。

## スコープ
### 対象
　患者の入退院や外来受診の情報

## プロファイル定義における必須要素と推奨要素
  - 必須要素は、その要素が必ず１個以上出現しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。
  - 推奨要素は、送信側はシステムに値が存在しているなら、値を格納した要素が必ず１個以上出現しなければならず、受信側は必ずその値を格納しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。

### 必須要素
  - resourceType : リソースタイプ "Encounter"
  - meta.profile : 電子カルテ情報共有サービスでは必須
  - status : この情報のステータス("finished")
  - class : 入院中、外来

### 条件により必須
  - reasonCode : 診療情報提供書の場合に必須。入院時主訴や情報提供理由。

### 推奨要素
  - 特記なし。

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


<h3>表 「Encounter」</h3>
<button id="mrc" type="button" onclick="details_open(true,'TableDetails','mrc')">表「Encounter」開く</button>
<details id="TableDetails">
<button type="button" onclick="details_open(false,'TableDetails', 'mrc')">閉じる</button>
<summary></summary>


<div id="Table_18042" class="htmlTable" align=center x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=1038 style='border-collapse:
 collapse;table-layout:fixed;width:778pt'>
 <col class=xl325 width=107 style='mso-width-source:userset;mso-width-alt:2925;
 width:80pt'>
 <col class=xl325 width=73 span=3 style='mso-width-source:userset;mso-width-alt:
 2011;width:55pt'>
 <col class=xl325 width=35 style='mso-width-source:userset;mso-width-alt:950;
 width:26pt'>
 <col class=xl325 width=87 style='mso-width-source:userset;mso-width-alt:2377;
 width:65pt'>
 <col class=xl325 width=359 style='mso-width-source:userset;mso-width-alt:9837;
 width:269pt'>
 <col class=xl325 width=36 style='mso-width-source:userset;mso-width-alt:987;
 width:27pt'>
 <col class=xl331 width=195 style='mso-width-source:userset;mso-width-alt:5339;
 width:146pt'>
 <tr height=68 style='mso-height-source:userset;height:51.0pt'>
  <td colspan=9 height=68 class=xl456 align=left width=1038 style='height:51.0pt;
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
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl68 width=107 style='height:75.0pt;border-top:none;
  width:80pt'>要素Lv1</td>
  <td class=xl315 width=73 style='border-top:none;border-left:none;width:55pt'>要素Lv2</td>
  <td class=xl315 width=73 style='border-top:none;border-left:none;width:55pt'>要素Lv3</td>
  <td class=xl315 width=73 style='border-top:none;border-left:none;width:55pt'>要素Lv4</td>
  <td class=xl316 width=35 style='border-top:none;border-left:none;width:26pt'>多重度</td>
  <td class=xl315 width=87 style='border-top:none;border-left:none;width:65pt'>型</td>
  <td class=xl315 width=359 style='border-top:none;border-left:none;width:269pt'>説明</td>
  <td class=xl315 width=36 style='border-top:none;border-left:none;width:27pt'><ruby>固定値<span
  style='display:none'><rt class=font7>コテイチ</rt></span></ruby> <br>
    <ruby>／<span style='display:none'><rt class=font7>レイジ</rt></span></ruby> <ruby>例<span
  style='display:none'><rt class=font7>ジ</rt></span></ruby> 示</td>
  <td class=xl317 width=195 style='border-top:none;border-left:none;width:146pt'><ruby>固定値<span
  style='display:none'><rt class=font7>コテイチ</rt></span></ruby> または<ruby>例示<span
  style='display:none'><rt class=font7>レイジ</rt></span></ruby></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl274 width=107 style='height:30.0pt;border-top:none;
  width:80pt'>resourceType</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl318 width=35 style='border-top:none;border-left:none;width:26pt'>1..1</td>
  <td class=xl282 width=87 style='border-top:none;border-left:none;width:65pt'>string</td>
  <td class=xl319 width=359 style='border-top:none;border-left:none;width:269pt'>Encounterリソースであることを示す。</td>
  <td class=xl282 width=36 style='border-top:none;border-left:none;width:27pt'>固定値</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;Encounter&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl274 width=107 style='height:15.0pt;border-top:none;
  width:80pt'>meta</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl321 width=35 style='border-top:none;border-left:none;width:26pt'>0..1</td>
  <td class=xl282 width=87 style='border-top:none;border-left:none;width:65pt'>Meta</td>
  <td class=xl282 width=359 style='border-top:none;border-left:none;width:269pt'>　</td>
  <td class=xl282 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=340 style='height:255.0pt'>
  <td height=340 class=xl274 width=107 style='height:255.0pt;border-top:none;
  width:80pt'>meta</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>lastUpdated</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl321 width=35 style='border-top:none;border-left:none;width:26pt'>0..1</td>
  <td class=xl282 width=87 style='border-top:none;border-left:none;width:65pt'>instant</td>
  <td class=xl282 width=359 style='border-top:none;border-left:none;width:269pt'>最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz<br>
   
  この要素は、このリソースのデータを取り込んで蓄積していたシステムが、このリソースになんらかの変更があった可能性があった日時を取得し、このデータを再取り込みする必要性の判断をするために使われる。<ruby>本要素<span
  style='display:none'><rt>ホンヨウソ </rt></span></ruby>に前回取り込んだ時点より後の日時が設定されている場合には、なんらかの変更があった可能性がある（変更がない場合もある）ものとして判断される。したがって、内容になんらかの変更があった場合、またはこのリソースのデータが初めて作成された場合には、その時点以降の日時（たとえば、このリソースのデータを作成した日時）を設定しなければならない。内容の変更がない場合でも、このリソースのデータが作り直された場合や単に複写された場合にその日時を設定しなおしてもよい。ただし、内容に変更がないのであれば、日時を変更しなくてもよい。また、この要素の変更とmeta.versionIdの変更とは、必ずしも連動しないことがある。</td>
  <td class=xl282 width=36 style='border-top:none;border-left:none;width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;2015-02-07T13:28:17.239+09:00&quot;</td>
 </tr>
 <tr height=160 style='height:120.0pt'>
  <td height=160 class=xl274 width=107 style='height:120.0pt;border-top:none;
  width:80pt'>meta</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>profile[+]</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl322 width=35 style='border-top:none;border-left:none;width:26pt'>0..*</td>
  <td class=xl282 width=87 style='border-top:none;border-left:none;width:65pt'>canonical(StructureDefinition)</td>
  <td class=xl323 width=359 style='border-top:none;border-left:none;width:269pt'>準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。<br>
    http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Encounter_eCS　を設定する。<br>
    <font class="font12">電子カルテ情報共有サービスに本リソースデータを送信する場合には、http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Encounter_eCS　を設定すること。</font></td>
  <td class=xl282 width=36 style='border-top:none;border-left:none;width:27pt'>固定値</td>
  <td class=xl324 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Encounter_eCS&quot;<br>
    または<br>
   
  &quot;http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Encounter_eCS&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>identifier[*]</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1*</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Identifier</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>この医療機関における入院管理番号、あるいは<ruby>受診<span style='display:none'><rt>ジュシｎ
  </rt></span></ruby><ruby>歴<span style='display:none'><rt>レキ </rt></span></ruby><ruby>管理<span
  style='display:none'><rt>カンリ </rt></span></ruby><ruby>番号<span
  style='display:none'><rt>バンゴウ </rt></span></ruby>。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl326 align=left width=107 style='height:45.0pt;
  border-top:none;width:80pt'>identifier[+]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>付番方法については「識別子名前空間一覧」を参照。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>固定値</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>identifier[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>value</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入院管理番号、受診歴管理番号の文字列。値は例示。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイジ </rt></span></ruby>示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;1311234567-2020-00123456&quot;</td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl326 align=left width=107 style='height:45.0pt;
  border-top:none;width:80pt'>status</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>code</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>この情報のステータス。EncounterStatus(http://
  hl7.org/fhir/ValueSet/encouner-status)より&quot;finished&quot;を指定する。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>固定値</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;finished&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>class</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Coding</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>入院<span style='display:none'><rt>ニュウイｎ </rt></span></ruby>または受診イベントの分類<ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl326 align=left width=107 style='height:45.0pt;
  border-top:none;width:80pt'>class</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>コード体系v3.ActEncounterCodeを識別するURI<ruby>。<span style='display:
  none'><rt>。</rt></span></ruby></td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>固定値</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://terminology.
  hl7.org/CodeSystem/v3-ActCode&quot;</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl326 align=left width=107 style='height:60.0pt;
  border-top:none;width:80pt'>class</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>code</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>「IMP:入院(inpatient
  Encounter)」または、「AMB:外来受診(ambulatory)」。退院時サマリーで退院時を記述する場合には&quot;IMP&quot;を使用する。INPではなくIMPであることに注意。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>“IMP&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>class</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>display</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl96 width=359 style='border-top:none;border-left:none;width:269pt'>　</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>“入院”
  または”外来”</td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl326 align=left width=107 style='height:45.0pt;
  border-top:none;width:80pt'>classHistory[*]</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>この入院期間までの外来受診履歴や入院履歴を記述したい場合にここに繰り返しで記述する。紹介先受診情報では不要。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=45 style='mso-height-source:userset;height:34.0pt'>
  <td height=45 class=xl326 align=left width=107 style='height:34.0pt;
  border-top:none;width:80pt'>classHistory[+]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>class</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Coding</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>受診イベントの分類</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl326 align=left width=107 style='height:45.0pt;
  border-top:none;width:80pt'>classHistory[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>class</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>コード体系v3.ActEncounterCodeを識別するURI。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>固定値</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://terminology.
  hl7.org/CodeSystem/v3-ActCode&quot;</td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl326 align=left width=107 style='height:75.0pt;
  border-top:none;width:80pt'>classHistory[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>class</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>「IMP:入院(inpatient Encounter)」または、「AMB:外来受診(ambulatory)」<br>
    退院時サマリーで退院時を記述する場合には&quot;IMP&quot;を使用する。<br>
    * INPではなくIMPであることに注意。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>“IMP”
  または”AMB”</td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.0pt'>
  <td height=35 class=xl326 align=left width=107 style='height:26.0pt;
  border-top:none;width:80pt'>classHistory[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>class</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>display</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 width=359 style='border-top:none;border-left:none;width:269pt'>　</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;入院&quot;または&quot;外来&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>classHistory[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>period</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入院期間を表す必要がある場合には必須。外来では必要な場合を除き省略可。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl326 align=left width=107 style='height:45.0pt;
  border-top:none;width:80pt'>classHistory[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>period</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>start</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>上記イベントの開始日時。入院の場合には入院日、外来受診の場合には診療情報提供書の記載基準となった外来受診日に相当するが、period要素自体は省略できる。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;2020-08-21&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>classHistory[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>period</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>end</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>上記イベントの終了日時。入院の場合には退院日、外来受診の場合には不要。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;2020-08-24&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>period</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Priod</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入院期間、<ruby>受診<span style='display:none'><rt>ジュシｎ </rt></span></ruby>イベント<ruby>期間<span
  style='display:none'><rt>キカｎ </rt></span></ruby>。退院時サマリーでは必須。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>period</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>start</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>この入院の入院日時</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;2020-09-01&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>period</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>end</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>この入院の退院日時</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;2020-09-18&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>length</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Duration</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>この入院の在院日数</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>length</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>value</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>decimal</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>在院日数。値は例示。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>7</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>length</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>unit</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>在院日数の単位文字列。固定値。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;日&quot;</td>
 </tr>
 <tr height=32 style='mso-height-source:userset;height:24.0pt'>
  <td height=32 class=xl326 align=left width=107 style='height:24.0pt;
  border-top:none;width:80pt'>length</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>単位コードUCUMのコード体系を識別するURI。固定値。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://unitsofmeasure.org&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>length</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>code</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>日を意味する単位コード「d」。固定値。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;d&quot;</td>
 </tr>
 <tr height=180 style='height:135.0pt'>
  <td height=180 class=xl326 align=left width=107 style='height:135.0pt;
  border-top:none;width:80pt'>reasonCode[*]</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl328 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入院時主訴・入院理由。<br>
    診療情報提供書の場合、その理由（主訴・目的）<br>
   
  コードで記述できる場合にそのコード記述。system値はMEDIS標準病名マスター病名交換用コードを使用する場合の例示。&quot;BOEF&quot;は、MEDIS標準病名マスター病名交換用コードで&quot;持続腹痛&quot;のコード。&quot;持続腹痛&quot;は、入院時主訴・入院理由のテキスト記述。<br>
    診療情報提供書の場合、text要素で理由を自由記述すること。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイジ </rt></span></ruby>示</td>
  <td class=xl329 width=195 style='border-top:none;border-left:none;width:146pt'><a
  href="http://medis.or.jp/CodeSystem/master-disease-exCode" target="_parent"><span
  style='font-family:"ＭＳ 明朝";mso-generic-font-family:auto;mso-font-charset:
  128'>http://medis.or.jp/CodeSystem/master-disease-exCode</span></a></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>diagnosis[*]</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入院期間中の診断情報。診療情報提供書では不要。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>diagnosis[+]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>condition</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Reference(Condition)</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>患者状態（病態・疾患名・症状）への参照</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl326 align=left width=107 style='height:90.0pt;
  border-top:none;width:80pt'>diagnosis[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>use</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>診断の位置付け区分。<br>
   
  （DiagnosisRole）。これにより、入院時診断、退院時診断、などが区別される。入院中のすべての診断病名にこのコードが必須ではないが、少なくともAD:入院時診断、DD:退院時診断、CC:主訴、についてはそれぞれ1個以上はこのコードがついている必要がある。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>diagnosis[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>use</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding[*]</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..*</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>同じ診断名に複数の診断位置付けコードをつけることができる。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>diagnosis[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>use</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding[+]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>診断位置付けValueSet（FHIR準拠の場合のコード表）</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;<font
  class="font45">http://terminology.hl7.org/CodeSystem/diagnosis-role</font><font
  class="font10">&quot;</font></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl326 align=left width=107 style='height:45.0pt;
  border-top:none;width:80pt'>diagnosis[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>use</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>AD:入院時診断、DD:退院時診断、CC:主訴、CM:併存症診断、pre-op:術前診断、post-op:術後診断、billing:会計請求診断（FHIR準拠の場合のコード表）。値は例示。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;DD&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>diagnosis[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>use</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>display</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>コードに対する名称。値は例示。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;退院時診断&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>diagnosis[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>rank</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>positiveInt</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>同じ診断位置付け内での順序数値（1から順）。順序は医療者の意図によりつけてよい。値は例示。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>1</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>hospitalization</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>BackboneElement</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入退院詳細情報。診療情報提供書では不要。退院時サマリーでは必須。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl326 align=left width=107 style='height:60.0pt;
  border-top:none;width:80pt'>hospitalization</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>origin</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Reference(Location | Organization)</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入院前の所在場所または施設への参照。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=180 style='height:135.0pt'>
  <td height=180 class=xl326 align=left width=107 style='height:135.0pt;
  border-top:none;width:80pt'>hospitalization</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>admitSource</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入院経路を表すコード情報。値は例示。system<ruby>値<span style='display:none'><rt>チ </rt></span></ruby>は<ruby>固定値<span
  style='display:none'><rt>コテイチ </rt></span></ruby>。<br>
    （出典：厚労省DPC導入影響評価調査）<br>
    0 院内の他病棟からの転棟<br>
    1 家庭からの入院<br>
    4 他の病院・診療所の病棟からの転院<br>
    5 介護施設・福祉施設に入所中<br>
    8 院内で出生<br>
    9 その他</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>固定値<span style='display:none'><rt>コテイチ </rt></span></ruby></td>
  <td class=xl329 width=195 style='border-top:none;border-left:none;width:146pt'><a
  href="http://jpfhir.jp/fhir/eCS/CodeSystem/admit-Source" target="_parent"><span
  style='font-family:"ＭＳ 明朝";mso-generic-font-family:auto;mso-font-charset:
  128'>http://jpfhir.jp/fhir/eCS/CodeSystem/admit-Source</span></a></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>hospitalization</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>reAdmission</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>再入院の場合の再入院種類。当面未使用</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>hospitalization</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>specialCourtesy</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>特別配慮を要する入院。VIP、職員、医療専門職といった区分。当面未使用</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>hospitalization</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>SpecialArrangement</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>特別調整を要する入院。車椅子、増設ベッド、通訳、付き添い、盲導犬等の必要性。当面未使用</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl326 align=left width=107 style='height:60.0pt;
  border-top:none;width:80pt'>hospitalization</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>destination</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Reference(Location | Organization)</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>退院先場所または施設への参照。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=180 style='height:135.0pt'>
  <td height=180 class=xl326 align=left width=107 style='height:135.0pt;
  border-top:none;width:80pt'>hospitalization</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>dischargeDisposition</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>退院時転帰コード情報。コード表は暫定（出典：厚労省DPC導入影響評価調査）<br>
    1:傷病が治癒・軽快<br>
    3:傷病（白血病、潰瘍性大腸炎、クローン病等）が寛解<br>
    4:傷病が不変<br>
    5:傷病が増悪<br>
    6:傷病による死亡<br>
    7:傷病以外による死亡<br>
    9:その他（検査入院,正常分娩及び人間ドック含む）</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl329 width=195 style='border-top:none;border-left:none;width:146pt'><a
  href="http://jpfhir.jp/fhir/eCS/CodeSystem/discharge-disposition"
  target="_parent"><span style='font-family:"ＭＳ 明朝";mso-generic-font-family:
  auto;mso-font-charset:128'>http://jpfhir.jp/fhir/eCS/CodeSystem/discharge-disposition</span></a></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>location[*]</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>BackboneElement</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入院中の所在場所（病棟病室など）。診療情報提供書では不要。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>location[+]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>location</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Reference(Location)</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>入院中の所在場所（病棟病室など）への参照</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>location[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>status</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>code</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>planned | active | reserved | completed のいずれかであるが、退院時サマリーの<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>には、&quot;completed&quot;。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイジ </rt></span></ruby>示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;completed&quot;</td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl326 align=left width=107 style='height:90.0pt;
  border-top:none;width:80pt'>location[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>physicalType</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>所在場所のタイプ。system<ruby>値<span style='display:none'><rt>チ </rt></span></ruby>は<ruby>固定値<span
  style='display:none'><rt>コテイチ </rt></span></ruby>。<br>
    bu: 建物<br>
    wa: 病棟<br>
    ro: 病室<br>
    bd: ベッド<br>
    area: エリア　など。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>固定値<span style='display:none'><rt class=font7>コテイチ</rt></span></ruby>
  <br>
    </td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://terminology.hl7.org/CodeSystem/location-physical-type&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>location[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>preiod</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Period</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>所在期間</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl326 align=left width=107 style='height:15.0pt;
  border-top:none;width:80pt'>location[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>preiod</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>start</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>所在期間の開始日時</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl326 align=left width=107 style='height:16.0pt;
  border-top:none;width:80pt'>location[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>preiod</td>
  <td class=xl101 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>end</td>
  <td class=xl101 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl101 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl101 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl101 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>所在期間の終了日時</td>
  <td class=xl101 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl330 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>

</table>

</div>

<button type="button" onclick="details_open(false,'TableDetails','mrc')">閉じる</button>
</details>

<br>

## プロファイル


{% include markdown-link-references.md %}