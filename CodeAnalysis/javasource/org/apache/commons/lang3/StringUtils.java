package org.apache.commons.lang3;

public class StringUtils
{
  public static boolean isEmpty(CharSequence paramCharSequence)
  {
    return (paramCharSequence == null) || (paramCharSequence.length() == 0);
  }
  
  public static String repeat(char paramChar, int paramInt)
  {
    char[] arrayOfChar = new char[paramInt];
    paramInt -= 1;
    while (paramInt >= 0)
    {
      arrayOfChar[paramInt] = paramChar;
      paramInt -= 1;
    }
    return new String(arrayOfChar);
  }
  
  public static String rightPad(String paramString, int paramInt, char paramChar)
  {
    String str;
    if (paramString == null) {
      str = null;
    }
    int i;
    do
    {
      return str;
      i = paramInt - paramString.length();
      str = paramString;
    } while (i <= 0);
    if (i > 8192) {
      return rightPad(paramString, paramInt, String.valueOf(paramChar));
    }
    return paramString.concat(repeat(paramChar, i));
  }
  
  public static String rightPad(String paramString1, int paramInt, String paramString2)
  {
    if (paramString1 == null) {
      paramString2 = null;
    }
    int i;
    int j;
    do
    {
      return paramString2;
      localObject = paramString2;
      if (isEmpty(paramString2)) {
        localObject = " ";
      }
      i = ((String)localObject).length();
      j = paramInt - paramString1.length();
      paramString2 = paramString1;
    } while (j <= 0);
    if ((i == 1) && (j <= 8192)) {
      return rightPad(paramString1, paramInt, ((String)localObject).charAt(0));
    }
    if (j == i) {
      return paramString1.concat((String)localObject);
    }
    if (j < i) {
      return paramString1.concat(((String)localObject).substring(0, j));
    }
    paramString2 = new char[j];
    Object localObject = ((String)localObject).toCharArray();
    paramInt = 0;
    while (paramInt < j)
    {
      paramString2[paramInt] = localObject[(paramInt % i)];
      paramInt += 1;
    }
    return paramString1.concat(new String(paramString2));
  }
}
