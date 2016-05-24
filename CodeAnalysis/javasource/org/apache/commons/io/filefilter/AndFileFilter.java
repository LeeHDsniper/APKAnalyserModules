package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class AndFileFilter
  extends AbstractFileFilter
  implements Serializable
{
  private final List<IOFileFilter> fileFilters;
  
  public AndFileFilter()
  {
    fileFilters = new ArrayList();
  }
  
  public AndFileFilter(List<IOFileFilter> paramList)
  {
    if (paramList == null)
    {
      fileFilters = new ArrayList();
      return;
    }
    fileFilters = new ArrayList(paramList);
  }
  
  public boolean accept(File paramFile)
  {
    if (fileFilters.isEmpty()) {
      return false;
    }
    Iterator localIterator = fileFilters.iterator();
    while (localIterator.hasNext()) {
      if (!((IOFileFilter)localIterator.next()).accept(paramFile)) {
        return false;
      }
    }
    return true;
  }
  
  public boolean accept(File paramFile, String paramString)
  {
    if (fileFilters.isEmpty()) {
      return false;
    }
    Iterator localIterator = fileFilters.iterator();
    while (localIterator.hasNext()) {
      if (!((IOFileFilter)localIterator.next()).accept(paramFile, paramString)) {
        return false;
      }
    }
    return true;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(super.toString());
    localStringBuilder.append("(");
    if (fileFilters != null)
    {
      int i = 0;
      if (i < fileFilters.size())
      {
        if (i > 0) {
          localStringBuilder.append(",");
        }
        Object localObject = fileFilters.get(i);
        if (localObject == null) {}
        for (localObject = "null";; localObject = localObject.toString())
        {
          localStringBuilder.append((String)localObject);
          i += 1;
          break;
        }
      }
    }
    localStringBuilder.append(")");
    return localStringBuilder.toString();
  }
}
