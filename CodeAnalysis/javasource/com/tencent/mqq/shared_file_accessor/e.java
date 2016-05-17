package com.tencent.mqq.shared_file_accessor;

public final class e
{
  public int a = 0;
  public String b = null;
  
  private e(int paramInt, String paramString)
  {
    a = paramInt;
    b = paramString;
  }
  
  public final boolean equals(Object paramObject)
  {
    if (paramObject == null) {}
    do
    {
      return false;
      if (!(paramObject instanceof Integer)) {
        break;
      }
    } while (a != ((Integer)paramObject).intValue());
    return true;
    if ((paramObject instanceof String)) {
      return b.equals(paramObject);
    }
    return super.equals(paramObject);
  }
  
  public final String toString()
  {
    return b;
  }
}
