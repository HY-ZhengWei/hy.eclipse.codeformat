#!/bin/sh

JDT_VERSION=org.eclipse.jdt.ui_3.15.0.v20180829-2215
JDT_Java=/../
JDT_Make=/org.eclipse.jdt.ui
JDT_File=/org/eclipse/jdt/internal/corext/template/java
JDT_File2=/org/eclipse/jdt/internal/corext/codemanipulation

TEXT_VERSION=org.eclipse.text_3.7.0.v20180822-1511
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



cp .$JDT_Java/bin$JDT_File/CodeTemplateContextType*            .$JDT_Make$JDT_File
cp .$JDT_Java/bin$JDT_File2/GetterSetterUtil*                  .$JDT_Make$JDT_File2
cp .$TEXT_Java/bin$TEXT_File/HYTemplateVariables*              .$TEXT_Make$TEXT_File
cp .$TEXT_Java/bin$TEXT_File/TextTemplateMessages.properties   .$TEXT_Make$TEXT_File


cd .$JDT_Make
jar cvfm $JDT_VERSION.jar  ./META-INF/MANIFEST.MF * .api_description .options
mv  *.jar ..
cd ..

cd .$TEXT_Make
jar cvfm $TEXT_VERSION.jar ./META-INF/MANIFEST.MF * .api_description
mv  *.jar ..
cd ..
 
 
 
# cp $JDT_VERSION.jar  /Users/hy/Develop/eclipse_j2ee/plugins
# cp $TEXT_VERSION.jar /Users/hy/Develop/eclipse_j2ee/plugins
