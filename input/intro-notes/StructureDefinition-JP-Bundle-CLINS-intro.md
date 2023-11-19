
# CLINS電子カルテ情報共有サービス用: 【送信用Bundleリソース】

## 背景および想定シナリオ
このプロファイルは、６情報を送信するためにデータをまとめる役割をするBundleリソースのプロファイルを記述するためのものである。

Bundleリソースの使い方については、

  - 2.1.1 送信時の複数リソースデータのまとめ方
  - 2.1.2 送信済みBundleリソース・インスタンスを指定する識別子について
  - 2.1.3 Bundleリソースの送信タイミング

を参照すること。

## スコープ
### 対象
　６情報を送信するためにデータをまとめる際に必ず使用するBundleリソースとなる。

## プロファイル定義における必須要素と推奨要素
  - 必須要素は、その要素が必ず１個以上出現しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。
  - 推奨要素は、送信側はシステムに値が存在しているなら、値を格納した要素が必ず１個以上出現しなければならず、受信側は必ずその値を格納しなければならない要素。FHIR仕様ではMust Supportフラグを設定している。

### 必須要素
  - resourceType : リソースタイプ "Bundle"
  - meta.lastUpdated : 最終更新日時
  - meta.profile : 準拠プロファイル　"http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Bundle_CLINS"
  - meta.tag[n].system : このBundleが格納するリソースタイプを識別するcodeのsystem値　"http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS"
  - meta.tag[n].code : このBundleが格納するリソースタイプを識別するcode
  - identifier : インスタンス識別子
  - type : Bundleリソースのタイプ "collection"
  - timestamp : このリソースを生成した日時
  - entry[0] : JP_Patient_CLINS_eCS profileに準拠したPatientリソース。
  - entry[1以降] : このBundleが格納するリソース

### 条件により必須
  - 該当なし。

### 推奨要素
  - 該当なし。

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


<h3>表 「Bundle」</h3>
<button id="mrc" type="button" onclick="details_open(true,'TableDetails','mrc')">表「Bundle」開く</button>
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
 <col class=xl461 width=195 style='mso-width-source:userset;mso-width-alt:5339;
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
  <td class=xl319 width=359 style='border-top:none;border-left:none;width:269pt'>Bundleリソースであることを示す。</td>
  <td class=xl282 width=36 style='border-top:none;border-left:none;width:27pt'>固定値</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;Bundle&quot;</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl274 width=107 style='height:15.0pt;border-top:none;
  width:80pt'>meta</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl445 width=35 style='border-top:none;border-left:none;width:26pt'>1..1</td>
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
  <td class=xl445 width=35 style='border-top:none;border-left:none;width:26pt'>1..1</td>
  <td class=xl282 width=87 style='border-top:none;border-left:none;width:65pt'>instant</td>
  <td class=xl282 width=359 style='border-top:none;border-left:none;width:269pt'>最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz<br>
   
  この要素は、このリソースのデータを取り込んで蓄積していたシステムが、このリソースになんらかの変更があった可能性があった日時を取得し、このデータを再取り込みする必要性の判断をするために使われる。<ruby>本要素<span
  style='display:none'><rt>ホンヨウソ </rt></span></ruby>に前回取り込んだ時点より後の日時が設定されている場合には、なんらかの変更があった可能性がある（変更がない場合もある）ものとして判断される。したがって、内容になんらかの変更があった場合、またはこのリソースのデータが初めて作成された場合には、その時点以降の日時（たとえば、このリソースのデータを作成した日時）を設定しなければならない。内容の変更がない場合でも、このリソースのデータが作り直された場合や単に複写された場合にその日時を設定しなおしてもよい。ただし、内容に変更がないのであれば、日時を変更しなくてもよい。また、この要素の変更とmeta.versionIdの変更とは、必ずしも連動しないことがある。</td>
  <td class=xl282 width=36 style='border-top:none;border-left:none;width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;2015-02-07T13:28:17.239+09:00&quot;</td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl274 width=107 style='height:75.0pt;border-top:none;
  width:80pt'>meta</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>profile[+]</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl282 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl445 width=35 style='border-top:none;border-left:none;width:26pt'>1..*</td>
  <td class=xl282 width=87 style='border-top:none;border-left:none;width:65pt'>canonical(StructureDefinition)</td>
  <td class=xl323 width=359 style='border-top:none;border-left:none;width:269pt'>準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。<br>
   
  http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Bundle_CLINS　を設定する。<br>
    </td>
  <td class=xl282 width=36 style='border-top:none;border-left:none;width:27pt'>固定値</td>
  <td class=xl256 width=195 style='border-top:none;border-left:none;width:146pt'><a
  href="http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Bundle_CLINS"
  target="_parent">http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Bundle_CLINS</a></td>
 </tr>
 <tr height=60 style='height:45.0pt'>
  <td height=60 class=xl72 width=107 style='height:45.0pt;width:80pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[*]</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl313 width=35 style='width:26pt'>1..*</td>
  <td class=xl73 width=87 style='width:65pt'>Coding</td>
  <td class=xl88 width=359 style='width:269pt'>本リソースのメタデータ。<br>
    CLINSでのBundleリソースに含まれる６情報リソースカテゴリーをmeta.tag要素に記述する。</td>
  <td class=xl73 width=36 style='width:27pt'>　</td>
  <td class=xl294 width=195 style='width:146pt'>　</td>
 </tr>
 <tr height=84 style='height:63.0pt'>
  <td height=84 class=xl72 width=107 style='height:63.0pt;width:80pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[+]</td>
  <td class=xl73 width=73 style='width:55pt'>system</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl313 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>uri</td>
  <td class=xl284 width=359 style='width:269pt'>固定値
  http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS　を設定する。</td>
  <td class=xl73 width=36 style='width:27pt'>固定値</td>
  <td class=xl85 width=195 style='width:146pt'><a
  href="http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS"
  target="_parent">http://jpfhir.jp/fhir/clins/CodeSystem/BundleResourceType_CS</a></td>
 </tr>
 <tr height=160 style='height:120.0pt'>
  <td height=160 class=xl72 width=107 style='height:120.0pt;width:80pt'>meta</td>
  <td class=xl73 width=73 style='width:55pt'>tag[=]</td>
  <td class=xl73 width=73 style='width:55pt'>code</td>
  <td class=xl73 width=73 style='width:55pt'>　</td>
  <td class=xl313 width=35 style='width:26pt'>1..1</td>
  <td class=xl73 width=87 style='width:65pt'>code</td>
  <td class=xl88 width=359 style='width:269pt'>Bundleリソースに含まれる６情報リソースカテゴリーのいずれかをhhttp://jpfhir.jp/fhir/clins/ValueSet/BundleResourceType_VSのValuseSetから設定する。<br>
   
  具体的には、&quot;AllergyIntolerance&quot;、&quot;Condition&quot;、&quot;Observation&quot;、&quot;MedicationRequest&quot;　のいずれかの値を設定する。<br>
    </td>
  <td class=xl73 width=36 style='width:27pt'><ruby>例<span style='display:none'><rt>レイジ
  </rt></span></ruby>示</td>
  <td class=xl294 width=195 style='width:146pt'>&quot;Observation&quot;</td>
 </tr>
 <tr height=175 style='page-break-before:always;mso-height-source:userset;
  height:131.0pt'>
  <td height=175 class=xl326 align=left width=107 style='height:131.0pt;
  border-top:none;width:80pt'>identifier[*]</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..*</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Identifier</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>この文書Bundleの<ruby>一意<span style='display:none'><rt>&#129351;</rt></span></ruby>の識別子。Bund<ruby>le<span
  style='display:none'><rt>ジュシｎ </rt></span></ruby><ruby>作<span
  style='display:none'><rt>レキ </rt></span></ruby><ruby>成時<span
  style='display:none'><rt>カンリ </rt></span></ruby><ruby>にシ<span
  style='display:none'><rt>バンゴウ </rt></span></ruby>ステムが設定する。<br>
   
  Bundleリソースのidentifier要素は、電子カルテ情報共有サービス側で保存される。送信側は、後続の送信においてこのidentifierを指定することで、<ruby>受信<span
  style='display:none'><rt>ジュシン </rt></span></ruby><ruby>側<span
  style='display:none'><rt>ガワ </rt></span></ruby>は過去に<ruby>受信<span
  style='display:none'><rt>ジュシン </rt></span></ruby>したBundleリソースを<ruby>特定<span
  style='display:none'><rt>トクテイ </rt></span></ruby>し、それに含まれていた全データについて削除、更新などの処理を行うためにこれを<ruby>使用<span
  style='display:none'><rt>シヨウ </rt></span></ruby>する。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=56 style='height:42.0pt'>
  <td height=56 class=xl326 align=left width=107 style='height:42.0pt;
  border-top:none;width:80pt'>identifier[+]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>system</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>固<span style='display:none'><rt>コテイチ </rt></span></ruby>定値　&quot;http://jpfhir.jp/fhir/clins/bundle-identifier&quot;を<ruby>設定<span
  style='display:none'><rt>セッテイ </rt></span></ruby>する。 </td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>固定値</td>
  <td class=xl462 align=left width=195 style='border-top:none;border-left:none;
  width:146pt'>http://jpfhir.jp/fhir/clins/bundle-identifier</td>
 </tr>
 <tr height=281 style='mso-height-source:userset;height:211.0pt'>
  <td height=281 class=xl326 align=left width=107 style='height:211.0pt;
  border-top:none;width:80pt'>identifier[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>value</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>string</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>以下に記載する[報告単位識別ID]　を設定する。<br>
    [報告単位識別ID]： 次の３つの文字列を半角ハット記号（^）で連携した文字列。<br>
    <font class="font47">【保険医療機関番号10桁】</font><font class="font10">：（内訳：都道府県番号２桁、点数表コード（医療機関区分）１桁、医療機関番号７桁）<br>
    </font><font class="font47">【被保険者個人識別子】</font><font class="font10">：　６情報送信仕様に記載の「6:被保険者個人識別子の格納」の仕様に従う。<br>
    </font><font class="font47">【報告単位のデータを医療機関のシステムとして医療機関内で一意に識別できる粒度のID文字列】</font><font
  class="font10">：当該システムが当該患者データの中で一意性を保証できるよう生成した半角文字列（英大文字、数字、ハイフン記号のみ可）。最大128文字とすること。&quot;</font></td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'><ruby>例<span style='display:none'><rt>レイジ </rt></span></ruby>示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;1311234567-2020-00123456&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>type</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>code</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>Bundleリソースのタイプ。<ruby>本<span style='display:none'><rt>ホン </rt></span></ruby><ruby>仕様<span
  style='display:none'><rt>シヨウ </rt></span></ruby>では&quot;collection&quot;<ruby>固定<span
  style='display:none'><rt>コテイ </rt></span></ruby>とする。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>固定値</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;collection&quot;</td>
 </tr>
 <tr height=83 style='mso-height-source:userset;height:62.0pt'>
  <td height=83 class=xl326 align=left width=107 style='height:62.0pt;
  border-top:none;width:80pt'>timestamp</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>instant</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>このリソースを生成した日時。時刻の精度はミリ秒とし、タイムゾーンを含めること。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;2021-02-01T13:28:17.239+09:00&quot;</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>entry[*]</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..*</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>BackboneElement</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>Bundleに含まれる全リソースエントリを<ruby>格納<span style='display:none'><rt>カクノウ
  </rt></span></ruby>する。</td>
  <td class=xl96 width=36 style='border-top:none;border-left:none;width:27pt'>　</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>　</td>
 </tr>
 <tr height=75 style='mso-height-source:userset;height:56.0pt'>
  <td height=75 class=xl326 align=left width=107 style='height:56.0pt;
  border-top:none;width:80pt'>entry[+]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>fullUrl</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>エントリリスト内の<ruby>各<span style='display:none'><rt>カクコジン サイショ
  ヒツオユヒッス ヒッス<span style='mso-spacerun:yes'>  </span></rt></span></ruby>リソースを一意に識別するためのUUID。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720&quot;</td>
 </tr>
 <tr height=300 style='page-break-before:always;height:225.0pt'>
  <td height=300 class=xl326 align=left width=107 style='height:225.0pt;
  border-top:none;width:80pt'>entry[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>resource</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl327 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>1..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Resource(JP_Patient_CLINS_eCS)</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>JP_Patient_CLINS_eCS profileに準拠したPatient<ruby>リソ<span
  style='display:none'><rt>ジュンキョ </rt></span></ruby>ース。最初のリソースentryはJP_Patient_CLINS_eCS
  profileに準拠したPatientリソースであることが必須。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>{<br>
    <span style='mso-spacerun:yes'>        </span>&quot;resourceType&quot;:
  &quot;Patient&quot;,<br>
    <span style='mso-spacerun:yes'>        </span>&quot;id&quot;:
  &quot;InlineExample-Patient-standard&quot;,<br>
    <span style='mso-spacerun:yes'>        </span>&quot;meta&quot;: {<br>
    <span style='mso-spacerun:yes'>          </span>&quot;profile&quot;:
  [<br>
    <span style='mso-spacerun:yes'>           
  </span>&quot;http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Patient_eCS&quot;<br>
    <span style='mso-spacerun:yes'>          </span>]<br>
    <span style='mso-spacerun:yes'>        </span>}, <br>
    <ruby>&lt;以<span style='display:none'><rt>イコウ </rt></span></ruby><ruby>降省<span
  style='display:none'><rt>ショウリャク </rt></span></ruby>略&gt;</td>
 </tr>
 <tr height=100 style='height:75.0pt'>
  <td height=100 class=xl326 align=left width=107 style='height:75.0pt;
  border-top:none;width:80pt'>entry[+]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>fullUrl</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>エントリリスト内の<ruby>各<span style='display:none'><rt>カクコジン </rt></span></ruby>リソースを一意に識別するためのUUID。すでに<ruby>送信<span
  style='display:none'><rt>ソウシン </rt></span></ruby><ruby>済<span
  style='display:none'><rt>ズミ </rt></span></ruby>みのBundleリソースを<ruby>削除<span
  style='display:none'><rt>サクジョ </rt></span></ruby>するためにこのBundleリソースを<ruby>送信<span
  style='display:none'><rt>ソウシン </rt></span></ruby>する<ruby>場合<span
  style='display:none'><rt>バアイ </rt></span></ruby>には、<ruby>最初<span
  style='display:none'><rt>サイショ </rt></span></ruby>のentry(Patientリソース）だけを<ruby>設定<span
  style='display:none'><rt>セッテイ </rt></span></ruby>し、これ<ruby>以降<span
  style='display:none'><rt>イコウ </rt></span></ruby>のリソースは<ruby>不要<span
  style='display:none'><rt>フヨウ </rt></span></ruby>である。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;urn:uuid:179f9f7f-e546-04c2-6888-a9e0b24e5720&quot;</td>
 </tr>
 <tr height=300 style='height:225.0pt'>
  <td height=300 class=xl326 align=left width=107 style='height:225.0pt;
  border-top:none;width:80pt'>entry[=]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>resource</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>Resource(JP_Conditon_CLINS_eCS|JP_Observation_LabResult_CLINS_eCS|JP_MedicationRequest_CLINS_eCS|JP_AllergyIntorellance_CLINS_eCS)</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>このBundleリソースが格納するリソースのprofileに準拠したリソース。検体検査結果、傷病、アレルギー・薬剤禁忌、処方のいずれか。ただし、処方は６情報送信においては送信対象となっていない。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>{<br>
    <span style='mso-spacerun:yes'>        </span>&quot;resourceType&quot;:
  &quot;Observation&quot;,<br>
    <span style='mso-spacerun:yes'>        </span>&quot;id&quot;:
  &quot;InlineExample-Patient-standard&quot;,<br>
    <span style='mso-spacerun:yes'>        </span>&quot;meta&quot;: {<br>
    <span style='mso-spacerun:yes'>          </span>&quot;profile&quot;:
  [<br>
    <span style='mso-spacerun:yes'>           
  </span>&quot;http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Observation_LabResult_CLINS_eCS&quot;<br>
    <span style='mso-spacerun:yes'>    </span><ruby><span
  style='mso-spacerun:yes'>  </span><span style='display:none'><rt>イコウ </rt></span></ruby><ruby><span
  style='mso-spacerun:yes'>  </span><span style='display:none'><rt>ショウリャク </rt></span></ruby><span
  style='mso-spacerun:yes'>  </span>]<br>
    <span style='mso-spacerun:yes'>        </span>}, <br>
    &lt;以降省略&gt;</td>
 </tr>
 <tr height=43 style='mso-height-source:userset;height:32.0pt'>
  <td colspan=9 height=43 class=xl457 width=1038 style='border-right:1.0pt solid black;
  height:32.0pt;width:778pt'>　　　：：：　（<ruby>リ<span style='display:none'><rt>クリカエシ
  </rt></span></ruby>ソースインスタンスの数だけ繰り<ruby>返<span style='display:none'><rt>カズ </rt></span></ruby>し（）</td>
 </tr>
 <tr height=40 style='height:30.0pt'>
  <td height=40 class=xl326 align=left width=107 style='height:30.0pt;
  border-top:none;width:80pt'>entry[+]</td>
  <td class=xl96 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>fullUrl</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl96 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..1</td>
  <td class=xl96 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>uri</td>
  <td class=xl96 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'>エントリリスト内の<ruby>各<span style='display:none'><rt>カクコジン </rt></span></ruby>リソースを一意に識別するためのUUID。</td>
  <td class=xl96 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl320 width=195 style='border-top:none;border-left:none;width:146pt'>&quot;urn:uuid:3e6a0ba2-d781-4fd7-9de6-e077b690daed&quot;</td>
 </tr>
 <tr height=301 style='page-break-before:always;height:226.0pt'>
  <td height=301 class=xl460 align=left width=107 style='height:226.0pt;
  border-top:none;width:80pt'>entry[=]</td>
  <td class=xl101 align=left width=73 style='border-top:none;border-left:none;
  width:55pt'>resource</td>
  <td class=xl101 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl101 width=73 style='border-top:none;border-left:none;width:55pt'>　</td>
  <td class=xl101 align=left width=35 style='border-top:none;border-left:none;
  width:26pt'>0..*</td>
  <td class=xl101 align=left width=87 style='border-top:none;border-left:none;
  width:65pt'>entry[1]<ruby>以降<span style='display:none'><rt>イコウ </rt></span></ruby>と<ruby>同一<span
  style='display:none'><rt>ドウイツ </rt></span></ruby>。</td>
  <td class=xl101 align=left width=359 style='border-top:none;border-left:none;
  width:269pt'><ruby>上記<span style='display:none'><rt>ジョウキ </rt></span></ruby>と<ruby>同<span
  style='display:none'><rt>オナジ </rt></span></ruby>じ。ただし、<ruby>同一<span
  style='display:none'><rt>ドウイツ </rt></span></ruby>のBundleリソースに<ruby>格納<span
  style='display:none'><rt>カクノウ </rt></span></ruby>されるすべてのentryは、<ruby>同一<span
  style='display:none'><rt>ドウイツ </rt></span></ruby>のリソース<ruby>種別<span
  style='display:none'><rt>シュベツ </rt></span></ruby>、<ruby>同一<span
  style='display:none'><rt>ドウイツ </rt></span></ruby>のプロファイルに<ruby>準拠<span
  style='display:none'><rt>ジュンキョ </rt></span></ruby>していなければならない。</td>
  <td class=xl101 align=left width=36 style='border-top:none;border-left:none;
  width:27pt'>例示</td>
  <td class=xl330 width=195 style='border-top:none;border-left:none;width:146pt'>{<br>
    <span style='mso-spacerun:yes'>        </span>&quot;resourceType&quot;:
  &quot;Observation&quot;,<br>
    <span style='mso-spacerun:yes'>        </span>&quot;id&quot;:
  &quot;InlineExample-Patient-standard&quot;,<br>
    <span style='mso-spacerun:yes'>        </span>&quot;meta&quot;: {<br>
    <span style='mso-spacerun:yes'>          </span>&quot;profile&quot;:
  [<br>
    <span style='mso-spacerun:yes'>           
  </span>&quot;http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Observation_LabResult_CLINS_eCS&quot;<br>
    <span style='mso-spacerun:yes'>    </span><ruby><span
  style='mso-spacerun:yes'>  </span><span style='display:none'><rt>イコウ </rt></span></ruby><ruby><span
  style='mso-spacerun:yes'>  </span><span style='display:none'><rt>ショウリャク </rt></span></ruby><span
  style='mso-spacerun:yes'>  </span>]<br>
    <span style='mso-spacerun:yes'>        </span>}, <br>
    &lt;以降省略&gt;</td>
 </tr>

</table>

</div>

<button type="button" onclick="details_open(false,'TableDetails','mrc')">閉じる</button>
</details>

<br>

## プロファイル


{% include markdown-link-references.md %}