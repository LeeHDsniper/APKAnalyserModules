package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;
import org.apache.commons.io.IOCase;

public class NameFileFilter
  extends AbstractFileFilter
  implements Serializable
{
  private final IOCase caseSensitivity;
  private final String[] names;
  
  public NameFileFilter(String paramString)
  {
    this(paramString, null);
  }
  
  public NameFileFilter(String paramString, IOCase paramIOCase)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("The wildcard must not be null");
    }
    names = new String[] { paramString };
    paramString = paramIOCase;
    if (paramIOCase == null) {
      paramString = IOCase.SENSITIVE;
    }
    caseSensitivity = paramString;
  }
  
  public boolean accept(File paramFile)
  {
    paramFile = paramFile.getName();
    String[] arrayOfString = names;
    int j = arrayOfString.length;
    int i = 0;
    while (i < j)
    {
      String str = arrayOfString[i];
      if (caseSensitivity.checkEquals(paramFile, str)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    paramFile = names;
    int j = paramFile.length;
    int i = 0;
    while (i < j)
    {
      String str = paramFile[i];
      if (caseSensitivity.checkEquals(paramString, str)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(super.toString());
    localStringBuilder.append("(");
    if (names != null)
    {
      int i = 0;
      while (i < names.length)
      {
        if (i > 0) {
          localStringBuilder.append(",");
        }
        localStringBuilder.append(names[i]);
        i += 1;
      }
    }
    localStringBuilder.append(")");
    return localStringBuilder.toString();
  }
}
