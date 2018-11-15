package org.eclipse.jface.text.templates;

import java.text.SimpleDateFormat;
import java.util.Date;


import org.hy.common.Help;







/**
 * 我们自定义的变量模板类
 * 
 * @author ZhengWei(HY)
 * @create 2014-11-06
 * 
 * @see org.eclipse.jface.text.templates.GlobalTemplateVariables
 */
public class HYTemplateVariables
{
	
	public static class DateYMS extends SimpleTemplateVariableResolver 
	{
	    private SimpleDateFormat SDF_YMD  = new SimpleDateFormat("yyyy-MM-dd");
	    
		public DateYMS() 
		{
			super("date_yyyymmdd" ,TextTemplateMessages.getString("GlobalVariables.variable.description.date_yyyymmdd"));  //$NON-NLS-1$//$NON-NLS-2$
		}
		

		protected String resolve(TemplateContext context) 
		{
		    return SDF_YMD.format(new Date());
		}
	}
	
	
	
	public static class Author extends SimpleTemplateVariableResolver 
	{
	    private String authorName;
	    
	    
        public Author() 
        {
            super("author" ,TextTemplateMessages.getString("GlobalVariables.variable.description.author")); //$NON-NLS-1$ //$NON-NLS-2$
            
            // 环境变量可以定义在eclipse.ini的vmargs下面
            this.authorName = System.getProperty("authorName");//$NON-NLS-1$
            if ( this.authorName == null )
            {
                this.authorName = System.getProperty("user.name"); 
            }
        }

        
        protected String resolve(TemplateContext context) 
        {
            return this.authorName;
        }
    }
	
	
	
	public static class SuperComment extends SimpleTemplateVariableResolver 
    {
        public SuperComment() 
        {
            super("superComment" ,TextTemplateMessages.getString("GlobalVariables.variable.description.superComment"));  //$NON-NLS-1$//$NON-NLS-2$
        }
        
        protected String resolve(TemplateContext context) 
        {
            try
            {
                if ( context == null )
                {
                    return "Context is null";
                }
                else
                {
                    return Help.NVL(context.toString());
                }
                
                
                
                /*
                
                IJavaProject        v_IProject            = v_CodeTemplateContext.getJavaProject();
                
                if ( v_IProject == null )
                {
                    return "IJavaProject is null.";
                }
                else if ( v_IProject.getElementName() == null )
                {
                    return "EN is null";
                }
                return "EN=" + v_IProject.getElementName();
                */
            }
            catch (Exception exce)
            {
                return exce.getMessage();
            }
        }
    }
	
}
