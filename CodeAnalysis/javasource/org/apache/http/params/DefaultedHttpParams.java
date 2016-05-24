package org.apache.http.params;

import java.util.HashSet;
import java.util.Set;
import org.apache.http.util.Args;

@Deprecated
public final class DefaultedHttpParams
  extends AbstractHttpParams
{
  private final HttpParams defaults;
  private final HttpParams local;
  
  public DefaultedHttpParams(HttpParams paramHttpParams1, HttpParams paramHttpParams2)
  {
    local = ((HttpParams)Args.notNull(paramHttpParams1, "Local HTTP parameters"));
    defaults = paramHttpParams2;
  }
  
  private Set<String> getNames(HttpParams paramHttpParams)
  {
    if ((paramHttpParams instanceof HttpParamsNames)) {
      return ((HttpParamsNames)paramHttpParams).getNames();
    }
    throw new UnsupportedOperationException("HttpParams instance does not implement HttpParamsNames");
  }
  
  public HttpParams copy()
  {
    return new DefaultedHttpParams(local.copy(), defaults);
  }
  
  public Set<String> getDefaultNames()
  {
    return new HashSet(getNames(defaults));
  }
  
  public HttpParams getDefaults()
  {
    return defaults;
  }
  
  public Set<String> getLocalNames()
  {
    return new HashSet(getNames(local));
  }
  
  public Set<String> getNames()
  {
    HashSet localHashSet = new HashSet(getNames(defaults));
    localHashSet.addAll(getNames(local));
    return localHashSet;
  }
  
  public Object getParameter(String paramString)
  {
    Object localObject2 = local.getParameter(paramString);
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      localObject1 = localObject2;
      if (defaults != null) {
        localObject1 = defaults.getParameter(paramString);
      }
    }
    return localObject1;
  }
  
  public boolean removeParameter(String paramString)
  {
    return local.removeParameter(paramString);
  }
  
  public HttpParams setParameter(String paramString, Object paramObject)
  {
    return local.setParameter(paramString, paramObject);
  }
}
