package org.apache.http.auth;

import java.io.Serializable;
import java.security.Principal;
import java.util.Locale;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public class NTCredentials
  implements Serializable, Credentials
{
  private static final long serialVersionUID = -7385699315228907265L;
  private final String password;
  private final NTUserPrincipal principal;
  private final String workstation;
  
  public NTCredentials(String paramString)
  {
    Args.notNull(paramString, "Username:password string");
    int i = paramString.indexOf(':');
    if (i >= 0)
    {
      String str = paramString.substring(0, i);
      password = paramString.substring(i + 1);
      paramString = str;
      i = paramString.indexOf('/');
      if (i < 0) {
        break label97;
      }
    }
    label97:
    for (principal = new NTUserPrincipal(paramString.substring(0, i).toUpperCase(Locale.ENGLISH), paramString.substring(i + 1));; principal = new NTUserPrincipal(null, paramString.substring(i + 1)))
    {
      workstation = null;
      return;
      password = null;
      break;
    }
  }
  
  public NTCredentials(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    Args.notNull(paramString1, "User name");
    principal = new NTUserPrincipal(paramString4, paramString1);
    password = paramString2;
    if (paramString3 != null)
    {
      workstation = paramString3.toUpperCase(Locale.ENGLISH);
      return;
    }
    workstation = null;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof NTCredentials)) {
        break;
      }
      paramObject = (NTCredentials)paramObject;
    } while ((LangUtils.equals(principal, principal)) && (LangUtils.equals(workstation, workstation)));
    return false;
  }
  
  public String getDomain()
  {
    return principal.getDomain();
  }
  
  public String getPassword()
  {
    return password;
  }
  
  public String getUserName()
  {
    return principal.getUsername();
  }
  
  public Principal getUserPrincipal()
  {
    return principal;
  }
  
  public String getWorkstation()
  {
    return workstation;
  }
  
  public int hashCode()
  {
    return LangUtils.hashCode(LangUtils.hashCode(17, principal), workstation);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[principal: ");
    localStringBuilder.append(principal);
    localStringBuilder.append("][workstation: ");
    localStringBuilder.append(workstation);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}
