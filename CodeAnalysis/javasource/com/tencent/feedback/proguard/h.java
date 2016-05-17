package com.tencent.feedback.proguard;

import com.tencent.feedback.eup.jni.c;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class h
{
  private ByteBuffer a;
  private String b = "GBK";
  
  public h() {}
  
  public h(byte[] paramArrayOfByte)
  {
    a = ByteBuffer.wrap(paramArrayOfByte);
  }
  
  public h(byte[] paramArrayOfByte, int paramInt)
  {
    a = ByteBuffer.wrap(paramArrayOfByte);
    a.position(4);
  }
  
  private double a(double paramDouble, int paramInt, boolean paramBoolean)
  {
    if (a(paramInt))
    {
      localC = new c();
      a(localC, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      case 12: 
        paramDouble = 0.0D;
      }
    }
    while (!paramBoolean)
    {
      c localC;
      return paramDouble;
      return a.getFloat();
      return a.getDouble();
    }
    throw new g("require field not exist.");
  }
  
  private float a(float paramFloat, int paramInt, boolean paramBoolean)
  {
    if (a(paramInt))
    {
      localC = new c();
      a(localC, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      case 12: 
        paramFloat = 0.0F;
      }
    }
    while (!paramBoolean)
    {
      c localC;
      return paramFloat;
      return a.getFloat();
    }
    throw new g("require field not exist.");
  }
  
  private static int a(c paramC, ByteBuffer paramByteBuffer)
  {
    int i = paramByteBuffer.get();
    a = ((byte)(i & 0xF));
    b = ((i & 0xF0) >> 4);
    if (b == 15)
    {
      b = paramByteBuffer.get();
      return 2;
    }
    return 1;
  }
  
  private <K, V> Map<K, V> a(Map<K, V> paramMap1, Map<K, V> paramMap2, int paramInt, boolean paramBoolean)
  {
    if ((paramMap2 == null) || (paramMap2.isEmpty())) {
      paramMap2 = new HashMap();
    }
    do
    {
      return paramMap2;
      paramMap2 = (Map.Entry)paramMap2.entrySet().iterator().next();
      Object localObject1 = paramMap2.getKey();
      Object localObject2 = paramMap2.getValue();
      if (a(paramInt))
      {
        paramMap2 = new c();
        a(paramMap2, a);
        switch (a)
        {
        default: 
          throw new g("type mismatch.");
        }
        int i = a(0, 0, true);
        if (i < 0) {
          throw new g("size invalid: " + i);
        }
        paramInt = 0;
        for (;;)
        {
          paramMap2 = paramMap1;
          if (paramInt >= i) {
            break;
          }
          paramMap1.put(a(localObject1, 0, true), a(localObject2, 1, true));
          paramInt += 1;
        }
      }
      paramMap2 = paramMap1;
    } while (!paramBoolean);
    throw new g("require field not exist.");
  }
  
  private void a()
  {
    c localC = new c();
    do
    {
      a(localC, a);
      a(a);
    } while (a != 11);
  }
  
  private void a(byte paramByte)
  {
    byte b2 = 0;
    byte b1 = 0;
    c localC;
    switch (paramByte)
    {
    default: 
      throw new g("invalid type.");
    case 0: 
      a.position(a.position() + 1);
    case 11: 
    case 12: 
      return;
    case 1: 
      a.position(2 + a.position());
      return;
    case 2: 
      a.position(a.position() + 4);
      return;
    case 3: 
      a.position(a.position() + 8);
      return;
    case 4: 
      a.position(a.position() + 4);
      return;
    case 5: 
      a.position(a.position() + 8);
      return;
    case 6: 
      b1 = a.get();
      paramByte = b1;
      if (b1 < 0) {
        paramByte = b1 + 256;
      }
      a.position(paramByte + a.position());
      return;
    case 7: 
      paramByte = a.getInt();
      a.position(paramByte + a.position());
      return;
    case 8: 
      b2 = a(0, 0, true);
      paramByte = b1;
      while (paramByte < b2 << 1)
      {
        localC = new c();
        a(localC, a);
        a(a);
        paramByte += 1;
      }
    case 9: 
      b1 = a(0, 0, true);
      paramByte = b2;
      while (paramByte < b1)
      {
        localC = new c();
        a(localC, a);
        a(a);
        paramByte += 1;
      }
    case 13: 
      localC = new c();
      a(localC, a);
      if (a != 0) {
        throw new g("skipField with invalid type, type value: " + paramByte + ", " + a);
      }
      paramByte = a(0, 0, true);
      a.position(paramByte + a.position());
      return;
    }
    a();
  }
  
  private boolean a(int paramInt)
  {
    try
    {
      c localC = new c();
      for (;;)
      {
        int i = a(localC, a.duplicate());
        if ((paramInt <= b) || (a == 11))
        {
          if (paramInt != b) {
            break;
          }
          return true;
        }
        a.position(i + a.position());
        a(a);
      }
      return false;
    }
    catch (g localG)
    {
      return false;
    }
    catch (BufferUnderflowException localBufferUnderflowException) {}
  }
  
  private <T> T[] a(T[] paramArrayOfT, int paramInt, boolean paramBoolean)
  {
    if ((paramArrayOfT == null) || (paramArrayOfT.length == 0)) {
      throw new g("unable to get type of key and value.");
    }
    return b(paramArrayOfT[0], paramInt, paramBoolean);
  }
  
  private <T> T[] b(T paramT, int paramInt, boolean paramBoolean)
  {
    if (a(paramInt))
    {
      localObject = new c();
      a((c)localObject, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      }
      int i = a(0, 0, true);
      if (i < 0) {
        throw new g("size invalid: " + i);
      }
      Object[] arrayOfObject = (Object[])Array.newInstance(paramT.getClass(), i);
      paramInt = 0;
      for (;;)
      {
        localObject = arrayOfObject;
        if (paramInt >= i) {
          break;
        }
        arrayOfObject[paramInt] = a(paramT, 0, true);
        paramInt += 1;
      }
    }
    if (paramBoolean) {
      throw new g("require field not exist.");
    }
    Object localObject = null;
    return localObject;
  }
  
  private boolean[] d(int paramInt, boolean paramBoolean)
  {
    Object localObject = null;
    if (a(paramInt))
    {
      localObject = new c();
      a((c)localObject, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      }
      i = a(0, 0, true);
      if (i < 0) {
        throw new g("size invalid: " + i);
      }
      localObject = new boolean[i];
      paramInt = 0;
      if (paramInt < i)
      {
        if (a((byte)0, 0, true) != 0) {}
        for (paramBoolean = true;; paramBoolean = false)
        {
          localObject[paramInt] = paramBoolean;
          paramInt += 1;
          break;
        }
      }
    }
    while (!paramBoolean)
    {
      int i;
      return localObject;
    }
    throw new g("require field not exist.");
  }
  
  private short[] e(int paramInt, boolean paramBoolean)
  {
    Object localObject = null;
    if (a(paramInt))
    {
      localObject = new c();
      a((c)localObject, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      }
      int i = a(0, 0, true);
      if (i < 0) {
        throw new g("size invalid: " + i);
      }
      short[] arrayOfShort = new short[i];
      paramInt = 0;
      for (;;)
      {
        localObject = arrayOfShort;
        if (paramInt >= i) {
          break;
        }
        arrayOfShort[paramInt] = a(arrayOfShort[0], 0, true);
        paramInt += 1;
      }
    }
    if (paramBoolean) {
      throw new g("require field not exist.");
    }
    return localObject;
  }
  
  private int[] f(int paramInt, boolean paramBoolean)
  {
    Object localObject = null;
    if (a(paramInt))
    {
      localObject = new c();
      a((c)localObject, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      }
      int i = a(0, 0, true);
      if (i < 0) {
        throw new g("size invalid: " + i);
      }
      int[] arrayOfInt = new int[i];
      paramInt = 0;
      for (;;)
      {
        localObject = arrayOfInt;
        if (paramInt >= i) {
          break;
        }
        arrayOfInt[paramInt] = a(arrayOfInt[0], 0, true);
        paramInt += 1;
      }
    }
    if (paramBoolean) {
      throw new g("require field not exist.");
    }
    return localObject;
  }
  
  private long[] g(int paramInt, boolean paramBoolean)
  {
    Object localObject = null;
    if (a(paramInt))
    {
      localObject = new c();
      a((c)localObject, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      }
      int i = a(0, 0, true);
      if (i < 0) {
        throw new g("size invalid: " + i);
      }
      long[] arrayOfLong = new long[i];
      paramInt = 0;
      for (;;)
      {
        localObject = arrayOfLong;
        if (paramInt >= i) {
          break;
        }
        arrayOfLong[paramInt] = a(arrayOfLong[0], 0, true);
        paramInt += 1;
      }
    }
    if (paramBoolean) {
      throw new g("require field not exist.");
    }
    return localObject;
  }
  
  private float[] h(int paramInt, boolean paramBoolean)
  {
    Object localObject = null;
    if (a(paramInt))
    {
      localObject = new c();
      a((c)localObject, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      }
      int i = a(0, 0, true);
      if (i < 0) {
        throw new g("size invalid: " + i);
      }
      float[] arrayOfFloat = new float[i];
      paramInt = 0;
      for (;;)
      {
        localObject = arrayOfFloat;
        if (paramInt >= i) {
          break;
        }
        arrayOfFloat[paramInt] = a(arrayOfFloat[0], 0, true);
        paramInt += 1;
      }
    }
    if (paramBoolean) {
      throw new g("require field not exist.");
    }
    return localObject;
  }
  
  private double[] i(int paramInt, boolean paramBoolean)
  {
    Object localObject = null;
    if (a(paramInt))
    {
      localObject = new c();
      a((c)localObject, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      }
      int i = a(0, 0, true);
      if (i < 0) {
        throw new g("size invalid: " + i);
      }
      double[] arrayOfDouble = new double[i];
      paramInt = 0;
      for (;;)
      {
        localObject = arrayOfDouble;
        if (paramInt >= i) {
          break;
        }
        arrayOfDouble[paramInt] = a(arrayOfDouble[0], 0, true);
        paramInt += 1;
      }
    }
    if (paramBoolean) {
      throw new g("require field not exist.");
    }
    return localObject;
  }
  
  public final byte a(byte paramByte, int paramInt, boolean paramBoolean)
  {
    if (a(paramInt))
    {
      localC = new c();
      a(localC, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      case 12: 
        paramByte = 0;
      }
    }
    while (!paramBoolean)
    {
      c localC;
      return paramByte;
      return a.get();
    }
    throw new g("require field not exist.");
  }
  
  public final int a(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    if (a(paramInt2))
    {
      localC = new c();
      a(localC, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      case 12: 
        paramInt1 = 0;
      }
    }
    while (!paramBoolean)
    {
      c localC;
      return paramInt1;
      return a.get();
      return a.getShort();
      return a.getInt();
    }
    throw new g("require field not exist.");
  }
  
  public final int a(String paramString)
  {
    b = paramString;
    return 0;
  }
  
  public final long a(long paramLong, int paramInt, boolean paramBoolean)
  {
    if (a(paramInt))
    {
      localC = new c();
      a(localC, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      case 12: 
        paramLong = 0L;
      }
    }
    while (!paramBoolean)
    {
      c localC;
      return paramLong;
      return a.get();
      return a.getShort();
      return a.getInt();
      return a.getLong();
    }
    throw new g("require field not exist.");
  }
  
  public final j a(j paramJ, int paramInt, boolean paramBoolean)
  {
    c localC = null;
    if (a(paramInt))
    {
      try
      {
        paramJ = (j)paramJ.getClass().newInstance();
        localC = new c();
        a(localC, a);
        if (a != 10) {
          throw new g("type mismatch.");
        }
      }
      catch (Exception paramJ)
      {
        throw new g(paramJ.getMessage());
      }
      paramJ.a(this);
      a();
    }
    do
    {
      return paramJ;
      paramJ = localC;
    } while (!paramBoolean);
    throw new g("require field not exist.");
  }
  
  public final <T> Object a(T paramT, int paramInt, boolean paramBoolean)
  {
    int i = 0;
    boolean bool = false;
    if ((paramT instanceof Byte)) {
      return Byte.valueOf(a((byte)0, paramInt, paramBoolean));
    }
    if ((paramT instanceof Boolean))
    {
      if (a((byte)0, paramInt, paramBoolean) != 0) {
        bool = true;
      }
      return Boolean.valueOf(bool);
    }
    if ((paramT instanceof Short)) {
      return Short.valueOf(a((short)0, paramInt, paramBoolean));
    }
    if ((paramT instanceof Integer)) {
      return Integer.valueOf(a(0, paramInt, paramBoolean));
    }
    if ((paramT instanceof Long)) {
      return Long.valueOf(a(0L, paramInt, paramBoolean));
    }
    if ((paramT instanceof Float)) {
      return Float.valueOf(a(0.0F, paramInt, paramBoolean));
    }
    if ((paramT instanceof Double)) {
      return Double.valueOf(a(0.0D, paramInt, paramBoolean));
    }
    if ((paramT instanceof String)) {
      return String.valueOf(b(paramInt, paramBoolean));
    }
    if ((paramT instanceof Map))
    {
      paramT = (Map)paramT;
      return (HashMap)a(new HashMap(), paramT, paramInt, paramBoolean);
    }
    if ((paramT instanceof List))
    {
      paramT = (List)paramT;
      if ((paramT == null) || (paramT.isEmpty())) {
        return new ArrayList();
      }
      paramT = b(paramT.get(0), paramInt, paramBoolean);
      if (paramT == null) {
        return null;
      }
      ArrayList localArrayList = new ArrayList();
      paramInt = i;
      while (paramInt < paramT.length)
      {
        localArrayList.add(paramT[paramInt]);
        paramInt += 1;
      }
      return localArrayList;
    }
    if ((paramT instanceof j)) {
      return a((j)paramT, paramInt, paramBoolean);
    }
    if (paramT.getClass().isArray())
    {
      if (((paramT instanceof byte[])) || ((paramT instanceof Byte[]))) {
        return c(paramInt, paramBoolean);
      }
      if ((paramT instanceof boolean[])) {
        return d(paramInt, paramBoolean);
      }
      if ((paramT instanceof short[])) {
        return e(paramInt, paramBoolean);
      }
      if ((paramT instanceof int[])) {
        return f(paramInt, paramBoolean);
      }
      if ((paramT instanceof long[])) {
        return g(paramInt, paramBoolean);
      }
      if ((paramT instanceof float[])) {
        return h(paramInt, paramBoolean);
      }
      if ((paramT instanceof double[])) {
        return i(paramInt, paramBoolean);
      }
      return a((Object[])paramT, paramInt, paramBoolean);
    }
    throw new g("read object error: unsupport type.");
  }
  
  public final <K, V> HashMap<K, V> a(Map<K, V> paramMap, int paramInt, boolean paramBoolean)
  {
    return (HashMap)a(new HashMap(), paramMap, paramInt, paramBoolean);
  }
  
  public final short a(short paramShort, int paramInt, boolean paramBoolean)
  {
    if (a(paramInt))
    {
      localC = new c();
      a(localC, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      case 12: 
        paramShort = 0;
      }
    }
    while (!paramBoolean)
    {
      c localC;
      return paramShort;
      return (short)a.get();
      return a.getShort();
    }
    throw new g("require field not exist.");
  }
  
  public final void a(byte[] paramArrayOfByte)
  {
    if (a != null) {
      a.clear();
    }
    a = ByteBuffer.wrap(paramArrayOfByte);
  }
  
  public final boolean a(int paramInt, boolean paramBoolean)
  {
    boolean bool = false;
    if (a((byte)0, paramInt, paramBoolean) != 0) {
      bool = true;
    }
    return bool;
  }
  
  public final String b(int paramInt, boolean paramBoolean)
  {
    Object localObject1 = null;
    if (a(paramInt))
    {
      localObject1 = new c();
      a((c)localObject1, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      case 6: 
        i = a.get();
        paramInt = i;
        if (i < 0) {
          paramInt = i + 256;
        }
        localObject2 = new byte[paramInt];
        a.get((byte[])localObject2);
      }
    }
    while (!paramBoolean)
    {
      Object localObject2;
      try
      {
        int i;
        localObject1 = new String((byte[])localObject2, b);
        return localObject1;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException1)
      {
        return new String((byte[])localObject2);
      }
      paramInt = a.getInt();
      if ((paramInt > 104857600) || (paramInt < 0)) {
        throw new g("String too long: " + paramInt);
      }
      byte[] arrayOfByte = new byte[paramInt];
      a.get(arrayOfByte);
      try
      {
        localObject2 = new String(arrayOfByte, b);
        return localObject2;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException2)
      {
        return new String(arrayOfByte);
      }
    }
    throw new g("require field not exist.");
  }
  
  public final byte[] c(int paramInt, boolean paramBoolean)
  {
    Object localObject1 = null;
    if (a(paramInt))
    {
      localObject1 = new c();
      a((c)localObject1, a);
      switch (a)
      {
      default: 
        throw new g("type mismatch.");
      case 13: 
        localObject2 = new c();
        a((c)localObject2, a);
        if (a != 0) {
          throw new g("type mismatch, tag: " + paramInt + ", type: " + a + ", " + a);
        }
        i = a(0, 0, true);
        if (i < 0) {
          throw new g("invalid size, tag: " + paramInt + ", type: " + a + ", " + a + ", size: " + i);
        }
        localObject1 = new byte[i];
        a.get((byte[])localObject1);
      }
    }
    while (!paramBoolean)
    {
      return localObject1;
      int i = a(0, 0, true);
      if (i < 0) {
        throw new g("size invalid: " + i);
      }
      Object localObject2 = new byte[i];
      paramInt = 0;
      for (;;)
      {
        localObject1 = localObject2;
        if (paramInt >= i) {
          break;
        }
        localObject2[paramInt] = a(localObject2[0], 0, true);
        paramInt += 1;
      }
    }
    throw new g("require field not exist.");
  }
}
