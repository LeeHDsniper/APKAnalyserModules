package org.apache.http.client.utils;

import java.util.StringTokenizer;
import org.apache.http.annotation.Immutable;

@Immutable
public class Rfc3492Idn
  implements Idn
{
  private static final String ACE_PREFIX = "xn--";
  private static final int base = 36;
  private static final int damp = 700;
  private static final char delimiter = '-';
  private static final int initial_bias = 72;
  private static final int initial_n = 128;
  private static final int skew = 38;
  private static final int tmax = 26;
  private static final int tmin = 1;
  
  public Rfc3492Idn() {}
  
  private int adapt(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    if (paramBoolean) {
      paramInt1 /= 700;
    }
    for (;;)
    {
      paramInt2 = paramInt1 + paramInt1 / paramInt2;
      paramInt1 = 0;
      while (paramInt2 > 455)
      {
        paramInt2 /= 35;
        paramInt1 += 36;
      }
      paramInt1 /= 2;
    }
    return paramInt2 * 36 / (paramInt2 + 38) + paramInt1;
  }
  
  private int digit(char paramChar)
  {
    if ((paramChar >= 'A') && (paramChar <= 'Z')) {
      return paramChar - 'A';
    }
    if ((paramChar >= 'a') && (paramChar <= 'z')) {
      return paramChar - 'a';
    }
    if ((paramChar >= '0') && (paramChar <= '9')) {
      return paramChar - '0' + 26;
    }
    throw new IllegalArgumentException("illegal digit: " + paramChar);
  }
  
  protected String decode(String paramString)
  {
    String str = paramString;
    int j = 128;
    int n = 0;
    int i1 = 72;
    StringBuilder localStringBuilder = new StringBuilder(str.length());
    int i2 = str.lastIndexOf('-');
    int k = i1;
    int i = n;
    paramString = str;
    int m = j;
    if (i2 != -1)
    {
      localStringBuilder.append(str.subSequence(0, i2));
      paramString = str.substring(i2 + 1);
      m = j;
      i = n;
      k = i1;
    }
    if (paramString.length() > 0)
    {
      i1 = 1;
      n = 36;
      j = i;
      int i3;
      if (paramString.length() == 0)
      {
        i3 = j;
        label121:
        j = localStringBuilder.length();
        if (i != 0) {
          break label304;
        }
      }
      label304:
      for (boolean bool = true;; bool = false)
      {
        k = adapt(i3 - i, j + 1, bool);
        m += i3 / (localStringBuilder.length() + 1);
        i = i3 % (localStringBuilder.length() + 1);
        localStringBuilder.insert(i, (char)m);
        i += 1;
        break;
        char c = paramString.charAt(0);
        str = paramString.substring(1);
        int i4 = digit(c);
        i2 = j + i4 * i1;
        if (n <= k + 1) {
          j = 1;
        }
        for (;;)
        {
          i3 = i2;
          paramString = str;
          if (i4 < j) {
            break label121;
          }
          i1 *= (36 - j);
          n += 36;
          j = i2;
          paramString = str;
          break;
          if (n >= k + 26) {
            j = 26;
          } else {
            j = n - k;
          }
        }
      }
    }
    return localStringBuilder.toString();
  }
  
  public String toUnicode(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder(paramString.length());
    StringTokenizer localStringTokenizer = new StringTokenizer(paramString, ".");
    while (localStringTokenizer.hasMoreTokens())
    {
      String str = localStringTokenizer.nextToken();
      if (localStringBuilder.length() > 0) {
        localStringBuilder.append('.');
      }
      paramString = str;
      if (str.startsWith("xn--")) {
        paramString = decode(str.substring(4));
      }
      localStringBuilder.append(paramString);
    }
    return localStringBuilder.toString();
  }
}
