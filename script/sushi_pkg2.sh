#!/bin/bash
mkdir -p ~/.fhir/packages/'jp-core.r4#1.1.2'
gtar xf packages_snapshot/jp-core.r4-1.1.2.tgz -C ~/.fhir/packages/'jp-core.r4#1.1.2'
mkdir -p ~/.fhir/packages/'jpfhir-terminology.r4#1.1.1'
gtar xf packages_snapshot/jpfhir-terminology.r4-1.1.1.tgz  -C ~/.fhir/packages/'jpfhir-terminology.r4#1.1.1'
sushi -s .
#
cd fsh-generated
cp -r resources package
cp ../forPackageRelease/package-snap.json package/package.json
gtar czf jp-sample.r4-1.0.0.tgz package
rm -rf package
cp jp-sample.r4-1.0.0.tgz ../packages_snapshot
mv jp-sample.r4-1.0.0.tgz ../pkgValidation
cd ..
rm -rf ~/.fhir/packages/'jp-core.r4#1.1.2'
rm -rf ~/.fhir/packages/'jpfhir-terminology.r4#1.1.1'
#rm -rf fsh-generated