#!/bin/bash
#!/bin/bash
mkdir -p ~/.fhir/packages/'jp-core.r4#1.1.2'
gtar xf packages_snapshot/jp-core.r4-1.1.2.tgz -C ~/.fhir/packages/'jp-core.r4#1.1.2'
mkdir -p ~/.fhir/packages/'jpfhir-terminology.r4#1.1.1'
gtar xf packages_snapshot/jpfhir-terminology.r4-1.1.1.tgz  -C ~/.fhir/packages/'jpfhir-terminology.r4#1.1.1'
java -Xmx4G -Djava.awt.headless=true -jar ../work/publisher_latest.jar -ig ig.ini -tx n/a
cd ..
rm -rf ~/.fhir/packages/'jp-core.r4#1.1.2'
rm -rf ~/.fhir/packages/'jpfhir-terminology.r4#1.1.1'
#rm -rf fsh-generated