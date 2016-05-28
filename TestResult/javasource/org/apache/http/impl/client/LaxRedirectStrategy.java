package org.apache.http.impl.client;

import org.apache.http.annotation.Immutable;

@Immutable
public class LaxRedirectStrategy
  extends DefaultRedirectStrategy
{
  private static final String[] REDIRECT_METHODS = { "GET", "POST", "HEAD" };
  
  public LaxRedirectStrategy() {}
  
  protected boolean isRedirectable(String paramString)
  {
    String[] arrayOfString = REDIRECT_METHODS;
    int j = arrayOfString.length;
    int i = 0;
    while (i < j)
    {
      if (arrayOfString[i].equalsIgnoreCase(paramString)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
}
