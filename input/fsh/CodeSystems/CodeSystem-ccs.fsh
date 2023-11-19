//

CodeSystem: JP_CLINS_BundleResourceType_CS
Id: jp-clins-bundleresourcetype-cs
Description: "CLINSでのBundleリソースに含まれる６情報リソースタイプをmeta要素に記述するためのコードセット"
* ^url = $JP_CLINS_BundleResourceType_CS
* ^title = "Bundleリソースに含まれる６情報リソースタイプ"
* ^status = #active
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #AllergyIntolerance
* #Condition
* #Observation
* #MedicationRequest

CodeSystem: JP_CLINS_ObsLabResult_Uncoded_CS
Id: jp-clins-obslabresult-uncoded-cs
Description: "検体検査結果項目で標準コードが割り当てられない場合に使用する未コード化コード(JLAC10)"
* ^url = $JP_CLINS_ObsLabResultUncoded_CS
* ^title = "未標準化コード項目(JLAC)"
* ^status = #active
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #99999999999999999  "未標準化コード項目(JLAC)"

CodeSystem: JP_CLINS_ObsLabResult_LocalUncoded_CS
Id: jp-clins-obslabresult-localuncoded-cs
Description: "検体検査結果項目で標準コードが割り当てられない場合に使用する未コード化コード(Local)"
* ^url = $JP_ObservationLabResultLocalUncoded_CS
* ^title = "未標準化コード項目(Local)"
* ^status = #active
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #LUNCODED  "Locally Uncoded"

CodeSystem: JP_eCS_MedicationCode_Nocoded_CS
Id: jp-eCS-medicationcode-nocoded-cs
Description: "医薬品コードで標準コードが割り当てられない場合に使用する未コード化コード"
* ^url = $JP_eCS_MedicationCodeNocoded_CS
* ^title = "医薬品未標準化コード項目"
* ^status = #active
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #NOCODED  "標準コードなし"

/*
CodeSystem: JP_CLINS_ObsLabResult_LocalCode_CS
Id: jp-clins-obslabresult-localcode-cs
Description: "検体検査項目ローカルコード識別用CS"
* ^url = $JP_ObservationLabResultLocal_CS
* ^title = "検体検査項目ローカルコード識別用コードシステム"
* ^status = #active
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #dummy "コード化ローカルコード"
*/

CodeSystem: JP_ehrshrs_indication_CS
Id: jp-ehrshrs-indication-cs
Description: "長期保存／未告知診療情報のためのフラグコード"
* ^url = $JP_ehrshrs_indication_CS
* ^title = "長期保存／未告知診療情報のためのフラグコード"
* ^status = #active
* ^experimental = false
* ^content = #complete
* ^caseSensitive = false
* #LTS  "長期保存"
* #UNINFORMED  "未告知"




//$observation-subcategory-cs#infectionRelated http://jpfhir.jp/fhir/eCS/CodeSystem/observation-subcategory-cs
CodeSystem: JP_Observation_SubCategory_CS
Id: jp-observation-subcategory-cs
Description: "感染症関連検査結果として検体検査結果を報告する場合のサブカテゴリで６情報で運用される"
* ^url = $observation-subcategory-cs
* ^title = "感染症関連検査結果として検体検査結果を報告する場合のサブカテゴリで６情報で運用される"
* ^status = #active
* ^experimental = false
* ^content = #fragment
* ^caseSensitive = false
* #infectionRelated  "感染症関連検査結果"

// from jpcore 2023-05-27
CodeSystem: JP_SimpleObservationCategory_CS
Id: jp-simpleobservationcategory-cs
Title: "JP Core Simple Observation Category CodeSystem"
Description: "JP Coreにて定義したObservationリソースに関する分類コード"
* ^url = $JP_SimpleObservationCategory_CS
* ^status = #active
* ^experimental = false
* ^date = "2023-04-18"
* ^caseSensitive = true
* ^content = #complete
* #sdoh "SDOH" "健康の社会的決定要因 (Social Determinant of Health)"
* #functional-status "Functional Status" "機能ステータス"
* #disability-status "Disability Status" "障害区分"
* #cognitive-status "Cognitive Status" "認知ステータスのカテゴリ"
* #social-history "Social History" "社会歴観察では、患者の職業、個人（ライフスタイルなど）、社会歴、家族歴、環境歴、および患者の健康に影響を与える可能性のある健康リスク要因を定義します。"
* #vital-signs "Vital Signs" "身体の基本機能のうち、呼吸機能、不整脈、血圧、体表面皮膚温、睡眠、意識障害、体温、脈拍数など。"
* #body-measurement "Body Measurement" "身体の基本機能のうち、体重、身長、胸囲、腹囲、嚥下、握力など。"
* #imaging "Imaging" "イメージングによって生成された観測。 範囲には、単純X線、超音波、CT、MRI、血管造影、心エコー検査、および核医学に関する観察が含まれます。"
* #laboratory "Laboratory" "検査室によって生成された観察結果。 検査結果は通常、化学、血液学、血清学、組織学、細胞学、解剖病理学 (デジタル病理学を含む)、微生物学、および/またはウイルス学などの分野で分析サービスを提供する検査室によって生成されます。 これらの観察結果は、患者から採取され、検査室に提出された検体の分析に基づいています。"
* #procedure "Procedure" "他の手順によって生成された観察。 このカテゴリには、実験室および画像検査 (心臓カテーテル法、内視鏡検査、電気診断など) を除く、介入および非介入手順から生じる観察結果が含まれます。 通常、検査結果は臨床医によって生成され、検査中に行われたコンポーネントの観察に関するより詳細な情報を提供します。 例としては、消化器内科医が大腸内視鏡検査中に観察されたポリープのサイズを報告する場合があります。"
* #survey "Survey" "評価ツール/調査機器の観察 (例: Apgar Scores、Montreal Cognitive Assessment (MoCA))。"
* #exam "Exam" "臨床医による直接観察、単純な器具の使用、患者の体に直接行われた単純な操作の結果など、身体検査の結果によって生成された観察。"
* #therapy "Therapy" "非介入治療プロトコル（例：職業療法、物理療法、放射線療法、栄養療法、投薬療法）によって生成された観察"
* #activity "Activity" "体力と全体的な健康状態を向上または維持する身体活動を測定または記録する観察。 理学療法士などの施術者の直接の監督下にないこと。 (例: 水泳ラップ、歩数、睡眠データ)"