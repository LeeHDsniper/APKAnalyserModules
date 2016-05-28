package org.apache.http.util;

public class Asserts
{
  public Asserts() {}
  
  public static void check(boolean paramBoolean, String paramString)
  {
    if (!paramBoolean) {
      throw new IllegalStateException(paramString);
    }
  }
  
  public static void check(boolean paramBoolean, String paramString, Object... paramVarArgs)
  {
    if (!paramBoolean) {
      throw new IllegalStateException(String.format(paramString, paramVarArgs));
    }
  }
  
  public static void notBlank(CharSequence paramCharSequence, String paramString)
  {
    if (TextUtils.isBlank(paramCharSequence)) {
      throw new IllegalStateException(paramString + " is blank");
    }
  }
  
  public static void notEmpty(CharSequence paramCharSequence, String paramString)
  {
    if (TextUtils.isEmpty(paramCharSequence)) {
      throw new IllegalStateException(paramString + " is empty");
    }
  }
  
  public static void notNull(Object paramObject, String paramString)
  {
    if (paramObject == null) {
      throw new IllegalStateException(paramString + " is null");
    }
  }
}
