package org.apache.http.impl.client;

import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.params.AbstractHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
@NotThreadSafe
public class ClientParamsStack
  extends AbstractHttpParams
{
  protected final HttpParams applicationParams;
  protected final HttpParams clientParams;
  protected final HttpParams overrideParams;
  protected final HttpParams requestParams;
  
  public ClientParamsStack(ClientParamsStack paramClientParamsStack)
  {
    this(paramClientParamsStack.getApplicationParams(), paramClientParamsStack.getClientParams(), paramClientParamsStack.getRequestParams(), paramClientParamsStack.getOverrideParams());
  }
  
  public ClientParamsStack(ClientParamsStack paramClientParamsStack, HttpParams paramHttpParams1, HttpParams paramHttpParams2, HttpParams paramHttpParams3, HttpParams paramHttpParams4) {}
  
  public ClientParamsStack(HttpParams paramHttpParams1, HttpParams paramHttpParams2, HttpParams paramHttpParams3, HttpParams paramHttpParams4)
  {
    applicationParams = paramHttpParams1;
    clientParams = paramHttpParams2;
    requestParams = paramHttpParams3;
    overrideParams = paramHttpParams4;
  }
  
  public HttpParams copy()
  {
    return this;
  }
  
  public final HttpParams getApplicationParams()
  {
    return applicationParams;
  }
  
  public final HttpParams getClientParams()
  {
    return clientParams;
  }
  
  public final HttpParams getOverrideParams()
  {
    return overrideParams;
  }
  
  public Object getParameter(String paramString)
  {
    Args.notNull(paramString, "Parameter name");
    Object localObject2 = null;
    if (overrideParams != null) {
      localObject2 = overrideParams.getParameter(paramString);
    }
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      localObject1 = localObject2;
      if (requestParams != null) {
        localObject1 = requestParams.getParameter(paramString);
      }
    }
    localObject2 = localObject1;
    if (localObject1 == null)
    {
      localObject2 = localObject1;
      if (clientParams != null) {
        localObject2 = clientParams.getParameter(paramString);
      }
    }
    localObject1 = localObject2;
    if (localObject2 == null)
    {
      localObject1 = localObject2;
      if (applicationParams != null) {
        localObject1 = applicationParams.getParameter(paramString);
      }
    }
    return localObject1;
  }
  
  public final HttpParams getRequestParams()
  {
    return requestParams;
  }
  
  public boolean removeParameter(String paramString)
  {
    throw new UnsupportedOperationException("Removing parameters in a stack is not supported.");
  }
  
  public HttpParams setParameter(String paramString, Object paramObject)
    throws UnsupportedOperationException
  {
    throw new UnsupportedOperationException("Setting parameters in a stack is not supported.");
  }
}
