
Profile: JP_Composition_sample001
Parent: Composition
Id: JP-Composition-sample001
Description:  "サンプルCompositionプロファイル"
* ^url = "http://jpfhir.jp/fhir/IGsample/StructureDefinition/JP_Composition_sample"
* ^status = #active
* meta.lastUpdated 1.. MS
* meta.profile 1.. MS

* identifier 1.. MS
* identifier.system 1.. MS
* identifier.system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier" (exactly)
* identifier.value 1.. MS

* status = #final (exactly)

* type ^short = "文書区分コード"
* type ^definition = "documentタイプのうち文書種別"
* type MS
* type from http://jpfhir.jp/fhir/IGsample/ValueSet/doc-typecodes (required)
* type.coding.code = #12345-1
* type.coding.display = "サンプル医療文書種別"

* category 1..1 MS
* category ^short = "文書カテゴリーコード"
* category ^definition = "文書カテゴリーコード。type.coding.codeに記述される文書区分コードと同一とすることもあり。"
* category.coding 1..1 MS
* category from http://jpfhir.jp/fhir/IGsample/ValueSet/doc-typecodes (required)
* category.coding.code = #12345-1 (exactly)
* category.coding.display = "サンプル医療文書種別"

* subject 1.. MS
* subject ^short = "患者情報を表すPatientリソースへの参照。"
* subject ^definition = "患者情報を表すPatientリソースへの参照。"
* subject.reference 1..1 MS
* subject only  Reference(JP_Patient)


* title 1..1 MS
* title = "サンプル文書" (exactly)

* custodian 0..1 MS
* custodian ^short = "文書の作成・修正を行い、文書の管理責任を持つ医療機関（Organizationリソース）への参照"
* custodian ^definition = "文書作成機関と同一の組織の場合、custodian要素からは文書作成機関を表すOrganizationリソースへの参照となる。文書作成機関とは異なる組織である場合は、文書作成機関とは別のOrganizationリソースで表現し、custodian要素からはそのOrganizationリソースを参照する。"
* custodian only Reference(JP_Organization)
* section.code.coding from http://jpfhir.jp/fhir/IGsample/ValueSet/document-section
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code.coding.code"
* section ^slicing.rules = #open
* section contains
        section01  1..1 MS    // 第1セクション
//
* section[section01].title 1.. MS
* section[section01].title = "第1セクション" (exactly)
* section[section01].code 1.. MS
* section[section01].code.coding 1..1 MS
* section[section01].code.coding.system 1.. MS
* section[section01].code.coding.system = "http://jpfhir.jp/fhir/IGsample/CodeSystem/document-section" (exactly)
* section[section01].code.coding.code 1.. MS
* section[section01].code.coding.code = #910 (exactly)
* section[section01].code.coding.display = "紹介先情報セクション"
* section[section01].code.coding.display MS
* section[section01].code.coding.userSelected ..0
* section[section01].code.text ..0
* section[section01].text ^short = "このセクションに含められるすべてのテキスト（叙述的記述）表現"
* section[section01].text ^definition = "本セクションの内容をテキストで表現した文字列。内容を省略しても構わない。 このデータは人がこのセクションの内容の概略をひと目で把握するためだけに使われるものであり、データ処理対象としてはならない。"
* section[section01].text MS
* section[section01].text.status MS
* section[section01].text.status = #additional (exactly)
* section[section01].mode ..0
* section[section01].orderedBy ..0
* section[section01].entry 1.. MS
* section[section01].entry only Reference(JP_Patient or JP_Condition or JP_Observation_Common) 
* section[section01].emptyReason ..1
* section[section01].section ..0
