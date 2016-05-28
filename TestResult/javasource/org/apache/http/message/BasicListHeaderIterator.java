package org.apache.http.message;

import java.util.List;
import java.util.NoSuchElementException;
import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@NotThreadSafe
public class BasicListHeaderIterator
  implements HeaderIterator
{
  protected final List<Header> allHeaders;
  protected int currentIndex;
  protected String headerName;
  protected int lastIndex;
  
  public BasicListHeaderIterator(List<Header> paramList, String paramString)
  {
    allHeaders = ((List)Args.notNull(paramList, "Header list"));
    headerName = paramString;
    currentIndex = findNext(-1);
    lastIndex = -1;
  }
  
  protected boolean filterHeader(int paramInt)
  {
    if (headerName == null) {
      return true;
    }
    String str = ((Header)allHeaders.get(paramInt)).getName();
    return headerName.equalsIgnoreCase(str);
  }
  
  protected int findNext(int paramInt)
  {
    if (paramInt < -1) {}
    boolean bool;
    do
    {
      return -1;
      int i = allHeaders.size();
      for (bool = false; (!bool) && (paramInt < i - 1); bool = filterHeader(paramInt)) {
        paramInt += 1;
      }
    } while (!bool);
    return paramInt;
  }
  
  public boolean hasNext()
  {
    return currentIndex >= 0;
  }
  
  public final Object next()
    throws NoSuchElementException
  {
    return nextHeader();
  }
  
  public Header nextHeader()
    throws NoSuchElementException
  {
    int i = currentIndex;
    if (i < 0) {
      throw new NoSuchElementException("Iteration already finished.");
    }
    lastIndex = i;
    currentIndex = findNext(i);
    return (Header)allHeaders.get(i);
  }
  
  public void remove()
    throws UnsupportedOperationException
  {
    if (lastIndex >= 0) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "No header to remove");
      allHeaders.remove(lastIndex);
      lastIndex = -1;
      currentIndex -= 1;
      return;
    }
  }
}
