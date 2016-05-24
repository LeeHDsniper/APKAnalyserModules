package org.apache.http.auth;

import java.io.Serializable;
import java.security.Principal;
import java.util.Locale;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public class NTUserPrincipal
  implements Serializable, Principal
{
  private static final long serialVersionUID = -6870169797924406894L;
  private final String domain;
  private final String ntname;
  private final String username;
  
  public NTUserPrincipal(String paramString1, String paramString2)
  {
    Args.notNull(paramString2, "User name");
    username = paramString2;
    if (paramString1 != null) {}
    for (domain = paramString1.toUpperCase(Locale.ENGLISH); (domain != null) && (domain.length() > 0); domain = null)
    {
      paramString1 = new StringBuilder();
      paramString1.append(domain);
      paramString1.append('\\');
      paramString1.append(username);
      ntname = paramString1.toString();
      return;
    }
    ntname = username;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof NTUserPrincipal)) {
        break;
      }
      paramObject = (NTUserPrincipal)paramObject;
    } while ((LangUtils.equals(username, username)) && (LangUtils.equals(domain, domain)));
    return false;
  }
  
  public String getDomain()
  {
    return domain;
  }
  
  public String getName()
  {
    return ntname;
  }
  
  public String getUsername()
  {
    return username;
  }
  
  public int hashCode()
  {
    return LangUtils.hashCode(LangUtils.hashCode(17, username), domain);
  }
  
  public String toString()
  {
    return ntname;
  }
}
