Profile: JP_Bundle_sample001
Parent: Bundle
Id: JP-Bundle-sample001
Description: "サンプル文書 Bundleリソース"
* ^url = "http://jpfhir.jp/fhir/IGsample/StructureDefinition/JP_Bundle_sample001"
* ^status = #active
* . ^short = "サンプル文書 Bundleリソース"
* . ^definition = "サンプル文書 Bundleリソース"
* meta.lastUpdated 1.. MS   // 最終更新日付は必須とする
* meta.profile 1.. MS      // 準拠するプロファイルURLの指定は必須とする

* identifier 1.. MS
* identifier.system 1.. MS
* identifier.system = "http://jpfhir.jp/fhir/core/IdSystem/documentInstance-identifier" (exactly)   // 文書インスタンスのidentifier
* identifier.value 1.. MS

* type = #document (exactly)    // 本プロファイルでは document 固定とする。
* type ^definition = "このバンドルの目的コード。本プロファイルでは document 固定とする。\r\n（document | message | transaction | transaction_response | batch | batch_response | history | searchset | collection）"
* type MS

* timestamp 1.. MS
* timestamp ^short = "このバンドルリソースのインスタンスが作成された日時。"
* timestamp ^definition = "このリソースを生成した日時。時刻の精度はミリ秒とし、タイムゾーンを含めること。　例：\"2021-02-01T13:28:17.239+09:00\""

* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
    composition 1..1 MS  // 文書構成情報
and patient 1..1 MS  //  患者情報
and condition 1.. MS // 病名情報
and observation 1.. MS // 検査結果情報

* entry[composition] ^short = "documentタイプのBundleリソースの先頭entryはCompositionリソース。"
* entry[composition] ^definition = "compositionリソースのエントリー。"
* entry[composition].fullUrl 1.. MS
* entry[composition].resource 1.. MS
* entry[composition].resource only  Composition
* entry[composition].search ..0
* entry[composition].request ..0
* entry[composition].response ..0

* entry[patient] ^short = "Patientリソース"
* entry[patient] ^definition = "Patientリソースのエントリー。"
* entry[patient].fullUrl 1.. MS
* entry[patient].resource 1.. MS
* entry[patient].resource only JP_Patient // 患者情報エントリ Composition.subject
* entry[patient].search ..0
* entry[patient].request ..0
* entry[patient].response ..0

* entry[condition] ^short = "Conditionリソース"
* entry[condition] ^definition = "Conditionリソースのエントリー。"
* entry[condition].fullUrl 1.. MS
* entry[condition].resource 1.. MS
* entry[condition].resource only JP_Condition // 病名情報
* entry[condition].search ..0
* entry[condition].request ..0
* entry[condition].response ..0

* entry[observation] ^short = "Observationリソース"
* entry[observation] ^definition = "Observationリソースのエントリー。"
* entry[observation].fullUrl 1.. MS
* entry[observation].resource 1.. MS
* entry[observation].resource only JP_Observation_Common    // 検査情報 
* entry[observation].search ..0
* entry[observation].request ..0
* entry[observation].response ..0

