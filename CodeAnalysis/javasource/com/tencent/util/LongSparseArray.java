package com.tencent.util;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class LongSparseArray
  implements Cloneable
{
  private static final Object jdField_a_of_type_JavaLangObject = new Object();
  private int jdField_a_of_type_Int;
  private boolean jdField_a_of_type_Boolean = false;
  private long[] jdField_a_of_type_ArrayOfLong;
  private Object[] jdField_a_of_type_ArrayOfJavaLangObject;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public LongSparseArray()
  {
    this(10);
  }
  
  public LongSparseArray(int paramInt)
  {
    paramInt = b(paramInt);
    jdField_a_of_type_ArrayOfLong = new long[paramInt];
    jdField_a_of_type_ArrayOfJavaLangObject = new Object[paramInt];
    jdField_a_of_type_Int = 0;
  }
  
  public static int a(int paramInt)
  {
    int i = 4;
    for (;;)
    {
      int j = paramInt;
      if (i < 32)
      {
        if (paramInt <= (1 << i) - 12) {
          j = (1 << i) - 12;
        }
      }
      else {
        return j;
      }
      i += 1;
    }
  }
  
  private static int a(long[] paramArrayOfLong, int paramInt1, int paramInt2, long paramLong)
  {
    int j = paramInt1 - 1;
    int i = paramInt1 + paramInt2;
    while (i - j > 1)
    {
      int k = (i + j) / 2;
      if (paramArrayOfLong[k] < paramLong) {
        j = k;
      } else {
        i = k;
      }
    }
    if (i == paramInt1 + paramInt2) {
      paramInt1 = paramInt1 + paramInt2 ^ 0xFFFFFFFF;
    }
    do
    {
      return paramInt1;
      paramInt1 = i;
    } while (paramArrayOfLong[i] == paramLong);
    return i ^ 0xFFFFFFFF;
  }
  
  public static int b(int paramInt)
  {
    return a(paramInt * 8) / 8;
  }
  
  private void b()
  {
    int m = jdField_a_of_type_Int;
    long[] arrayOfLong = jdField_a_of_type_ArrayOfLong;
    Object[] arrayOfObject = jdField_a_of_type_ArrayOfJavaLangObject;
    int i = 0;
    int k;
    for (int j = 0; i < m; j = k)
    {
      Object localObject = arrayOfObject[i];
      k = j;
      if (localObject != jdField_a_of_type_JavaLangObject)
      {
        if (i != j)
        {
          arrayOfLong[j] = arrayOfLong[i];
          arrayOfObject[j] = localObject;
          arrayOfObject[i] = null;
        }
        k = j + 1;
      }
      i += 1;
    }
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Int = j;
  }
  
  public int a()
  {
    if (jdField_a_of_type_Boolean) {
      b();
    }
    return jdField_a_of_type_Int;
  }
  
  public int a(long paramLong)
  {
    if (jdField_a_of_type_Boolean) {
      b();
    }
    return a(jdField_a_of_type_ArrayOfLong, 0, jdField_a_of_type_Int, paramLong);
  }
  
  public int a(Object paramObject)
  {
    if (jdField_a_of_type_Boolean) {
      b();
    }
    int i = 0;
    while (i < jdField_a_of_type_Int)
    {
      if (jdField_a_of_type_ArrayOfJavaLangObject[i] == paramObject) {
        return i;
      }
      i += 1;
    }
    return -1;
  }
  
  public long a(int paramInt)
  {
    if (jdField_a_of_type_Boolean) {
      b();
    }
    return jdField_a_of_type_ArrayOfLong[paramInt];
  }
  
  public LongSparseArray a()
  {
    try
    {
      LongSparseArray localLongSparseArray = (LongSparseArray)super.clone();
      return localCloneNotSupportedException1;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException1)
    {
      try
      {
        jdField_a_of_type_ArrayOfLong = ((long[])jdField_a_of_type_ArrayOfLong.clone());
        jdField_a_of_type_ArrayOfJavaLangObject = ((Object[])jdField_a_of_type_ArrayOfJavaLangObject.clone());
        return localLongSparseArray;
      }
      catch (CloneNotSupportedException localCloneNotSupportedException2) {}
      localCloneNotSupportedException1 = localCloneNotSupportedException1;
      return null;
    }
  }
  
  public Object a(int paramInt)
  {
    if (jdField_a_of_type_Boolean) {
      b();
    }
    return jdField_a_of_type_ArrayOfJavaLangObject[paramInt];
  }
  
  public Object a(long paramLong)
  {
    return a(paramLong, null);
  }
  
  public Object a(long paramLong, Object paramObject)
  {
    int i = a(jdField_a_of_type_ArrayOfLong, 0, jdField_a_of_type_Int, paramLong);
    if ((i < 0) || (jdField_a_of_type_ArrayOfJavaLangObject[i] == jdField_a_of_type_JavaLangObject)) {
      return paramObject;
    }
    return jdField_a_of_type_ArrayOfJavaLangObject[i];
  }
  
  public void a()
  {
    int j = jdField_a_of_type_Int;
    Object[] arrayOfObject = jdField_a_of_type_ArrayOfJavaLangObject;
    int i = 0;
    while (i < j)
    {
      arrayOfObject[i] = null;
      i += 1;
    }
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_Boolean = false;
  }
  
  public void a(int paramInt)
  {
    if (jdField_a_of_type_ArrayOfJavaLangObject[paramInt] != jdField_a_of_type_JavaLangObject)
    {
      jdField_a_of_type_ArrayOfJavaLangObject[paramInt] = jdField_a_of_type_JavaLangObject;
      jdField_a_of_type_Boolean = true;
    }
  }
  
  public void a(int paramInt, Object paramObject)
  {
    if (jdField_a_of_type_Boolean) {
      b();
    }
    jdField_a_of_type_ArrayOfJavaLangObject[paramInt] = paramObject;
  }
  
  public void a(long paramLong)
  {
    int i = a(jdField_a_of_type_ArrayOfLong, 0, jdField_a_of_type_Int, paramLong);
    if ((i >= 0) && (jdField_a_of_type_ArrayOfJavaLangObject[i] != jdField_a_of_type_JavaLangObject))
    {
      jdField_a_of_type_ArrayOfJavaLangObject[i] = jdField_a_of_type_JavaLangObject;
      jdField_a_of_type_Boolean = true;
    }
  }
  
  public void a(long paramLong, Object paramObject)
  {
    int i = a(jdField_a_of_type_ArrayOfLong, 0, jdField_a_of_type_Int, paramLong);
    if (i >= 0)
    {
      jdField_a_of_type_ArrayOfJavaLangObject[i] = paramObject;
      return;
    }
    int j = i ^ 0xFFFFFFFF;
    if ((j < jdField_a_of_type_Int) && (jdField_a_of_type_ArrayOfJavaLangObject[j] == jdField_a_of_type_JavaLangObject))
    {
      jdField_a_of_type_ArrayOfLong[j] = paramLong;
      jdField_a_of_type_ArrayOfJavaLangObject[j] = paramObject;
      return;
    }
    i = j;
    if (jdField_a_of_type_Boolean)
    {
      i = j;
      if (jdField_a_of_type_Int >= jdField_a_of_type_ArrayOfLong.length)
      {
        b();
        i = a(jdField_a_of_type_ArrayOfLong, 0, jdField_a_of_type_Int, paramLong) ^ 0xFFFFFFFF;
      }
    }
    if (jdField_a_of_type_Int >= jdField_a_of_type_ArrayOfLong.length)
    {
      j = b(jdField_a_of_type_Int + 1);
      long[] arrayOfLong = new long[j];
      Object[] arrayOfObject = new Object[j];
      System.arraycopy(jdField_a_of_type_ArrayOfLong, 0, arrayOfLong, 0, jdField_a_of_type_ArrayOfLong.length);
      System.arraycopy(jdField_a_of_type_ArrayOfJavaLangObject, 0, arrayOfObject, 0, jdField_a_of_type_ArrayOfJavaLangObject.length);
      jdField_a_of_type_ArrayOfLong = arrayOfLong;
      jdField_a_of_type_ArrayOfJavaLangObject = arrayOfObject;
    }
    if (jdField_a_of_type_Int - i != 0)
    {
      System.arraycopy(jdField_a_of_type_ArrayOfLong, i, jdField_a_of_type_ArrayOfLong, i + 1, jdField_a_of_type_Int - i);
      System.arraycopy(jdField_a_of_type_ArrayOfJavaLangObject, i, jdField_a_of_type_ArrayOfJavaLangObject, i + 1, jdField_a_of_type_Int - i);
    }
    jdField_a_of_type_ArrayOfLong[i] = paramLong;
    jdField_a_of_type_ArrayOfJavaLangObject[i] = paramObject;
    jdField_a_of_type_Int += 1;
  }
  
  public void b(long paramLong)
  {
    a(paramLong);
  }
  
  public void b(long paramLong, Object paramObject)
  {
    if ((jdField_a_of_type_Int != 0) && (paramLong <= jdField_a_of_type_ArrayOfLong[(jdField_a_of_type_Int - 1)]))
    {
      a(paramLong, paramObject);
      return;
    }
    if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_Int >= jdField_a_of_type_ArrayOfLong.length)) {
      b();
    }
    int i = jdField_a_of_type_Int;
    if (i >= jdField_a_of_type_ArrayOfLong.length)
    {
      int j = b(i + 1);
      long[] arrayOfLong = new long[j];
      Object[] arrayOfObject = new Object[j];
      System.arraycopy(jdField_a_of_type_ArrayOfLong, 0, arrayOfLong, 0, jdField_a_of_type_ArrayOfLong.length);
      System.arraycopy(jdField_a_of_type_ArrayOfJavaLangObject, 0, arrayOfObject, 0, jdField_a_of_type_ArrayOfJavaLangObject.length);
      jdField_a_of_type_ArrayOfLong = arrayOfLong;
      jdField_a_of_type_ArrayOfJavaLangObject = arrayOfObject;
    }
    jdField_a_of_type_ArrayOfLong[i] = paramLong;
    jdField_a_of_type_ArrayOfJavaLangObject[i] = paramObject;
    jdField_a_of_type_Int = (i + 1);
  }
}
