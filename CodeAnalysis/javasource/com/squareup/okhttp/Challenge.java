package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;

public final class Challenge
{
  private final String realm;
  private final String scheme;
  
  public Challenge(String paramString1, String paramString2)
  {
    scheme = paramString1;
    realm = paramString2;
  }
  
  public boolean equals(Object paramObject)
  {
    return ((paramObject instanceof Challenge)) && (Util.equal(scheme, scheme)) && (Util.equal(realm, realm));
  }
  
  public String getRealm()
  {
    return realm;
  }
  
  public String getScheme()
  {
    return scheme;
  }
  
  public int hashCode()
  {
    int j = 0;
    if (realm != null) {}
    for (int i = realm.hashCode();; i = 0)
    {
      if (scheme != null) {
        j = scheme.hashCode();
      }
      return (i + 899) * 31 + j;
    }
  }
  
  public String toString()
  {
    return scheme + " realm=\"" + realm + "\"";
  }
}
