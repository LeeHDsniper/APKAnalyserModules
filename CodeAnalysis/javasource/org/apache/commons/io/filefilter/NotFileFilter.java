package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

public class NotFileFilter
  extends AbstractFileFilter
  implements Serializable
{
  private final IOFileFilter filter;
  
  public NotFileFilter(IOFileFilter paramIOFileFilter)
  {
    if (paramIOFileFilter == null) {
      throw new IllegalArgumentException("The filter must not be null");
    }
    filter = paramIOFileFilter;
  }
  
  public boolean accept(File paramFile)
  {
    return !filter.accept(paramFile);
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    return !filter.accept(paramFile, paramString);
  }
  
  public String toString()
  {
    return super.toString() + "(" + filter.toString() + ")";
  }
}
