package org.apache.commons.lang3;

import java.lang.reflect.Array;

public class ArrayUtils
{
  public static final boolean[] EMPTY_BOOLEAN_ARRAY;
  public static final Boolean[] EMPTY_BOOLEAN_OBJECT_ARRAY;
  public static final byte[] EMPTY_BYTE_ARRAY;
  public static final Byte[] EMPTY_BYTE_OBJECT_ARRAY;
  public static final Character[] EMPTY_CHARACTER_OBJECT_ARRAY = new Character[0];
  public static final char[] EMPTY_CHAR_ARRAY;
  public static final Class<?>[] EMPTY_CLASS_ARRAY;
  public static final double[] EMPTY_DOUBLE_ARRAY;
  public static final Double[] EMPTY_DOUBLE_OBJECT_ARRAY;
  public static final float[] EMPTY_FLOAT_ARRAY;
  public static final Float[] EMPTY_FLOAT_OBJECT_ARRAY;
  public static final Integer[] EMPTY_INTEGER_OBJECT_ARRAY;
  public static final int[] EMPTY_INT_ARRAY;
  public static final long[] EMPTY_LONG_ARRAY;
  public static final Long[] EMPTY_LONG_OBJECT_ARRAY;
  public static final Object[] EMPTY_OBJECT_ARRAY = new Object[0];
  public static final short[] EMPTY_SHORT_ARRAY;
  public static final Short[] EMPTY_SHORT_OBJECT_ARRAY;
  public static final String[] EMPTY_STRING_ARRAY;
  
  static
  {
    EMPTY_CLASS_ARRAY = new Class[0];
    EMPTY_STRING_ARRAY = new String[0];
    EMPTY_LONG_ARRAY = new long[0];
    EMPTY_LONG_OBJECT_ARRAY = new Long[0];
    EMPTY_INT_ARRAY = new int[0];
    EMPTY_INTEGER_OBJECT_ARRAY = new Integer[0];
    EMPTY_SHORT_ARRAY = new short[0];
    EMPTY_SHORT_OBJECT_ARRAY = new Short[0];
    EMPTY_BYTE_ARRAY = new byte[0];
    EMPTY_BYTE_OBJECT_ARRAY = new Byte[0];
    EMPTY_DOUBLE_ARRAY = new double[0];
    EMPTY_DOUBLE_OBJECT_ARRAY = new Double[0];
    EMPTY_FLOAT_ARRAY = new float[0];
    EMPTY_FLOAT_OBJECT_ARRAY = new Float[0];
    EMPTY_BOOLEAN_ARRAY = new boolean[0];
    EMPTY_BOOLEAN_OBJECT_ARRAY = new Boolean[0];
    EMPTY_CHAR_ARRAY = new char[0];
  }
  
  private static Object add(Object paramObject1, int paramInt, Object paramObject2, Class<?> paramClass)
  {
    if (paramObject1 == null)
    {
      if (paramInt != 0) {
        throw new IndexOutOfBoundsException("Index: " + paramInt + ", Length: 0");
      }
      paramObject1 = Array.newInstance(paramClass, 1);
      Array.set(paramObject1, 0, paramObject2);
      return paramObject1;
    }
    int i = Array.getLength(paramObject1);
    if ((paramInt > i) || (paramInt < 0)) {
      throw new IndexOutOfBoundsException("Index: " + paramInt + ", Length: " + i);
    }
    paramClass = Array.newInstance(paramClass, i + 1);
    System.arraycopy(paramObject1, 0, paramClass, 0, paramInt);
    Array.set(paramClass, paramInt, paramObject2);
    if (paramInt < i) {
      System.arraycopy(paramObject1, paramInt, paramClass, paramInt + 1, i - paramInt);
    }
    return paramClass;
  }
  
  public static int[] add(int[] paramArrayOfInt, int paramInt)
  {
    paramArrayOfInt = (int[])copyArrayGrow1(paramArrayOfInt, Integer.TYPE);
    paramArrayOfInt[(paramArrayOfInt.length - 1)] = paramInt;
    return paramArrayOfInt;
  }
  
  public static int[] add(int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    return (int[])add(paramArrayOfInt, paramInt1, Integer.valueOf(paramInt2), Integer.TYPE);
  }
  
  public static int[] addAll(int[] paramArrayOfInt1, int... paramVarArgs)
  {
    if (paramArrayOfInt1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfInt1);
    }
    int[] arrayOfInt = new int[paramArrayOfInt1.length + paramVarArgs.length];
    System.arraycopy(paramArrayOfInt1, 0, arrayOfInt, 0, paramArrayOfInt1.length);
    System.arraycopy(paramVarArgs, 0, arrayOfInt, paramArrayOfInt1.length, paramVarArgs.length);
    return arrayOfInt;
  }
  
  public static int[] clone(int[] paramArrayOfInt)
  {
    if (paramArrayOfInt == null) {
      return null;
    }
    return (int[])paramArrayOfInt.clone();
  }
  
  private static Object copyArrayGrow1(Object paramObject, Class<?> paramClass)
  {
    if (paramObject != null)
    {
      int i = Array.getLength(paramObject);
      paramClass = Array.newInstance(paramObject.getClass().getComponentType(), i + 1);
      System.arraycopy(paramObject, 0, paramClass, 0, i);
      return paramClass;
    }
    return Array.newInstance(paramClass, 1);
  }
}
