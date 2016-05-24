package com.squareup.okhttp;

import com.squareup.okhttp.internal.http.HeaderParser;
import java.util.concurrent.TimeUnit;

public final class CacheControl
{
  public static final CacheControl FORCE_CACHE = new Builder().onlyIfCached().maxStale(Integer.MAX_VALUE, TimeUnit.SECONDS).build();
  public static final CacheControl FORCE_NETWORK = new Builder().noCache().build();
  private final boolean isPublic;
  private final int maxAgeSeconds;
  private final int maxStaleSeconds;
  private final int minFreshSeconds;
  private final boolean mustRevalidate;
  private final boolean noCache;
  private final boolean noStore;
  private final boolean noTransform;
  private final boolean onlyIfCached;
  private final int sMaxAgeSeconds;
  
  private CacheControl(Builder paramBuilder)
  {
    noCache = noCache;
    noStore = noStore;
    maxAgeSeconds = maxAgeSeconds;
    sMaxAgeSeconds = -1;
    isPublic = false;
    mustRevalidate = false;
    maxStaleSeconds = maxStaleSeconds;
    minFreshSeconds = minFreshSeconds;
    onlyIfCached = onlyIfCached;
    noTransform = noTransform;
  }
  
  private CacheControl(boolean paramBoolean1, boolean paramBoolean2, int paramInt1, int paramInt2, boolean paramBoolean3, boolean paramBoolean4, int paramInt3, int paramInt4, boolean paramBoolean5, boolean paramBoolean6)
  {
    noCache = paramBoolean1;
    noStore = paramBoolean2;
    maxAgeSeconds = paramInt1;
    sMaxAgeSeconds = paramInt2;
    isPublic = paramBoolean3;
    mustRevalidate = paramBoolean4;
    maxStaleSeconds = paramInt3;
    minFreshSeconds = paramInt4;
    onlyIfCached = paramBoolean5;
    noTransform = paramBoolean6;
  }
  
  public static CacheControl parse(Headers paramHeaders)
  {
    boolean bool6 = false;
    boolean bool5 = false;
    int n = -1;
    int m = -1;
    boolean bool4 = false;
    boolean bool3 = false;
    int k = -1;
    int j = -1;
    boolean bool2 = false;
    boolean bool1 = false;
    int i1 = 0;
    while (i1 < paramHeaders.size())
    {
      boolean bool7;
      boolean bool8;
      int i;
      int i3;
      boolean bool9;
      boolean bool10;
      int i4;
      int i5;
      boolean bool11;
      boolean bool12;
      if ((!paramHeaders.name(i1).equalsIgnoreCase("Cache-Control")) && (!paramHeaders.name(i1).equalsIgnoreCase("Pragma")))
      {
        bool7 = bool1;
        bool8 = bool2;
        i = j;
        i3 = k;
        bool9 = bool3;
        bool10 = bool4;
        i4 = m;
        i5 = n;
        bool11 = bool5;
        bool12 = bool6;
        i1 += 1;
        bool6 = bool12;
        bool5 = bool11;
        n = i5;
        m = i4;
        bool4 = bool10;
        bool3 = bool9;
        k = i3;
        j = i;
        bool2 = bool8;
        bool1 = bool7;
      }
      else
      {
        String str2 = paramHeaders.value(i1);
        int i2 = 0;
        for (;;)
        {
          bool12 = bool6;
          bool11 = bool5;
          i5 = n;
          i4 = m;
          bool10 = bool4;
          bool9 = bool3;
          i3 = k;
          i = j;
          bool8 = bool2;
          bool7 = bool1;
          if (i2 >= str2.length()) {
            break;
          }
          i = HeaderParser.skipUntil(str2, i2, "=,;");
          String str3 = str2.substring(i2, i).trim();
          String str1;
          if ((i == str2.length()) || (str2.charAt(i) == ',') || (str2.charAt(i) == ';'))
          {
            i += 1;
            str1 = null;
          }
          for (;;)
          {
            if (!"no-cache".equalsIgnoreCase(str3)) {
              break label380;
            }
            bool6 = true;
            i2 = i;
            break;
            i2 = HeaderParser.skipWhitespace(str2, i + 1);
            if ((i2 < str2.length()) && (str2.charAt(i2) == '"'))
            {
              i = i2 + 1;
              i2 = HeaderParser.skipUntil(str2, i, "\"");
              str1 = str2.substring(i, i2);
              i = i2 + 1;
            }
            else
            {
              i = HeaderParser.skipUntil(str2, i2, ",;");
              str1 = str2.substring(i2, i).trim();
            }
          }
          label380:
          if ("no-store".equalsIgnoreCase(str3))
          {
            bool5 = true;
            i2 = i;
          }
          else if ("max-age".equalsIgnoreCase(str3))
          {
            n = HeaderParser.parseSeconds(str1, -1);
            i2 = i;
          }
          else if ("s-maxage".equalsIgnoreCase(str3))
          {
            m = HeaderParser.parseSeconds(str1, -1);
            i2 = i;
          }
          else if ("public".equalsIgnoreCase(str3))
          {
            bool4 = true;
            i2 = i;
          }
          else if ("must-revalidate".equalsIgnoreCase(str3))
          {
            bool3 = true;
            i2 = i;
          }
          else if ("max-stale".equalsIgnoreCase(str3))
          {
            k = HeaderParser.parseSeconds(str1, Integer.MAX_VALUE);
            i2 = i;
          }
          else if ("min-fresh".equalsIgnoreCase(str3))
          {
            j = HeaderParser.parseSeconds(str1, -1);
            i2 = i;
          }
          else if ("only-if-cached".equalsIgnoreCase(str3))
          {
            bool2 = true;
            i2 = i;
          }
          else
          {
            i2 = i;
            if ("no-transform".equalsIgnoreCase(str3))
            {
              bool1 = true;
              i2 = i;
            }
          }
        }
      }
    }
    return new CacheControl(bool6, bool5, n, m, bool4, bool3, k, j, bool2, bool1);
  }
  
  public int maxAgeSeconds()
  {
    return maxAgeSeconds;
  }
  
  public int maxStaleSeconds()
  {
    return maxStaleSeconds;
  }
  
  public int minFreshSeconds()
  {
    return minFreshSeconds;
  }
  
  public boolean mustRevalidate()
  {
    return mustRevalidate;
  }
  
  public boolean noCache()
  {
    return noCache;
  }
  
  public boolean noStore()
  {
    return noStore;
  }
  
  public boolean onlyIfCached()
  {
    return onlyIfCached;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (noCache) {
      localStringBuilder.append("no-cache, ");
    }
    if (noStore) {
      localStringBuilder.append("no-store, ");
    }
    if (maxAgeSeconds != -1) {
      localStringBuilder.append("max-age=").append(maxAgeSeconds).append(", ");
    }
    if (sMaxAgeSeconds != -1) {
      localStringBuilder.append("s-maxage=").append(sMaxAgeSeconds).append(", ");
    }
    if (isPublic) {
      localStringBuilder.append("public, ");
    }
    if (mustRevalidate) {
      localStringBuilder.append("must-revalidate, ");
    }
    if (maxStaleSeconds != -1) {
      localStringBuilder.append("max-stale=").append(maxStaleSeconds).append(", ");
    }
    if (minFreshSeconds != -1) {
      localStringBuilder.append("min-fresh=").append(minFreshSeconds).append(", ");
    }
    if (onlyIfCached) {
      localStringBuilder.append("only-if-cached, ");
    }
    if (noTransform) {
      localStringBuilder.append("no-transform, ");
    }
    if (localStringBuilder.length() == 0) {
      return "";
    }
    localStringBuilder.delete(localStringBuilder.length() - 2, localStringBuilder.length());
    return localStringBuilder.toString();
  }
  
  public static final class Builder
  {
    int maxAgeSeconds = -1;
    int maxStaleSeconds = -1;
    int minFreshSeconds = -1;
    boolean noCache;
    boolean noStore;
    boolean noTransform;
    boolean onlyIfCached;
    
    public Builder() {}
    
    public CacheControl build()
    {
      return new CacheControl(this, null);
    }
    
    public Builder maxStale(int paramInt, TimeUnit paramTimeUnit)
    {
      if (paramInt < 0) {
        throw new IllegalArgumentException("maxStale < 0: " + paramInt);
      }
      long l = paramTimeUnit.toSeconds(paramInt);
      if (l > 2147483647L) {}
      for (paramInt = Integer.MAX_VALUE;; paramInt = (int)l)
      {
        maxStaleSeconds = paramInt;
        return this;
      }
    }
    
    public Builder noCache()
    {
      noCache = true;
      return this;
    }
    
    public Builder noStore()
    {
      noStore = true;
      return this;
    }
    
    public Builder onlyIfCached()
    {
      onlyIfCached = true;
      return this;
    }
  }
}
