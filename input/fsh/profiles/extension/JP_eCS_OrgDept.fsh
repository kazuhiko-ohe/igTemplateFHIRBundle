
// -----------------------------------------
//JP_eCS_OrganizationNumber
// -----------------------------------------
Extension: JP_eCS_InstitutionNumber
Id: jp-ecs-institution-number
Title: "JP eCS InstitutionNumber Extension"
Description: "診療サマリーや6情報等に記述する際に、作成発行した医療機関番号を記述する拡張"
* ^url = $JP_eCS_InstitutionNumber
// http://jpfhir.jp/fhir/clins/Extension/StructureDefinition/JP_eCS_InstitutionNumber
* ^status = #active
* ^date = "2023-10-09"
* ^purpose = "診療サマリーや6情報等に記述する際に、作成発行した医療機関番号を記述するため。"

* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* ^context[+].type = #element
* ^context[=].expression = "AllergyIntolerance"
* ^context[+].type = #element
* ^context[=].expression = "Condition"
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* ^context[+].type = #element
* ^context[=].expression = "Observation"

* . ^short = "作成発行した医療機関番号を記述するための拡張"
* . ^definition = "診療サマリーや6情報等に記述する際に、作成発行した医療機関番号を記述する"
* url = $JP_eCS_InstitutionNumber (exactly)
* value[x] only Identifier
* value[x] ^short = "作成発行した医療機関番号を設定する。"
* value[x] ^definition = "作成発行した医療機関番号を設定する。"
* valueIdentifier.system = $JP_InstitutionNumber (exactly)

* obeys valid-value-institutionNumberExtension

// -----------------------------------------
//JP_eCS_Department
// -----------------------------------------
Extension: JP_eCS_Department
Id: jp-ecs-department
Title: "JP eCS Department Extension"
Description: "診療サマリーや6情報等に記述する際に、発行診療科または発行者の診療科情報を記述する拡張"
* ^url = $JP_eCS_Department
* ^status = #active
* ^date = "2023-10-09"
* ^purpose = "診療サマリーや6情報等に記述する際に、発行診療科または発行者の診療科情報を記述するため。"
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* ^context[+].type = #element
* ^context[=].expression = "AllergyIntolerance"
* ^context[+].type = #element
* ^context[=].expression = "Condition"
* ^context[+].type = #element
* ^context[=].expression = "Observation"

* . ^short = "診療科情報を記述するための拡張"
* . ^definition = "発行診療科または発行者の診療科情報を記述する"
* url = $JP_eCS_Department (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "診療科コードと名称等を設定する。"
* value[x] ^definition = "診療科コードと名称等を設定する。"
* valueCodeableConcept from $JP_Department_SsMix_VS (preferred)

