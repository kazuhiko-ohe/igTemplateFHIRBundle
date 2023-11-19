
# eCS 診療情報・サマリー汎用：【検体検査結果・感染症情報】

## 背景および想定シナリオ
このプロファイルは、６情報をはじめ、診療情報提供書や退院時サマリーなどの2文書や、診療６情報・サマリー用に「検体検査結果（感染症情報を含む）」を記述するためのものである。
電子カルテ情報共有サービスに送信する情報に含まれる場合には、[CLINS電子カルテ情報共有サービス用: 【検体検査結果／感染症情報　JP_Observation_LabResult_CLINS_eCS][JP_Observation_LabResult_CLINS_eCS]　を使用すること。】


## スコープ
### 対象
以下のような検体検査結果の情報。
 - 血液検体検査結果
 - 尿検体検査結果
 - 生体から取得したその他の検体材料の検査結果

### 対象としないこと
 - 細菌検査結果（塗抹、培養、感受性等）は含まない。
 - 病理検体検査結果（細胞診、組織診）は含まない。

## プロファイル定義における必須要素と推奨要素
  - MustSupport要素は、送信側（データ作成側）にその情報があれば特段の理由がない限り、値をなんらかの方法で設定し、送信しなければならない項目。受信側では値が設定されているのであれば、格納しなければならない（破棄してはならない）。
  - 必須要素は、その要素が必ず１個以上出現しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。
  - 推奨要素は、送信側はシステムに値が存在しているなら、値を格納した要素が必ず１個以上出現しなければならず、受信側は必ずその値を格納しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。

### 必須要素
  - resourceType : リソースタイプ "Observation"
  - meta.lastUpdated : 最終更新日時
  - meta.profile : 電子カルテ情報共有サービスでは必須
  - extension (InstitutionNumber) : 電子カルテ情報共有サービスでは必須。ｓ医療機関番号１０桁
  - identifier : インスタンス識別ID
  - status : 検査・観察のステータス
  - code : 検査・観察の項目コード
  - subject : 患者のFHIRリソースへの参照。contained (JP_Patient)リソースへのリテラル参照を設定する。
  - effectiveDateTime : 検体採取日または検体採取日時
  - specimen :　検体材料のFHIRリソースへの参照。 contained (JP_Patient)リソースへのリテラル参照を設定する。

### 条件により必須
  - meta.tag : 電子カルテ情報共有サービスで長期保存情報フラグの設定する場合に必須。
  - meta.tag : ３文書６情報の作成で未説明フラグを設定する場合に必須。
  - value[x] : 検査結果や観察結果。検査項目がバッテリー項目（グループ項目）の場合や理由があって検査値が得られなかった場合を除き必須。
  - dataAbsentReason : 検査値が得られなかった理由。検査値が得られなかった場合には必須。
  - hasMember : このグループに含まれる個々の検査の参照。この検査が複数の検査項目をグループ化したパネル検査もしくはバッテリー検査の場合には必須。
  - component : １回の検査・観察で同時に複数の検査結果が得られる場合には必須。

### 推奨要素
  - extension (Department) : 診療科情報
  - category : 検査結果カテゴリー。
  - encounter : アレルギー登録時の入院外来区分情報。
  - referenceRange : 基準値範囲。

### MustSupport要素
　- 必須要素、条件により必須要素、推奨要素は、自動的にMustSupport要素である。それ以外に以下の要素がMustSupport要素である。
  - note : 結果に対するコメントテキスト記述。
  - method : 検査手法の記述。

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

<h3>表「Observation_LabResult」</h3>
<button id="mrc" type="button" onclick="details_open(true,'TableDetails,'mrc')">表「Observation_LabResult」開く</button>
<details id="TableDetails">
<button type="button" onclick="details_open(false,'TableDetails, 'mrc')">閉じる</button>
<summary></summary>

<div id="Table_20456" class="htmlTable" align=center x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=1067 style='border-collapse:
 collapse;table-layout:fixed;width:800pt'>
 <col class=xl332 width=105 style='mso-width-source:userset;mso-width-alt:2889;
 width:79pt'>
 <col class=xl332 width=92 style='mso-width-source:userset;mso-width-alt:2523;
 width:69pt'>
 <col class=xl332 width=73 span=2 style='mso-width-source:userset;mso-width-alt:
 2011;width:55pt'>
 <col class=xl332 width=47 style='mso-width-source:userset;mso-width-alt:1280;
 width:35pt'>
 <col class=xl332 width=87 style='mso-width-source:userset;mso-width-alt:2377;
 width:65pt'>
 <col class=xl332 width=359 style='mso-width-source:userset;mso-width-alt:9837;
 width:269pt'>
 <col class=xl332 width=36 style='mso-width-source:userset;mso-width-alt:987;
 width:27pt'>
 <col class=xl332 width=195 style='mso-width-source:userset;mso-width-alt:5339;
 width:146pt'>
 <tr height=28 style='height:21.0pt'>
  <td colspan=9 height=28 class=xl451 align=left width=1067 style='height:21.0pt;
  width:800pt'><ruby>多重度<span style='display:none'><rt>タジュウド </rt></span></ruby>は、<ruby>親<span
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
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl333 align=left width=105 style='height:75.0pt;
  border-top:none;width:79pt'>要素<font class="font16">Lv1</font></td>
  <td class=xl334 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>要素<font class="font16">Lv2</font></td>
  <td class=xl334 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>要素<font class="font16">Lv3</font></td>
  <td class=xl334 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>要素<font class="font16">Lv4</font></td>
  <td class=xl463 width=47 style='border-top:none;border-left:none;width:35pt'>多重度</td>
  <td class=xl334 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>型</td>
  <td class=xl334 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>説明</td>
  <td class=xl257 width=36 style='border-top:none;border-left:none;width:27pt'>固定値
  <br>
    ／ 例 示</td>
  <td class=xl335 width=195 style='border-top:none;border-left:none;width:146pt'>値</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>resourceType</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl464 width=47 style='border-left:none;width:35pt'>1..1<ruby><font
  class="font23"><rt class=font23></rt></font></ruby></td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl338 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>Observation<font class="font10">リソースであることを示す</font><font
  class="font35">。</font></td>
  <td class=xl338 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;Observation&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>meta</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl275 width=47 style='width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Meta</td>
  <td class=xl337 width=359 style='border-top:none;border-left:none;width:269pt'>　</td>
  <td class=xl337 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=360 style='height:270.0pt'>
  <td height=360 class=xl336 width=105 style='height:270.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>lastUpdated</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl275 width=47 style='width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>instant</td>
  <td class=xl104 width=359 style='width:269pt'>最終更新日時。<font class="font16">YYYY-MM-DDThh:mm:ss.sss+zz:zz
  (</font><font class="font10">例</font><font class="font16">.
  2015-02-07T13:28:17.239+09:00)</font><font class="font10"><br>
   
  この要素は、このリソースのデータを取り込んで蓄積していたシステムが、このリソースになんらかの変更があった可能性があった日時を取得し、このデータを再取り込みする必要性の判断をするために使われる。本要素に前回取り込んだ時点より後の日時が設定されている場合には、なんらかの変更があった可能性がある（変更がない場合もある）ものとして判断される。したがって、内容になんらかの変更があった場合、またはこのリソースのデータが初めて作成された場合には、その時点以降の日時（たとえば、このリソースのデータを作成した日時）を設定しなければならない。内容の変更がない場合でも、このリソースのデータが作り直された場合や単に複写された場合にその日時を設定しなおしてもよい。ただし、内容に変更がないのであれば、日時を変更しなくてもよい。また、この要素の変更とmeta.versionIdの変更とは、必ずしも連動しないことがある。</font></td>
  <td class=xl340 width=36 style='width:27pt'>例示</td>
  <td class=xl341 width=195 style='width:146pt'>&quot;2015-02-07T13:28:17.239+09:00&quot;</td>
 </tr>
 <tr height=160 style='height:120.0pt'>
  <td height=160 class=xl342 width=105 style='height:120.0pt;width:79pt'>meta</td>
  <td class=xl104 width=92 style='width:69pt'>profile[+]</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl343 width=47 style='width:35pt'>0..*</td>
  <td class=xl104 width=87 style='width:65pt'>canonical(StructureDefinition)</td>
  <td class=xl344 width=359 style='width:269pt'>準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。<br>
   
  http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Observation_LabResult_eCS　を設定する。<br>
    <font class="font12">電子カルテ情報共有サービスに本リソースデータを送信する場合には、http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Observation_LabResult_eCS　を設定すること。</font></td>
  <td class=xl104 width=36 style='width:27pt'>固定値</td>
  <td class=xl345 width=195 style='width:146pt'>&quot;http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Observation_LabResult_eCS&quot;<br>
    または<br>
   
  &quot;http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Observation_LabResult_eCS&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl346 width=105 style='height:20.0pt;width:79pt'>meta</td>
  <td class=xl347 width=92 style='width:69pt'>tag[*]</td>
  <td class=xl347 width=73 style='width:55pt'>　</td>
  <td class=xl347 width=73 style='width:55pt'>　</td>
  <td class=xl348 width=47 style='width:35pt'>0..*</td>
  <td class=xl340 width=87 style='width:65pt'>Coding</td>
  <td class=xl340 width=359 style='width:269pt'><ruby>本リソースのタグ情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby></td>
  <td class=xl340 width=36 style='width:27pt'>　</td>
  <td class=xl341 width=195 style='width:146pt'>　</td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl346 width=105 style='height:45.0pt;width:79pt'>meta</td>
  <td class=xl347 width=92 style='width:69pt'>tag[+]</td>
  <td class=xl347 width=73 style='width:55pt'>system</td>
  <td class=xl347 width=73 style='width:55pt'>　</td>
  <td class=xl348 width=47 style='width:35pt'>1..1</td>
  <td class=xl340 width=87 style='width:65pt'>uri</td>
  <td class=xl349 width=359 style='width:269pt'>電子カルテ情報共有サービスで長期保存情報フラグの設定する場合に使用</td>
  <td class=xl340 width=36 style='width:27pt'>固定値</td>
  <td class=xl341 width=195 style='width:146pt'>&quot;http://jpfhir.jp/fhir/clins/CodeSystem/JP_ehrshrs_indication&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl350 width=105 style='height:30.0pt;width:79pt'>meta</td>
  <td class=xl351 width=92 style='width:69pt'>tag[=]</td>
  <td class=xl351 width=73 style='width:55pt'>code</td>
  <td class=xl351 width=73 style='width:55pt'>　</td>
  <td class=xl352 width=47 style='width:35pt'>1..1</td>
  <td class=xl353 width=87 style='width:65pt'>code</td>
  <td class=xl353 width=359 style='width:269pt'>長期保存情報フラグ</td>
  <td class=xl353 width=36 style='width:27pt'>固定値</td>
  <td class=xl354 width=195 style='width:146pt'>&quot;LTS&quot;</td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl355 width=105 style='height:90.0pt;width:79pt'>contained[+]</td>
  <td class=xl199 width=92 style='width:69pt'>　</td>
  <td class=xl199 width=73 style='width:55pt'>　</td>
  <td class=xl199 width=73 style='width:55pt'>　</td>
  <td class=xl199 width=47 style='width:35pt'>0..1*</td>
  <td class=xl199 width=87 style='width:65pt'>Resource(JP_Encounter )</td>
  <td class=xl199 width=359 style='width:269pt'>encounter要素から参照される場合には、そのJP_Encounterリソースの実体。JP_Encounterリソースにおける必要最小限の要素だけが含まれればよい。ここで埋め込まれるJP_Encounterリソースでは、Encounter.classにこの<ruby>検査<span
  style='display:none'><rt>ケンサ </rt></span></ruby>をオーダしたときの受診情報（入外区分など）を記述して使用する。</td>
  <td class=xl199 width=36 style='width:27pt'>　</td>
  <td class=xl356 width=195 style='width:146pt'>　</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl342 width=105 style='height:60.0pt;width:79pt'>contained[+]</td>
  <td class=xl104 width=92 style='width:69pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=47 style='width:35pt'>0..1*</td>
  <td class=xl104 width=87 style='width:65pt'>Resource(JP_Specimen )</td>
  <td class=xl104 width=359 style='width:269pt'>specimen要素(<ruby>検体<span
  style='display:none'><rt>ケンタイ </rt></span></ruby><ruby>材料<span
  style='display:none'><rt>ザイリョウ </rt></span></ruby><ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>bの<ruby>要素<span
  style='display:none'><rt>ヨウソ </rt></span></ruby>)から参照される場合には、そのJP_Specimenリソースの実体。JP_Specimenリソースにおける必要最小限の要素（type<ruby>要素<span
  style='display:none'><rt>ヨウソ </rt></span></ruby>にJLAC10<ruby>検体<span
  style='display:none'><rt>ケンタイ </rt></span></ruby><ruby>材料<span
  style='display:none'><rt>ザイリョウ </rt></span></ruby>コード<ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>を<ruby>設定<span
  style='display:none'><rt>セッテイ </rt></span></ruby>するなど）だけが含まれればよい。</td>
  <td class=xl104 width=36 style='width:27pt'>　</td>
  <td class=xl357 width=195 style='width:146pt'>　</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl342 width=105 style='height:60.0pt;width:79pt'>contained[+]</td>
  <td class=xl104 width=92 style='width:69pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=47 style='width:35pt'>0..1*</td>
  <td class=xl104 width=87 style='width:65pt'>Resource(JP_ServiceRequest )</td>
  <td class=xl104 width=359 style='width:269pt'>basedOn要素から<ruby>元<span
  style='display:none'><rt>モト </rt></span></ruby>のオーダ<ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>を<ruby>Se<span
  style='display:none'><rt>キジュツ </rt></span></ruby>rviceRequestとして記述してそれを参照する場合には、そのJP_ServiceRequestリソースの実体。JP_ServiceRequestリソースにおける必要最小限の要素だけが含まれればよい。</td>
  <td class=xl104 width=36 style='width:27pt'>　</td>
  <td class=xl357 width=195 style='width:146pt'>　</td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl358 align=left width=105 style='height:31.0pt;
  border-top:none;width:79pt'>extension[*]</td>
  <td class=xl359 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl359 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl359 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl360 width=47 style='border-top:none;border-left:none;width:35pt'>0..*</td>
  <td class=xl361 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl362 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>電子カルテ情報サービスでは、<ruby>作成<span style='display:none'><rt>サクセイ </rt></span></ruby><ruby>発行<span
  style='display:none'><rt>ハッコウ </rt></span></ruby>した<ruby>医療<span
  style='display:none'><rt>イリョウ </rt></span></ruby><ruby>機関<span
  style='display:none'><rt>キカｎ </rt></span></ruby><ruby>番号<span
  style='display:none'><rt>バンゴウ </rt></span></ruby>や<ruby>診療科<span
  style='display:none'><rt>シンリョウカ </rt></span></ruby><ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>を<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>する<ruby>拡張<span
  style='display:none'><rt>カクチョウ </rt></span></ruby>。</td>
  <td class=xl363 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl364 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl365 align=left width=105 style='height:20.0pt;
  width:79pt'>extension[+]</td>
  <td class=xl366 width=92 style='border-left:none;width:69pt'>　</td>
  <td class=xl366 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl366 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl367 width=47 style='border-left:none;width:35pt'>0..1</td>
  <td class=xl368 align=left width=87 style='border-left:none;width:65pt'>Extension</td>
  <td class=xl369 style='border-left:none'>　</td>
  <td class=xl370 width=36 style='border-left:none;width:27pt'>　</td>
  <td class=xl371 width=195 style='border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=140 style='height:105.0pt'>
  <td height=140 class=xl372 align=left width=105 style='height:105.0pt;
  width:79pt'>extension[=]</td>
  <td class=xl373 align=left width=92 style='border-left:none;width:69pt'>url</td>
  <td class=xl373 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl373 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl374 width=47 style='border-left:none;width:35pt'>1..1</td>
  <td class=xl375 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl376 align=left width=359 style='border-left:none;width:269pt'><ruby>本<span
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
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl377 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>extension[=]</td>
  <td class=xl378 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>valueIdentifier</td>
  <td class=xl378 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl378 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl379 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl380 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Identifier</td>
  <td class=xl381 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>医療<span style='display:none'><rt>イリョウ </rt></span></ruby><ruby>機関<span
  style='display:none'><rt>キカｎ </rt></span></ruby><ruby>識別<span
  style='display:none'><rt>シキベツ </rt></span></ruby><ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>。</td>
  <td class=xl382 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl383 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=84 style='height:63.0pt'>
  <td height=84 class=xl377 align=left width=105 style='height:63.0pt;
  border-top:none;width:79pt'>extension[=]</td>
  <td class=xl378 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>valueIdentifier</td>
  <td class=xl378 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl378 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl379 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl375 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl381 align=left width=359 style='border-top:none;border-left:none;
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
 </tr>
 <tr height=28 style='height:21.0pt'>
  <td height=28 class=xl384 align=left width=105 style='height:21.0pt;
  border-top:none;width:79pt'>extension[=]</td>
  <td class=xl385 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>valueIdentifier</td>
  <td class=xl385 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>value</td>
  <td class=xl385 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl386 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl387 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl388 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>医療機関１０桁番号。<span style='display:none'><rt>ケタ </rt></span></ruby></td>
  <td class=xl389 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl390 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;1318814790&quot;</td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl365 align=left width=105 style='height:45.0pt;
  border-top:none;width:79pt'>extension[+]</td>
  <td class=xl366 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl366 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl366 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl391 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl368 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Extension</td>
  <td class=xl392 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>本情報を作成発行した診療科または<ruby>作成<span style='display:none'><rt>サクセイ </rt></span></ruby><ruby>発行<span
  style='display:none'><rt>ハッコウ </rt></span></ruby>者の診療科情報を記述するために使用する拡張「eCS_Department」。</td>
  <td class=xl370 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl393 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=72 style='height:54.0pt'>
  <td height=72 class=xl372 align=left width=105 style='height:54.0pt;
  width:79pt'>extension[=]</td>
  <td class=xl373 align=left width=92 style='border-left:none;width:69pt'>url</td>
  <td class=xl373 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl373 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl394 width=47 style='border-left:none;width:35pt'>1..1</td>
  <td class=xl375 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl395 align=left width=359 style='border-left:none;width:269pt'>診療科情報を記述するために使用する拡張を識別するURL。</td>
  <td class=xl269 align=left width=36 style='border-left:none;width:27pt'><ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl279 width=195 style='border-left:none;width:146pt'><a
  href="http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_Department"
  target="_parent"><span style='font-size:10.0pt'>http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_Department</span></a></td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl377 align=left width=105 style='height:31.0pt;
  border-top:none;width:79pt'>extension[=]</td>
  <td class=xl378 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>valueCodeableConcept</td>
  <td class=xl378 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl378 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl396 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl380 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>診療科情報。</td>
  <td class=xl382 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=36 style='height:27.0pt'>
  <td height=36 class=xl377 align=left width=105 style='height:27.0pt;
  border-top:none;width:79pt'>extension[=]</td>
  <td class=xl378 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>valueCodeableConcept</td>
  <td class=xl378 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl378 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl396 width=47 style='border-top:none;border-left:none;width:35pt'>0..1*</td>
  <td class=xl380 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Coding</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>診療科のコード化記述。</td>
  <td class=xl134 width=36 style='border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=56 style='height:42.0pt'>
  <td height=56 class=xl377 align=left width=105 style='height:42.0pt;
  border-top:none;width:79pt'>extension[=]</td>
  <td class=xl378 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>valueCodeableConcept</td>
  <td class=xl378 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl378 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl396 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl375 align=left width=87 style='border-left:none;width:65pt'>uri</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JAMI 診療科コード表のURI。</td>
  <td class=xl134 align=left width=36 style='border-left:none;width:27pt'><ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment&quot;</td>
 </tr>
 <tr height=35 style='height:26.0pt'>
  <td height=35 class=xl377 align=left width=105 style='height:26.0pt;
  border-top:none;width:79pt'>extension[=]</td>
  <td class=xl378 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>valueCodeableConcept</td>
  <td class=xl378 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl378 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl396 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl380 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JAMI 診療科コード。2<ruby>桁<span style='display:none'><rt>ケタ </rt></span></ruby>またh3桁コード。</td>
  <td class=xl382 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;08&quot;</td>
 </tr>
 <tr height=35 style='height:26.0pt'>
  <td height=35 class=xl377 align=left width=105 style='height:26.0pt;
  border-top:none;width:79pt'>extension[=]</td>
  <td class=xl378 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>valueCodeableConcept</td>
  <td class=xl378 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>coding</td>
  <td class=xl378 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>display</td>
  <td class=xl396 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl380 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JAMI 診療科コードでのコードに対応する表示名。</td>
  <td class=xl382 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;<ruby>循環器科<span
  style='display:none'><rt>ジュンカンキカ </rt></span></ruby>&quot;</td>
 </tr>
 <tr height=41 style='height:31.0pt'>
  <td height=41 class=xl384 align=left width=105 style='height:31.0pt;
  border-top:none;width:79pt'>extension[=]</td>
  <td class=xl385 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>valueCodeableConcept</td>
  <td class=xl385 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>text</td>
  <td class=xl385 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl397 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl387 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl124 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>コード<ruby>化<span style='display:none'><rt>カ </rt></span></ruby>の<ruby>有無<span
  style='display:none'><rt>ウム </rt></span></ruby>に<ruby>関<span
  style='display:none'><rt>カカワラズ </rt></span></ruby>わらず、<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>したい<ruby>診療科<span
  style='display:none'><rt>シンリョウカ </rt></span></ruby><ruby>名<span
  style='display:none'><rt>メイ </rt></span></ruby>の<ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby>。</td>
  <td class=xl389 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl398 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;<ruby>循環器<span
  style='display:none'><rt>ジュンカンキ </rt></span></ruby><ruby>診療<span
  style='display:none'><rt>シンリョウ </rt></span></ruby><ruby>科<span
  style='display:none'><rt>カ </rt></span></ruby>&quot;</td>
 </tr>
 <tr height=261 style='height:196.0pt'>
  <td height=261 class=xl399 width=105 style='height:196.0pt;width:79pt'>identifier[*]</td>
  <td class=xl400 width=92 style='width:69pt'>　</td>
  <td class=xl400 width=73 style='width:55pt'>　</td>
  <td class=xl400 width=73 style='width:55pt'>　</td>
  <td class=xl401 width=47 style='width:35pt'>1..*</td>
  <td class=xl402 width=87 style='width:65pt'>Identifier</td>
  <td class=xl344 width=359 style='width:269pt'>このリソース情報の一意識別ID。<br>
    少なくともひとつのidentifierは以下に記載の一意識別IDの仕様に従う値を設定すること。<br>
   
  一意識別IDは、このリソース情報を作成した施設内で、このリソース情報を他のリソース情報と一意に区別できるIDを想定しているが、１回の登録で発生する複数の病名情報が同一IDを持っていてもよい。<br>
    このID情報をキーとして、このIDが同一である本リソース情報ひとつまたは複数に対して、一括して更新・削除が実施されることがある。1回の登録で複数のリソース情報が登録される場合に、それらは同一のIDでも構わない。この場合、更新や削除は同一IDの情報すべてに対して実施される。</td>
  <td class=xl402 width=36 style='width:27pt'>　</td>
  <td class=xl403 width=195 style='width:146pt'>　</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl404 width=105 style='height:60.0pt;border-top:none;
  width:79pt'>identifier[+]</td>
  <td class=xl405 width=92 style='border-top:none;width:69pt'>system</td>
  <td class=xl405 width=73 style='border-top:none;width:55pt'>　</td>
  <td class=xl405 width=73 style='border-top:none;width:55pt'>　</td>
  <td class=xl406 width=47 style='border-top:none;width:35pt'>1..1</td>
  <td class=xl407 width=87 style='border-top:none;width:65pt'>uri</td>
  <td class=xl408 width=359 style='width:269pt'>このリソース情報を他のリソース情報と一意に区別できるIDである場合に、system値を固定で設定する。1回の登録で複数のリソース情報が登録される場合に、それらは同一のIDで登録される場合でもこのsystem値を使用する。</td>
  <td class=xl407 width=36 style='border-top:none;width:27pt'>固定値</td>
  <td class=xl409 width=195 style='border-top:none;border-left:none;width:146pt'>http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl350 width=105 style='height:30.0pt;width:79pt'>identifier[=]</td>
  <td class=xl351 width=92 style='width:69pt'>value</td>
  <td class=xl351 width=73 style='width:55pt'>　</td>
  <td class=xl351 width=73 style='width:55pt'>　</td>
  <td class=xl410 width=47 style='width:35pt'>1..1</td>
  <td class=xl353 width=87 style='width:65pt'>string</td>
  <td class=xl353 width=359 style='width:269pt'>このリソース情報IDの文字列。URI形式を使う場合には、urn:ietf:rfc:3986に準拠すること。<ruby><font
  class="font23"><rt class=font23></rt></font></ruby></td>
  <td class=xl353 width=36 style='width:27pt'>例示</td>
  <td class=xl354 width=195 style='width:146pt'>&quot;1311234567-2020-00123456&quot;</td>
 </tr>
 <tr height=180 style='height:135.0pt'>
  <td height=180 class=xl411 width=105 style='height:135.0pt;width:79pt'>basedOn</td>
  <td class=xl412 width=92 style='width:69pt'>　</td>
  <td class=xl412 width=73 style='width:55pt'>　</td>
  <td class=xl412 width=73 style='width:55pt'>　</td>
  <td class=xl413 width=47 style='width:35pt'>0..1</td>
  <td class=xl413 width=87 style='width:65pt'>Reference(JP_ServiceRequest)</td>
  <td class=xl413 width=359 style='width:269pt'>元の<ruby>検査<span
  style='display:none'><rt>ケンサ </rt></span></ruby>オーダ情報。オーダ番号等の一意識別子を含むServiceRequestリソース（Containedリソース）への参照。<ruby>検査<span
  style='display:none'><rt>ケンサ </rt></span></ruby>オーダ番号等の一意識別子を含むServiceRequestリソース（Containedリソース）への参照。<br>
    元のオーダID情報や依頼に関する情報（<ruby>検査<span style='display:none'><rt>ケンサ </rt></span></ruby><ruby>依頼<span
  style='display:none'><rt>イライ </rt></span></ruby><ruby>者<span
  style='display:none'><rt>シャ </rt></span></ruby>の所属や診療科など）が記述されるContainedリソースに含まれるServiceRequest（<ruby>検査<span
  style='display:none'><rt>ケンサ </rt></span></ruby>オーダー情報）リソースをこのリソース内で参照する。ただし、<ruby>医療<span
  style='display:none'><rt>イリョウ </rt></span></ruby><ruby>機関<span
  style='display:none'><rt>キカｎ </rt></span></ruby><ruby>番号<span
  style='display:none'><rt>バンゴウ </rt></span></ruby>と<ruby>診療科<span
  style='display:none'><rt>シンリョウカ </rt></span></ruby><ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>は、extensionでも<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>することになっている。</td>
  <td class=xl413 width=36 style='width:27pt'>　</td>
  <td class=xl414 width=195 style='width:146pt'>　</td>
 </tr>
 <tr height=181 style='height:136.0pt'>
  <td height=181 class=xl415 align=left width=105 style='height:136.0pt;
  width:79pt'>status</td>
  <td class=xl416 width=92 style='border-left:none;width:69pt'>　</td>
  <td class=xl416 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl416 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl417 width=47 style='border-left:none;width:35pt'>1..1</td>
  <td class=xl416 align=left width=87 style='border-left:none;width:65pt'>code</td>
  <td class=xl269 align=left width=359 style='border-left:none;width:269pt'>検査・観察のステータス。<ruby>使用<span
  style='display:none'><rt>シヨウ </rt></span></ruby>するコード表：&quot;http://hl7.org/fhir/observation-status&quot;<br>
    　registered : <ruby>結果<span style='display:none'><rt>ケッカ </rt></span></ruby><ruby>未着<span
  style='display:none'><rt>ミチャク </rt></span></ruby><br>
    　preliminary : <ruby>暫定<span style='display:none'><rt>ザンテイ </rt></span></ruby><ruby>結果<span
  style='display:none'><rt>ケッカ </rt></span></ruby><ruby>報告<span
  style='display:none'><rt>ホウコク </rt></span></ruby><br>
    　final : <ruby>最終<span style='display:none'><rt>サイシュウ </rt></span></ruby><ruby>結果<span
  style='display:none'><rt>ケッカ </rt></span></ruby><ruby>報告<span
  style='display:none'><rt>ホウコク </rt></span></ruby><br>
    　amended : <ruby>訂正<span style='display:none'><rt>テイセイ </rt></span></ruby><ruby>報告<span
  style='display:none'><rt>ホウコク </rt></span></ruby><br>
    　cancelled : <ruby>検査<span style='display:none'><rt>ケンサ </rt></span></ruby><ruby>中止<span
  style='display:none'><rt>チュウシ </rt></span></ruby><br>
    　entered-in-error : エラー<ruby>入力<span style='display:none'><rt>ニュウリョク </rt></span></ruby><br>
    　unknown : ステータス<ruby>不明<span style='display:none'><rt>フメイ </rt></span></ruby></td>
  <td class=xl353 width=36 style='width:27pt'>例示</td>
  <td class=xl418 width=195 style='border-left:none;width:146pt'>&quot;final&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl180 width=105 style='height:30.0pt;width:79pt'>category[*]<ruby><font
  class="font23"><rt class=font23></rt></font></ruby></td>
  <td class=xl181 width=92 style='width:69pt'>　</td>
  <td class=xl181 width=73 style='width:55pt'>　</td>
  <td class=xl181 width=73 style='width:55pt'>　</td>
  <td class=xl276 width=47 style='width:35pt'>0..1<ruby><font class="font23"><rt
  class=font23></rt></font></ruby></td>
  <td class=xl183 width=87 style='width:65pt'>CodeableConcept</td>
  <td class=xl183 width=359 style='width:269pt'><ruby>検査<span style='display:
  none'><rt class=font23>ケンサ </rt></span></ruby><ruby>結果<span style='display:
  none'><rt class=font23>ケッカ </rt></span></ruby>カテゴリー</td>
  <td class=xl183 width=36 style='width:27pt'>　</td>
  <td class=xl219 width=195 style='width:146pt'>　</td>
 </tr>
 <tr height=72 style='height:54.0pt'>
  <td height=72 class=xl107 width=105 style='height:54.0pt;width:79pt'>category[+]<ruby><font
  class="font23"><rt class=font23></rt></font></ruby></td>
  <td class=xl108 width=92 style='width:69pt'>system</td>
  <td class=xl108 width=73 style='width:55pt'>　</td>
  <td class=xl108 width=73 style='width:55pt'>　</td>
  <td class=xl277 width=47 style='width:35pt'>1..1<ruby><font class="font23"><rt
  class=font23></rt></font></ruby></td>
  <td class=xl104 width=87 style='width:65pt'>uri</td>
  <td class=xl104 width=359 style='width:269pt'>検査結果カテゴリーのコードシステム値で、固定値。</td>
  <td class=xl340 width=36 style='width:27pt'><ruby>固定<span style='display:
  none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl280 width=195 style='width:146pt'><a
  href="http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS"
  target="_parent"><span style='font-size:10.0pt'>http://jpfhir.jp/fhir/core/CodeSystem/JP_SimpleObservationCategory_CS<ruby><font
  class="font23"><rt class=font23></rt></font></ruby></span></a></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl107 width=105 style='height:20.0pt;width:79pt'>category[=]<ruby><font
  class="font23"><rt class=font23></rt></font></ruby></td>
  <td class=xl108 width=92 style='width:69pt'>code</td>
  <td class=xl108 width=73 style='width:55pt'>　</td>
  <td class=xl108 width=73 style='width:55pt'>　</td>
  <td class=xl277 width=47 style='width:35pt'>1..1<ruby><font class="font23"><rt
  class=font23></rt></font></ruby></td>
  <td class=xl104 width=87 style='width:65pt'>string</td>
  <td class=xl104 width=359 style='width:269pt'>検査結果カテゴリーを表すコードで固定値。</td>
  <td class=xl340 width=36 style='width:27pt'><ruby>固定<span style='display:
  none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl226 width=195 style='width:146pt'>&quot;laboratory&quot;</td>
 </tr>
 <tr height=28 style='height:21.0pt'>
  <td height=28 class=xl169 width=105 style='height:21.0pt;width:79pt'>category[=]<ruby><font
  class="font23"><rt class=font23></rt></font></ruby></td>
  <td class=xl170 width=92 style='width:69pt'>display<ruby><font class="font23"><rt
  class=font23></rt></font></ruby></td>
  <td class=xl170 width=73 style='width:55pt'>　</td>
  <td class=xl170 width=73 style='width:55pt'>　</td>
  <td class=xl278 width=47 style='width:35pt'>0..1<ruby><font class="font23"><rt
  class=font23></rt></font></ruby></td>
  <td class=xl172 width=87 style='width:65pt'>string</td>
  <td class=xl211 width=359 style='width:269pt'>検査結果カテゴリーを表す<ruby>表示<span
  style='display:none'><rt>ヒョウジ </rt></span></ruby><ruby>名<span
  style='display:none'><rt>メイ </rt></span></ruby>で固定値。</td>
  <td class=xl353 width=36 style='width:27pt'><ruby>固定<span style='display:
  none'><rt>コテイ </rt></span></ruby></td>
  <td class=xl224 width=195 style='width:146pt'>&quot;Laboratory&quot;<ruby><font
  class="font23"><rt class=font23></rt></font></ruby></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl336 align=left width=105 style='height:30.0pt;
  width:79pt'>code</td>
  <td class=xl337 width=92 style='border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl419 width=47 style='border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-left:none;width:65pt'>CodeableConcept</td>
  <td class=xl134 align=left width=359 style='border-left:none;width:269pt'>検査・観察の項目コード。<br>
    </td>
  <td class=xl134 width=36 style='border-left:none;width:27pt'>　</td>
  <td class=xl393 width=195 style='border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>code</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[*]</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl419 width=47 style='border-top:none;border-left:none;width:35pt'>1..*</td>
  <td class=xl420 style='border-top:none;border-left:none'>　</td>
  <td rowspan=6 class=xl452 align=left width=359 style='border-top:none;
  width:269pt'>「医療機関から送信するFHIR仕様について」の「検体検査結果情報における検査項目のコーディング規則」を適用すること。<ruby>電子<span
  style='display:none'><rt>デンシ </rt></span></ruby>カルテ<ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby><ruby>共有<span
  style='display:none'><rt>キョウユウ </rt></span></ruby>サービス<ruby>用<span
  style='display:none'><rt>ヨウ </rt></span></ruby>でない<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>も、<ruby>特<span
  style='display:none'><rt>トクビ </rt></span></ruby>に<ruby>他<span
  style='display:none'><rt>ホカ </rt></span></ruby>に<ruby>明示的<span
  style='display:none'><rt>メイジテキ </rt></span></ruby>な<ruby>理由<span
  style='display:none'><rt>リユウ </rt></span></ruby>がない<ruby>限<span
  style='display:none'><rt>カギリ </rt></span></ruby>り、この<ruby>規則<span
  style='display:none'><rt>キソク </rt></span></ruby>を<ruby>適用<span
  style='display:none'><rt>テキヨウ </rt></span></ruby>すること。</td>
  <td rowspan=6 class=xl362 width=36 style='border-top:none;width:27pt'>　</td>
  <td rowspan=6 class=xl364 width=195 style='border-top:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>code</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[+]</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl419 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Coding</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>code</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[=]</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl419 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>code</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[=]</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl419 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>code</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[=]</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>display</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl419 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
 </tr>
 <tr height=28 style='height:21.0pt'>
  <td height=28 class=xl421 align=left width=105 style='height:21.0pt;
  border-top:none;width:79pt'>code</td>
  <td class=xl422 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>text</td>
  <td class=xl422 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl422 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl423 width=47 style='border-top:none;border-left:none;width:35pt'>1..0</td>
  <td class=xl422 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl424 width=105 style='height:60.0pt;width:79pt'>subject</td>
  <td class=xl183 width=92 style='width:69pt'>　</td>
  <td class=xl183 width=73 style='width:55pt'>　</td>
  <td class=xl183 width=73 style='width:55pt'>　</td>
  <td class=xl425 width=47 style='width:35pt'>1..1</td>
  <td class=xl183 width=87 style='width:65pt'>Reference(JP_Patient )</td>
  <td class=xl183 width=359 style='width:269pt'><ruby>対象<span style='display:
  none'><rt>タイショウ </rt></span></ruby>となる患者のFHIRリソースへの参照。Bundleリソースなどで本リソースから参照可能なPatientリソースが同時に存在する場合には、そのリソースの識別URI（fullUrl要素に指定されるUUID）を参照する。</td>
  <td class=xl183 width=36 style='width:27pt'>例示</td>
  <td class=xl426 width=195 style='width:146pt'>例 <br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;urn: .....&quot;<br>
    }</td>
 </tr>
 <tr height=280 style='height:210.0pt'>
  <td height=280 class=xl342 width=105 style='height:210.0pt;width:79pt'>　</td>
  <td class=xl104 width=92 style='width:69pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl105 width=47 style='width:35pt'>　</td>
  <td class=xl104 width=87 style='width:65pt'>　</td>
  <td class=xl344 width=359 style='width:269pt'>保険個人識別子(例では、保険者等番号＝12345、被保険者証等の記号＝あいう、被保険者証等の番号＝１８７、枝番＝05の患者)を記述した外部にある患者リソースを参照する場合の例。<ruby><font
  class="font12">電子</font><span style='display:none'><rt>デンシカルテ </rt></span></ruby><font
  class="font12">カルテ</font><ruby><font class="font12">情報</font><span
  style='display:none'><rt>ジョウホウ </rt></span></ruby><font class="font12">サービスでは、この</font><ruby><font
  class="font12">記述</font><span style='display:none'><rt>キジュツ </rt></span></ruby><ruby><font
  class="font12">方法</font><span style='display:none'><rt>ホウホウ </rt></span></ruby><font
  class="font12">を</font><ruby><font class="font12">用</font><span
  style='display:none'><rt>モチイル </rt></span></ruby><font class="font12">いる。</font></td>
  <td class=xl104 width=36 style='width:27pt'>例示</td>
  <td class=xl345 width=195 style='width:146pt'>例 <br>
    {<br>
    <span style='mso-spacerun:yes'>    </span>&quot;type&quot;:
  &quot;Patient&quot;,<span style='mso-spacerun:yes'>  </span><br>
    <span style='mso-spacerun:yes'>     </span>&quot;identifier&quot;:{<br>
    <span style='mso-spacerun:yes'>         </span>&quot;system&quot;:
  &quot;http://jpfhir.jp/fhir/eCS/Idsysmem/JP_Insurance_memberID&quot;,<br>
    <span style='mso-spacerun:yes'>          </span>&quot;value&quot;:
  &quot;00012345:あいう:１８７:05&quot;<br>
    <span style='mso-spacerun:yes'>       </span>}<br>
    }<br>
    </td>
 </tr>
 <tr height=120 style='height:90.0pt'>
  <td height=120 class=xl342 width=105 style='height:90.0pt;width:79pt'>encounter</td>
  <td class=xl104 width=92 style='width:69pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl427 width=47 style='width:35pt'>0..1</td>
  <td class=xl104 width=87 style='width:65pt'>Reference (JP_Encounter )</td>
  <td class=xl104 width=359 style='width:269pt'>この<ruby>検査<span
  style='display:none'><rt>ケンサ </rt></span></ruby>をオーダしたときの受診情報（入外区分など）を記述しているEncounterリソースへの参照。Bundleリソースなどで本リソースから参照可能なEncouertリソースが同時に存在する場合には、そのリソースの識別URIを参照する。Containedリソースが存在する場合には、それを参照する記述（次行の例）。</td>
  <td class=xl104 width=36 style='width:27pt'>例示</td>
  <td class=xl357 width=195 style='width:146pt'>例 1 <br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;urn: .....&quot;<br>
    }</td>
 </tr>
 <tr height=220 style='height:165.0pt'>
  <td height=220 class=xl342 width=105 style='height:165.0pt;width:79pt'>　</td>
  <td class=xl104 width=92 style='width:69pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=47 style='width:35pt'>　</td>
  <td class=xl104 width=87 style='width:65pt'>　</td>
  <td class=xl104 width=359 style='width:269pt'>電子カルテシステムで入院時、外来受診時のいずれにおいて本情報が登録されたか記録さている場合にはその入院・外来区分をEncounter.class要素に設定し、そのEncounterリソースをContainedリソースとして本リソースに埋め込んで、それを参照すること。<br>
    <font class="font12">電子カルテ共有サービスにおける6情報のひとつとして本リソースが記述される場合には、JP_Encounterタイプのリソース（Encounter.idの値が&quot;#encounter203987&quot;と仮定）が本リソースのContainedリソースとして埋め込み記述されることが必須であるため、そのcontainedリソースのid値(Encounter.id)を記述する例2となる。</font></td>
  <td class=xl104 width=36 style='width:27pt'>例示</td>
  <td class=xl357 width=195 style='width:146pt'>例 2<br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;#encounter203987&quot;<br>
    }</td>
 </tr>
 <tr height=77 style='height:58.0pt'>
  <td height=77 class=xl337 align=left width=105 style='height:58.0pt;
  border-top:none;width:79pt'>effectiveDateTime</td>
  <td class=xl422 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl422 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl422 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl423 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>検体<span style='display:none'><rt>ケンタイ </rt></span></ruby><ruby>採取日<span
  style='display:none'><rt>サイシュヒ </rt></span></ruby>または<ruby>検体採取<span
  style='display:none'><rt>ケンタイサイシュ </rt></span></ruby><ruby>日時<span
  style='display:none'><rt>ニチジ </rt></span></ruby>。<br>
    YYYY-MM-DD<br>
    YYYY-MM-DDThh:mm:ss+zz:zz</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイ </rt></span></ruby><ruby>示<span
  style='display:none'><rt>ジ </rt></span></ruby></td>
  <td class=xl364 width=195 style='border-top:none;border-left:none;width:146pt'>2021-09-05<br>
    <ruby><font class="font18">日時</font><span style='display:none'><rt>ニチジ </rt></span></ruby><font
  class="font18">を</font><ruby><font class="font18">記述</font><span
  style='display:none'><rt>キジュツ </rt></span></ruby><font class="font18">する</font><ruby><font
  class="font18">場合</font><span style='display:none'><rt>バアイ </rt></span></ruby><font
  class="font18">には、</font>2015-02-07T13:28:17+09:00 <font class="font18">の</font><ruby><font
  class="font18">形式</font><span style='display:none'><rt>ケイシキ </rt></span></ruby><font
  class="font18">。</font></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl428 align=left width=105 style='height:45.0pt;
  border-top:none;width:79pt'>issued</td>
  <td class=xl422 width=92 style='border-left:none;width:69pt'>　</td>
  <td class=xl422 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl422 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl429 width=47 style='border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>instant</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>結果<span style='display:none'><rt>ケッカ </rt></span></ruby><ruby>提供<span
  style='display:none'><rt>テイキョウ </rt></span></ruby>システム<ruby>日時<span
  style='display:none'><rt>ニチジ </rt></span></ruby>（検査結果がシステムに格納された日時）　YYYY-MM-DDThh:mm:ss[.sss]+zz:zz
  (例. 2015-02-07T13:28:1<ruby>7.<span style='display:none'><rt>ブブｎ </rt></span></ruby>2<ruby>39<span
  style='display:none'><rt>ショウリャク </rt></span></ruby><ruby>+0<span
  style='display:none'><rt>カノウ </rt></span></ruby>9:00) [<span
  style='mso-spacerun:yes'>  </span>]部分は省略可能。</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイ </rt></span></ruby><ruby>示<span
  style='display:none'><rt>ジ </rt></span></ruby></td>
  <td class=xl364 width=195 style='border-left:none;width:146pt'>2022-02-07T13:28:17.239+09:00</td>
 </tr>
 <tr height=140 style='height:105.0pt'>
  <td height=140 class=xl430 align=left width=105 style='height:105.0pt;
  border-top:none;width:79pt'>(value)</td>
  <td class=xl337 width=92 style='border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-left:none;width:35pt'>0..1</td>
  <td class=xl337 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>検査結果や観察結果。<br>
    以下のvalueで始まる要素のひとつを選択して、それにより記述する。複数を選択はできない。<br>
    この項目自体は子項目をまとめるセット名（バッテリー名、例：血球算定など）の場合には、結果値が<ruby>何<span
  style='display:none'><rt>ナンラカノ </rt></span></ruby>らかの<ruby>理由<span
  style='display:none'><rt>リユウ </rt></span></ruby>により得られなかった<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>には出現しない。それ以外では<ruby>必<span
  style='display:none'><rt>カナラズ </rt></span></ruby>ず<ruby>出現<span
  style='display:none'><rt>シュツゲン </rt></span></ruby>する。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>valueQuantity</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Quantity</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果が数量で記述できる場合。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>value</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>1.1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>decimal</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>数値<span style='display:none'><rt>スウチ </rt></span></ruby>(<ruby>小数値<span
  style='display:none'><rt>ショウスウチ </rt></span></ruby>、<ruby>負数<span
  style='display:none'><rt>フスウ </rt></span></ruby>も<ruby>可<span
  style='display:none'><rt>カノウ </rt></span></ruby>）</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>193.04</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl337 width=105 style='height:60.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>comparator</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>code</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>実際の値が、value<ruby>要素<span style='display:none'><rt>ヨウソ </rt></span></ruby><ruby>値<span
  style='display:none'><rt>チ </rt></span></ruby>よりも大きい、あるいは小さい場合にその記号を記述する。&quot;&lt;&quot;<span
  style='mso-spacerun:yes'>  </span>&quot;&lt;=&quot;<span
  style='mso-spacerun:yes'>  </span>&quot;&gt;=&quot;<span
  style='mso-spacerun:yes'>  </span>&quot;&gt;&quot; の<br>
    例：実際の値＜value要素値　の場合には &quot;&lt;&quot;を記述する。&quot;=&quot;は使用しない。</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;&lt;=&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>unit</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>単<span style='display:none'><rt>タンイ </rt></span></ruby>位<ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby></td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>”mg”</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl337 width=105 style='height:30.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>system</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>単位体系<font class="font16"> UCUM</font>コード体系を<ruby>推奨<span
  style='display:none'><rt>スイショウ </rt></span></ruby>する（&quot;http://unitsofmeasure.org&quot;）</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl281 width=195 style='border-top:none;border-left:none;width:146pt'><a
  href="http://unitsofmeasure.org/" target="_parent"><span style='font-size:
  10.0pt'>http://unitsofmeasure.org</span></a></td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>code</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>code</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>単<span style='display:none'><rt>タンイ </rt></span></ruby>位のコード<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>による<ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby></td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl337 align=left width=105 style='height:60.0pt;
  border-top:none;width:79pt'>valueCodeableConcept</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果がコード化されたコンセプトで記述できる場合。<br>
    定性検査値の場合などに使用する。<ruby>質問<span style='display:none'><rt>シツモン </rt></span></ruby><ruby>項目<span
  style='display:none'><rt>コウモク </rt></span></ruby>の<ruby>回答<span
  style='display:none'><rt>カイトウ </rt></span></ruby><ruby>記号<span
  style='display:none'><rt>キゴウ </rt></span></ruby>もコードと<ruby>回答<span
  style='display:none'><rt>カイトウ </rt></span></ruby><ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby>とみなしてこの<ruby>結果<span
  style='display:none'><rt>ケッカ </rt></span></ruby><ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby><ruby>方法<span
  style='display:none'><rt>ホウホウ </rt></span></ruby>を<ruby>使用<span
  style='display:none'><rt>シヨウ </rt></span></ruby>することができる。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[*]</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..*</td>
  <td class=xl337 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl120 width=359 style='border-top:none;border-left:none;width:269pt'>　</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[+]</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>結果<span style='display:none'><rt>ケッカ </rt></span></ruby>のコード<ruby>体系<span
  style='display:none'><rt>タイケイ </rt></span></ruby>を<ruby>表<span
  style='display:none'><rt>アラワス </rt></span></ruby>す。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[=]</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>結<span style='display:none'><rt>ケッカ </rt></span></ruby>果のコード</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;2&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[=]</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>display</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果のコードに対応する結果文字列</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例示<span style='display:none'><rt>&#128347;</rt></span></ruby></td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;++&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl337 align=left width=105 style='height:30.0pt;
  border-top:none;width:79pt'>valueString</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果が可読文字列で記述できる場合。<ruby>検体<span style='display:none'><rt>ケンタイ </rt></span></ruby><ruby>検査<span
  style='display:none'><rt>ケンサ </rt></span></ruby><ruby>結果<span
  style='display:none'><rt>ケッカ </rt></span></ruby>が<ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby>である<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>に<ruby>使用<span
  style='display:none'><rt>シヨウ </rt></span></ruby>する。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl337 align=left width=105 style='height:30.0pt;
  border-top:none;width:79pt'>valueBoolean</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl432 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>boolean</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果が真偽値で記述できる場合。通常、検体検査結果には使用しない。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl337 align=left width=105 style='height:30.0pt;
  border-top:none;width:79pt'>valueInteger</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl432 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>integer</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果が整数値で記述できる場合。通常、検体検査結果には使用せず、valueQuantityで記述する。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl337 align=left width=105 style='height:30.0pt;
  border-top:none;width:79pt'>valueRange</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl432 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Range</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果が数量の範囲で記述できる場合。通常、検体検査結果には使用しない。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl337 align=left width=105 style='height:30.0pt;
  border-top:none;width:79pt'>valueRatio</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl432 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Ratio</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果が数量の比率で記述できる場合。通常、検体検査結果には使用しない。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl337 align=left width=105 style='height:30.0pt;
  border-top:none;width:79pt'>valueSampleeData</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl432 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>SampledData</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果がサンプリングデータの場合。通常、検体検査結果には使用しない。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl337 align=left width=105 style='height:30.0pt;
  border-top:none;width:79pt'>valueTime</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl432 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>time</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果が時刻・時間値の場合。通常、検体検査結果には使用しない。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>valueDateTime</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl432 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果が日時の場合。通常、検体検査結果には使用しない。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl337 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>valuePeriod</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl432 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Period</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果が期間の場合。<ruby>通常<span style='display:none'><rt>ツウジョウ </rt></span></ruby>、<ruby>検体<span
  style='display:none'><rt>ケンタイ </rt></span></ruby><ruby>検査<span
  style='display:none'><rt>ケンサ </rt></span></ruby><ruby>結果<span
  style='display:none'><rt>ケッカ </rt></span></ruby>には<ruby>使用<span
  style='display:none'><rt>シヨウ </rt></span></ruby>しない。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl336 align=left width=105 style='height:75.0pt;
  border-top:none;width:79pt'>dataAbsentReason</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>value<ruby>要素<span style='display:none'><rt>ヨウソ </rt></span></ruby>に<ruby>結果<span
  style='display:none'><rt>ケッカ </rt></span></ruby>を<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>しない<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>で検査結果値が欠落している<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>には、その理由。コード<ruby>化<span
  style='display:none'><rt>カ </rt></span></ruby>して<ruby>設定<span
  style='display:none'><rt>セッテイ </rt></span></ruby>することは<ruby>一般<span
  style='display:none'><rt>イッパｎ </rt></span></ruby>に<ruby>難<span
  style='display:none'><rt>ムズカシイ </rt></span></ruby>しいのでtextだけで<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>する。<ruby>検査値<span
  style='display:none'><rt>ケンサチ </rt></span></ruby>が<ruby>得<span
  style='display:none'><rt>エラレル </rt></span></ruby>られるはずの<ruby>検査<span
  style='display:none'><rt>ケンサ </rt></span></ruby><ruby>項目<span
  style='display:none'><rt>コウモク </rt></span></ruby>であるにもかかわらずvalueXX<ruby>要素<span
  style='display:none'><rt>ヨウソ </rt></span></ruby>に<ruby>値<span
  style='display:none'><rt>アタイ </rt></span></ruby>がない<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>には、この<ruby>項目<span
  style='display:none'><rt>コウモク </rt></span></ruby>は<ruby>必須<span
  style='display:none'><rt>ヒッス </rt></span></ruby>。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>text</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>理由<span style='display:none'><rt>リユウ </rt></span></ruby>の<ruby>文字列<span
  style='display:none'><rt>モジレツ </rt></span></ruby>。</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイジ </rt></span></ruby>示</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;<ruby>検体<span
  style='display:none'><rt>ケンタイ </rt></span></ruby><ruby>量<span
  style='display:none'><rt>リョウ </rt></span></ruby><ruby>不足<span
  style='display:none'><rt>フソク </rt></span></ruby>のため&quot;</td>
 </tr>
 <tr height=37 style='height:28.0pt'>
  <td height=37 class=xl336 align=left width=105 style='height:28.0pt;
  border-top:none;width:79pt'>interpretation</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..*</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>検査結果値の評価コード。基準値よりHighなど。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[*]</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..*</td>
  <td class=xl337 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl120 width=359 style='border-top:none;border-left:none;width:269pt'>　</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=56 style='height:42.0pt'>
  <td height=56 class=xl336 width=105 style='height:42.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[+]</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>検査結果値の評価コード表のsystem値で固定。</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>固定値<span style='display:none'><rt>コテイチ </rt></span></ruby></td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl336 width=105 style='height:30.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[=]</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>検査結果値の評価コード<ruby>。<span style='display:none'><rt>。</rt></span></ruby><br>
    H:High,L:Low,N:Normal の<ruby>い<span style='display:none'><rt>ツカウ </rt></span></ruby>ずれかを使う。</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイジ </rt></span></ruby>示</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;H&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding[=]</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>display</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>検査結果値の評価コードに対応する表示名</td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイジ </rt></span></ruby>示</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>”High&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>text</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>評価<span style='display:none'><rt>ヒョウカ </rt></span></ruby><ruby>表示<span
  style='display:none'><rt>ヒョウジ </rt></span></ruby><ruby>文字<span
  style='display:none'><rt>モジレｔ </rt></span></ruby><ruby>列<span
  style='display:none'><rt>レツ </rt></span></ruby></td>
  <td class=xl120 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイジ </rt></span></ruby>示</td>
  <td class=xl434 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;高&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 align=left width=105 style='height:20.0pt;
  border-top:none;width:79pt'>note</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl435 width=47 style='border-top:none;border-left:none;width:35pt'>0..*</td>
  <td class=xl337 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>結果に関するコメントテキスト記述</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>author</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl435 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 width=87 style='border-top:none;border-left:none;width:65pt'>　</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>記載者の情報</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=37 style='height:28.0pt'>
  <td height=37 class=xl336 width=105 style='height:28.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>authorString</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl435 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>記載者氏名などの文字列。必ずしも氏名でなくてもよい。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;<ruby><font
  class="font18">検査室</font><span style='display:none'><rt>ケンサシツ </rt></span></ruby>&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>time</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl435 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>dateTime</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>この追加的な情報が作成された日時。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl336 width=105 style='height:30.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>text</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl435 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>markdown</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>追加的な情報の内容。<font class="font16">markdown</font><font
  class="font10">形式のテキストが使用できる。データとして</font><font class="font16">1M</font><font
  class="font10">バイト以内であること。</font></td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl336 align=left width=105 style='height:30.0pt;
  border-top:none;width:79pt'>method</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl435 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>検査手法を<ruby>記述<span style='display:none'><rt>キジュツ </rt></span></ruby>する<ruby>必要<span
  style='display:none'><rt>ヒツヨウ </rt></span></ruby>がある<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>に、Codingせずtext情報だけを必要に応じて記述する。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>coding</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>text</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl435 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl337 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>検査手法文字列。</td>
  <td class=xl337 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl336 align=left width=105 style='height:75.0pt;
  border-top:none;width:79pt'>specimen</td>
  <td class=xl436 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl436 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl436 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl437 width=47 style='width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Reference(Specimen)</td>
  <td class=xl104 width=359 style='width:269pt'><ruby>検査<span style='display:
  none'><rt>ケンサ </rt></span></ruby>における<ruby>検体<span style='display:none'><rt>ケンタイ
  </rt></span></ruby><ruby>材料<span style='display:none'><rt>ザイリョウ </rt></span></ruby>情報を記述しているSpecimenリソースへの参照。Bundleリソースなどで本リソースから参照可能なSpecimenリソースが同時に存在する場合には、そのリソースの識別URIを参照する。Containedリソースが存在する場合には、それを参照する記述（次行の例）。</td>
  <td class=xl104 width=36 style='width:27pt'>例示</td>
  <td class=xl357 width=195 style='width:146pt'>例 1 <br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;urn: .....&quot;<br>
    }</td>
 </tr>
 <tr height=200 style='height:150.0pt'>
  <td height=200 class=xl342 width=105 style='height:150.0pt;width:79pt'>　</td>
  <td class=xl104 width=92 style='width:69pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=47 style='width:35pt'>　</td>
  <td class=xl104 width=87 style='width:65pt'>　</td>
  <td class=xl104 width=359 style='width:269pt'><ruby>検体<span style='display:
  none'><rt>ケンタイ </rt></span></ruby><ruby>材料<span style='display:none'><rt>ザイリョウ
  </rt></span></ruby>に<ruby>関<span style='display:none'><rt>カンスル </rt></span></ruby>する<ruby>情報<span
  style='display:none'><rt>ジョウホウ </rt></span></ruby>を<ruby>記述<span
  style='display:none'><rt>キジュツ </rt></span></ruby>したSpecimenリソースをContainedリソースとして本リソースに埋め込んで、それを参照すること。<br>
    <font class="font12">電子カルテ共有サービスにおける6情報のひとつとして本リソースが記述される場合には、JP_Specimenタイプのリソース（Specimen.idの値が&quot;#specimen203987&quot;と仮定）が本リソースのContainedリソースとして埋め込み記述して、そのcontainedリソースのid値(Specimen.id)を記述する</font><ruby><font
  class="font12">例</font><span style='display:none'><rt>レイ </rt></span></ruby><font
  class="font12">２とするか、またはspecimen.display</font><ruby><font class="font12">要素</font><span
  style='display:none'><rt>ヨウソ </rt></span></ruby><font class="font12">に</font><ruby><font
  class="font12">材料</font><span style='display:none'><rt>ザイリョウ </rt></span></ruby><ruby><font
  class="font12">文字列</font><span style='display:none'><rt>モジレツ </rt></span></ruby><font
  class="font12">だけを</font><ruby><font class="font12">記述</font><span
  style='display:none'><rt>キジュツ </rt></span></ruby><font class="font12">する</font><ruby><font
  class="font12">方式</font><span style='display:none'><rt>ホウシキ </rt></span></ruby><font
  class="font12">（</font><ruby><font class="font12">以下</font><span
  style='display:none'><rt>イカ </rt></span></ruby><font class="font12">の２行による</font><ruby><font
  class="font12">例</font><span style='display:none'><rt>レイ </rt></span></ruby><font
  class="font12">３）をとる。</font></td>
  <td class=xl104 width=36 style='width:27pt'>例示</td>
  <td class=xl357 width=195 style='width:146pt'>例 2<br>
    {<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;#specimen203987&quot;<br>
    }</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl438 width=105 style='height:20.0pt;width:79pt'>　</td>
  <td class=xl439 width=92 style='width:69pt'>type</td>
  <td class=xl439 width=73 style='width:55pt'>　</td>
  <td class=xl439 width=73 style='width:55pt'>　</td>
  <td class=xl439 width=47 style='width:35pt'>0..1</td>
  <td class=xl439 width=87 style='width:65pt'>string</td>
  <td class=xl104 width=359 style='width:269pt'><ruby>参照<span style='display:
  none'><rt>サンショウ </rt></span></ruby>するリソースタイプ　</td>
  <td class=xl104 width=36 style='width:27pt'>例示</td>
  <td class=xl440 width=195 style='width:146pt'><ruby><font class="font10">例</font><span
  style='display:none'><rt>レイ </rt></span></ruby><font class="font10">３　</font>&quot;Specimen&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl438 width=105 style='height:20.0pt;width:79pt'>　</td>
  <td class=xl439 width=92 style='width:69pt'>display</td>
  <td class=xl439 width=73 style='width:55pt'>　</td>
  <td class=xl439 width=73 style='width:55pt'>　</td>
  <td class=xl439 width=47 style='width:35pt'>0..1</td>
  <td class=xl439 width=87 style='width:65pt'>string</td>
  <td class=xl104 width=359 style='width:269pt'><ruby>検体<span style='display:
  none'><rt>ケンタイ </rt></span></ruby><ruby>材<span style='display:none'><rt>ザイリョウ
  </rt></span></ruby>料の<ruby>文字列<span style='display:none'><rt>モジレツ </rt></span></ruby><ruby>名称<span
  style='display:none'><rt>メイショウ </rt></span></ruby></td>
  <td class=xl104 width=36 style='width:27pt'>例示</td>
  <td class=xl441 width=195 style='width:146pt'><ruby><font class="font10">例</font><span
  style='display:none'><rt>レイ </rt></span></ruby><font class="font10">３　</font><font
  class="font16">&quot;</font><ruby><font class="font16">血清</font><span
  style='display:none'><rt>ケッセイ </rt></span></ruby><font class="font16">&quot;</font></td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl336 align=left width=105 style='height:30.0pt;
  border-top:none;width:79pt'>referenceRange</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..1*</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>BackboneElement</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>推奨範囲として結果値を解釈するためのガイダンス。基準値範囲。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=37 style='height:28.0pt'>
  <td height=37 class=xl336 width=105 style='height:28.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>low</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>SimpleQuantity</td>
  <td class=xl337 width=359 style='border-top:none;border-left:none;width:269pt'>　</td>
  <td class=xl337 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>value</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>decimal</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>下限値。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>unit</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>検査下限値の単位</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;mg/L&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>単位体系<font class="font16"> UCUM</font><font class="font10">コード体系。固定値。</font></td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;http://unitsofmeasure.org&quot;</td>
 </tr>
 <tr height=27 style='height:20.0pt'>
  <td height=27 class=xl336 width=105 style='height:20.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>code</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>code</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>医薬品単位略号。値は例示。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;mg/L&quot;</td>
 </tr>
 <tr height=37 style='height:28.0pt'>
  <td height=37 class=xl336 width=105 style='height:28.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>high</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>impleQuantity</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>上限値。（<font class="font16">low </font><font class="font10">と同じ記述方法なので省略）</font></td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl336 width=105 style='height:30.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>text</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl433 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>markdown</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>markdownテキストで記述したい<ruby>場合<span style='display:none'><rt>バアイ </rt></span></ruby>の検査結果・観察値の基準範囲など。</td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=220 style='height:165.0pt'>
  <td height=220 class=xl336 align=left width=105 style='height:165.0pt;
  border-top:none;width:79pt'>hasMember</td>
  <td class=xl104 width=92 style='width:69pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl104 width=73 style='width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..*</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Reference(JP_Observation_LabResult )</td>
  <td class=xl104 width=359 style='width:269pt'>この<ruby>検査<span
  style='display:none'><rt>ケンサ </rt></span></ruby>が複数の検査項目をグループ化したパネル検査もしくはバッテリー検査の場合に、このグループに含まれる個々の検査の参照へのリストである。この場合には、本Observationリソースのvalueは存在しない。<br>
   
  Bundleリソースなどで本リソースから参照可能なObservationリソースが同時に存在する場合には、そのリソースの識別URIを参照する。<br>
    <font class="font12">個々の</font><ruby><font class="font12">子</font><span
  style='display:none'><rt>コ &#0;&#2;&#2;&#4;ň</rt></span></ruby><font
  class="font12">検査の結果Observationリソースを、このリソースにContainedリソースとして埋め込むのではなく、別の検査結果Observationリソースとして作成し、そのidentifierを論理参照する方法をとること。</font></td>
  <td class=xl104 width=36 style='width:27pt'>例示</td>
  <td class=xl357 width=195 style='width:146pt'>{<br>
    <span style='mso-spacerun:yes'>  </span>&quot;reference&quot;:<span
  style='mso-spacerun:yes'>  </span>&quot;urn: .....&quot;<br>
    }</td>
 </tr>
 <tr height=160 style='height:120.0pt'>
  <td height=160 class=xl336 align=left width=105 style='height:120.0pt;
  border-top:none;width:79pt'>component</td>
  <td class=xl337 width=92 style='border-top:none;border-left:none;width:69pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..*</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>BackboneElement</td>
  <td class=xl120 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>同じ検査・観察において、メソッドが<font class="font16">1</font><font
  class="font10">つ、観察が</font><font class="font16">1</font><font class="font10">つ、実行者が</font><font
  class="font16">1</font><font class="font10">つ、デバイスが</font><font class="font16">1</font><font
  class="font10">つ、時間が</font><font class="font16">1</font><font class="font10">つしかない１回の検査・観察で同時に複数の検査結果が得られる場合に、その各検査を</font><font
  class="font16">component</font><font class="font10">をみなして、この</font><font
  class="font16">Observation</font><font class="font10">リソースの</font><font
  class="font16">component</font><font class="font10">要素に記述する。たとえばこのObservationリソースが血圧である場合に、収縮期血圧値と拡張期血圧値の2つは、Observationリソース：血圧の2つのcomponentとして記述される。</font></td>
  <td class=xl120 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=37 style='height:28.0pt'>
  <td height=37 class=xl336 width=105 style='height:28.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>code</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>1..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl337 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>Observation.code<font class="font10">と同じ。</font></td>
  <td class=xl337 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=80 style='height:60.0pt'>
  <td height=80 class=xl336 width=105 style='height:60.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>(value)</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>11<font class="font10">種類のデータタイプのいずれかひとつ。</font></td>
  <td class=xl337 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>Observation.(value)<font class="font10">と同じ。</font></td>
  <td class=xl337 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=37 style='height:28.0pt'>
  <td height=37 class=xl336 width=105 style='height:28.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>dataAbsentReason</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl337 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>Observation.dataAbsentReason<font class="font10">と同じ。</font></td>
  <td class=xl337 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=37 style='height:28.0pt'>
  <td height=37 class=xl336 width=105 style='height:28.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl337 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>interpretation</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl337 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl431 width=47 style='border-top:none;border-left:none;width:35pt'>0..1*</td>
  <td class=xl337 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>CodeableConcept</td>
  <td class=xl337 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>Observation. interpretation<font class="font10">と同じ。</font></td>
  <td class=xl337 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl339 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=39 style='height:29.0pt'>
  <td height=39 class=xl442 width=105 style='height:29.0pt;border-top:none;
  width:79pt'>　</td>
  <td class=xl443 align=left width=92 style='border-top:none;border-left:none;
  width:69pt'>referenceRange</td>
  <td class=xl443 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl443 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl444 width=47 style='border-top:none;border-left:none;width:35pt'>0..1*</td>
  <td class=xl443 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>BackboneElement</td>
  <td class=xl443 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>Observation. referenceRange<font class="font10">と同じ。</font></td>
  <td class=xl443 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl398 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>

</table>


</div>



<button type="button" onclick="details_open(false,'AllergyDetails','mrc')">閉じる</button>

</details>

## プロファイル

<br>

## プロファイル

{% include markdown-link-references.md %}
{% include external-link-reference.md %}