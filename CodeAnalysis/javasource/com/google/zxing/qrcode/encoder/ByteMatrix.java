package com.google.zxing.qrcode.encoder;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.reflect.Array;

public final class ByteMatrix
{
  private final int jdField_a_of_type_Int;
  private final byte[][] jdField_a_of_type_Array2dOfByte;
  private final int b;
  
  public ByteMatrix(int paramInt1, int paramInt2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Array2dOfByte = ((byte[][])Array.newInstance(Byte.TYPE, new int[] { paramInt2, paramInt1 }));
    jdField_a_of_type_Int = paramInt1;
    b = paramInt2;
  }
  
  public byte a(int paramInt1, int paramInt2)
  {
    return jdField_a_of_type_Array2dOfByte[paramInt2][paramInt1];
  }
  
  public int a()
  {
    return b;
  }
  
  public void a(byte paramByte)
  {
    int i = 0;
    while (i < b)
    {
      int j = 0;
      while (j < jdField_a_of_type_Int)
      {
        jdField_a_of_type_Array2dOfByte[i][j] = paramByte;
        j += 1;
      }
      i += 1;
    }
  }
  
  public void a(int paramInt1, int paramInt2, byte paramByte)
  {
    jdField_a_of_type_Array2dOfByte[paramInt2][paramInt1] = paramByte;
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    jdField_a_of_type_Array2dOfByte[paramInt2][paramInt1] = ((byte)paramInt3);
  }
  
  public void a(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    byte[] arrayOfByte = jdField_a_of_type_Array2dOfByte[paramInt2];
    if (paramBoolean) {}
    for (paramInt2 = 1;; paramInt2 = 0)
    {
      arrayOfByte[paramInt1] = ((byte)paramInt2);
      return;
    }
  }
  
  public byte[][] a()
  {
    return jdField_a_of_type_Array2dOfByte;
  }
  
  public int b()
  {
    return jdField_a_of_type_Int;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(jdField_a_of_type_Int * 2 * b + 2);
    int i = 0;
    while (i < b)
    {
      int j = 0;
      if (j < jdField_a_of_type_Int)
      {
        switch (jdField_a_of_type_Array2dOfByte[i][j])
        {
        default: 
          localStringBuilder.append("  ");
        }
        for (;;)
        {
          j += 1;
          break;
          localStringBuilder.append(" 0");
          continue;
          localStringBuilder.append(" 1");
        }
      }
      localStringBuilder.append('\n');
      i += 1;
    }
    return localStringBuilder.toString();
  }
}
