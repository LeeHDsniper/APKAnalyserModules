package org.apache.http.impl.client;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.Credentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.util.Args;

@ThreadSafe
public class BasicCredentialsProvider
  implements CredentialsProvider
{
  private final ConcurrentHashMap<AuthScope, Credentials> credMap = new ConcurrentHashMap();
  
  public BasicCredentialsProvider() {}
  
  private static Credentials matchCredentials(Map<AuthScope, Credentials> paramMap, AuthScope paramAuthScope)
  {
    Credentials localCredentials = (Credentials)paramMap.get(paramAuthScope);
    Object localObject2 = localCredentials;
    if (localCredentials == null)
    {
      int i = -1;
      Object localObject1 = null;
      Iterator localIterator = paramMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        localObject2 = (AuthScope)localIterator.next();
        int j = paramAuthScope.match((AuthScope)localObject2);
        if (j > i)
        {
          i = j;
          localObject1 = localObject2;
        }
      }
      localObject2 = localCredentials;
      if (localObject1 != null) {
        localObject2 = (Credentials)paramMap.get(localObject1);
      }
    }
    return localObject2;
  }
  
  public void clear()
  {
    credMap.clear();
  }
  
  public Credentials getCredentials(AuthScope paramAuthScope)
  {
    Args.notNull(paramAuthScope, "Authentication scope");
    return matchCredentials(credMap, paramAuthScope);
  }
  
  public void setCredentials(AuthScope paramAuthScope, Credentials paramCredentials)
  {
    Args.notNull(paramAuthScope, "Authentication scope");
    credMap.put(paramAuthScope, paramCredentials);
  }
  
  public String toString()
  {
    return credMap.toString();
  }
}
