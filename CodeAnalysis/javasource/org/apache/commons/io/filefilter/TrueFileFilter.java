package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class TrueFileFilter
  implements Serializable, IOFileFilter
{
  public static final IOFileFilter INSTANCE = TRUE;
  public static final IOFileFilter TRUE = new TrueFileFilter();
  
  protected TrueFileFilter() {}
  
  public boolean accept(File paramFile)
  {
    return true;
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    return true;
  }
}
