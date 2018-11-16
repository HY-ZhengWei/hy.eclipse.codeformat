package org.eclipse.jdt.internal.corext.codemanipulation;


import java.io.IOException;

import org.eclipse.jdt.core.JavaModelException;
import org.eclipse.jdt.core.dom.AST;
import org.eclipse.jdt.core.dom.ASTParser;
import org.eclipse.jdt.core.dom.CompilationUnit;
import org.eclipse.jdt.core.dom.TypeDeclaration;
import org.eclipse.jface.text.Document;

import org.hy.common.file.FileHelp;





/**
 *
 * @author      ZhengWei(HY)
 * @createDate  2014-11-14
 * @version     v1.0
 */
public class QQ
{

    /** 名称 */
    private String name;
    
    
    
    /** 名称 */
    public String getName()
    {
        return name;
    }


    
    /** 名称 */
    public void setName(String name)
    {
        this.name = name;
    }



    /**
     * 
     * @author      ZhengWei(HY)
     * @createDate  2014-11-14
     * @version     v1.0
     *
     * @param args
     * @throws IOException 
     * @throws NullPointerException 
     * @throws ClassNotFoundException 
     * @throws JavaModelException 
     */
    @SuppressWarnings("deprecation")
    public static void main(String [] args) throws NullPointerException, IOException, ClassNotFoundException, JavaModelException
    {
        FileHelp v_FileHelp    = new FileHelp();
        String   v_JavaContent = v_FileHelp.getContent("/Users/hy/WSS/WorkSpace_SearchDesktop/Eclipse_Plugins/src/org/eclipse/jdt/internal/corext/codemanipulation/QQ.java" ,"UTF-8");
        Document doc = new Document(v_JavaContent);
        ASTParser parser = ASTParser.newParser(AST.JLS4);
        parser.setSource(doc.get().toCharArray());
        CompilationUnit cu = (CompilationUnit) parser.createAST(null);
        

        
        for (int i=0; i<cu.types().size(); i++)
        {
            System.out.println(cu.types().get(i).getClass());
        }
        
        
        TypeDeclaration t = (TypeDeclaration)cu.types().get(0);
        
        System.out.println(t.getMethods()[0].getJavadoc());
        // JavaHelp.print(t.getMethods());

        //JavaHelp.print(cu.getCommentList());
        //JavaHelp.print(cu.getRoot().structuralPropertiesForType());
        
    }
    
}
