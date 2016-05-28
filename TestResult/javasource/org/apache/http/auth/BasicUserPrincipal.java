package org.apache.http.auth;

import java.io.Serializable;
import java.security.Principal;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public final class BasicUserPrincipal
  implements Serializable, Principal
{
  private static final long serialVersionUID = -2266305184969850467L;
  private final String username;
  
  public BasicUserPrincipal(String paramString)
  {
    Args.notNull(paramString, "User name");
    username = paramString;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof BasicUserPrincipal)) {
        break;
      }
      paramObject = (BasicUserPrincipal)paramObject;
    } while (LangUtils.equals(username, username));
    return false;
  }
  
  public String getName()
  {
    return username;
  }
  
  public int hashCode()
  {
    return LangUtils.hashCode(17, username);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[principal: ");
    localStringBuilder.append(username);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}
