package org.apache.http.protocol;

@Deprecated
public class SyncBasicHttpContext
  extends BasicHttpContext
{
  public SyncBasicHttpContext() {}
  
  public SyncBasicHttpContext(HttpContext paramHttpContext)
  {
    super(paramHttpContext);
  }
  
  public void clear()
  {
    try
    {
      super.clear();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public Object getAttribute(String paramString)
  {
    try
    {
      paramString = super.getAttribute(paramString);
      return paramString;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public Object removeAttribute(String paramString)
  {
    try
    {
      paramString = super.removeAttribute(paramString);
      return paramString;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public void setAttribute(String paramString, Object paramObject)
  {
    try
    {
      super.setAttribute(paramString, paramObject);
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
}
