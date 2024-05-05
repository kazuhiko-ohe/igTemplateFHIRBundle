#!/bin/bash
rm -r ~/.fhir
cp -r ~/.fhir_sushiVersion ~/.fhir
java -Xmx4G -Djava.awt.headless=true -jar ../work/publisher_latest.jar -ig ig.ini -tx n/a
rm -r ~/.fhir
cp -r ~/.fhir.validation ~/.fhir
#rm -rf fsh-generated