package org.apache.http.params;

import java.util.Set;

@Deprecated
public abstract class AbstractHttpParams
  implements HttpParams, HttpParamsNames
{
  protected AbstractHttpParams() {}
  
  public boolean getBooleanParameter(String paramString, boolean paramBoolean)
  {
    paramString = getParameter(paramString);
    if (paramString == null) {
      return paramBoolean;
    }
    return ((Boolean)paramString).booleanValue();
  }
  
  public double getDoubleParameter(String paramString, double paramDouble)
  {
    paramString = getParameter(paramString);
    if (paramString == null) {
      return paramDouble;
    }
    return ((Double)paramString).doubleValue();
  }
  
  public int getIntParameter(String paramString, int paramInt)
  {
    paramString = getParameter(paramString);
    if (paramString == null) {
      return paramInt;
    }
    return ((Integer)paramString).intValue();
  }
  
  public long getLongParameter(String paramString, long paramLong)
  {
    paramString = getParameter(paramString);
    if (paramString == null) {
      return paramLong;
    }
    return ((Long)paramString).longValue();
  }
  
  public Set<String> getNames()
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean isParameterFalse(String paramString)
  {
    boolean bool = false;
    if (!getBooleanParameter(paramString, false)) {
      bool = true;
    }
    return bool;
  }
  
  public boolean isParameterTrue(String paramString)
  {
    return getBooleanParameter(paramString, false);
  }
  
  public HttpParams setBooleanParameter(String paramString, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (Boolean localBoolean = Boolean.TRUE;; localBoolean = Boolean.FALSE)
    {
      setParameter(paramString, localBoolean);
      return this;
    }
  }
  
  public HttpParams setDoubleParameter(String paramString, double paramDouble)
  {
    setParameter(paramString, Double.valueOf(paramDouble));
    return this;
  }
  
  public HttpParams setIntParameter(String paramString, int paramInt)
  {
    setParameter(paramString, Integer.valueOf(paramInt));
    return this;
  }
  
  public HttpParams setLongParameter(String paramString, long paramLong)
  {
    setParameter(paramString, Long.valueOf(paramLong));
    return this;
  }
}
