#!/bin/sh

JDT_VERSION=org.eclipse.jdt.core.manipulation_1.11.0.v20181126-0647
JDT_Java=/../
JDT_Make=/org.eclipse.jdt.core.manipulation
JDT_File1=/org/eclipse/jdt/internal/core/manipulation
JDT_File2=/org/eclipse/jdt/internal/corext/codemanipulation

TEXT_VERSION=org.eclipse.text_3.8.0.v20180923-1636
TEXT_Java=/../
TEXT_Make=/org.eclipse.text
TEXT_File=/org/eclipse/jface/text/templates


rm       .$JDT_VERSION.jar
rm    -r .$JDT_Make
mkdir -p .$JDT_Make$JDT_File
rm       .$TEXT_VERSION.jar
rm    -r .$TEXT_Make
mkdir -p .$TEXT_Make$TEXT_File



tar xvf ${JDT_VERSION}_ORG.jar  -C .$JDT_Make
tar xvf ${TEXT_VERSION}_ORG.jar -C .$TEXT_Make



cp .$JDT_Java/bin$JDT_File1/CodeTemplateContextType*           .$JDT_Make$JDT_File1
cp .$JDT_Java/bin$JDT_File2/GetterSetterUtil*                  .$JDT_Make$JDT_File2
cp .$TEXT_Java/bin$TEXT_File/HYTemplateVariables*              .$TEXT_Make$TEXT_File
cp .$TEXT_Java/bin$TEXT_File/TextTemplateMessages.properties   .$TEXT_Make$TEXT_File


cd .$JDT_Make
jar cvfm $JDT_VERSION.jar  ./META-INF/MANIFEST.MF * .api_description .options about.html plugin.properties plugin.xml
mv  *.jar ..
cd ..

cd .$TEXT_Make
jar cvfm $TEXT_VERSION.jar ./META-INF/MANIFEST.MF * .api_description about.html plugin.properties
mv  *.jar ..
cd ..
 
 
 
# cp $JDT_VERSION.jar  /Users/hy/Develop/eclipse_j2ee/plugins
# cp $TEXT_VERSION.jar /Users/hy/Develop/eclipse_j2ee/plugins
