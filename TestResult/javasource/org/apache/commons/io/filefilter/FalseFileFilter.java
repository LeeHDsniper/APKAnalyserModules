package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class FalseFileFilter
  implements Serializable, IOFileFilter
{
  public static final IOFileFilter FALSE = new FalseFileFilter();
  public static final IOFileFilter INSTANCE = FALSE;
  
  protected FalseFileFilter() {}
  
  public boolean accept(File paramFile)
  {
    return false;
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    return false;
  }
}
