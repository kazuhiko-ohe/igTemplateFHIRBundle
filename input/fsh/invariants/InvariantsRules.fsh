

// R1011-  患者IDチェック
Invariant: valid-system-local-patientID
Description: "R1011:施設患者IDを記述する場合には、identifier.systemは、'urn:oid:1.2.392.100495.20.3.51.[1+施設番号10桁]'であり、かつその施設番号10桁はextension[eCS_InstitutionNumber].valueIdentifier.value値と一致しなければならない。"
Severity: #error
Expression: "(identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.').count()=1 and (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.')).system.substring(31,11) = '1' + extension('http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber').value.ofType(Identifier).value) or (identifier.where(system.substring(0,31) = 'urn:oid:1.2.392.100495.20.3.51.').empty())"

Invariant: valid-system-insurance-patientIdentifier
Description: "R1012:被保険者識別子情報(identifier.system=\"http://jpfhir.jp/fhir/eCS/Idsysmem/JP_Insurance_memberID\")は１つだけ必須。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/eCS/Idsysmem/JP_Insurance_memberID').count()=1)"

Invariant: valid-value-insurance-patientIdentifier
Description: "R1013:identifier.value 被保険者識別子情報の形式は、\"保険者等番号:被保険者記号:被保険者番号:被保険者証等枝番\"で、それぞれ半角英数字8桁固定、半角または全角文字列(空白を含まない)、半角または全角文字列(同)、半角数字2桁固定(1文字目は0)であり、それぞれ存在しない場合には、空文字列とする。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/eCS/Idsysmem/JP_Insurance_memberID').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/eCS/Idsysmem/JP_Insurance_memberID').value.matches('^[0-9]{8}:[^:^\\\\s^　]*:[^:^\\\\s^　]*:0[0-9]$'))"
// '^[0-9]{8}:[^:^\\\\s^　]*:[^:^\\\\s^　]*:0[0-9]$''
// '^[0-9]{8}:[^:]*:[^:]*:[0-9]{2}$'

// R1021-  施設IDチェック
Invariant: valid-value-institutionNumber
Description: "R1021:医療機関番号　extension[eCS_InstitutionNumber].valueIdentifier.value値は、２桁都道府県番号、１桁医療機関区分(1|2|3)、７桁保険医療機関番号の連結１０桁とする。"
Severity: #error
Expression: "extension('http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber').value.ofType(Identifier).value.matches('[0-4][0-9][1-3][0-9]{7}')"

Invariant: valid-value-institutionNumberExtension
Description: "施設番号　valueIdentifier.value値は、２桁都道府県番号、１桁医療機関区分(1|2|3)、７桁保険医療機関番号の連結１０桁とする。"
Severity: #error
Expression: "value.ofType(Identifier).value.matches('[0-4][0-9][1-3][0-9]{7}')"

// R2011-  アレルギー・薬剤禁忌関係チェック
Invariant: waring-medication-allergy
Description: "注意喚起：R2011:薬剤禁忌情報として本リソース種別を使用するのであれば、category要素は\"medication\"で、criticality要素は\"high\"を設定しなければならない。このままでよければ修正不要。"
Severity: #warning
Expression: "(category.where($this='medication').exists() and criticality='high') or category.exists().not() or category.where($this='medication').exists().not()"

// R0111- BundleIDチェック
Invariant: valid-value-bundleIdenfifier
Description: "R0110:Bundle.identifier.value は、医療機関番号10桁^被保険者個人識別子^128文字以内の半角文字列（英大文字、数字、ハイフン記号のみ可）であること。'^[0-4][0-9][1-3][0-9]{7}[\\^][0-9]{8}:[^:^\\s^　]*:[^:^\\s^　]*:[0-9]{2}[\\^][A-Z0-9\\-]{1,128}$'"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^[0-4][0-9][1-3][0-9]{7}[\\\\^][0-9]{8}:[^:^\\\\s^　]*:[^:^\\\\s^　]*:[0-9]{2}[\\\\^][A-Z0-9\\\\-]{1,128}$'))"

Invariant: valid-valuePart0-bundleIdenfifier
Description: "R0111:構成：Bundle.identifier.value は^区切りで３つのパートから構成されなければならない。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^.+?[\\\\^].+[\\\\^].+$'))"

Invariant: valid-valuePart1-bundleIdenfifier
Description: "R0110原因：R0112:Bundle.identifier.value の最初の^までのパートが、医療機関番号10桁として適切な数字列でなければならない。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^[0-4][0-9][1-3][0-9]{7}[\\\\^].*$'))"

/*
Invariant: valid-valuePart2-bundleIdenfifier
Description: "Bundle.identifier.value の最初の^から２番目の^までのパートが、被保険者個人識別子として適切な文字列でなければならない。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^.+?[\\\\^][0-9]{8}:[^:^\\\\s^　]*?:[^:^\\\\s^　]*?:[0-9]{2}[\\\\^].+$'))"
*/
//* identifier.value = "1318814790^00012345:あいう:１８７:01^1038463784937"

Invariant: valid-valuePart2-0-bundleIdenfifier
Description: "R0110原因：R0113:Bundle.identifier.value の最初の^から２番目の^までの被保険者個人識別子パートは、:区切り文字が３つでなければならない。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^.+?[\\\\^].+?:.+?:.+?:.+?[\\\\^].+$'))"
//* identifier.value = "1318814790^00012345:あいう:１８７:01^1038463784937"

Invariant: valid-valuePart2-1-bundleIdenfifier
Description: "R0110原因：R0114:Bundle.identifier.value の最初の^から２番目の^までの被保険者個人識別子パートは、第１要素が数字8桁（保険者番号）でなければならない。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^.+?[\\\\^][0-9]{8}:.+?:.+?:.+[\\\\^].+$'))"
//* identifier.value = "1318814790^00012345:あいう:１８７:01^1038463784937"

Invariant: valid-valuePart2-2-bundleIdenfifier
Description: "R0110原因：R0115:Bundle.identifier.value の最初の^から２番目の^までの被保険者個人識別子パートは、第2要素が空白を含まない文字列（被保険者記号等）でなければならない。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^.+?[\\\\^].+?:[^:^\\\\s^　]*?:.+?:.+?[\\\\^].+$'))"
//* identifier.value = "1318814790^00012345:あいう:１８７:01^1038463784937"

/*
Invariant: valid-valuePart2-2-bundleIdenfifier
Description: "原因：Bundle.identifier.value の最初の^から２番目の^までの被保険者個人識別子パートは、第2要素が空白を含まない全角文字列（被保険者記号等）または空白を含まない半角文字列でなければならない。"
// [^:^\\\\s^　]*? 
// 全角文字列＝　[^ -~｡-ﾟ]*　（半角でない文字からなる文字列）
//　全角空白と半角文字以外の文字からなる文字列＝ [^ -~｡-ﾟ　]*
// 半角だけの文字列 [ -~｡-ﾟ]*
// 空白以外の半角だけの文字列　[ -~｡-ﾟ]*
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^.+?[\\\\^].+?:[^ -~｡-ﾟ　]*?:.+?:.+?[\\\\^].+$'))"
*/

Invariant: valid-valuePart2-3-bundleIdenfifier
Description: "R0110原因：R0116:Bundle.identifier.value の最初の^から２番目の^までの被保険者個人識別子パートは、第3要素が空白を含まない文字列（被保険者番号等）でなければならない。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^.+?[\\\\^].+?:.+?:[^:^\\\\s^　]*?:.+?[\\\\^].+$'))"
//* identifier.value = "1318814790^00012345:あいう:１８７:01^1038463784937"

Invariant: valid-valuePart2-4-bundleIdenfifier
Description: "R0110原因：R0117:Bundle.identifier.value の最初の^から２番目の^被保険者個人識別子パートは、第4要素が2桁の半角数字（枝番）でなければならない。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^.+?[\\\\^].+?:.+?:.+?:[0-9]{2}[\\\\^].+$'))"
//* identifier.value = "1318814790^00012345:あいう:１８７:01^1038463784937"


Invariant: valid-valuePart3-bundleIdenfifier
Description: "R0110原因：R0118:Bundle.identifier.value の2番目^から3番目の^までのパートが、一意識別として128文字以内の半角文字列（英大文字、数字、ハイフン記号のみ可）でなければならない。"
Severity: #error
Expression: "(identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').count()=1 and identifier.where(system = 'http://jpfhir.jp/fhir/clins/bundle-identifier').value.matches('^.+?[\\\\^]*?[\\\\^][A-Z0-9\\\\-]{1,128}$'))"


// 医療機関番号１０桁：[0-4][0-9][1-3][0-9]{7}
// 保険者番号８桁：[0-9]{8}
// 被保険者記号：[^:^\\\\s^　]* 
// 被保険者番号：[^:^\\\\s^　]*
// 被保険者枝番：0[0-9]
// 被保険者識別子: ^[0-9]{8}:[^:^\\\\s^　]*:[^:^\\\\s^　]*:0[0-9]$
// 医療機関内Bundle識別子：[A-Z0-9\\\\-]{1,128}

// R0211-  
Invariant: first-bundle-entry-is-Patient
Description: "R0211:最初のentryはPatientでなければならない。"
Severity: #error
Expression: "entry.first().resource.is(Patient)"

Invariant: patients-profile-is-JP-Patient-CLINS-eCS
Description: "R0212:最初のentryであるPatientは、JP_Patient_CLINS_eCSプロファイルに準拠していなければならない。"
Severity: #error
Expression: "entry.first().resource.meta.profile.where($this = 'http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Patient_eCS').exists()"

Invariant: bundle-profile-is-JP-Bundle-CLINS
Description: "R0213:BundleはJP-Bundle-CLINSプロファイルに準拠していなければならない。"
Severity: #error
Expression: "meta.profile.where($this ='http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Bundle_CLINS').exists()"

// R3010 医薬品コードの妥当性チェック（標準コードなしもOK）
Invariant: needs-anyOfStandardCode-medication
Description: "R3010:medicationCodeableConcept は、電子カルテ共有サービスで使用する場合には、YJコード、HOT9またはHOT7コード、厚生労働省一般名コード、標準コードなし、のいずれかを必須とする。"
/*
Alias: $JP_MedicationCodeYJ_CS = urn:oid:1.2.392.100495.20.1.73
Alias: $JP_MedicationCodeHOT7_CS = urn:oid:1.2.392.200119.4.403.2
Alias: $JP_MedicationCodeHOT9_CS = urn:oid:1.2.392.200119.4.403.1
Alias: $JP_MedicationCodeCommon_CS = urn:oid:1.2.392.100495.20.1.81
Alias: $JP_eCS_MedicationCodeNocoded_CS = http://jpfhir.jp/fhir/eCS/CodeSystem/MedicationCodeNocoded_CS
*/
Severity: #error
Expression: "(medication.ofType(CodeableConcept).coding.where(system = 'urn:oid:1.2.392.100495.20.1.73').count()=1) or (medication.ofType(CodeableConcept).coding.where(system = 'urn:oid:1.2.392.200119.4.403.2').count()=1) or (medication.ofType(CodeableConcept).coding.where(system = 'urn:oid:1.2.392.200119.4.403.1').count()=1) or (medication.ofType(CodeableConcept).coding.where(system = 'urn:oid:1.2.392.100495.20.1.81').count()=1) or (medication.ofType(CodeableConcept).coding.where(system = 'http://jpfhir.jp/fhir/eCS/CodeSystem/MedicationCodeNocoded_CS').count()=1)"


