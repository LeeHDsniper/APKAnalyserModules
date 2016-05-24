package org.apache.http.util;

public final class TextUtils
{
  public TextUtils() {}
  
  public static boolean isBlank(CharSequence paramCharSequence)
  {
    if (paramCharSequence == null) {}
    for (;;)
    {
      return true;
      int i = 0;
      while (i < paramCharSequence.length())
      {
        if (!Character.isWhitespace(paramCharSequence.charAt(i))) {
          return false;
        }
        i += 1;
      }
    }
  }
  
  public static boolean isEmpty(CharSequence paramCharSequence)
  {
    if (paramCharSequence == null) {}
    while (paramCharSequence.length() == 0) {
      return true;
    }
    return false;
  }
}
