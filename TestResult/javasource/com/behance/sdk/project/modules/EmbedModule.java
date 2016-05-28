package com.behance.sdk.project.modules;

public class EmbedModule
  extends BaseModule
{
  private static final long serialVersionUID = 2336836168618283848L;
  private String embedContentTxt;
  private int order;
  
  public EmbedModule(String paramString)
  {
    if (paramString.contains("src=\"//"))
    {
      embedContentTxt = paramString.replace("src=\"//", "src=\"http://");
      return;
    }
    embedContentTxt = paramString;
  }
  
  public void clear() {}
  
  public String getDescription()
  {
    return "Embed " + order;
  }
  
  public String getEmbedContent()
  {
    return embedContentTxt;
  }
  
  public String getSubDescription()
  {
    return "m" + order + ".behance.net";
  }
  
  public ProjectModuleTypes getType()
  {
    return ProjectModuleTypes.EMBED;
  }
  
  public void setOrder(int paramInt)
  {
    order = paramInt;
  }
}
