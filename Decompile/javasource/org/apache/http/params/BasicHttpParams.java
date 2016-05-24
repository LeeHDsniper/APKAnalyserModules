package org.apache.http.params;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.annotation.ThreadSafe;

@Deprecated
@ThreadSafe
public class BasicHttpParams
  extends AbstractHttpParams
  implements Serializable, Cloneable
{
  private static final long serialVersionUID = -7086398485908701455L;
  private final Map<String, Object> parameters = new ConcurrentHashMap();
  
  public BasicHttpParams() {}
  
  public void clear()
  {
    parameters.clear();
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    BasicHttpParams localBasicHttpParams = (BasicHttpParams)super.clone();
    copyParams(localBasicHttpParams);
    return localBasicHttpParams;
  }
  
  public HttpParams copy()
  {
    try
    {
      HttpParams localHttpParams = (HttpParams)clone();
      return localHttpParams;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      throw new UnsupportedOperationException("Cloning not supported");
    }
  }
  
  public void copyParams(HttpParams paramHttpParams)
  {
    Iterator localIterator = parameters.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      paramHttpParams.setParameter((String)localEntry.getKey(), localEntry.getValue());
    }
  }
  
  public Set<String> getNames()
  {
    return new HashSet(parameters.keySet());
  }
  
  public Object getParameter(String paramString)
  {
    return parameters.get(paramString);
  }
  
  public boolean isParameterSet(String paramString)
  {
    return getParameter(paramString) != null;
  }
  
  public boolean isParameterSetLocally(String paramString)
  {
    return parameters.get(paramString) != null;
  }
  
  public boolean removeParameter(String paramString)
  {
    if (parameters.containsKey(paramString))
    {
      parameters.remove(paramString);
      return true;
    }
    return false;
  }
  
  public HttpParams setParameter(String paramString, Object paramObject)
  {
    if (paramString == null) {
      return this;
    }
    if (paramObject != null)
    {
      parameters.put(paramString, paramObject);
      return this;
    }
    parameters.remove(paramString);
    return this;
  }
  
  public void setParameters(String[] paramArrayOfString, Object paramObject)
  {
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      setParameter(paramArrayOfString[i], paramObject);
      i += 1;
    }
  }
}
