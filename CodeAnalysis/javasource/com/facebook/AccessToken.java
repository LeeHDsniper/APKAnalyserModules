package com.facebook;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.text.TextUtils;
import com.facebook.internal.Utility;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public final class AccessToken
  implements Serializable
{
  private static final Date ALREADY_EXPIRED_EXPIRATION_TIME = MIN_DATE;
  private static final AccessTokenSource DEFAULT_ACCESS_TOKEN_SOURCE;
  private static final Date DEFAULT_EXPIRATION_TIME;
  private static final Date DEFAULT_LAST_REFRESH_TIME;
  private static final Date MAX_DATE;
  private static final Date MIN_DATE = new Date(Long.MIN_VALUE);
  private static final long serialVersionUID = 1L;
  private final List<String> declinedPermissions;
  private final Date expires;
  private final Date lastRefresh;
  private final List<String> permissions;
  private final AccessTokenSource source;
  private final String token;
  
  static
  {
    MAX_DATE = new Date(Long.MAX_VALUE);
    DEFAULT_EXPIRATION_TIME = MAX_DATE;
    DEFAULT_LAST_REFRESH_TIME = new Date();
    DEFAULT_ACCESS_TOKEN_SOURCE = AccessTokenSource.FACEBOOK_APPLICATION_WEB;
  }
  
  AccessToken(String paramString, Date paramDate1, List<String> paramList1, List<String> paramList2, AccessTokenSource paramAccessTokenSource, Date paramDate2)
  {
    Object localObject = paramList1;
    if (paramList1 == null) {
      localObject = Collections.emptyList();
    }
    paramList1 = paramList2;
    if (paramList2 == null) {
      paramList1 = Collections.emptyList();
    }
    expires = paramDate1;
    permissions = Collections.unmodifiableList((List)localObject);
    declinedPermissions = Collections.unmodifiableList(paramList1);
    token = paramString;
    source = paramAccessTokenSource;
    lastRefresh = paramDate2;
  }
  
  private void appendPermissions(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(" permissions:");
    if (permissions == null)
    {
      paramStringBuilder.append("null");
      return;
    }
    paramStringBuilder.append("[");
    paramStringBuilder.append(TextUtils.join(", ", permissions));
    paramStringBuilder.append("]");
  }
  
  static AccessToken createEmptyToken()
  {
    return new AccessToken("", ALREADY_EXPIRED_EXPIRATION_TIME, null, null, AccessTokenSource.NONE, DEFAULT_LAST_REFRESH_TIME);
  }
  
  static AccessToken createFromCache(Bundle paramBundle)
  {
    List localList1 = getPermissionsFromBundle(paramBundle, "com.facebook.TokenCachingStrategy.Permissions");
    List localList2 = getPermissionsFromBundle(paramBundle, "com.facebook.TokenCachingStrategy.DeclinedPermissions");
    return new AccessToken(paramBundle.getString("com.facebook.TokenCachingStrategy.Token"), TokenCachingStrategy.getDate(paramBundle, "com.facebook.TokenCachingStrategy.ExpirationDate"), localList1, localList2, TokenCachingStrategy.getSource(paramBundle), TokenCachingStrategy.getDate(paramBundle, "com.facebook.TokenCachingStrategy.LastRefreshDate"));
  }
  
  static AccessToken createFromNativeLogin(Bundle paramBundle, AccessTokenSource paramAccessTokenSource)
  {
    Date localDate = getBundleLongAsDate(paramBundle, "com.facebook.platform.extra.EXPIRES_SECONDS_SINCE_EPOCH", new Date(0L));
    return createNew(paramBundle.getStringArrayList("com.facebook.platform.extra.PERMISSIONS"), null, paramBundle.getString("com.facebook.platform.extra.ACCESS_TOKEN"), localDate, paramAccessTokenSource);
  }
  
  @SuppressLint({"FieldGetter"})
  static AccessToken createFromRefresh(AccessToken paramAccessToken, Bundle paramBundle)
  {
    if ((source != AccessTokenSource.FACEBOOK_APPLICATION_WEB) && (source != AccessTokenSource.FACEBOOK_APPLICATION_NATIVE) && (source != AccessTokenSource.FACEBOOK_APPLICATION_SERVICE)) {
      throw new FacebookException("Invalid token source: " + source);
    }
    Date localDate = getBundleLongAsDate(paramBundle, "expires_in", new Date(0L));
    paramBundle = paramBundle.getString("access_token");
    return createNew(paramAccessToken.getPermissions(), paramAccessToken.getDeclinedPermissions(), paramBundle, localDate, source);
  }
  
  static AccessToken createFromTokenWithRefreshedPermissions(AccessToken paramAccessToken, List<String> paramList1, List<String> paramList2)
  {
    return new AccessToken(token, expires, paramList1, paramList2, source, lastRefresh);
  }
  
  static AccessToken createFromWebBundle(List<String> paramList, Bundle paramBundle, AccessTokenSource paramAccessTokenSource)
  {
    Date localDate = getBundleLongAsDate(paramBundle, "expires_in", new Date());
    String str1 = paramBundle.getString("access_token");
    String str2 = paramBundle.getString("granted_scopes");
    if (!Utility.isNullOrEmpty(str2)) {
      paramList = new ArrayList(Arrays.asList(str2.split(",")));
    }
    str2 = paramBundle.getString("denied_scopes");
    paramBundle = null;
    if (!Utility.isNullOrEmpty(str2)) {
      paramBundle = new ArrayList(Arrays.asList(str2.split(",")));
    }
    return createNew(paramList, paramBundle, str1, localDate, paramAccessTokenSource);
  }
  
  private static AccessToken createNew(List<String> paramList1, List<String> paramList2, String paramString, Date paramDate, AccessTokenSource paramAccessTokenSource)
  {
    if ((Utility.isNullOrEmpty(paramString)) || (paramDate == null)) {
      return createEmptyToken();
    }
    return new AccessToken(paramString, paramDate, paramList1, paramList2, paramAccessTokenSource, new Date());
  }
  
  private static Date getBundleLongAsDate(Bundle paramBundle, String paramString, Date paramDate)
  {
    if (paramBundle == null) {
      return null;
    }
    paramBundle = paramBundle.get(paramString);
    long l;
    if ((paramBundle instanceof Long)) {
      l = ((Long)paramBundle).longValue();
    }
    for (;;)
    {
      if (l == 0L)
      {
        return new Date(Long.MAX_VALUE);
        if (!(paramBundle instanceof String)) {
          break;
        }
        try
        {
          l = Long.parseLong((String)paramBundle);
        }
        catch (NumberFormatException paramBundle)
        {
          return null;
        }
      }
    }
    return new Date(paramDate.getTime() + 1000L * l);
  }
  
  static List<String> getPermissionsFromBundle(Bundle paramBundle, String paramString)
  {
    paramBundle = paramBundle.getStringArrayList(paramString);
    if (paramBundle == null) {
      return Collections.emptyList();
    }
    return Collections.unmodifiableList(new ArrayList(paramBundle));
  }
  
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws InvalidObjectException
  {
    throw new InvalidObjectException("Cannot readObject, serialization proxy required");
  }
  
  private String tokenToString()
  {
    if (token == null) {
      return "null";
    }
    if (Settings.isLoggingBehaviorEnabled(LoggingBehavior.INCLUDE_ACCESS_TOKENS)) {
      return token;
    }
    return "ACCESS_TOKEN_REMOVED";
  }
  
  private Object writeReplace()
  {
    return new SerializationProxyV2(token, expires, permissions, declinedPermissions, source, lastRefresh, null);
  }
  
  public List<String> getDeclinedPermissions()
  {
    return declinedPermissions;
  }
  
  public Date getExpires()
  {
    return expires;
  }
  
  public Date getLastRefresh()
  {
    return lastRefresh;
  }
  
  public List<String> getPermissions()
  {
    return permissions;
  }
  
  public AccessTokenSource getSource()
  {
    return source;
  }
  
  public String getToken()
  {
    return token;
  }
  
  boolean isInvalid()
  {
    return (Utility.isNullOrEmpty(token)) || (new Date().after(expires));
  }
  
  Bundle toCacheBundle()
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("com.facebook.TokenCachingStrategy.Token", token);
    TokenCachingStrategy.putDate(localBundle, "com.facebook.TokenCachingStrategy.ExpirationDate", expires);
    localBundle.putStringArrayList("com.facebook.TokenCachingStrategy.Permissions", new ArrayList(permissions));
    localBundle.putStringArrayList("com.facebook.TokenCachingStrategy.DeclinedPermissions", new ArrayList(declinedPermissions));
    localBundle.putSerializable("com.facebook.TokenCachingStrategy.AccessTokenSource", source);
    TokenCachingStrategy.putDate(localBundle, "com.facebook.TokenCachingStrategy.LastRefreshDate", lastRefresh);
    return localBundle;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("{AccessToken");
    localStringBuilder.append(" token:").append(tokenToString());
    appendPermissions(localStringBuilder);
    localStringBuilder.append("}");
    return localStringBuilder.toString();
  }
  
  private static class SerializationProxyV2
    implements Serializable
  {
    private static final long serialVersionUID = -2488473066578201068L;
    private final List<String> declinedPermissions;
    private final Date expires;
    private final Date lastRefresh;
    private final List<String> permissions;
    private final AccessTokenSource source;
    private final String token;
    
    private SerializationProxyV2(String paramString, Date paramDate1, List<String> paramList1, List<String> paramList2, AccessTokenSource paramAccessTokenSource, Date paramDate2)
    {
      expires = paramDate1;
      permissions = paramList1;
      declinedPermissions = paramList2;
      token = paramString;
      source = paramAccessTokenSource;
      lastRefresh = paramDate2;
    }
    
    private Object readResolve()
    {
      return new AccessToken(token, expires, permissions, declinedPermissions, source, lastRefresh);
    }
  }
}
