package org.apache.commons.io.filefilter;

import java.io.File;

public abstract class AbstractFileFilter
  implements IOFileFilter
{
  public AbstractFileFilter() {}
  
  public boolean accept(File paramFile)
  {
    return accept(paramFile.getParentFile(), paramFile.getName());
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    return accept(new File(paramFile, paramString));
  }
  
  public String toString()
  {
    return getClass().getSimpleName();
  }
}
