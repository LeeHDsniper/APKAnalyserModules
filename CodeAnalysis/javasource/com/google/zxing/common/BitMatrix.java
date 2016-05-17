package com.google.zxing.common;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class BitMatrix
{
  private final int jdField_a_of_type_Int;
  private final int[] jdField_a_of_type_ArrayOfInt;
  private final int b;
  private final int c;
  
  public BitMatrix(int paramInt)
  {
    this(paramInt, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public BitMatrix(int paramInt1, int paramInt2)
  {
    if ((paramInt1 < 1) || (paramInt2 < 1)) {
      throw new IllegalArgumentException("Both dimensions must be greater than 0");
    }
    jdField_a_of_type_Int = paramInt1;
    b = paramInt2;
    c = (paramInt1 + 31 >> 5);
    jdField_a_of_type_ArrayOfInt = new int[c * paramInt2];
  }
  
  public int a()
  {
    return jdField_a_of_type_Int;
  }
  
  public void a()
  {
    int j = jdField_a_of_type_ArrayOfInt.length;
    int i = 0;
    while (i < j)
    {
      jdField_a_of_type_ArrayOfInt[i] = 0;
      i += 1;
    }
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    paramInt2 = c * paramInt2 + (paramInt1 >> 5);
    int[] arrayOfInt = jdField_a_of_type_ArrayOfInt;
    arrayOfInt[paramInt2] |= 1 << (paramInt1 & 0x1F);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if ((paramInt2 < 0) || (paramInt1 < 0)) {
      throw new IllegalArgumentException("Left and top must be nonnegative");
    }
    if ((paramInt4 < 1) || (paramInt3 < 1)) {
      throw new IllegalArgumentException("Height and width must be at least 1");
    }
    int i = paramInt1 + paramInt3;
    paramInt4 = paramInt2 + paramInt4;
    if ((paramInt4 > b) || (i > jdField_a_of_type_Int)) {
      throw new IllegalArgumentException("The region must fit inside the matrix");
    }
    for (;;)
    {
      paramInt2 += 1;
      if (paramInt2 >= paramInt4) {
        break;
      }
      int j = c;
      paramInt3 = paramInt1;
      while (paramInt3 < i)
      {
        int[] arrayOfInt = jdField_a_of_type_ArrayOfInt;
        int k = (paramInt3 >> 5) + paramInt2 * j;
        arrayOfInt[k] |= 1 << (paramInt3 & 0x1F);
        paramInt3 += 1;
      }
    }
  }
  
  public boolean a(int paramInt1, int paramInt2)
  {
    int i = c;
    return (jdField_a_of_type_ArrayOfInt[(i * paramInt2 + (paramInt1 >> 5))] >>> (paramInt1 & 0x1F) & 0x1) != 0;
  }
  
  public int b()
  {
    return b;
  }
  
  public void b(int paramInt1, int paramInt2)
  {
    paramInt2 = c * paramInt2 + (paramInt1 >> 5);
    int[] arrayOfInt = jdField_a_of_type_ArrayOfInt;
    arrayOfInt[paramInt2] ^= 1 << (paramInt1 & 0x1F);
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof BitMatrix)) {}
    do
    {
      return false;
      paramObject = (BitMatrix)paramObject;
    } while ((jdField_a_of_type_Int != jdField_a_of_type_Int) || (b != b) || (c != c) || (jdField_a_of_type_ArrayOfInt.length != jdField_a_of_type_ArrayOfInt.length));
    int i = 0;
    for (;;)
    {
      if (i >= jdField_a_of_type_ArrayOfInt.length) {
        break label93;
      }
      if (jdField_a_of_type_ArrayOfInt[i] != jdField_a_of_type_ArrayOfInt[i]) {
        break;
      }
      i += 1;
    }
    label93:
    return true;
  }
  
  public int hashCode()
  {
    int i = jdField_a_of_type_Int;
    int j = jdField_a_of_type_Int;
    int k = b;
    j = c + ((i * 31 + j) * 31 + k) * 31;
    int[] arrayOfInt = jdField_a_of_type_ArrayOfInt;
    k = arrayOfInt.length;
    i = 0;
    while (i < k)
    {
      j = j * 31 + arrayOfInt[i];
      i += 1;
    }
    return j;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(b * (jdField_a_of_type_Int + 1));
    int i = 0;
    while (i < b)
    {
      int j = 0;
      if (j < jdField_a_of_type_Int)
      {
        if (a(j, i)) {}
        for (String str = "X ";; str = "  ")
        {
          localStringBuilder.append(str);
          j += 1;
          break;
        }
      }
      localStringBuilder.append('\n');
      i += 1;
    }
    return localStringBuilder.toString();
  }
}
