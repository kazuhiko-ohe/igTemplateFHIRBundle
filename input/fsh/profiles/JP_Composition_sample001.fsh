
Profile: JP_Composition_eReferral
Parent: Composition
Id: JP-Composition-eReferral
Description:  "診療情報提供書情報のリソース構成情報と文書日付に関するCompositionの派生プロファイル"
// * obeys checkValidCategoryTitle
// * obeys checkValidCategory
// * obeys checkValidSections
* obeys checkExist-CDASection-or-CompositionSection
* ^url = "http://jpfhir.jp/fhir/eReferral/StructureDefinition/JP_Composition_eReferral"
* ^status = #active
* meta.lastUpdated 1.. MS
* meta.profile 1.. MS
//* meta.profile = "http://jpfhir.jp/fhir/eReferral/StructureDefinition/JP_Composition_eReferral"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $composition-clinicaldocument-versionNumber named version 1..1
* extension[version] ^short = "文書バージョンを表す拡張"
* extension[version] 1..1 MS
* extension[version].url 1..1 MS
* extension[version].value[x] ^short = "文書のバージョン番号を表す文字列。"
* extension[version].value[x] ^definition = "文書のバージョン番号を表す文字列。\r\n例 : 第１版は  \"1\" とする。"
* extension[version].value[x] 1..1 MS

* identifier 1.. MS
* identifier.system 1.. MS
* identifier.system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier" (exactly)
* identifier.system ^short = "文書リソースIDの名前空間を表すURI。固定値。"
* identifier.system ^definition = "文書リソースIDの名前空間を表すURI。固定値。"
* identifier.value 1.. MS
* identifier.value ^short = "文書リソースID"
* identifier.value ^definition = "その医療機関が発行した診療情報提供書をその医療機関内において一意に識別するID（診療情報提供書番号）を設定する。\r\n
施設固有のID設定方式を用いて構わないが、Identifier型のvalue要素に、保険医療機関番号（10桁）、発行年（4桁）、施設内において発行年内で一意となる番号（8桁）をハイフン(“-“：U+002D)で連結した文字列を指定する方法を本仕様では具体的として採用している。\r\n
例：”1311234567-2020-00123456\r\n 施設内文書番号が、異なる文書種別同士で重複するシステムの場合には、さらに文書区分コードなどを挿入して区別できることが望ましい。"

* status = #final (exactly)
* status ^short = "この文書のステータス。"
* status ^definition = "この文書のステータス。\r\n仕様上は、preliminary | final | amended | entered_in_error　のいずれかを設定できるが、医療機関から登録される段階では、\"final\" でなければならない。"

* type ^short = "文書区分コード"
* type ^definition = "documentタイプのうち文書種別"
* type MS
* type.coding 1..1 MS
* type from http://jpfhir.jp/fhir/Common/ValueSet/doc-typecodes (required)
* type.coding.system = "http://jpfhir.jp/fhir/Common/CodeSystem/doc-typecodes" (exactly)
* type.coding.system ^definition = "文書区分コードのコード体系を識別するURI。固定値"
* type.coding.system MS
* type.coding.version
* type.coding.code 1.. MS
* type.coding.code = #57133-1 (exactly)
* type.coding.code ^definition = "診療情報提供書\"57133-1\"を指定。固定値。"
* type.coding.display = "診療情報提供書" (exactly)
* type.coding.display ^short = "文書区分コードの表示名。"
* type.coding.display ^definition = "文書区分コードの表示名。"
* type.coding.display MS

* category 1..1 MS
* category ^short = "文書カテゴリーコード"
* category ^definition = "文書カテゴリーコード。　診療情報提供書ではtype.coding.codeに記述される文書区分コードと同一。"
* category.coding 1..1 MS
* category from http://jpfhir.jp/fhir/Common/ValueSet/doc-typecodes (required)
* category.coding.system 1.. MS
* category.coding.system = "http://jpfhir.jp/fhir/Common/CodeSystem/doc-typecodes" (exactly)
* category.coding.system ^short = "文書カテゴリコードのコード体系"
* category.coding.system ^definition = "文書カテゴリコードのコード体系を識別するURI。固定値。"
* category.coding.code 1.. MS
* category.coding.code = #57133-1 (exactly)
* category.coding.code ^short = "文書カテゴリコード"
* category.coding.code ^definition = "文書カテゴリコード"
* category.coding.display ^short = "文書カテゴリコードの表示名"
* category.coding.display ^definition = "文書カテゴリ"
* category.coding.display MS

* subject 1.. MS
* subject ^short = "患者情報を表すPatientリソースへの参照。"
* subject ^definition = "患者情報を表すPatientリソースへの参照。"
* subject.reference 1..1 MS
* subject.reference ^short = "PatientリソースのfullUrl要素に指定されるUUIDを指定。"
* subject.reference ^definition = "Bundleリソースに記述されるPatientリソースのfullUrl要素に指定されるUUIDを指定。\r\n例：\"urn:uuid:11f0a9a6_a91d_3aef_fc4e_069995b89c4f\""
* subject only  Reference(JP_Patient_eCS)

* encounter ^short = "この文書が作成された受診時状況情報を表すEncounterリソースへの参照"
* encounter ^definition = "この文書が作成された受診時状況情報を表すEncounterリソースへの参照"
* encounter 0..1 MS
* encounter.reference ^short = "EncounterリソースのfullUrl要素に指定されるUUIDを指定。"
* encounter.reference ^definition = "Bundleリソースに記述されるEncounterリソースのfullUrl要素に指定されるUUIDを指定。\r\n例：\"urn:uuid:12f0a9a6_a91d_8aef_d14e_069795b89c9f\""
* encounter.reference 1..1 MS
* encounter only Reference(JP_Encounter_eCS)

* date ^definition = "このリソースを作成または最後に編集した日時。ISO8601に準拠し、秒の精度まで記録し、タイムゾーンも付記する。\r\n午前0時を\"24:00\"と記録することはできないため\"00:00\"と記録すること。　\r\n例：\"2020_08_21T12:28:21+09:00\""
* date 1..1 MS

/*
* author ^slicing.discriminator.type = #profile
* author ^slicing.discriminator.path = "resolve()"
* author ^slicing.rules = #open

* author contains
    authorPractitioner 1..1 MS 
and authorOrganization 1..1 MS
and authorDepartment 0..1 MS
* author[authorPractitioner] only  Reference(JP_Practitioner_eCS)
* author[authorOrganization] only  Reference(JP_Organization_eCS)
* author[authorDepartment] only  Reference(JP_Organization_eCS_department)
*/

* author ^short = "文書作成責任者と文書作成機関とへの参照。"
* author ^definition = "文書作成責任者を表すPractitionerリソースへの参照、および,文書作成機関か、または文書作成機関の診療科と文書作成機関を表すOrganizationリソースへの参照の2つのReferenceを繰り返す。"
* author only  Reference(JP_Practitioner_eCS or JP_Organization_eCS)
 
* title 1..1 MS
* title = "診療情報提供書" (exactly)

* custodian 1..1 MS
* custodian ^short = "文書の作成・修正を行い、文書の管理責任を持つ医療機関（Organizationリソース）への参照"
* custodian ^definition = "文書作成機関と同一の組織の場合、custodian要素からは文書作成機関を表すOrganizationリソースへの参照となる。文書作成機関とは異なる組織である場合は、文書作成機関とは別のOrganizationリソースで表現し、custodian要素からはそのOrganizationリソースを参照する。"
* custodian only Reference(JP_Organization_eCS)
* custodian.reference 1..1
* custodian.reference ^short = "custodianに対応するOrganizationリソースのfullUrl要素に指定されるUUIDを指定。"
* custodian.reference ^definition = "custodianに対応するOrganizationリソースのfullUrl要素に指定されるUUIDを指定。\r\n例：\"urn:uuid:179f9f7f_e546_04c2_6888_a9e0b24e5720\""

* event 1..1 MS
* event ^short = "診療情報提供書の発行イベントの情報"
* event ^definition = "診療情報提供書の発行イベントの情報"
* event.code 1..1 MS
* event.code.coding ..0
* event.code.text 1.. MS
* event.code.text = "診療情報提供書発行" (exactly)
* event.period 1.. MS
* event.period ^short = "診療情報提供書発行日"
* event.period ^definition = "診療情報提供書発行日。ISO8601に準拠yyyy-mm-dd形式で記述する。"
* event.period.start 1.. MS
* event.period.start ^short = "診療情報提供書発行日"
* event.period.start ^definition = "診療情報提供書発行日。ISO8601に準拠yyyy-mm-dd形式で記述する。"
* event.period.end ^short = "診療情報提供書の場合記述しないが、startと同一であれば存在していてもよい"
* event.period.end ^definition = "診療情報提供書の場合記述しない。startと同一であれば存在していてもよい"

* section.code.coding from http://jpfhir.jp/fhir/eReferral/ValueSet/document-section
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code.coding.code"
* section ^slicing.rules = #open
* section contains
        referralFromSection  1..1 MS    // 紹介元情報セクション referralFromSection
    and referralToSection 1..1 MS  // 紹介先情報セクション referralToSection
    and cdaSection   0..1 MS // CDA参照セクション    cdaSection
    and compositionSection     0..1 MS // 構造情報セクション   compositionSection
	and attachmentSection    0..*    MS  //  添付情報セクション	attachmentSection
    and remarksCommunicationSection    0..*    MS  //  備考・連絡情報セクション	remarksCommunicationSection
    and pdfSection    0..*    MS  //  PDFセクション	pdfSection
// CDA参照セクションと構造情報セクションは、どちらか一方だけが出現する。制約条件の記述が必要。
//
* section[referralToSection] ^short = "紹介先情報セクション"
* section[referralToSection] ^definition = "紹介先情報セクション"
* section[referralToSection].title 1.. MS
* section[referralToSection].title = "紹介先情報" (exactly)
* section[referralToSection].title ^short = "セクションタイトル"
* section[referralToSection].title ^definition = "セクションタイトル。固定値。"
* section[referralToSection].code 1.. MS
* section[referralToSection].code ^short = "セクション区分コード"
* section[referralToSection].code ^definition = "セクション区分コード"
* section[referralToSection].code.coding 1..1 MS
* section[referralToSection].code.coding.system 1.. MS
* section[referralToSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[referralToSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[referralToSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[referralToSection].code.coding.code 1.. MS
* section[referralToSection].code.coding.code = #910 (exactly)
* section[referralToSection].code.coding.code ^short = "セクション区分のコード値"
* section[referralToSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[referralToSection].code.coding.display = "紹介先情報セクション"
* section[referralToSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[referralToSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[referralToSection].code.coding.display MS
* section[referralToSection].code.coding.userSelected ..0
* section[referralToSection].code.text ..0
* section[referralToSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[referralToSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[referralToSection].text MS
* section[referralToSection].text.status MS
* section[referralToSection].text.status = #additional (exactly)
* section[referralToSection].text.status ^short = "セクションの内容作成状態コード"
* section[referralToSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[referralToSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[referralToSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[referralToSection].mode ..0
* section[referralToSection].orderedBy ..0
* section[referralToSection].entry 1..3
* section[referralToSection].entry  ^slicing.discriminator.type = #profile
* section[referralToSection].entry  ^slicing.discriminator.path = "resolve()"
* section[referralToSection].entry  ^slicing.rules = #open
* section[referralToSection].entry contains
    referralToOrganization  1..1 MS
//    and referralToDepartment    0..1 MS
    and referralToDoctor    0..1 MS
* section[referralToSection].entry[referralToOrganization] only Reference(JP_Organization_eCS)
* section[referralToSection].entry[referralToOrganization] ^short = "紹介先医療機関"
* section[referralToSection].entry[referralToOrganization] ^definition = "紹介先医療機関.診療科情報をExtensionで含めることが可能。"
// * section[referralToSection].entry[referralToDepartment] only Reference(JP_Organization_eCS_department)
// * section[referralToSection].entry[referralToDepartment] ^short = "紹介先医療機関の診療科"
// * section[referralToSection].entry[referralToDepartment] ^definition = "紹介先医療機関の診療科"
* section[referralToSection].entry[referralToDoctor] only Reference(JP_Practitioner_eCS)
* section[referralToSection].entry[referralToDoctor] ^short = "紹介先医師"
* section[referralToSection].entry[referralToDoctor] ^definition = "紹介先医師"
* section[referralToSection].emptyReason ..1
* section[referralToSection].section ..0
//
//
* section[referralFromSection] ^short = "紹介元情報セクション"
* section[referralFromSection] ^definition = "紹介元情報セクション"
* section[referralFromSection].title 1.. MS
* section[referralFromSection].title = "紹介元情報" (exactly)
* section[referralFromSection].title ^short = "セクションタイトル"
* section[referralFromSection].title ^definition = "セクションタイトル。固定値。"
* section[referralFromSection].code 1.. MS
* section[referralFromSection].code ^short = "セクション区分コード"
* section[referralFromSection].code ^definition = "セクション区分コード"
* section[referralFromSection].code.coding 1..1 MS
* section[referralFromSection].code.coding.system 1.. MS
* section[referralFromSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[referralFromSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[referralFromSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[referralFromSection].code.coding.code 1.. MS
* section[referralFromSection].code.coding.code = #920 (exactly)
* section[referralFromSection].code.coding.code ^short = "セクション区分のコード値"
* section[referralFromSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[referralFromSection].code.coding.display = "紹介元情報セクション"
* section[referralFromSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[referralFromSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[referralFromSection].code.coding.display MS
* section[referralFromSection].code.coding.userSelected ..0
* section[referralFromSection].code.text ..0
* section[referralFromSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[referralFromSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[referralFromSection].text MS
* section[referralFromSection].text.status MS
* section[referralFromSection].text.status = #additional (exactly)
* section[referralFromSection].text.status ^short = "セクションの内容作成状態コード"
* section[referralFromSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[referralFromSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[referralFromSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[referralFromSection].mode ..0
* section[referralFromSection].orderedBy ..0
* section[referralFromSection].entry 1..3
* section[referralFromSection].entry  ^slicing.discriminator.type = #profile
* section[referralFromSection].entry  ^slicing.discriminator.path = "resolve()"
* section[referralFromSection].entry  ^slicing.rules = #open
* section[referralFromSection].entry contains
    referralFromOrganization  1..1 MS
//    and referralFromDepartment    0..1 MS
    and referralFromDoctor    0..1 MS
//* section[referralFromSection].entry[referralFromOrganization] only Reference(JP_Organization_eCS_issuer)
* section[referralFromSection].entry[referralFromOrganization] only Reference(JP_Organization_eCS)
* section[referralFromSection].entry[referralFromOrganization] ^short = "紹介元医療機関"
* section[referralFromSection].entry[referralFromOrganization] ^definition = "紹介元医療機関.診療科情報をExtensionで含めることが可能。"
// * section[referralFromSection].entry[referralFromDepartment] only Reference(JP_Organization_eCS_department)
// * section[referralFromSection].entry[referralFromDepartment] ^short = "紹介元医療機関の診療科"
// * section[referralFromSection].entry[referralFromDepartment] ^definition = "紹介元医療機関の診療科"
* section[referralFromSection].entry[referralFromDoctor] only Reference(JP_Practitioner_eCS)
* section[referralFromSection].entry[referralFromDoctor] ^short = "紹介元医師"
* section[referralFromSection].entry[referralFromDoctor] ^definition = "紹介元医師"
* section[referralFromSection].emptyReason ..1
* section[referralFromSection].section ..0
//
//
* section[cdaSection] ^short = "CDA参照セクション"
* section[cdaSection] ^definition = "CDA参照セクション"
* section[cdaSection].title 1.. MS
* section[cdaSection].title = "CDA参照" (exactly)
* section[cdaSection].title ^short = "セクションタイトル"
* section[cdaSection].title ^definition = "セクションタイトル。固定値。"
* section[cdaSection].code 1.. MS
* section[cdaSection].code ^short = "セクション区分コード"
* section[cdaSection].code ^definition = "セクション区分コード"
* section[cdaSection].code.coding 1..1 MS
* section[cdaSection].code.coding.system 1.. MS
* section[cdaSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[cdaSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[cdaSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[cdaSection].code.coding.code 1.. MS
* section[cdaSection].code.coding.code = #200 (exactly)
* section[cdaSection].code.coding.code ^short = "セクション区分のコード値"
* section[cdaSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[cdaSection].code.coding.display = "CDA参照セクション"
* section[cdaSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[cdaSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[cdaSection].code.coding.display MS
* section[cdaSection].code.coding.userSelected ..0
* section[cdaSection].code.text ..0
* section[cdaSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[cdaSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[cdaSection].text MS
* section[cdaSection].text.status MS
* section[cdaSection].text.status = #additional (exactly)
* section[cdaSection].text.status ^short = "セクションの内容作成状態コード"
* section[cdaSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[cdaSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[cdaSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[cdaSection].mode ..0
* section[cdaSection].orderedBy ..0
* section[cdaSection].entry 1..1
* section[cdaSection].entry only Reference(DocumentReference)
* section[cdaSection].entry ^short = "CDA規約文書ファイルへの参照"
* section[cdaSection].entry ^definition = "CDA規約文書ファイルへの参照"
* section[cdaSection].emptyReason ..1
* section[cdaSection].section ..0
//
//
//	and attachmentSection    0..*    MS  //  添付情報セクション	attachmentSection
//    and remarksCommunicationSection    0..*    MS  //  備考・連絡情報セクション	remarksCommunicationSection
* section[attachmentSection] ^short = "添付情報セクション"
* section[attachmentSection] ^definition = "添付情報セクション"
* section[attachmentSection].title 1.. MS
* section[attachmentSection].title = "添付情報" (exactly)
* section[attachmentSection].title ^short = "セクションタイトル"
* section[attachmentSection].title ^definition = "セクションタイトル。固定値。"
* section[attachmentSection].code 1.. MS
* section[attachmentSection].code ^short = "セクション区分コード"
* section[attachmentSection].code ^definition = "セクション区分コード"
* section[attachmentSection].code.coding 1..1 MS
* section[attachmentSection].code.coding.system 1.. MS
* section[attachmentSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[attachmentSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[attachmentSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[attachmentSection].code.coding.code 1.. MS
* section[attachmentSection].code.coding.code = #210 (exactly)
* section[attachmentSection].code.coding.code ^short = "セクション区分のコード値"
* section[attachmentSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[attachmentSection].code.coding.display = "添付情報セクション"
* section[attachmentSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[attachmentSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[attachmentSection].code.coding.display MS
* section[attachmentSection].code.coding.userSelected ..0
* section[attachmentSection].code.text ..0
* section[attachmentSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[attachmentSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[attachmentSection].text MS
* section[attachmentSection].text.status MS
* section[attachmentSection].text.status = #additional (exactly)
* section[attachmentSection].text.status ^short = "セクションの内容作成状態コード"
* section[attachmentSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[attachmentSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[attachmentSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[attachmentSection].mode ..0
* section[attachmentSection].orderedBy ..0
* section[attachmentSection].entry 1..*
* section[attachmentSection].entry only Reference(DocumentReference or Binary or Bundle)  // あえてJP_を外している
* section[attachmentSection].entry ^short = "添付情報ファイルへの参照"
* section[attachmentSection].entry ^definition = "添付情報ファイルへの参照"
* section[attachmentSection].emptyReason ..1
* section[attachmentSection].section ..0
//
//
* section[remarksCommunicationSection] ^short = "備考・連絡情報セクション"
* section[remarksCommunicationSection] ^definition = "備考・連絡情報セクション"
* section[remarksCommunicationSection].title 1.. MS
* section[remarksCommunicationSection].title = "備考・連絡情報" (exactly)
* section[remarksCommunicationSection].title ^short = "セクションタイトル"
* section[remarksCommunicationSection].title ^definition = "セクションタイトル。固定値。"
* section[remarksCommunicationSection].code 1.. MS
* section[remarksCommunicationSection].code ^short = "セクション区分コード"
* section[remarksCommunicationSection].code ^definition = "セクション区分コード"
* section[remarksCommunicationSection].code.coding 1..1 MS
* section[remarksCommunicationSection].code.coding.system 1.. MS
* section[remarksCommunicationSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[remarksCommunicationSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[remarksCommunicationSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[remarksCommunicationSection].code.coding.code 1.. MS
* section[remarksCommunicationSection].code.coding.code = #220 (exactly)
* section[remarksCommunicationSection].code.coding.code ^short = "セクション区分のコード値"
* section[remarksCommunicationSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[remarksCommunicationSection].code.coding.display = "備考・連絡情報セクション"
* section[remarksCommunicationSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[remarksCommunicationSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[remarksCommunicationSection].code.coding.display MS
* section[remarksCommunicationSection].code.coding.userSelected ..0
* section[remarksCommunicationSection].code.text ..0
* section[remarksCommunicationSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[remarksCommunicationSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[remarksCommunicationSection].text MS
* section[remarksCommunicationSection].text.status MS
* section[remarksCommunicationSection].text.status = #additional (exactly)
* section[remarksCommunicationSection].text.status ^short = "セクションの内容作成状態コード"
* section[remarksCommunicationSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[remarksCommunicationSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[remarksCommunicationSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[remarksCommunicationSection].mode ..0
* section[remarksCommunicationSection].orderedBy ..0
* section[remarksCommunicationSection].entry 0..1
* section[remarksCommunicationSection].entry only Reference(DocumentReference or Binary)  // あえてJP_を外している
* section[remarksCommunicationSection].entry ^short = "備考・連絡情報バイナリファイルへの参照"
* section[remarksCommunicationSection].entry ^definition = "備考・連絡情報バイナリファイルへの参照"
* section[remarksCommunicationSection].emptyReason ..1
* section[remarksCommunicationSection].section ..0
//
//
* section[pdfSection] ^short = "PDFセクション"
* section[pdfSection] ^definition = "PDFセクション"
* section[pdfSection].title 1.. MS
* section[pdfSection].title = "PDF" (exactly)
* section[pdfSection].title ^short = "セクションタイトル"
* section[pdfSection].title ^definition = "セクションタイトル。固定値。"
* section[pdfSection].code 1.. MS
* section[pdfSection].code ^short = "セクション区分コード"
* section[pdfSection].code ^definition = "セクション区分コード"
* section[pdfSection].code.coding 1..1 MS
* section[pdfSection].code.coding.system 1.. MS
* section[pdfSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[pdfSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[pdfSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[pdfSection].code.coding.code 1.. MS
* section[pdfSection].code.coding.code = #230 (exactly)
* section[pdfSection].code.coding.code ^short = "セクション区分のコード値"
* section[pdfSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[pdfSection].code.coding.display = "PDFセクション"
* section[pdfSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[pdfSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[pdfSection].code.coding.display MS
* section[pdfSection].code.coding.userSelected ..0
* section[pdfSection].code.text ..0
* section[pdfSection].text ..0 
* section[pdfSection].mode ..0
* section[pdfSection].orderedBy ..0
* section[pdfSection].entry 1..*
* section[pdfSection].entry only Reference(Binary)
* section[pdfSection].entry ^short = "PDFファイルへの参照"
* section[pdfSection].entry ^definition = "PDFファイルへの参照"
* section[pdfSection].emptyReason ..1
* section[pdfSection].section ..0
////////
* section[compositionSection] ^short = "構造情報セクション"
* section[compositionSection] ^definition = "構造情報セクション"
* section[compositionSection].title 1.. MS
* section[compositionSection].title = "構造情報" (exactly)
* section[compositionSection].title ^short = "セクションタイトル"
* section[compositionSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].code 1.. MS
* section[compositionSection].code ^short = "セクション区分コード"
* section[compositionSection].code ^definition = "セクション区分コード"
* section[compositionSection].code.coding 1..1 MS
* section[compositionSection].code.coding.system 1.. MS
* section[compositionSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].code.coding.code 1.. MS
* section[compositionSection].code.coding.code = #300 (exactly)
* section[compositionSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].code.coding.display = "構造情報セクション"
* section[compositionSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].code.coding.display MS
* section[compositionSection].code.coding.userSelected ..0
* section[compositionSection].code.text ..0
* section[compositionSection].text 0.. 
* section[compositionSection].mode ..0
* section[compositionSection].orderedBy ..0
* section[compositionSection].emptyReason ..1  MS
//* section[compositionSection].emptyReason.coding    1..1    MS
//* section[compositionSection].emptyReason.coding.system = "http://terminology.hl7.org/CodeSystem/list-empty-reason"
//* section[compositionSection].emptyReason.coding.code = #unavilable (exactly)
//
* section[compositionSection].section ^slicing.discriminator.type = #value
* section[compositionSection].section ^slicing.discriminator.path = "code.coding.code"
* section[compositionSection].section ^slicing.rules = #open

* section[compositionSection].section   contains 
        referralPurposeSection  1..1    MS  // 紹介目的セクション referralPurposeSection
    and problemSection    1..1    MS  // 傷病名・主訴セクション   problemSection
    and presentIllnessSection     1..1    MS  // 現病歴セクション presentIllnessSection
    and pastIllnessSection    0..1    MS  // 既往歴セクション pastIllnessSection
    and allergiesIIntoleranceSection      0..1    MS  // アレルギー・不耐性反応セクション allergiesIIntoleranceSection
    and familiyHistorySection     0..1    MS  // 家族歴セクション familiyHistorySection
    and admissionPhysicalStatusSection    0..1    MS  // 身体所見セクション   admissionPhysicalStatusSection
    and infectiousDiseaseInformationSection   0..1    MS  //  感染症情報セクション    infectiousDiseaseInformationSection"
    and socialHistorySection      0..1    MS  //  社会歴・生活習慣セクション  socialHistorySection
	and immunizationSection   0..1    MS  //  予防接種歴セクション    immunizationSection
	and surgicalProcedureSection      0..1    MS  //  手術セクション  surgucalProcedureSection
	and bloodInfusionProcedureSection     0..1    MS  //  輸血歴セクション    bloodInfusionProcedureSection
	and treatmentProcedureSection     0..1    MS  //  処置セクション	treatmentProcedureSection
	and medicationSection     0..1    MS  //  投薬指示セクション	medicationSection
	and examsStudySection     0..1    MS  //  検査結果セクション	examsStudySection 
	and clinicalCourseSection     0..1    MS  //  臨床経過セクション	clinicalCourseSection
	and clinicalInstructionSection    0..1    MS  //  診療方針指示セクション	clinicalInstructionSection
	and medicalDeviceSection      0..1    MS  //  医療機器セクション	medicalDeviceSection
	and advanceDirectiveSection   0..1    MS  //  事前指示セクション	advanceDirectiveSection
	and researchParticipationSection      0..1    MS  //  臨床研究参加セクション	researchParticipationSection
//
* section[compositionSection].section[referralPurposeSection]
* section[compositionSection].section[referralPurposeSection] ^short = "紹介目的セクション"
* section[compositionSection].section[referralPurposeSection] ^definition = "紹介目的セクション"
* section[compositionSection].section[referralPurposeSection].title 1.. MS
* section[compositionSection].section[referralPurposeSection].title = "紹介目的"
* section[compositionSection].section[referralPurposeSection].title ^short = "セクションタイトル"
* section[compositionSection].section[referralPurposeSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[referralPurposeSection].code 1.. MS
* section[compositionSection].section[referralPurposeSection].code ^short = "セクション区分コード"
* section[compositionSection].section[referralPurposeSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[referralPurposeSection].code.coding 1..1 MS
* section[compositionSection].section[referralPurposeSection].code.coding.system 1.. MS
* section[compositionSection].section[referralPurposeSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[referralPurposeSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[referralPurposeSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[referralPurposeSection].code.coding.code 1.. MS
* section[compositionSection].section[referralPurposeSection].code.coding.code = #950 (exactly)
* section[compositionSection].section[referralPurposeSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[referralPurposeSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[referralPurposeSection].code.coding.display = "紹介目的セクション"
* section[compositionSection].section[referralPurposeSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[referralPurposeSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[referralPurposeSection].code.coding.display MS
* section[compositionSection].section[referralPurposeSection].code.coding.userSelected ..0
* section[compositionSection].section[referralPurposeSection].code.text ..0
* section[compositionSection].section[referralPurposeSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[referralPurposeSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[referralPurposeSection].text MS
* section[compositionSection].section[referralPurposeSection].text.status MS
* section[compositionSection].section[referralPurposeSection].text.status = #additional (exactly)
* section[compositionSection].section[referralPurposeSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[referralPurposeSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[referralPurposeSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[referralPurposeSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[referralPurposeSection].mode ..0
* section[compositionSection].section[referralPurposeSection].orderedBy ..0
* section[compositionSection].section[referralPurposeSection].entry 0..1 MS
* section[compositionSection].section[referralPurposeSection].entry only Reference(JP_Encounter_eCS)
* section[compositionSection].section[referralPurposeSection].entry ^short = "必須。紹介先で予定している受診を記述したEncounterリソースを参照"
* section[compositionSection].section[referralPurposeSection].entry ^definition = "紹介先で予定している受診を記述したEncounterリソースを参照。Encounter.reasonCodeに紹介する理由を記述するが、疾患や症状にもとづく診療紹介の場合には、その症状や疾患のコードあるいはテキストを記述する。そうでない場合には、コード化にかかわらずEncounter.reasonCode.textに紹介理由もtext形式で記述する。"
* section[compositionSection].section[referralPurposeSection].emptyReason ..1 MS
* section[compositionSection].section[referralPurposeSection].section ..0
//
//
* section[compositionSection].section[problemSection]
* section[compositionSection].section[problemSection] ^short = "傷病名・主訴セクション"
* section[compositionSection].section[problemSection] ^definition = "傷病名・主訴セクション"
* section[compositionSection].section[problemSection].title 1.. MS
* section[compositionSection].section[problemSection].title = "傷病名・主訴"
* section[compositionSection].section[problemSection].title ^short = "セクションタイトル"
* section[compositionSection].section[problemSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[problemSection].code 1.. MS
* section[compositionSection].section[problemSection].code ^short = "セクション区分コード"
* section[compositionSection].section[problemSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[problemSection].code.coding 1..1 MS
* section[compositionSection].section[problemSection].code.coding.system 1.. MS
* section[compositionSection].section[problemSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[problemSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[problemSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[problemSection].code.coding.code 1.. MS
* section[compositionSection].section[problemSection].code.coding.code = #340 (exactly)
* section[compositionSection].section[problemSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[problemSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[problemSection].code.coding.display = "傷病名・主訴セクション"
* section[compositionSection].section[problemSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[problemSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[problemSection].code.coding.display MS
* section[compositionSection].section[problemSection].code.coding.userSelected ..0
* section[compositionSection].section[problemSection].code.text ..0
* section[compositionSection].section[problemSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[problemSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[problemSection].text MS
* section[compositionSection].section[problemSection].text.status MS
* section[compositionSection].section[problemSection].text.status = #additional (exactly)
* section[compositionSection].section[problemSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[problemSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[problemSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[problemSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[problemSection].mode ..0
* section[compositionSection].section[problemSection].orderedBy ..0
* section[compositionSection].section[problemSection].entry 0..* MS
* section[compositionSection].section[problemSection].entry only Reference(JP_Condition_eCS)
* section[compositionSection].section[problemSection].entry ^short = "必須。傷病名・主訴を１個以上必ず記述する。"
* section[compositionSection].section[problemSection].entry ^definition = "傷病名・主訴を１個以上必ず記述する。1つにつき1つのConditionで記述されたものを参照する。フリーテキストでしか記述できない場合には、Condition.code.text に記述する。"
* section[compositionSection].section[problemSection].emptyReason ..1 MS
* section[compositionSection].section[problemSection].section ..0
//
//
* section[compositionSection].section[presentIllnessSection]
* section[compositionSection].section[presentIllnessSection] ^short = "現病歴セクション"
* section[compositionSection].section[presentIllnessSection] ^definition = "現病歴セクション"
* section[compositionSection].section[presentIllnessSection].title 1.. MS
* section[compositionSection].section[presentIllnessSection].title = "現病歴"
* section[compositionSection].section[presentIllnessSection].title ^short = "セクションタイトル"
* section[compositionSection].section[presentIllnessSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[presentIllnessSection].code 1.. MS
* section[compositionSection].section[presentIllnessSection].code ^short = "セクション区分コード"
* section[compositionSection].section[presentIllnessSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[presentIllnessSection].code.coding 1..1 MS
* section[compositionSection].section[presentIllnessSection].code.coding.system 1.. MS
* section[compositionSection].section[presentIllnessSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[presentIllnessSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[presentIllnessSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[presentIllnessSection].code.coding.code 1.. MS
* section[compositionSection].section[presentIllnessSection].code.coding.code = #360 (exactly)
* section[compositionSection].section[presentIllnessSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[presentIllnessSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[presentIllnessSection].code.coding.display = "現病歴セクション"
* section[compositionSection].section[presentIllnessSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[presentIllnessSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[presentIllnessSection].code.coding.display MS
* section[compositionSection].section[presentIllnessSection].code.coding.userSelected ..0
* section[compositionSection].section[presentIllnessSection].code.text ..0
* section[compositionSection].section[presentIllnessSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[presentIllnessSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[presentIllnessSection].text MS
* section[compositionSection].section[presentIllnessSection].text.status MS
* section[compositionSection].section[presentIllnessSection].text.status = #additional (exactly)
* section[compositionSection].section[presentIllnessSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[presentIllnessSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[presentIllnessSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[presentIllnessSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[presentIllnessSection].mode ..0
* section[compositionSection].section[presentIllnessSection].orderedBy ..0
* section[compositionSection].section[presentIllnessSection].entry 0..* MS
* section[compositionSection].section[presentIllnessSection].entry only Reference(JP_Condition_eCS)
* section[compositionSection].section[presentIllnessSection].entry ^short = "必須。現病歴として記述すべき疾患に関する現在にいたる経過歴を１個以上必ず記述したConditionリソースを参照する。"
* section[compositionSection].section[presentIllnessSection].entry ^definition = "フリーテキストでしか記述できない場合には、それをCondition.code.text 
                                                                            およびCodition.noteに記述したConditionリソースを参照する。
                                                                            疾患ごとに分けて現病歴を記述できる場合には、それぞれをひとつのConditionリソースで記述して参照する。
                                                                            "
* section[compositionSection].section[presentIllnessSection].emptyReason ..1
* section[compositionSection].section[presentIllnessSection].section ..0
////
* section[compositionSection].section[pastIllnessSection]
* section[compositionSection].section[pastIllnessSection] ^short = "既往歴セクション"
* section[compositionSection].section[pastIllnessSection] ^definition = "既往歴セクション"
* section[compositionSection].section[pastIllnessSection].title 1.. MS
* section[compositionSection].section[pastIllnessSection].title = "既往歴"
* section[compositionSection].section[pastIllnessSection].title ^short = "セクションタイトル"
* section[compositionSection].section[pastIllnessSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[pastIllnessSection].code 1.. MS
* section[compositionSection].section[pastIllnessSection].code ^short = "セクション区分コード"
* section[compositionSection].section[pastIllnessSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[pastIllnessSection].code.coding 1..1 MS
* section[compositionSection].section[pastIllnessSection].code.coding.system 1.. MS
* section[compositionSection].section[pastIllnessSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[pastIllnessSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[pastIllnessSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[pastIllnessSection].code.coding.code 1.. MS
* section[compositionSection].section[pastIllnessSection].code.coding.code = #370 (exactly)
* section[compositionSection].section[pastIllnessSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[pastIllnessSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[pastIllnessSection].code.coding.display = "既往歴セクション"
* section[compositionSection].section[pastIllnessSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[pastIllnessSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[pastIllnessSection].code.coding.display MS
* section[compositionSection].section[pastIllnessSection].code.coding.userSelected ..0
* section[compositionSection].section[pastIllnessSection].code.text ..0
* section[compositionSection].section[pastIllnessSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[pastIllnessSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[pastIllnessSection].text MS
* section[compositionSection].section[pastIllnessSection].text.status MS
* section[compositionSection].section[pastIllnessSection].text.status = #additional (exactly)
* section[compositionSection].section[pastIllnessSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[pastIllnessSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[pastIllnessSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[pastIllnessSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[pastIllnessSection].mode ..0
* section[compositionSection].section[pastIllnessSection].orderedBy ..0
* section[compositionSection].section[pastIllnessSection].entry 0..* MS
* section[compositionSection].section[pastIllnessSection].entry only Reference(JP_Condition_eCS)
* section[compositionSection].section[pastIllnessSection].entry ^short = "既往歴をConditionリソースに記述して参照する。"
* section[compositionSection].section[pastIllnessSection].entry ^definition = "既往歴をConditionリソースに記述して参照する。
                                                                1つの既往疾患につき1つのConditionリソースで記述されたものを参照する。
                                                                記述すべき既往疾患が存在しないことを明示的に記述する（「既往特になし」など）場合にはentry要素は出現せず、emptyReasonにnilknownを記述する。
                                                                既往疾患情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                "
* section[compositionSection].section[pastIllnessSection].emptyReason ..1
* section[compositionSection].section[pastIllnessSection].section ..0
////
* section[compositionSection].section[allergiesIIntoleranceSection]
* section[compositionSection].section[allergiesIIntoleranceSection] ^short = "アレルギー・不耐性反応セクション"
* section[compositionSection].section[allergiesIIntoleranceSection] ^definition = "アレルギー・不耐性反応セクション"
* section[compositionSection].section[allergiesIIntoleranceSection].title 1.. MS
* section[compositionSection].section[allergiesIIntoleranceSection].title = "アレルギー・不耐性反応"
* section[compositionSection].section[allergiesIIntoleranceSection].title ^short = "セクションタイトル"
* section[compositionSection].section[allergiesIIntoleranceSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[allergiesIIntoleranceSection].code 1.. MS
* section[compositionSection].section[allergiesIIntoleranceSection].code ^short = "セクション区分コード"
* section[compositionSection].section[allergiesIIntoleranceSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding 1..1 MS
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.system 1.. MS
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.code 1.. MS
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.code = #510 (exactly)
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.display = "アレルギー・不耐性反応セクション"
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.display MS
* section[compositionSection].section[allergiesIIntoleranceSection].code.coding.userSelected ..0
* section[compositionSection].section[allergiesIIntoleranceSection].code.text ..0
* section[compositionSection].section[allergiesIIntoleranceSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[allergiesIIntoleranceSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[allergiesIIntoleranceSection].text MS
* section[compositionSection].section[allergiesIIntoleranceSection].text.status MS
* section[compositionSection].section[allergiesIIntoleranceSection].text.status = #additional (exactly)
* section[compositionSection].section[allergiesIIntoleranceSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[allergiesIIntoleranceSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[allergiesIIntoleranceSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[allergiesIIntoleranceSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[allergiesIIntoleranceSection].mode ..0
* section[compositionSection].section[allergiesIIntoleranceSection].orderedBy ..0
* section[compositionSection].section[allergiesIIntoleranceSection].entry 0..* MS
* section[compositionSection].section[allergiesIIntoleranceSection].entry only Reference(JP_AllergyIntolerance_eCS)
* section[compositionSection].section[allergiesIIntoleranceSection].entry ^short = "アレルギー・不耐性反応情報を記述したAllergyIntoleranceリソースを参照"
* section[compositionSection].section[allergiesIIntoleranceSection].entry ^definition = "アレルギー・不耐性反応情報を記述して参照する。
                                                                1つの既往疾患につき1つのAllergyIntoleranceリソースで記述されたものを参照する。
                                                                記述すべきアレルギー・不耐性反応情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                アレルギー・不耐性反応情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。                                                                
                                                                "
* section[compositionSection].section[allergiesIIntoleranceSection].emptyReason ..1
* section[compositionSection].section[allergiesIIntoleranceSection].section ..0
////
* section[compositionSection].section[familiyHistorySection]
* section[compositionSection].section[familiyHistorySection] ^short = "家族歴セクション"
* section[compositionSection].section[familiyHistorySection] ^definition = "家族歴セクション"
* section[compositionSection].section[familiyHistorySection].title 1.. MS
* section[compositionSection].section[familiyHistorySection].title = "家族歴"
* section[compositionSection].section[familiyHistorySection].title ^short = "セクションタイトル"
* section[compositionSection].section[familiyHistorySection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[familiyHistorySection].code 1.. MS
* section[compositionSection].section[familiyHistorySection].code ^short = "セクション区分コード"
* section[compositionSection].section[familiyHistorySection].code ^definition = "セクション区分コード"
* section[compositionSection].section[familiyHistorySection].code.coding 1..1 MS
* section[compositionSection].section[familiyHistorySection].code.coding.system 1.. MS
* section[compositionSection].section[familiyHistorySection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[familiyHistorySection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[familiyHistorySection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[familiyHistorySection].code.coding.code 1.. MS
* section[compositionSection].section[familiyHistorySection].code.coding.code = #550 (exactly)
* section[compositionSection].section[familiyHistorySection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[familiyHistorySection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[familiyHistorySection].code.coding.display = "家族歴セクション"
* section[compositionSection].section[familiyHistorySection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[familiyHistorySection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[familiyHistorySection].code.coding.display MS
* section[compositionSection].section[familiyHistorySection].code.coding.userSelected ..0
* section[compositionSection].section[familiyHistorySection].code.text ..0
* section[compositionSection].section[familiyHistorySection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[familiyHistorySection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[familiyHistorySection].text MS
* section[compositionSection].section[familiyHistorySection].text.status MS
* section[compositionSection].section[familiyHistorySection].text.status = #additional (exactly)
* section[compositionSection].section[familiyHistorySection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[familiyHistorySection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[familiyHistorySection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[familiyHistorySection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[familiyHistorySection].mode ..0
* section[compositionSection].section[familiyHistorySection].orderedBy ..0
* section[compositionSection].section[familiyHistorySection].entry 0..* MS
* section[compositionSection].section[familiyHistorySection].entry only Reference(JP_FamilyMemberHistory)
* section[compositionSection].section[familiyHistorySection].entry ^short = "家族歴情報を記述したFamilyMemberHistoryリソースを参照"
* section[compositionSection].section[familiyHistorySection].entry ^definition = "家族歴情報情報を記述して参照する。
                                                                1つの家族歴につき1つのFamilyMemberHistoryリソースで記述されたものを参照する。
                                                                記述すべき家族歴情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                家族歴情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                "
* section[compositionSection].section[familiyHistorySection].emptyReason ..1
* section[compositionSection].section[familiyHistorySection].section ..0
////
* section[compositionSection].section[admissionPhysicalStatusSection]
* section[compositionSection].section[admissionPhysicalStatusSection] ^short = "身体所見セクション"
* section[compositionSection].section[admissionPhysicalStatusSection] ^definition = "身体所見セクション"
* section[compositionSection].section[admissionPhysicalStatusSection].title 1.. MS
* section[compositionSection].section[admissionPhysicalStatusSection].title = "身体所見"
* section[compositionSection].section[admissionPhysicalStatusSection].title ^short = "セクションタイトル"
* section[compositionSection].section[admissionPhysicalStatusSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[admissionPhysicalStatusSection].code 1.. MS
* section[compositionSection].section[admissionPhysicalStatusSection].code ^short = "セクション区分コード"
* section[compositionSection].section[admissionPhysicalStatusSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding 1..1 MS
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.system 1.. MS
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.code 1.. MS
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.code = #610 (exactly)
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.display = "身体所見セクション"
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.display MS
* section[compositionSection].section[admissionPhysicalStatusSection].code.coding.userSelected ..0
* section[compositionSection].section[admissionPhysicalStatusSection].code.text ..0
* section[compositionSection].section[admissionPhysicalStatusSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[admissionPhysicalStatusSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[admissionPhysicalStatusSection].text MS
* section[compositionSection].section[admissionPhysicalStatusSection].text.status MS
* section[compositionSection].section[admissionPhysicalStatusSection].text.status = #additional (exactly)
* section[compositionSection].section[admissionPhysicalStatusSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[admissionPhysicalStatusSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[admissionPhysicalStatusSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[admissionPhysicalStatusSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[admissionPhysicalStatusSection].mode ..0
* section[compositionSection].section[admissionPhysicalStatusSection].orderedBy ..0
* section[compositionSection].section[admissionPhysicalStatusSection].entry 0..* MS
* section[compositionSection].section[admissionPhysicalStatusSection].entry only Reference(JP_Observation_Common)
* section[compositionSection].section[admissionPhysicalStatusSection].entry ^short = "身体所見を記述したObservationリソースを参照"
* section[compositionSection].section[admissionPhysicalStatusSection].entry ^definition = "身体所見を記述して参照する。
                                                                1つの身体所見につき1つのObservationリソースで記述されたものを参照する。
                                                                記述すべき身体所見が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                身体所見を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                "
* section[compositionSection].section[admissionPhysicalStatusSection].emptyReason ..1
* section[compositionSection].section[admissionPhysicalStatusSection].section ..0
////
* section[compositionSection].section[infectiousDiseaseInformationSection]
* section[compositionSection].section[infectiousDiseaseInformationSection] ^short = "感染症情報セクション"
* section[compositionSection].section[infectiousDiseaseInformationSection] ^definition = "感染症情報セクション"
* section[compositionSection].section[infectiousDiseaseInformationSection].title 1.. MS
* section[compositionSection].section[infectiousDiseaseInformationSection].title = "感染症情報"
* section[compositionSection].section[infectiousDiseaseInformationSection].title ^short = "セクションタイトル"
* section[compositionSection].section[infectiousDiseaseInformationSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[infectiousDiseaseInformationSection].code 1.. MS
* section[compositionSection].section[infectiousDiseaseInformationSection].code ^short = "セクション区分コード"
* section[compositionSection].section[infectiousDiseaseInformationSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding 1..1 MS
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.system 1.. MS
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.code 1.. MS
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.code = #520 (exactly)
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.display = "感染症情報セクション"
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.display MS
* section[compositionSection].section[infectiousDiseaseInformationSection].code.coding.userSelected ..0
* section[compositionSection].section[infectiousDiseaseInformationSection].code.text ..0
* section[compositionSection].section[infectiousDiseaseInformationSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[infectiousDiseaseInformationSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[infectiousDiseaseInformationSection].text MS
* section[compositionSection].section[infectiousDiseaseInformationSection].text.status MS
* section[compositionSection].section[infectiousDiseaseInformationSection].text.status = #additional (exactly)
* section[compositionSection].section[infectiousDiseaseInformationSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[infectiousDiseaseInformationSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[infectiousDiseaseInformationSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[infectiousDiseaseInformationSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[infectiousDiseaseInformationSection].mode ..0
* section[compositionSection].section[infectiousDiseaseInformationSection].orderedBy ..0
* section[compositionSection].section[infectiousDiseaseInformationSection].entry 0..* MS
* section[compositionSection].section[infectiousDiseaseInformationSection].entry only Reference(JP_Observation_Common_eCS)
* section[compositionSection].section[infectiousDiseaseInformationSection].entry ^short = "感染症情報を記述したObservationリソースを参照"
* section[compositionSection].section[infectiousDiseaseInformationSection].entry ^definition = "感染症情報を記述して参照する。
                                                                1つの感染症情報につき1つのObservationリソースで記述されたものを参照する。
                                                                記述すべき感染症情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                感染症情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                "
* section[compositionSection].section[infectiousDiseaseInformationSection].emptyReason ..1
* section[compositionSection].section[infectiousDiseaseInformationSection].section ..0
////
* section[compositionSection].section[socialHistorySection]
* section[compositionSection].section[socialHistorySection] ^short = "社会歴・生活習慣セクション"
* section[compositionSection].section[socialHistorySection] ^definition = "社会歴・生活習慣セクション"
* section[compositionSection].section[socialHistorySection].title 1.. MS
* section[compositionSection].section[socialHistorySection].title = "社会歴・生活習慣"
* section[compositionSection].section[socialHistorySection].title ^short = "セクションタイトル"
* section[compositionSection].section[socialHistorySection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[socialHistorySection].code 1.. MS
* section[compositionSection].section[socialHistorySection].code ^short = "セクション区分コード"
* section[compositionSection].section[socialHistorySection].code ^definition = "セクション区分コード"
* section[compositionSection].section[socialHistorySection].code.coding 1..1 MS
* section[compositionSection].section[socialHistorySection].code.coding.system 1.. MS
* section[compositionSection].section[socialHistorySection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[socialHistorySection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[socialHistorySection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[socialHistorySection].code.coding.code 1.. MS
* section[compositionSection].section[socialHistorySection].code.coding.code = #640 (exactly)
* section[compositionSection].section[socialHistorySection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[socialHistorySection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[socialHistorySection].code.coding.display = "社会歴・生活習慣セクション"
* section[compositionSection].section[socialHistorySection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[socialHistorySection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[socialHistorySection].code.coding.display MS
* section[compositionSection].section[socialHistorySection].code.coding.userSelected ..0
* section[compositionSection].section[socialHistorySection].code.text ..0
* section[compositionSection].section[socialHistorySection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[socialHistorySection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[socialHistorySection].text MS
* section[compositionSection].section[socialHistorySection].text.status MS
* section[compositionSection].section[socialHistorySection].text.status = #additional (exactly)
* section[compositionSection].section[socialHistorySection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[socialHistorySection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[socialHistorySection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[socialHistorySection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[socialHistorySection].mode ..0
* section[compositionSection].section[socialHistorySection].orderedBy ..0
* section[compositionSection].section[socialHistorySection].entry 0..* MS
* section[compositionSection].section[socialHistorySection].entry only Reference(JP_Observation_Common)
* section[compositionSection].section[socialHistorySection].entry ^short = "社会歴・生活習慣情報を記述したObservationリソースを参照"
* section[compositionSection].section[socialHistorySection].entry ^definition = "社会歴・生活習慣情報を記述して参照する。
                                                                1つの社会歴・生活習慣につき1つのObservationリソースで記述されたものを参照する。
                                                                記述すべき社会歴・生活習慣情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                社会歴・生活習慣情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[socialHistorySection].emptyReason ..1
* section[compositionSection].section[socialHistorySection].section ..0
////
* section[compositionSection].section[immunizationSection]
* section[compositionSection].section[immunizationSection] ^short = "予防接種歴セクション"
* section[compositionSection].section[immunizationSection] ^definition = "予防接種歴セクション"
* section[compositionSection].section[immunizationSection].title 1.. MS
* section[compositionSection].section[immunizationSection].title = "予防接種歴"
* section[compositionSection].section[immunizationSection].title ^short = "セクションタイトル"
* section[compositionSection].section[immunizationSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[immunizationSection].code 1.. MS
* section[compositionSection].section[immunizationSection].code ^short = "セクション区分コード"
* section[compositionSection].section[immunizationSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[immunizationSection].code.coding 1..1 MS
* section[compositionSection].section[immunizationSection].code.coding.system 1.. MS
* section[compositionSection].section[immunizationSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[immunizationSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[immunizationSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[immunizationSection].code.coding.code 1.. MS
* section[compositionSection].section[immunizationSection].code.coding.code = #530 (exactly)
* section[compositionSection].section[immunizationSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[immunizationSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[immunizationSection].code.coding.display = "予防接種歴セクション"
* section[compositionSection].section[immunizationSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[immunizationSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[immunizationSection].code.coding.display MS
* section[compositionSection].section[immunizationSection].code.coding.userSelected ..0
* section[compositionSection].section[immunizationSection].code.text ..0
* section[compositionSection].section[immunizationSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[immunizationSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[immunizationSection].text MS
* section[compositionSection].section[immunizationSection].text.status MS
* section[compositionSection].section[immunizationSection].text.status = #additional (exactly)
* section[compositionSection].section[immunizationSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[immunizationSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[immunizationSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[immunizationSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[immunizationSection].mode ..0
* section[compositionSection].section[immunizationSection].orderedBy ..0
* section[compositionSection].section[immunizationSection].entry 0..* MS
* section[compositionSection].section[immunizationSection].entry only Reference(JP_Immunization)
* section[compositionSection].section[immunizationSection].entry ^short = "予防接種歴情報を記述したImmunizationリソースを参照"
* section[compositionSection].section[immunizationSection].entry ^definition = "予防接種歴情報を記述して参照する。
                                                                1つの予防接種歴情報につき1つのImmunizationリソースで記述されたものを参照する。
                                                                記述すべき予防接種歴情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                予防接種歴情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[immunizationSection].emptyReason ..1
* section[compositionSection].section[immunizationSection].section ..0
////
* section[compositionSection].section[surgicalProcedureSection]
* section[compositionSection].section[surgicalProcedureSection] ^short = "手術セクション"
* section[compositionSection].section[surgicalProcedureSection] ^definition = "手術セクション"
* section[compositionSection].section[surgicalProcedureSection].title 1.. MS
* section[compositionSection].section[surgicalProcedureSection].title = "手術"
* section[compositionSection].section[surgicalProcedureSection].title ^short = "セクションタイトル"
* section[compositionSection].section[surgicalProcedureSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[surgicalProcedureSection].code 1.. MS
* section[compositionSection].section[surgicalProcedureSection].code ^short = "セクション区分コード"
* section[compositionSection].section[surgicalProcedureSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[surgicalProcedureSection].code.coding 1..1 MS
* section[compositionSection].section[surgicalProcedureSection].code.coding.system 1.. MS
* section[compositionSection].section[surgicalProcedureSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[surgicalProcedureSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[surgicalProcedureSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[surgicalProcedureSection].code.coding.code 1.. MS
* section[compositionSection].section[surgicalProcedureSection].code.coding.code = #730 (exactly)
* section[compositionSection].section[surgicalProcedureSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[surgicalProcedureSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[surgicalProcedureSection].code.coding.display = "手術セクション"
* section[compositionSection].section[surgicalProcedureSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[surgicalProcedureSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[surgicalProcedureSection].code.coding.display MS
* section[compositionSection].section[surgicalProcedureSection].code.coding.userSelected ..0
* section[compositionSection].section[surgicalProcedureSection].code.text ..0
* section[compositionSection].section[surgicalProcedureSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[surgicalProcedureSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[surgicalProcedureSection].text MS
* section[compositionSection].section[surgicalProcedureSection].text.status MS
* section[compositionSection].section[surgicalProcedureSection].text.status = #additional (exactly)
* section[compositionSection].section[surgicalProcedureSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[surgicalProcedureSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[surgicalProcedureSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[surgicalProcedureSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[surgicalProcedureSection].mode ..0
* section[compositionSection].section[surgicalProcedureSection].orderedBy ..0
* section[compositionSection].section[surgicalProcedureSection].entry 0..* MS
* section[compositionSection].section[surgicalProcedureSection].entry only Reference(JP_Procedure)
* section[compositionSection].section[surgicalProcedureSection].entry ^short = "手術情報を記述したProcedureリソースを参照"
* section[compositionSection].section[surgicalProcedureSection].entry ^definition = "手術情報を記述して参照する。
                                                                1つの手術情報につき1つのProcedureリソースで記述されたものを参照する。
                                                                記述すべき手術情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                手術情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[surgicalProcedureSection].emptyReason ..1
* section[compositionSection].section[surgicalProcedureSection].section ..0
////
* section[compositionSection].section[bloodInfusionProcedureSection]
* section[compositionSection].section[bloodInfusionProcedureSection] ^short = "輸血歴セクション"
* section[compositionSection].section[bloodInfusionProcedureSection] ^definition = "輸血歴セクション"
* section[compositionSection].section[bloodInfusionProcedureSection].title 1.. MS
* section[compositionSection].section[bloodInfusionProcedureSection].title = "輸血歴"
* section[compositionSection].section[bloodInfusionProcedureSection].title ^short = "セクションタイトル"
* section[compositionSection].section[bloodInfusionProcedureSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[bloodInfusionProcedureSection].code 1.. MS
* section[compositionSection].section[bloodInfusionProcedureSection].code ^short = "セクション区分コード"
* section[compositionSection].section[bloodInfusionProcedureSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding 1..1 MS
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.system 1.. MS
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.code 1.. MS
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.code = #740 (exactly)
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.display = "輸血歴セクション"
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.display MS
* section[compositionSection].section[bloodInfusionProcedureSection].code.coding.userSelected ..0
* section[compositionSection].section[bloodInfusionProcedureSection].code.text ..0
* section[compositionSection].section[bloodInfusionProcedureSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[bloodInfusionProcedureSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[bloodInfusionProcedureSection].text MS
* section[compositionSection].section[bloodInfusionProcedureSection].text.status MS
* section[compositionSection].section[bloodInfusionProcedureSection].text.status = #additional (exactly)
* section[compositionSection].section[bloodInfusionProcedureSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[bloodInfusionProcedureSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[bloodInfusionProcedureSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[bloodInfusionProcedureSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[bloodInfusionProcedureSection].mode ..0
* section[compositionSection].section[bloodInfusionProcedureSection].orderedBy ..0
* section[compositionSection].section[bloodInfusionProcedureSection].entry 0..* MS
* section[compositionSection].section[bloodInfusionProcedureSection].entry only Reference(JP_Procedure)
* section[compositionSection].section[bloodInfusionProcedureSection].entry ^short = "輸血歴情報を記述したProcedureリソースを参照"
* section[compositionSection].section[bloodInfusionProcedureSection].entry ^definition = "輸血歴情報を記述して参照する。
                                                                1つの輸血歴情報につき1つのProcedureリソースで記述されたものを参照する。
                                                                記述すべき輸血歴情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                輸血歴情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[bloodInfusionProcedureSection].emptyReason ..1
* section[compositionSection].section[bloodInfusionProcedureSection].section ..0
////
* section[compositionSection].section[treatmentProcedureSection]
* section[compositionSection].section[treatmentProcedureSection] ^short = "処置セクション"
* section[compositionSection].section[treatmentProcedureSection] ^definition = "処置セクション"
* section[compositionSection].section[treatmentProcedureSection].title 1.. MS
* section[compositionSection].section[treatmentProcedureSection].title = "処置"
* section[compositionSection].section[treatmentProcedureSection].title ^short = "セクションタイトル"
* section[compositionSection].section[treatmentProcedureSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[treatmentProcedureSection].code 1.. MS
* section[compositionSection].section[treatmentProcedureSection].code ^short = "セクション区分コード"
* section[compositionSection].section[treatmentProcedureSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[treatmentProcedureSection].code.coding 1..1 MS
* section[compositionSection].section[treatmentProcedureSection].code.coding.system 1.. MS
* section[compositionSection].section[treatmentProcedureSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[treatmentProcedureSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[treatmentProcedureSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[treatmentProcedureSection].code.coding.code 1.. MS
* section[compositionSection].section[treatmentProcedureSection].code.coding.code = #720 (exactly)
* section[compositionSection].section[treatmentProcedureSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[treatmentProcedureSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[treatmentProcedureSection].code.coding.display = "処置セクション"
* section[compositionSection].section[treatmentProcedureSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[treatmentProcedureSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[treatmentProcedureSection].code.coding.display MS
* section[compositionSection].section[treatmentProcedureSection].code.coding.userSelected ..0
* section[compositionSection].section[treatmentProcedureSection].code.text ..0
* section[compositionSection].section[treatmentProcedureSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[treatmentProcedureSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[treatmentProcedureSection].text MS
* section[compositionSection].section[treatmentProcedureSection].text.status MS
* section[compositionSection].section[treatmentProcedureSection].text.status = #additional (exactly)
* section[compositionSection].section[treatmentProcedureSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[treatmentProcedureSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[treatmentProcedureSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[treatmentProcedureSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[treatmentProcedureSection].mode ..0
* section[compositionSection].section[treatmentProcedureSection].orderedBy ..0
* section[compositionSection].section[treatmentProcedureSection].entry 0..* MS
* section[compositionSection].section[treatmentProcedureSection].entry only Reference(JP_Procedure)
* section[compositionSection].section[treatmentProcedureSection].entry ^short = "処置情報を記述したProcedureリソースを参照"
* section[compositionSection].section[treatmentProcedureSection].entry ^definition = "処置情報を記述して参照する。
                                                                1つの処置情報につき1つのProcedureリソースで記述されたものを参照する。
                                                                記述すべき処置情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                処置情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[treatmentProcedureSection].emptyReason ..1
* section[compositionSection].section[treatmentProcedureSection].section ..0
////
* section[compositionSection].section[medicationSection]
* section[compositionSection].section[medicationSection] ^short = "投薬指示セクション"
* section[compositionSection].section[medicationSection] ^definition = "投薬指示セクション"
* section[compositionSection].section[medicationSection].title 1.. MS
* section[compositionSection].section[medicationSection].title = "投薬指示"
* section[compositionSection].section[medicationSection].title ^short = "セクションタイトル"
* section[compositionSection].section[medicationSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[medicationSection].code 1.. MS
* section[compositionSection].section[medicationSection].code ^short = "セクション区分コード"
* section[compositionSection].section[medicationSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[medicationSection].code.coding 1..1 MS
* section[compositionSection].section[medicationSection].code.coding.system 1.. MS
* section[compositionSection].section[medicationSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[medicationSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[medicationSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[medicationSection].code.coding.code 1.. MS
* section[compositionSection].section[medicationSection].code.coding.code = #430 (exactly)
* section[compositionSection].section[medicationSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[medicationSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[medicationSection].code.coding.display = "投薬指示セクション"
* section[compositionSection].section[medicationSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[medicationSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[medicationSection].code.coding.display MS
* section[compositionSection].section[medicationSection].code.coding.userSelected ..0
* section[compositionSection].section[medicationSection].code.text ..0
* section[compositionSection].section[medicationSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[medicationSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[medicationSection].text MS
* section[compositionSection].section[medicationSection].text.status MS
* section[compositionSection].section[medicationSection].text.status = #additional (exactly)
* section[compositionSection].section[medicationSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[medicationSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[medicationSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[medicationSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[medicationSection].mode ..0
* section[compositionSection].section[medicationSection].orderedBy ..0
* section[compositionSection].section[medicationSection].entry 0..* MS
* section[compositionSection].section[medicationSection].entry only Reference(JP_MedicationRequest_eCS)
* section[compositionSection].section[medicationSection].entry ^short = "投薬指示情報を記述したMedicationRequestリソースを参照"
* section[compositionSection].section[medicationSection].entry ^definition = "投薬指示情報を記述して参照する。
                                                                1つの投薬指示情報につき1つのMedicationRequestリソースで記述されたものを参照する。
                                                                記述すべき投薬指示情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                投薬指示情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[medicationSection].emptyReason ..1
* section[compositionSection].section[medicationSection].section ..0
////
* section[compositionSection].section[examsStudySection]
* section[compositionSection].section[examsStudySection] ^short = "検査結果セクション"
* section[compositionSection].section[examsStudySection] ^definition = "検査結果セクション"
* section[compositionSection].section[examsStudySection].title 1.. MS
* section[compositionSection].section[examsStudySection].title = "検査結果"
* section[compositionSection].section[examsStudySection].title ^short = "セクションタイトル"
* section[compositionSection].section[examsStudySection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[examsStudySection].code 1.. MS
* section[compositionSection].section[examsStudySection].code ^short = "セクション区分コード"
* section[compositionSection].section[examsStudySection].code ^definition = "セクション区分コード"
* section[compositionSection].section[examsStudySection].code.coding 1..1 MS
* section[compositionSection].section[examsStudySection].code.coding.system 1.. MS
* section[compositionSection].section[examsStudySection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[examsStudySection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[examsStudySection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[examsStudySection].code.coding.code 1.. MS
* section[compositionSection].section[examsStudySection].code.coding.code = #620 (exactly)
* section[compositionSection].section[examsStudySection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[examsStudySection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[examsStudySection].code.coding.display = "検査結果セクション"
* section[compositionSection].section[examsStudySection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[examsStudySection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[examsStudySection].code.coding.display MS
* section[compositionSection].section[examsStudySection].code.coding.userSelected ..0
* section[compositionSection].section[examsStudySection].code.text ..0
* section[compositionSection].section[examsStudySection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[examsStudySection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[examsStudySection].text MS
* section[compositionSection].section[examsStudySection].text.status MS
* section[compositionSection].section[examsStudySection].text.status = #additional (exactly)
* section[compositionSection].section[examsStudySection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[examsStudySection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[examsStudySection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[examsStudySection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[examsStudySection].mode ..0
* section[compositionSection].section[examsStudySection].orderedBy ..0
* section[compositionSection].section[examsStudySection].entry 0..* MS
/*
Alias: $JP_Observation_BodyMeasurement = http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_BodyMeasurement
Alias: $JP_Observation_Common = http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Common
Alias: $JP_Observation_LabResult = http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult
Alias: $JP_Observation_PhysicalExam = http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_PhysicalExam
Alias: $JP_Observation_SocialHistory = http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_SocialHistory
Alias: $JP_Observation_VitalSigns = http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_VitalSigns
*/
* section[compositionSection].section[examsStudySection].entry only Reference(JP_Observation_Common or 	ImagingStudy or DiagnosticReport or JP_Observation_BodyMeasurement or JP_Observation_Common or JP_Observation_LabResult or JP_Observation_PhysicalExam or JP_Observation_SocialHistory or JP_Observation_VitalSigns)
* section[compositionSection].section[examsStudySection].entry ^short = "検査結果情報を記述したObservationリソースを参照"
* section[compositionSection].section[examsStudySection].entry ^definition = "検査結果情報を記述して参照する。
                                                                1つの検査結果情報につき1つのObservationリソースで記述されたものを参照する。
                                                                記述すべき検査結果情報が存在しないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                検査結果情報を聴取しようとしていない場合でそれを明示的に記述する（「取得せず」など）場合にはentry要素は出現せず、emptyReasonに notasked を記述する。
                                                                情報が患者やシステムから取得できない状況でそれを明示的に記述する（「取得できず」「不明」など）場合にはentry要素は出現せず、emptyReasonに unavailable を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                               "
* section[compositionSection].section[examsStudySection].emptyReason ..1
* section[compositionSection].section[examsStudySection].section ..0
////
* section[compositionSection].section[clinicalCourseSection]
* section[compositionSection].section[clinicalCourseSection] ^short = "臨床経過セクション"
* section[compositionSection].section[clinicalCourseSection] ^definition = "臨床経過セクション"
* section[compositionSection].section[clinicalCourseSection].title 1.. MS
* section[compositionSection].section[clinicalCourseSection].title = "臨床経過"
* section[compositionSection].section[clinicalCourseSection].title ^short = "セクションタイトル"
* section[compositionSection].section[clinicalCourseSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[clinicalCourseSection].code 1.. MS
* section[compositionSection].section[clinicalCourseSection].code ^short = "セクション区分コード"
* section[compositionSection].section[clinicalCourseSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[clinicalCourseSection].code.coding 1..1 MS
* section[compositionSection].section[clinicalCourseSection].code.coding.system 1.. MS
* section[compositionSection].section[clinicalCourseSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[clinicalCourseSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[clinicalCourseSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[clinicalCourseSection].code.coding.code 1.. MS
* section[compositionSection].section[clinicalCourseSection].code.coding.code = #330 (exactly)
* section[compositionSection].section[clinicalCourseSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[clinicalCourseSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[clinicalCourseSection].code.coding.display = "臨床経過セクション"
* section[compositionSection].section[clinicalCourseSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[clinicalCourseSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[clinicalCourseSection].code.coding.display MS
* section[compositionSection].section[clinicalCourseSection].code.coding.userSelected ..0
* section[compositionSection].section[clinicalCourseSection].code.text ..0
* section[compositionSection].section[clinicalCourseSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[clinicalCourseSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[clinicalCourseSection].text MS
* section[compositionSection].section[clinicalCourseSection].text.status MS
* section[compositionSection].section[clinicalCourseSection].text.status = #additional (exactly)
* section[compositionSection].section[clinicalCourseSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[clinicalCourseSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[clinicalCourseSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[clinicalCourseSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[clinicalCourseSection].mode ..0
* section[compositionSection].section[clinicalCourseSection].orderedBy ..0
* section[compositionSection].section[clinicalCourseSection].entry 0..* MS
* section[compositionSection].section[clinicalCourseSection].entry only Reference(JP_DocumentReference)
* section[compositionSection].section[clinicalCourseSection].entry ^short = "必須。臨床経過を記述したDocumentReferenceリソースを参照"
* section[compositionSection].section[clinicalCourseSection].entry ^definition = "臨床経過を記述して参照する。
                                                                1つ以上のDocumentReferenceリソースで記述されたものを参照する。
                                                                診療情報提供書では臨床経過の記述は常に必要である。
                                                                "
* section[compositionSection].section[clinicalCourseSection].emptyReason ..1
* section[compositionSection].section[clinicalCourseSection].section ..0
////
* section[compositionSection].section[clinicalInstructionSection]
* section[compositionSection].section[clinicalInstructionSection] ^short = "診療方針指示セクション"
* section[compositionSection].section[clinicalInstructionSection] ^definition = "診療方針指示セクション"
* section[compositionSection].section[clinicalInstructionSection].title 1.. MS
* section[compositionSection].section[clinicalInstructionSection].title = "診療方針指示"
* section[compositionSection].section[clinicalInstructionSection].title ^short = "セクションタイトル"
* section[compositionSection].section[clinicalInstructionSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[clinicalInstructionSection].code 1.. MS
* section[compositionSection].section[clinicalInstructionSection].code ^short = "セクション区分コード"
* section[compositionSection].section[clinicalInstructionSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[clinicalInstructionSection].code.coding 1..1 MS
* section[compositionSection].section[clinicalInstructionSection].code.coding.system 1.. MS
* section[compositionSection].section[clinicalInstructionSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[clinicalInstructionSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[clinicalInstructionSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[clinicalInstructionSection].code.coding.code 1.. MS
* section[compositionSection].section[clinicalInstructionSection].code.coding.code = #420 (exactly)
* section[compositionSection].section[clinicalInstructionSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[clinicalInstructionSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[clinicalInstructionSection].code.coding.display = "診療方針指示セクション"
* section[compositionSection].section[clinicalInstructionSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[clinicalInstructionSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[clinicalInstructionSection].code.coding.display MS
* section[compositionSection].section[clinicalInstructionSection].code.coding.userSelected ..0
* section[compositionSection].section[clinicalInstructionSection].code.text ..0
* section[compositionSection].section[clinicalInstructionSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[clinicalInstructionSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[clinicalInstructionSection].text MS
* section[compositionSection].section[clinicalInstructionSection].text.status MS
* section[compositionSection].section[clinicalInstructionSection].text.status = #additional (exactly)
* section[compositionSection].section[clinicalInstructionSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[clinicalInstructionSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[clinicalInstructionSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[clinicalInstructionSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[clinicalInstructionSection].mode ..0
* section[compositionSection].section[clinicalInstructionSection].orderedBy ..0
* section[compositionSection].section[clinicalInstructionSection].entry 0..* MS
* section[compositionSection].section[clinicalInstructionSection].entry only Reference(JP_CarePlan)
* section[compositionSection].section[clinicalInstructionSection].entry ^short = "診療方針指示を記述したCarePlanリソースを参照"
* section[compositionSection].section[clinicalInstructionSection].entry ^definition = "診療方針指示を記述して参照する。
                                                                1つの指示をひとつのCarePlanリソースで記述されたものを参照する。
                                                                記述すべき診療方針指示が特にないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[clinicalInstructionSection].emptyReason ..1
* section[compositionSection].section[clinicalInstructionSection].section ..0
////
* section[compositionSection].section[medicalDeviceSection]
* section[compositionSection].section[medicalDeviceSection] ^short = "医療機器セクション"
* section[compositionSection].section[medicalDeviceSection] ^definition = "医療機器セクション"
* section[compositionSection].section[medicalDeviceSection].title 1.. MS
* section[compositionSection].section[medicalDeviceSection].title = "医療機器"
* section[compositionSection].section[medicalDeviceSection].title ^short = "セクションタイトル"
* section[compositionSection].section[medicalDeviceSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[medicalDeviceSection].code 1.. MS
* section[compositionSection].section[medicalDeviceSection].code ^short = "セクション区分コード"
* section[compositionSection].section[medicalDeviceSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[medicalDeviceSection].code.coding 1..1 MS
* section[compositionSection].section[medicalDeviceSection].code.coding.system 1.. MS
* section[compositionSection].section[medicalDeviceSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[medicalDeviceSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[medicalDeviceSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[medicalDeviceSection].code.coding.code 1.. MS
* section[compositionSection].section[medicalDeviceSection].code.coding.code = #810 (exactly)
* section[compositionSection].section[medicalDeviceSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[medicalDeviceSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[medicalDeviceSection].code.coding.display = "医療機器セクション"
* section[compositionSection].section[medicalDeviceSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[medicalDeviceSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[medicalDeviceSection].code.coding.display MS
* section[compositionSection].section[medicalDeviceSection].code.coding.userSelected ..0
* section[compositionSection].section[medicalDeviceSection].code.text ..0
* section[compositionSection].section[medicalDeviceSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[medicalDeviceSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[medicalDeviceSection].text MS
* section[compositionSection].section[medicalDeviceSection].text.status MS
* section[compositionSection].section[medicalDeviceSection].text.status = #additional (exactly)
* section[compositionSection].section[medicalDeviceSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[medicalDeviceSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[medicalDeviceSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[medicalDeviceSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[medicalDeviceSection].mode ..0
* section[compositionSection].section[medicalDeviceSection].orderedBy ..0
* section[compositionSection].section[medicalDeviceSection].entry 0..* MS
* section[compositionSection].section[medicalDeviceSection].entry only Reference(JP_DeviceUseStatement)
* section[compositionSection].section[medicalDeviceSection].entry ^short = "医療機器情報を記述したDocumentReferenceリソースを参照"
* section[compositionSection].section[medicalDeviceSection].entry ^definition = "医療機器情報を記述して参照する。
                                                                1つの医療機器情報をひとつのDeviceUseStatementリソースで記述されたものを参照する。
                                                                記述すべき医療機器情報が特にないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[medicalDeviceSection].emptyReason ..1
* section[compositionSection].section[medicalDeviceSection].section ..0
////
* section[compositionSection].section[advanceDirectiveSection]
* section[compositionSection].section[advanceDirectiveSection] ^short = "事前指示セクション"
* section[compositionSection].section[advanceDirectiveSection] ^definition = "事前指示セクション"
* section[compositionSection].section[advanceDirectiveSection].title 1.. MS
* section[compositionSection].section[advanceDirectiveSection].title = "事前指示"
* section[compositionSection].section[advanceDirectiveSection].title ^short = "セクションタイトル"
* section[compositionSection].section[advanceDirectiveSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[advanceDirectiveSection].code 1.. MS
* section[compositionSection].section[advanceDirectiveSection].code ^short = "セクション区分コード"
* section[compositionSection].section[advanceDirectiveSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[advanceDirectiveSection].code.coding 1..1 MS
* section[compositionSection].section[advanceDirectiveSection].code.coding.system 1.. MS
* section[compositionSection].section[advanceDirectiveSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[advanceDirectiveSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[advanceDirectiveSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[advanceDirectiveSection].code.coding.code 1.. MS
* section[compositionSection].section[advanceDirectiveSection].code.coding.code = #410 (exactly)
* section[compositionSection].section[advanceDirectiveSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[advanceDirectiveSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[advanceDirectiveSection].code.coding.display = "事前指示セクション"
* section[compositionSection].section[advanceDirectiveSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[advanceDirectiveSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[advanceDirectiveSection].code.coding.display MS
* section[compositionSection].section[advanceDirectiveSection].code.coding.userSelected ..0
* section[compositionSection].section[advanceDirectiveSection].code.text ..0
* section[compositionSection].section[advanceDirectiveSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[advanceDirectiveSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[advanceDirectiveSection].text MS
* section[compositionSection].section[advanceDirectiveSection].text.status MS
* section[compositionSection].section[advanceDirectiveSection].text.status = #additional (exactly)
* section[compositionSection].section[advanceDirectiveSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[advanceDirectiveSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[advanceDirectiveSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[advanceDirectiveSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[advanceDirectiveSection].mode ..0
* section[compositionSection].section[advanceDirectiveSection].orderedBy ..0
* section[compositionSection].section[advanceDirectiveSection].entry 0..* MS
* section[compositionSection].section[advanceDirectiveSection].entry only Reference(JP_Consent)
* section[compositionSection].section[advanceDirectiveSection].entry ^short = "事前指示を記述したConcentリソースを参照"
* section[compositionSection].section[advanceDirectiveSection].entry ^definition = "事前指示を記述して参照する。
                                                                1つの指示をひとつのConsentリソースで記述されたものを参照する。
                                                                記述すべき事前指示が特にないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[advanceDirectiveSection].emptyReason ..1
* section[compositionSection].section[advanceDirectiveSection].section ..0
////
* section[compositionSection].section[researchParticipationSection]
* section[compositionSection].section[researchParticipationSection] ^short = "臨床研究参加セクション"
* section[compositionSection].section[researchParticipationSection] ^definition = "臨床研究参加セクション"
* section[compositionSection].section[researchParticipationSection].title 1.. MS
* section[compositionSection].section[researchParticipationSection].title = "臨床研究参加"
* section[compositionSection].section[researchParticipationSection].title ^short = "セクションタイトル"
* section[compositionSection].section[researchParticipationSection].title ^definition = "セクションタイトル。固定値。"
* section[compositionSection].section[researchParticipationSection].code 1.. MS
* section[compositionSection].section[researchParticipationSection].code ^short = "セクション区分コード"
* section[compositionSection].section[researchParticipationSection].code ^definition = "セクション区分コード"
* section[compositionSection].section[researchParticipationSection].code.coding 1..1 MS
* section[compositionSection].section[researchParticipationSection].code.coding.system 1.. MS
* section[compositionSection].section[researchParticipationSection].code.coding.system = "http://jpfhir.jp/fhir/eReferral/CodeSystem/document-section" (exactly)
* section[compositionSection].section[researchParticipationSection].code.coding.system ^short = "セクション区分コードのコード体系"
* section[compositionSection].section[researchParticipationSection].code.coding.system ^definition = "セクション区分コードのコード体系を識別するURI。固定値。"
* section[compositionSection].section[researchParticipationSection].code.coding.code 1.. MS
* section[compositionSection].section[researchParticipationSection].code.coding.code = #830 (exactly)
* section[compositionSection].section[researchParticipationSection].code.coding.code ^short = "セクション区分のコード値"
* section[compositionSection].section[researchParticipationSection].code.coding.code ^definition = "セクション区分のコード値。\r\n固定値。"
* section[compositionSection].section[researchParticipationSection].code.coding.display = "臨床研究参加セクション"
* section[compositionSection].section[researchParticipationSection].code.coding.display ^short = "セクション区分コードの表示名"
* section[compositionSection].section[researchParticipationSection].code.coding.display ^definition = "セクション区分コードの表示名。"
* section[compositionSection].section[researchParticipationSection].code.coding.display MS
* section[compositionSection].section[researchParticipationSection].code.coding.userSelected ..0
* section[compositionSection].section[researchParticipationSection].code.text ..0
* section[compositionSection].section[researchParticipationSection].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[compositionSection].section[researchParticipationSection].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[compositionSection].section[researchParticipationSection].text MS
* section[compositionSection].section[researchParticipationSection].text.status MS
* section[compositionSection].section[researchParticipationSection].text.status = #additional (exactly)
* section[compositionSection].section[researchParticipationSection].text.status ^short = "セクションの内容作成状態コード"
* section[compositionSection].section[researchParticipationSection].text.status ^definition = "generated | extensions | additional | empty　から　\"additional\" の固定値。このセクションに含められるすべてのentry要素による情報に加えて、それらで表現し尽くせていない情報も含めた完全な叙述表現であることを示す。"
* section[compositionSection].section[researchParticipationSection].text.div ^short = "xhtml簡略形式に従った叙述記述データ"
* section[compositionSection].section[researchParticipationSection].text.div ^definition = "本セクションの内容を xhtml 形式のテキストで表現した文字列。内容を省略しても構わない。 \r\nこのデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。\r\nテキストは構造化された情報から自動的にシステムが生成したものとし、それ以上に情報を追加してはならない。"
* section[compositionSection].section[researchParticipationSection].mode ..0
* section[compositionSection].section[researchParticipationSection].orderedBy ..0
* section[compositionSection].section[researchParticipationSection].entry 0..* MS
* section[compositionSection].section[researchParticipationSection].entry only Reference(JP_ResearchSubject)
* section[compositionSection].section[researchParticipationSection].entry ^short = "臨床研究参加情報を記述したDocumentReferenceリソースを参照"
* section[compositionSection].section[researchParticipationSection].entry ^definition = "臨床研究参加情報を記述して参照する。
                                                                1つの臨床研究参加情報をひとつのResearchSubjectリソースで記述されたものを参照する。
                                                                記述すべき臨床研究参加情報が特にないことを明示的に記述する（「特になし」など）場合にはentry要素は出現せず、emptyReasonに nilknown を記述する。
                                                                記述すべき情報が特にない場合であって、そのことを明示的に記述する必要もない場合には、このサブセクションを出現させない。
                                                                "
* section[compositionSection].section[researchParticipationSection].emptyReason ..1
* section[compositionSection].section[researchParticipationSection].section ..0
//