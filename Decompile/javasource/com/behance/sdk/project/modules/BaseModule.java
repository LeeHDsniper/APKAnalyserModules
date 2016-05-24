package com.behance.sdk.project.modules;

import java.io.File;

public class BaseModule
  implements ProjectModule
{
  private static final long serialVersionUID = 662818794505128574L;
  
  public BaseModule() {}
  
  public void clear() {}
  
  public void deleteFromFileSystem() {}
  
  public File getFile()
  {
    return null;
  }
  
  public ProjectModuleTypes getType()
  {
    return null;
  }
}
