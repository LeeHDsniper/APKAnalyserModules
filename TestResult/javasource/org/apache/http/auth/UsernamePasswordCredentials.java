package org.apache.http.auth;

import java.io.Serializable;
import java.security.Principal;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public class UsernamePasswordCredentials
  implements Serializable, Credentials
{
  private static final long serialVersionUID = 243343858802739403L;
  private final String password;
  private final BasicUserPrincipal principal;
  
  public UsernamePasswordCredentials(String paramString)
  {
    Args.notNull(paramString, "Username:password string");
    int i = paramString.indexOf(':');
    if (i >= 0)
    {
      principal = new BasicUserPrincipal(paramString.substring(0, i));
      password = paramString.substring(i + 1);
      return;
    }
    principal = new BasicUserPrincipal(paramString);
    password = null;
  }
  
  public UsernamePasswordCredentials(String paramString1, String paramString2)
  {
    Args.notNull(paramString1, "Username");
    principal = new BasicUserPrincipal(paramString1);
    password = paramString2;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof UsernamePasswordCredentials)) {
        break;
      }
      paramObject = (UsernamePasswordCredentials)paramObject;
    } while (LangUtils.equals(principal, principal));
    return false;
  }
  
  public String getPassword()
  {
    return password;
  }
  
  public String getUserName()
  {
    return principal.getName();
  }
  
  public Principal getUserPrincipal()
  {
    return principal;
  }
  
  public int hashCode()
  {
    return principal.hashCode();
  }
  
  public String toString()
  {
    return principal.toString();
  }
}
