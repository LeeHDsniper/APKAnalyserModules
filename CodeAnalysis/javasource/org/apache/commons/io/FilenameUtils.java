package org.apache.commons.io;

import java.io.File;

public class FilenameUtils
{
  public static final String EXTENSION_SEPARATOR_STR = Character.toString('.');
  private static final char OTHER_SEPARATOR = '\\';
  private static final char SYSTEM_SEPARATOR = File.separatorChar;
  
  static
  {
    if (isSystemWindows())
    {
      OTHER_SEPARATOR = '/';
      return;
    }
  }
  
  public static String concat(String paramString1, String paramString2)
  {
    int i = getPrefixLength(paramString2);
    if (i < 0) {}
    do
    {
      return null;
      if (i > 0) {
        return normalize(paramString2);
      }
    } while (paramString1 == null);
    i = paramString1.length();
    if (i == 0) {
      return normalize(paramString2);
    }
    if (isSeparator(paramString1.charAt(i - 1))) {
      return normalize(paramString1 + paramString2);
    }
    return normalize(paramString1 + '/' + paramString2);
  }
  
  private static String doNormalize(String paramString, char paramChar, boolean paramBoolean)
  {
    if (paramString == null) {
      localObject = null;
    }
    do
    {
      return localObject;
      k = paramString.length();
      localObject = paramString;
    } while (k == 0);
    int i2 = getPrefixLength(paramString);
    if (i2 < 0) {
      return null;
    }
    Object localObject = new char[k + 2];
    paramString.getChars(0, paramString.length(), (char[])localObject, 0);
    if (paramChar == SYSTEM_SEPARATOR) {}
    for (int i = OTHER_SEPARATOR;; i = SYSTEM_SEPARATOR)
    {
      j = 0;
      while (j < localObject.length)
      {
        if (localObject[j] == i) {
          localObject[j] = paramChar;
        }
        j += 1;
      }
    }
    i = 1;
    int j = k;
    if (localObject[(k - 1)] != paramChar)
    {
      localObject[k] = paramChar;
      i = 0;
      j = k + 1;
    }
    int k = i2 + 1;
    int m;
    while (k < j)
    {
      n = k;
      m = j;
      if (localObject[k] == paramChar)
      {
        n = k;
        m = j;
        if (localObject[(k - 1)] == paramChar)
        {
          System.arraycopy(localObject, k, localObject, k - 1, j - k);
          m = j - 1;
          n = k - 1;
        }
      }
      k = n + 1;
      j = m;
    }
    k = i2 + 1;
    int i1;
    while (k < j)
    {
      i1 = k;
      n = i;
      m = j;
      if (localObject[k] == paramChar)
      {
        i1 = k;
        n = i;
        m = j;
        if (localObject[(k - 1)] == '.') {
          if (k != i2 + 1)
          {
            i1 = k;
            n = i;
            m = j;
            if (localObject[(k - 2)] != paramChar) {}
          }
          else
          {
            if (k == j - 1) {
              i = 1;
            }
            System.arraycopy(localObject, k + 1, localObject, k - 1, j - k);
            m = j - 2;
            i1 = k - 1;
            n = i;
          }
        }
      }
      k = i1 + 1;
      i = n;
      j = m;
    }
    k = i2 + 2;
    int n = j;
    j = k;
    if (j < n)
    {
      m = j;
      i1 = i;
      k = n;
      if (localObject[j] == paramChar)
      {
        m = j;
        i1 = i;
        k = n;
        if (localObject[(j - 1)] == '.')
        {
          m = j;
          i1 = i;
          k = n;
          if (localObject[(j - 2)] == '.') {
            if (j != i2 + 2)
            {
              m = j;
              i1 = i;
              k = n;
              if (localObject[(j - 3)] != paramChar) {}
            }
            else
            {
              if (j == i2 + 2) {
                return null;
              }
              if (j == n - 1) {
                i = 1;
              }
              k = j - 4;
              label528:
              if (k < i2) {
                break label612;
              }
              if (localObject[k] != paramChar) {
                break label603;
              }
              System.arraycopy(localObject, j + 1, localObject, k + 1, n - j);
              j = n - (j - k);
              m = k + 1;
              k = j;
            }
          }
        }
      }
      for (i1 = i;; i1 = i)
      {
        j = m + 1;
        i = i1;
        n = k;
        break;
        label603:
        k -= 1;
        break label528;
        label612:
        System.arraycopy(localObject, j + 1, localObject, i2, n - j);
        k = n - (j + 1 - i2);
        m = i2 + 1;
      }
    }
    if (n <= 0) {
      return "";
    }
    if (n <= i2) {
      return new String((char[])localObject, 0, n);
    }
    if ((i != 0) && (paramBoolean)) {
      return new String((char[])localObject, 0, n);
    }
    return new String((char[])localObject, 0, n - 1);
  }
  
  public static String getName(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return paramString.substring(indexOfLastSeparator(paramString) + 1);
  }
  
  public static int getPrefixLength(String paramString)
  {
    int i = 1;
    if (paramString == null) {
      i = -1;
    }
    char c1;
    do
    {
      int m;
      do
      {
        return i;
        m = paramString.length();
        if (m == 0) {
          return 0;
        }
        c1 = paramString.charAt(0);
        if (c1 == ':') {
          return -1;
        }
        if (m != 1) {
          break;
        }
        if (c1 == '~') {
          return 2;
        }
      } while (isSeparator(c1));
      return 0;
      int k;
      int j;
      if (c1 == '~')
      {
        k = paramString.indexOf('/', 1);
        j = paramString.indexOf('\\', 1);
        if ((k == -1) && (j == -1)) {
          return m + 1;
        }
        i = k;
        if (k == -1) {
          i = j;
        }
        k = j;
        if (j == -1) {
          k = i;
        }
        return Math.min(i, k) + 1;
      }
      char c2 = paramString.charAt(1);
      if (c2 == ':')
      {
        i = Character.toUpperCase(c1);
        if ((i >= 65) && (i <= 90))
        {
          if ((m == 2) || (!isSeparator(paramString.charAt(2)))) {
            return 2;
          }
          return 3;
        }
        return -1;
      }
      if ((isSeparator(c1)) && (isSeparator(c2)))
      {
        k = paramString.indexOf('/', 2);
        j = paramString.indexOf('\\', 2);
        if (((k == -1) && (j == -1)) || (k == 2) || (j == 2)) {
          return -1;
        }
        i = k;
        if (k == -1) {
          i = j;
        }
        k = j;
        if (j == -1) {
          k = i;
        }
        return Math.min(i, k) + 1;
      }
    } while (isSeparator(c1));
    return 0;
  }
  
  public static int indexOfLastSeparator(String paramString)
  {
    if (paramString == null) {
      return -1;
    }
    return Math.max(paramString.lastIndexOf('/'), paramString.lastIndexOf('\\'));
  }
  
  private static boolean isSeparator(char paramChar)
  {
    return (paramChar == '/') || (paramChar == '\\');
  }
  
  static boolean isSystemWindows()
  {
    return SYSTEM_SEPARATOR == '\\';
  }
  
  public static String normalize(String paramString)
  {
    return doNormalize(paramString, SYSTEM_SEPARATOR, true);
  }
}
