package org.apache.commons.io.filefilter;

import java.util.ArrayList;
import java.util.List;

public class FileFilterUtils
{
  private static final IOFileFilter cvsFilter = notFileFilter(and(new IOFileFilter[] { directoryFileFilter(), nameFileFilter("CVS") }));
  private static final IOFileFilter svnFilter = notFileFilter(and(new IOFileFilter[] { directoryFileFilter(), nameFileFilter(".svn") }));
  
  public static IOFileFilter and(IOFileFilter... paramVarArgs)
  {
    return new AndFileFilter(toList(paramVarArgs));
  }
  
  public static IOFileFilter directoryFileFilter()
  {
    return DirectoryFileFilter.DIRECTORY;
  }
  
  public static IOFileFilter nameFileFilter(String paramString)
  {
    return new NameFileFilter(paramString);
  }
  
  public static IOFileFilter notFileFilter(IOFileFilter paramIOFileFilter)
  {
    return new NotFileFilter(paramIOFileFilter);
  }
  
  public static IOFileFilter or(IOFileFilter... paramVarArgs)
  {
    return new OrFileFilter(toList(paramVarArgs));
  }
  
  public static List<IOFileFilter> toList(IOFileFilter... paramVarArgs)
  {
    if (paramVarArgs == null) {
      throw new IllegalArgumentException("The filters must not be null");
    }
    ArrayList localArrayList = new ArrayList(paramVarArgs.length);
    int i = 0;
    while (i < paramVarArgs.length)
    {
      if (paramVarArgs[i] == null) {
        throw new IllegalArgumentException("The filter[" + i + "] is null");
      }
      localArrayList.add(paramVarArgs[i]);
      i += 1;
    }
    return localArrayList;
  }
}
