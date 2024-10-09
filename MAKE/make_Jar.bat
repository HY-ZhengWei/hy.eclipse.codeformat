set JDT_VERSION=org.eclipse.jdt.core.manipulation_1.21.200.v20240815-2038
set JDT_Make=org.eclipse.jdt.core.manipulation
set JDT_File1=org\eclipse\jdt\internal\core\manipulation
set JDT_File2=org\eclipse\jdt\internal\corext\codemanipulation

set TEXT_VERSION=org.eclipse.text_3.14.100.v20240524-2010
set TEXT_Make=org.eclipse.text
set TEXT_File=org\eclipse\jface\text\templates


del   /Q/F "%JDT_VERSION%.jar"
rmdir /Q/S "%JDT_Make%"
mkdir      "%JDT_Make%\%JDT_File1%"
mkdir      "%JDT_Make%\%JDT_File2%"

del   /Q/F "%TEXT_VERSION%.jar"
rmdir /Q/S "%TEXT_Make%"
mkdir      "%TEXT_Make%/%TEXT_File%"



cd %JDT_Make%
jar -xf ..\%JDT_VERSION%_ORG.jar  
cd ..

cd %TEXT_Make%
jar -xf ..\%TEXT_VERSION%_ORG.jar  
cd ..



copy /Y "..\bin\%JDT_File1%\CodeTemplateContextType*"           .\"%JDT_Make%\%JDT_File1%\"
copy /Y "..\bin\%JDT_File2%\GetterSetterUtil*"                  .\"%JDT_Make%\%JDT_File2%\"
copy /Y "..\bin\%TEXT_File%\HYTemplateVariables*"               .\"%TEXT_Make%\%TEXT_File%\"
copy /Y "..\bin\%TEXT_File%\TextTemplateMessages.properties"    .\"%TEXT_Make%\%TEXT_File%\"


cd "%JDT_Make%"
jar cvfm %JDT_VERSION%.jar  ./META-INF/MANIFEST.MF * .api_description .options about.html plugin.properties plugin.xml
copy /Y *.jar ..
del  /Q/F *.jar
cd ..

cd "%TEXT_Make%"
jar cvfm %TEXT_VERSION%.jar ./META-INF/MANIFEST.MF * .api_description about.html plugin.properties
copy /Y *.jar ..
del  /Q/F *.jar
cd ..
