package com.behance.sdk.project.modules;

import java.io.File;
import java.io.Serializable;

public abstract interface ProjectModule
  extends Serializable
{
  public abstract void clear();
  
  public abstract void deleteFromFileSystem();
  
  public abstract File getFile();
  
  public abstract ProjectModuleTypes getType();
}
