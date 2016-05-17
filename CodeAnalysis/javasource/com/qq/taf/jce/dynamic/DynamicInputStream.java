package com.qq.taf.jce.dynamic;

import com.qq.taf.jce.JceDecodeException;
import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceInputStream.HeadData;
import java.io.UnsupportedEncodingException;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

public final class DynamicInputStream
{
  private ByteBuffer bs;
  private String sServerEncoding = "GBK";
  
  public DynamicInputStream(ByteBuffer paramByteBuffer)
  {
    bs = paramByteBuffer;
  }
  
  public DynamicInputStream(byte[] paramArrayOfByte)
  {
    bs = ByteBuffer.wrap(paramArrayOfByte);
  }
  
  private JceField readString(JceInputStream.HeadData paramHeadData, int paramInt)
  {
    byte[] arrayOfByte = new byte[paramInt];
    bs.get(arrayOfByte);
    try
    {
      String str1 = new String(arrayOfByte, sServerEncoding);
      return JceField.create(str1, tag);
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      for (;;)
      {
        String str2 = new String(arrayOfByte);
      }
    }
  }
  
  public JceField read()
  {
    try
    {
      localObject1 = new JceInputStream.HeadData();
      JceInputStream.readHead((JceInputStream.HeadData)localObject1, bs);
      switch (type)
      {
      case 0: 
        return JceField.create(bs.get(), tag);
      }
    }
    catch (BufferUnderflowException localBufferUnderflowException)
    {
      Object localObject1;
      int j;
      int i;
      Object localObject2;
      return null;
    }
    return JceField.create(bs.getShort(), tag);
    return JceField.create(bs.getInt(), tag);
    return JceField.create(bs.getLong(), tag);
    return JceField.create(bs.getFloat(), tag);
    return JceField.create(bs.getDouble(), tag);
    j = bs.get();
    i = j;
    if (j < 0) {
      i = j + 256;
    }
    return readString((JceInputStream.HeadData)localObject1, i);
    return readString((JceInputStream.HeadData)localObject1, bs.getInt());
    j = ((NumberField)read()).intValue();
    localObject2 = new JceField[j];
    i = 0;
    for (;;)
    {
      if (i < j)
      {
        localObject2[i] = read();
        i += 1;
      }
      else
      {
        return JceField.createList((JceField[])localObject2, tag);
        j = ((NumberField)read()).intValue();
        localObject2 = new JceField[j];
        Object localObject3 = new JceField[j];
        i = 0;
        for (;;)
        {
          if (i < j)
          {
            localObject2[i] = read();
            localObject3[i] = read();
            i += 1;
          }
          else
          {
            return JceField.createMap((JceField[])localObject2, (JceField[])localObject3, tag);
            localObject2 = new ArrayList();
            for (;;)
            {
              localObject3 = read();
              if (localObject3 == null) {
                return JceField.createStruct((JceField[])((List)localObject2).toArray(new JceField[0]), tag);
              }
              ((List)localObject2).add(localObject3);
              continue;
              return JceField.createZero(tag);
              i = tag;
              JceInputStream.readHead((JceInputStream.HeadData)localObject1, bs);
              if (type != 0) {
                throw new JceDecodeException("type mismatch, simple_list only support byte, tag: " + i + ", type: " + type);
              }
              localObject1 = new byte[((NumberField)read()).intValue()];
              bs.get((byte[])localObject1);
              localObject1 = JceField.create((byte[])localObject1, i);
              return localObject1;
              return null;
            }
          }
        }
      }
    }
    return null;
  }
  
  public int setServerEncoding(String paramString)
  {
    sServerEncoding = paramString;
    return 0;
  }
}
