package com.qq.taf.jce;

import java.io.PrintStream;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class JceDisplayer
{
  private int _level = 0;
  private StringBuilder sb;
  
  public JceDisplayer(StringBuilder paramStringBuilder)
  {
    sb = paramStringBuilder;
  }
  
  public JceDisplayer(StringBuilder paramStringBuilder, int paramInt)
  {
    sb = paramStringBuilder;
    _level = paramInt;
  }
  
  public static void main(String[] paramArrayOfString)
  {
    paramArrayOfString = new StringBuilder();
    paramArrayOfString.append(1.2D);
    System.out.println(paramArrayOfString.toString());
  }
  
  private void ps(String paramString)
  {
    int i = 0;
    while (i < _level)
    {
      sb.append('\t');
      i += 1;
    }
    if (paramString != null) {
      sb.append(paramString).append(": ");
    }
  }
  
  public JceDisplayer display(byte paramByte, String paramString)
  {
    ps(paramString);
    sb.append(paramByte).append('\n');
    return this;
  }
  
  public JceDisplayer display(char paramChar, String paramString)
  {
    ps(paramString);
    sb.append(paramChar).append('\n');
    return this;
  }
  
  public JceDisplayer display(double paramDouble, String paramString)
  {
    ps(paramString);
    sb.append(paramDouble).append('\n');
    return this;
  }
  
  public JceDisplayer display(float paramFloat, String paramString)
  {
    ps(paramString);
    sb.append(paramFloat).append('\n');
    return this;
  }
  
  public JceDisplayer display(int paramInt, String paramString)
  {
    ps(paramString);
    sb.append(paramInt).append('\n');
    return this;
  }
  
  public JceDisplayer display(long paramLong, String paramString)
  {
    ps(paramString);
    sb.append(paramLong).append('\n');
    return this;
  }
  
  public JceDisplayer display(JceStruct paramJceStruct, String paramString)
  {
    display('{', paramString);
    if (paramJceStruct == null) {
      sb.append('\t').append("null");
    }
    for (;;)
    {
      display('}', null);
      return this;
      paramJceStruct.display(sb, _level + 1);
    }
  }
  
  public <T> JceDisplayer display(T paramT, String paramString)
  {
    if (paramT == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if ((paramT instanceof Byte))
    {
      display(((Byte)paramT).byteValue(), paramString);
      return this;
    }
    if ((paramT instanceof Boolean))
    {
      display(((Boolean)paramT).booleanValue(), paramString);
      return this;
    }
    if ((paramT instanceof Short))
    {
      display(((Short)paramT).shortValue(), paramString);
      return this;
    }
    if ((paramT instanceof Integer))
    {
      display(((Integer)paramT).intValue(), paramString);
      return this;
    }
    if ((paramT instanceof Long))
    {
      display(((Long)paramT).longValue(), paramString);
      return this;
    }
    if ((paramT instanceof Float))
    {
      display(((Float)paramT).floatValue(), paramString);
      return this;
    }
    if ((paramT instanceof Double))
    {
      display(((Double)paramT).doubleValue(), paramString);
      return this;
    }
    if ((paramT instanceof String))
    {
      display((String)paramT, paramString);
      return this;
    }
    if ((paramT instanceof Map))
    {
      display((Map)paramT, paramString);
      return this;
    }
    if ((paramT instanceof List))
    {
      display((List)paramT, paramString);
      return this;
    }
    if ((paramT instanceof JceStruct))
    {
      display((JceStruct)paramT, paramString);
      return this;
    }
    if ((paramT instanceof byte[]))
    {
      display((byte[])paramT, paramString);
      return this;
    }
    if ((paramT instanceof boolean[]))
    {
      display((boolean[])paramT, paramString);
      return this;
    }
    if ((paramT instanceof short[]))
    {
      display((short[])paramT, paramString);
      return this;
    }
    if ((paramT instanceof int[]))
    {
      display((int[])paramT, paramString);
      return this;
    }
    if ((paramT instanceof long[]))
    {
      display((long[])paramT, paramString);
      return this;
    }
    if ((paramT instanceof float[]))
    {
      display((float[])paramT, paramString);
      return this;
    }
    if ((paramT instanceof double[]))
    {
      display((double[])paramT, paramString);
      return this;
    }
    if (paramT.getClass().isArray())
    {
      display((Object[])paramT, paramString);
      return this;
    }
    throw new JceEncodeException("write object error: unsupport type.");
  }
  
  public JceDisplayer display(String paramString1, String paramString2)
  {
    ps(paramString2);
    if (paramString1 == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    sb.append(paramString1).append('\n');
    return this;
  }
  
  public <T> JceDisplayer display(Collection<T> paramCollection, String paramString)
  {
    if (paramCollection == null)
    {
      ps(paramString);
      sb.append("null").append('\t');
      return this;
    }
    return display(paramCollection.toArray(), paramString);
  }
  
  public <K, V> JceDisplayer display(Map<K, V> paramMap, String paramString)
  {
    ps(paramString);
    if (paramMap == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if (paramMap.isEmpty())
    {
      sb.append(paramMap.size()).append(", {}").append('\n');
      return this;
    }
    sb.append(paramMap.size()).append(", {").append('\n');
    paramString = new JceDisplayer(sb, _level + 1);
    JceDisplayer localJceDisplayer = new JceDisplayer(sb, _level + 2);
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      paramString.display('(', null);
      localJceDisplayer.display(localEntry.getKey(), null);
      localJceDisplayer.display(localEntry.getValue(), null);
      paramString.display(')', null);
    }
    display('}', null);
    return this;
  }
  
  public JceDisplayer display(short paramShort, String paramString)
  {
    ps(paramString);
    sb.append(paramShort).append('\n');
    return this;
  }
  
  public JceDisplayer display(boolean paramBoolean, String paramString)
  {
    ps(paramString);
    paramString = sb;
    if (paramBoolean) {}
    for (char c = 'T';; c = 'F')
    {
      paramString.append(c).append('\n');
      return this;
    }
  }
  
  public JceDisplayer display(byte[] paramArrayOfByte, String paramString)
  {
    ps(paramString);
    if (paramArrayOfByte == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if (paramArrayOfByte.length == 0)
    {
      sb.append(paramArrayOfByte.length).append(", []").append('\n');
      return this;
    }
    sb.append(paramArrayOfByte.length).append(", [").append('\n');
    paramString = new JceDisplayer(sb, _level + 1);
    int j = paramArrayOfByte.length;
    int i = 0;
    while (i < j)
    {
      paramString.display(paramArrayOfByte[i], null);
      i += 1;
    }
    display(']', null);
    return this;
  }
  
  public JceDisplayer display(char[] paramArrayOfChar, String paramString)
  {
    ps(paramString);
    if (paramArrayOfChar == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if (paramArrayOfChar.length == 0)
    {
      sb.append(paramArrayOfChar.length).append(", []").append('\n');
      return this;
    }
    sb.append(paramArrayOfChar.length).append(", [").append('\n');
    paramString = new JceDisplayer(sb, _level + 1);
    int j = paramArrayOfChar.length;
    int i = 0;
    while (i < j)
    {
      paramString.display(paramArrayOfChar[i], null);
      i += 1;
    }
    display(']', null);
    return this;
  }
  
  public JceDisplayer display(double[] paramArrayOfDouble, String paramString)
  {
    ps(paramString);
    if (paramArrayOfDouble == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if (paramArrayOfDouble.length == 0)
    {
      sb.append(paramArrayOfDouble.length).append(", []").append('\n');
      return this;
    }
    sb.append(paramArrayOfDouble.length).append(", [").append('\n');
    paramString = new JceDisplayer(sb, _level + 1);
    int j = paramArrayOfDouble.length;
    int i = 0;
    while (i < j)
    {
      paramString.display(paramArrayOfDouble[i], null);
      i += 1;
    }
    display(']', null);
    return this;
  }
  
  public JceDisplayer display(float[] paramArrayOfFloat, String paramString)
  {
    ps(paramString);
    if (paramArrayOfFloat == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if (paramArrayOfFloat.length == 0)
    {
      sb.append(paramArrayOfFloat.length).append(", []").append('\n');
      return this;
    }
    sb.append(paramArrayOfFloat.length).append(", [").append('\n');
    paramString = new JceDisplayer(sb, _level + 1);
    int j = paramArrayOfFloat.length;
    int i = 0;
    while (i < j)
    {
      paramString.display(paramArrayOfFloat[i], null);
      i += 1;
    }
    display(']', null);
    return this;
  }
  
  public JceDisplayer display(int[] paramArrayOfInt, String paramString)
  {
    ps(paramString);
    if (paramArrayOfInt == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if (paramArrayOfInt.length == 0)
    {
      sb.append(paramArrayOfInt.length).append(", []").append('\n');
      return this;
    }
    sb.append(paramArrayOfInt.length).append(", [").append('\n');
    paramString = new JceDisplayer(sb, _level + 1);
    int j = paramArrayOfInt.length;
    int i = 0;
    while (i < j)
    {
      paramString.display(paramArrayOfInt[i], null);
      i += 1;
    }
    display(']', null);
    return this;
  }
  
  public JceDisplayer display(long[] paramArrayOfLong, String paramString)
  {
    ps(paramString);
    if (paramArrayOfLong == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if (paramArrayOfLong.length == 0)
    {
      sb.append(paramArrayOfLong.length).append(", []").append('\n');
      return this;
    }
    sb.append(paramArrayOfLong.length).append(", [").append('\n');
    paramString = new JceDisplayer(sb, _level + 1);
    int j = paramArrayOfLong.length;
    int i = 0;
    while (i < j)
    {
      paramString.display(paramArrayOfLong[i], null);
      i += 1;
    }
    display(']', null);
    return this;
  }
  
  public <T> JceDisplayer display(T[] paramArrayOfT, String paramString)
  {
    ps(paramString);
    if (paramArrayOfT == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if (paramArrayOfT.length == 0)
    {
      sb.append(paramArrayOfT.length).append(", []").append('\n');
      return this;
    }
    sb.append(paramArrayOfT.length).append(", [").append('\n');
    paramString = new JceDisplayer(sb, _level + 1);
    int j = paramArrayOfT.length;
    int i = 0;
    while (i < j)
    {
      paramString.display(paramArrayOfT[i], null);
      i += 1;
    }
    display(']', null);
    return this;
  }
  
  public JceDisplayer display(short[] paramArrayOfShort, String paramString)
  {
    ps(paramString);
    if (paramArrayOfShort == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if (paramArrayOfShort.length == 0)
    {
      sb.append(paramArrayOfShort.length).append(", []").append('\n');
      return this;
    }
    sb.append(paramArrayOfShort.length).append(", [").append('\n');
    paramString = new JceDisplayer(sb, _level + 1);
    int j = paramArrayOfShort.length;
    int i = 0;
    while (i < j)
    {
      paramString.display(paramArrayOfShort[i], null);
      i += 1;
    }
    display(']', null);
    return this;
  }
  
  public JceDisplayer displaySimple(byte paramByte, boolean paramBoolean)
  {
    sb.append(paramByte);
    if (paramBoolean) {
      sb.append("|");
    }
    return this;
  }
  
  public JceDisplayer displaySimple(char paramChar, boolean paramBoolean)
  {
    sb.append(paramChar);
    if (paramBoolean) {
      sb.append("|");
    }
    return this;
  }
  
  public JceDisplayer displaySimple(double paramDouble, boolean paramBoolean)
  {
    sb.append(paramDouble);
    if (paramBoolean) {
      sb.append("|");
    }
    return this;
  }
  
  public JceDisplayer displaySimple(float paramFloat, boolean paramBoolean)
  {
    sb.append(paramFloat);
    if (paramBoolean) {
      sb.append("|");
    }
    return this;
  }
  
  public JceDisplayer displaySimple(int paramInt, boolean paramBoolean)
  {
    sb.append(paramInt);
    if (paramBoolean) {
      sb.append("|");
    }
    return this;
  }
  
  public JceDisplayer displaySimple(long paramLong, boolean paramBoolean)
  {
    sb.append(paramLong);
    if (paramBoolean) {
      sb.append("|");
    }
    return this;
  }
  
  public JceDisplayer displaySimple(JceStruct paramJceStruct, boolean paramBoolean)
  {
    sb.append("{");
    if (paramJceStruct == null) {
      sb.append('\t').append("null");
    }
    for (;;)
    {
      sb.append("}");
      if (paramBoolean) {
        sb.append("|");
      }
      return this;
      paramJceStruct.displaySimple(sb, _level + 1);
    }
  }
  
  public <T> JceDisplayer displaySimple(T paramT, boolean paramBoolean)
  {
    if (paramT == null)
    {
      sb.append("null").append('\n');
      return this;
    }
    if ((paramT instanceof Byte))
    {
      displaySimple(((Byte)paramT).byteValue(), paramBoolean);
      return this;
    }
    if ((paramT instanceof Boolean))
    {
      displaySimple(((Boolean)paramT).booleanValue(), paramBoolean);
      return this;
    }
    if ((paramT instanceof Short))
    {
      displaySimple(((Short)paramT).shortValue(), paramBoolean);
      return this;
    }
    if ((paramT instanceof Integer))
    {
      displaySimple(((Integer)paramT).intValue(), paramBoolean);
      return this;
    }
    if ((paramT instanceof Long))
    {
      displaySimple(((Long)paramT).longValue(), paramBoolean);
      return this;
    }
    if ((paramT instanceof Float))
    {
      displaySimple(((Float)paramT).floatValue(), paramBoolean);
      return this;
    }
    if ((paramT instanceof Double))
    {
      displaySimple(((Double)paramT).doubleValue(), paramBoolean);
      return this;
    }
    if ((paramT instanceof String))
    {
      displaySimple((String)paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof Map))
    {
      displaySimple((Map)paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof List))
    {
      displaySimple((List)paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof JceStruct))
    {
      displaySimple((JceStruct)paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof byte[]))
    {
      displaySimple((byte[])paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof boolean[]))
    {
      displaySimple((boolean[])paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof short[]))
    {
      displaySimple((short[])paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof int[]))
    {
      displaySimple((int[])paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof long[]))
    {
      displaySimple((long[])paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof float[]))
    {
      displaySimple((float[])paramT, paramBoolean);
      return this;
    }
    if ((paramT instanceof double[]))
    {
      displaySimple((double[])paramT, paramBoolean);
      return this;
    }
    if (paramT.getClass().isArray())
    {
      displaySimple((Object[])paramT, paramBoolean);
      return this;
    }
    throw new JceEncodeException("write object error: unsupport type.");
  }
  
  public JceDisplayer displaySimple(String paramString, boolean paramBoolean)
  {
    if (paramString == null) {
      sb.append("null");
    }
    for (;;)
    {
      if (paramBoolean) {
        sb.append("|");
      }
      return this;
      sb.append(paramString);
    }
  }
  
  public <T> JceDisplayer displaySimple(Collection<T> paramCollection, boolean paramBoolean)
  {
    if (paramCollection == null)
    {
      sb.append("[]");
      if (paramBoolean) {
        sb.append("|");
      }
      return this;
    }
    return displaySimple(paramCollection.toArray(), paramBoolean);
  }
  
  public <K, V> JceDisplayer displaySimple(Map<K, V> paramMap, boolean paramBoolean)
  {
    if ((paramMap == null) || (paramMap.isEmpty()))
    {
      sb.append("{}");
      if (paramBoolean) {
        sb.append("|");
      }
    }
    do
    {
      return this;
      sb.append("{");
      JceDisplayer localJceDisplayer = new JceDisplayer(sb, _level + 2);
      int i = 1;
      paramMap = paramMap.entrySet().iterator();
      while (paramMap.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramMap.next();
        if (i == 0) {
          sb.append(",");
        }
        localJceDisplayer.displaySimple(localEntry.getKey(), true);
        localJceDisplayer.displaySimple(localEntry.getValue(), false);
        i = 0;
      }
      sb.append("}");
    } while (!paramBoolean);
    sb.append("|");
    return this;
  }
  
  public JceDisplayer displaySimple(short paramShort, boolean paramBoolean)
  {
    sb.append(paramShort);
    if (paramBoolean) {
      sb.append("|");
    }
    return this;
  }
  
  public JceDisplayer displaySimple(boolean paramBoolean1, boolean paramBoolean2)
  {
    StringBuilder localStringBuilder = sb;
    if (paramBoolean1) {}
    for (char c = 'T';; c = 'F')
    {
      localStringBuilder.append(c);
      if (paramBoolean2) {
        sb.append("|");
      }
      return this;
    }
  }
  
  public JceDisplayer displaySimple(byte[] paramArrayOfByte, boolean paramBoolean)
  {
    if ((paramArrayOfByte == null) || (paramArrayOfByte.length == 0)) {
      if (paramBoolean) {
        sb.append("|");
      }
    }
    do
    {
      return this;
      sb.append(HexUtil.bytes2HexStr(paramArrayOfByte));
    } while (!paramBoolean);
    sb.append("|");
    return this;
  }
  
  public JceDisplayer displaySimple(char[] paramArrayOfChar, boolean paramBoolean)
  {
    if ((paramArrayOfChar == null) || (paramArrayOfChar.length == 0)) {
      if (paramBoolean) {
        sb.append("|");
      }
    }
    do
    {
      return this;
      sb.append(new String(paramArrayOfChar));
    } while (!paramBoolean);
    sb.append("|");
    return this;
  }
  
  public JceDisplayer displaySimple(double[] paramArrayOfDouble, boolean paramBoolean)
  {
    if ((paramArrayOfDouble == null) || (paramArrayOfDouble.length == 0))
    {
      sb.append("[]");
      if (paramBoolean) {
        sb.append("|");
      }
    }
    do
    {
      return this;
      sb.append("[");
      JceDisplayer localJceDisplayer = new JceDisplayer(sb, _level + 1);
      int i = 0;
      while (i < paramArrayOfDouble.length)
      {
        double d = paramArrayOfDouble[i];
        if (i != 0) {
          sb.append("|");
        }
        localJceDisplayer.displaySimple(d, false);
        i += 1;
      }
      sb.append("[");
    } while (!paramBoolean);
    sb.append("|");
    return this;
  }
  
  public JceDisplayer displaySimple(float[] paramArrayOfFloat, boolean paramBoolean)
  {
    if ((paramArrayOfFloat == null) || (paramArrayOfFloat.length == 0))
    {
      sb.append("[]");
      if (paramBoolean) {
        sb.append("|");
      }
    }
    do
    {
      return this;
      sb.append("[");
      JceDisplayer localJceDisplayer = new JceDisplayer(sb, _level + 1);
      int i = 0;
      while (i < paramArrayOfFloat.length)
      {
        float f = paramArrayOfFloat[i];
        if (i != 0) {
          sb.append("|");
        }
        localJceDisplayer.displaySimple(f, false);
        i += 1;
      }
      sb.append("]");
    } while (!paramBoolean);
    sb.append("|");
    return this;
  }
  
  public JceDisplayer displaySimple(int[] paramArrayOfInt, boolean paramBoolean)
  {
    if ((paramArrayOfInt == null) || (paramArrayOfInt.length == 0))
    {
      sb.append("[]");
      if (paramBoolean) {
        sb.append("|");
      }
    }
    do
    {
      return this;
      sb.append("[");
      JceDisplayer localJceDisplayer = new JceDisplayer(sb, _level + 1);
      int i = 0;
      while (i < paramArrayOfInt.length)
      {
        int j = paramArrayOfInt[i];
        if (i != 0) {
          sb.append("|");
        }
        localJceDisplayer.displaySimple(j, false);
        i += 1;
      }
      sb.append("]");
    } while (!paramBoolean);
    sb.append("|");
    return this;
  }
  
  public JceDisplayer displaySimple(long[] paramArrayOfLong, boolean paramBoolean)
  {
    if ((paramArrayOfLong == null) || (paramArrayOfLong.length == 0))
    {
      sb.append("[]");
      if (paramBoolean) {
        sb.append("|");
      }
    }
    do
    {
      return this;
      sb.append("[");
      JceDisplayer localJceDisplayer = new JceDisplayer(sb, _level + 1);
      int i = 0;
      while (i < paramArrayOfLong.length)
      {
        long l = paramArrayOfLong[i];
        if (i != 0) {
          sb.append("|");
        }
        localJceDisplayer.displaySimple(l, false);
        i += 1;
      }
      sb.append("]");
    } while (!paramBoolean);
    sb.append("|");
    return this;
  }
  
  public <T> JceDisplayer displaySimple(T[] paramArrayOfT, boolean paramBoolean)
  {
    if ((paramArrayOfT == null) || (paramArrayOfT.length == 0))
    {
      sb.append("[]");
      if (paramBoolean) {
        sb.append("|");
      }
    }
    do
    {
      return this;
      sb.append("[");
      JceDisplayer localJceDisplayer = new JceDisplayer(sb, _level + 1);
      int i = 0;
      while (i < paramArrayOfT.length)
      {
        T ? = paramArrayOfT[i];
        if (i != 0) {
          sb.append("|");
        }
        localJceDisplayer.displaySimple(?, false);
        i += 1;
      }
      sb.append("]");
    } while (!paramBoolean);
    sb.append("|");
    return this;
  }
  
  public JceDisplayer displaySimple(short[] paramArrayOfShort, boolean paramBoolean)
  {
    if ((paramArrayOfShort == null) || (paramArrayOfShort.length == 0))
    {
      sb.append("[]");
      if (paramBoolean) {
        sb.append("|");
      }
    }
    do
    {
      return this;
      sb.append("[");
      JceDisplayer localJceDisplayer = new JceDisplayer(sb, _level + 1);
      int i = 0;
      while (i < paramArrayOfShort.length)
      {
        short s = paramArrayOfShort[i];
        if (i != 0) {
          sb.append("|");
        }
        localJceDisplayer.displaySimple(s, false);
        i += 1;
      }
      sb.append("]");
    } while (!paramBoolean);
    sb.append("|");
    return this;
  }
}
