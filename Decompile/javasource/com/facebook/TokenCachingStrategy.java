package com.facebook;

import android.os.Bundle;
import com.facebook.internal.Validate;
import java.util.Date;

public abstract class TokenCachingStrategy
{
  public TokenCachingStrategy() {}
  
  static Date getDate(Bundle paramBundle, String paramString)
  {
    if (paramBundle == null) {}
    long l;
    do
    {
      return null;
      l = paramBundle.getLong(paramString, Long.MIN_VALUE);
    } while (l == Long.MIN_VALUE);
    return new Date(l);
  }
  
  public static AccessTokenSource getSource(Bundle paramBundle)
  {
    Validate.notNull(paramBundle, "bundle");
    if (paramBundle.containsKey("com.facebook.TokenCachingStrategy.AccessTokenSource")) {
      return (AccessTokenSource)paramBundle.getSerializable("com.facebook.TokenCachingStrategy.AccessTokenSource");
    }
    if (paramBundle.getBoolean("com.facebook.TokenCachingStrategy.IsSSO")) {
      return AccessTokenSource.FACEBOOK_APPLICATION_WEB;
    }
    return AccessTokenSource.WEB_VIEW;
  }
  
  public static boolean hasTokenInformation(Bundle paramBundle)
  {
    if (paramBundle == null) {}
    String str;
    do
    {
      return false;
      str = paramBundle.getString("com.facebook.TokenCachingStrategy.Token");
    } while ((str == null) || (str.length() == 0) || (paramBundle.getLong("com.facebook.TokenCachingStrategy.ExpirationDate", 0L) == 0L));
    return true;
  }
  
  static void putDate(Bundle paramBundle, String paramString, Date paramDate)
  {
    paramBundle.putLong(paramString, paramDate.getTime());
  }
  
  public abstract void clear();
  
  public abstract Bundle load();
  
  public abstract void save(Bundle paramBundle);
}
