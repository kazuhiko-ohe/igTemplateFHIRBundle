#!/bin/bash

#ネットワークなし版
java -jar ../work/validator_cli_6.1.8.jar ExampleJson/*Bundle*.json ExampleJson/*Patient*.json -version 4.0.1  -language ja   -ig  pkgValidation/jp-core.r4-1.1.2.tgz -ig pkgValidation/jpfhir-terminology.r4-1.1.1.tgz -ig pkgValidation/jp-clins.r4-0.9.7.tgz -locale ja-JP -tx n/a  -display-issues-are-warnings -level warnings  -best-practice ignore -no-extensible-binding-warnings  -want-invariants-in-messages   -output testout.json 

-Xmx4G 

#テスト用
java -Xmx4G -Djava.awt.headless=true -jar ../work/validator_cli_6.1.8.jar ExampleJson/*.json  -display-issues-are-warnings  -version 4.0.1  -language ja   -ig  jp-core.r4#1.1.2.tgz -ig jpfhir-terminology#1.1.1.tgz -ig jp-clins#1.0.0.tgz  -locale ja-JP -tx n/a 

java -Xmx4G -Djava.awt.headless=true -jar ../work/validator_cli_6.1.8.jar ExampleJson/*.json  -display-issues-are-warnings  -version 4.0.1  -language ja    -ig pkgValidation/packages/hl7.fhir.r4.core#4.0.1  -ig  pkgValidation/jp-core.r4#1.1.2.tgz -ig pkgValidation/jpfhir-terminology#1.1.1.tgz -ig pkgValidation/jp-clins#1.0.0.tgz -locale ja-JP -tx n/a 


# diff　パッケージ版
java -Xmx4G -Djava.awt.headless=true -jar ../work/validator_cli_6.1.8.jar ExampleJson/*.json  -display-issues-are-warnings  -version 4.0.1  -language ja  -ig packagesForVali/jpfhir-terminology-1.1.1.tgz  -ig  packagesForVali/jp-core.r4-1.1.2tgz-ig packagesForVali/jp-clins-package-diff.tgz  -locale ja-JP -tx n/a 

# snap　パッケージ版
java -Xmx4G -Djava.awt.headless=true -jar ../work/validator_cli_latest.jar ExampleJson/*Patient*.json  -display-issues-are-warnings  -version 4.0.1  -language ja  -ig  packagesForVali/jpcore-snap.tgz -ig packagesForVali/jpfhir-terminology.tgz -ig packagesForVali/jp-clins-package-snap.tgz  -locale ja-JP -tx n/a 


java -Xmx4G -Djava.awt.headless=true -jar ../work/validator_cli.jar ExampleJson/*.json -display-issues-are-warnings  -version 4.0.1 -locale ja-JP  -ig  packages_snapshot/jp-clins.tgz -ig packages_snapshot/jp-core.r4-1.1.2-dev.tgz -ig packages_snapshot/jpfhir-terminology-1.1.1.tgz -tx n/a  -language ja

java -Xmx4G -Djava.awt.headless=true -jar ../work/validator_cli.jar ExampleJson/*Patient*.json -display-issues-are-warnings  -version 4.0.1 -locale ja-JP  -ig  packages_snapshot/jp-clins.tgz -ig packages_snapshot/jp-core.r4-1.1.2-dev.tgz -ig packages_snapshot/jpfhir-terminology-1.1.1.tgz -tx n/a  -language ja


java -Xmx4G -Djava.awt.headless=true -jar ../work/validator_cli.jar ExampleJson/*.json -display-issues-are-warnings  -version 4.0.1 -locale ja-JP -profile http://jpfhir.jp/fhir/ePrescription/StructureDefinition/JP_MedicationRequest_eClinicalSummary -profile http://jpfhir.jp/fhir/eClinicalSummary/StructureDefinition/JP_Encounter_eClinicalSummary -ig packages_snapshot/jp-core.r4-1.1.2-dev.tgz -ig packages_snapshot/jpfhir-terminology-1.1.1.tgz -ig  packages_snapshot/jp-clins.tgz -tx n/a  -language ja

java -Xmx4G -Djava.awt.headless=true -jar ../work/validator_cli.jar ExampleJson/MedicationRequest-Example-JP-MedReq-ExtAnus-AsNeeded-Total1.json -display-issues-are-warnings  -version 4.0.1 -locale ja-JP -ig packages_snapshot/jp-core.r4-1.1.2-dev.tgz -ig packages_snapshot/jpfhir-terminology-1.1.1.tgz -ig  packages_snapshot/jp-clins.tgz -tx n/a  -language ja