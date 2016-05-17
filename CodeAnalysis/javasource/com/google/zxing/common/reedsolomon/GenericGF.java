package com.google.zxing.common.reedsolomon;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import sn;

public final class GenericGF
{
  private static final int jdField_a_of_type_Int = 0;
  public static final GenericGF a;
  private sn jdField_a_of_type_Sn;
  private boolean jdField_a_of_type_Boolean = false;
  private int[] jdField_a_of_type_ArrayOfInt;
  private final int jdField_b_of_type_Int;
  private sn jdField_b_of_type_Sn;
  private int[] jdField_b_of_type_ArrayOfInt;
  private final int c;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComGoogleZxingCommonReedsolomonGenericGF = new GenericGF(285, 256);
  }
  
  public GenericGF(int paramInt1, int paramInt2)
  {
    c = paramInt1;
    jdField_b_of_type_Int = paramInt2;
    if (paramInt2 <= 0) {
      a();
    }
  }
  
  public static int a(int paramInt1, int paramInt2)
  {
    return paramInt1 ^ paramInt2;
  }
  
  private void a()
  {
    jdField_a_of_type_ArrayOfInt = new int[jdField_b_of_type_Int];
    jdField_b_of_type_ArrayOfInt = new int[jdField_b_of_type_Int];
    int j = 0;
    int i = 1;
    while (j < jdField_b_of_type_Int)
    {
      jdField_a_of_type_ArrayOfInt[j] = i;
      int k = i << 1;
      i = k;
      if (k >= jdField_b_of_type_Int) {
        i = (k ^ c) & jdField_b_of_type_Int - 1;
      }
      j += 1;
    }
    i = 0;
    while (i < jdField_b_of_type_Int - 1)
    {
      jdField_b_of_type_ArrayOfInt[jdField_a_of_type_ArrayOfInt[i]] = i;
      i += 1;
    }
    jdField_a_of_type_Sn = new sn(this, new int[] { 0 });
    jdField_b_of_type_Sn = new sn(this, new int[] { 1 });
    jdField_a_of_type_Boolean = true;
  }
  
  private void b()
  {
    if (!jdField_a_of_type_Boolean) {
      a();
    }
  }
  
  public int a()
  {
    return jdField_b_of_type_Int;
  }
  
  int a(int paramInt)
  {
    b();
    return jdField_a_of_type_ArrayOfInt[paramInt];
  }
  
  public sn a()
  {
    b();
    return jdField_a_of_type_Sn;
  }
  
  public sn a(int paramInt1, int paramInt2)
  {
    b();
    if (paramInt1 < 0) {
      throw new IllegalArgumentException();
    }
    if (paramInt2 == 0) {
      return jdField_a_of_type_Sn;
    }
    int[] arrayOfInt = new int[paramInt1 + 1];
    arrayOfInt[0] = paramInt2;
    return new sn(this, arrayOfInt);
  }
  
  public int b(int paramInt)
  {
    b();
    if (paramInt == 0) {
      throw new IllegalArgumentException();
    }
    return jdField_b_of_type_ArrayOfInt[paramInt];
  }
  
  public int b(int paramInt1, int paramInt2)
  {
    b();
    if ((paramInt1 == 0) || (paramInt2 == 0)) {
      return 0;
    }
    return jdField_a_of_type_ArrayOfInt[((jdField_b_of_type_ArrayOfInt[paramInt1] + jdField_b_of_type_ArrayOfInt[paramInt2]) % (jdField_b_of_type_Int - 1))];
  }
  
  sn b()
  {
    b();
    return jdField_b_of_type_Sn;
  }
  
  public int c(int paramInt)
  {
    b();
    if (paramInt == 0) {
      throw new ArithmeticException();
    }
    return jdField_a_of_type_ArrayOfInt[(jdField_b_of_type_Int - jdField_b_of_type_ArrayOfInt[paramInt] - 1)];
  }
}
