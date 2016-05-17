package com.tencent.biz.qrcode;

import com.tencent.biz.qrcode.util.QRUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.HexUtil;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

public class QRActionEntity
{
  public static final int a = 1;
  public static final int b = 2;
  public static final int c = 3;
  public static final int d = 4;
  public static final int e = 5;
  public static final int f = 6;
  public static final int g = 10;
  public static final int h = 1;
  public static final int i = 2;
  public static final int j = 3;
  public static final int k = 4;
  public static final int l = 5;
  public static final int m = 6;
  public static final int n = 7;
  public static final int o = 1;
  public static final int p = 1;
  public ArrayList a;
  public int q;
  public int r;
  public int s;
  public int t;
  
  public QRActionEntity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    q = 0;
    r = 0;
    s = 0;
    t = 0;
    a = null;
    a = new ArrayList();
  }
  
  public QRActionEntity(String paramString)
  {
    q = 0;
    r = 0;
    s = 0;
    t = 0;
    a = null;
    a(paramString);
  }
  
  public static QRActionEntity a(int paramInt, String paramString)
  {
    long l1;
    byte[] arrayOfByte;
    Object localObject;
    if ((paramInt == 1) || (paramInt == 2) || (paramInt == 3)) {
      if (paramString != null)
      {
        l1 = Long.parseLong(paramString);
        paramString = new QRActionEntity();
        q = 1;
        r = 1;
        s = paramInt;
        t = 0;
        a = new ArrayList();
        arrayOfByte = QRUtils.a(l1);
        localObject = ByteBuffer.allocate(4);
        ((ByteBuffer)localObject).put(arrayOfByte, 4, 4);
        ((ByteBuffer)localObject).flip();
        arrayOfByte = new byte[((ByteBuffer)localObject).limit()];
        ((ByteBuffer)localObject).get(arrayOfByte);
        if (paramInt != 2) {
          break label145;
        }
        paramInt = 2;
      }
    }
    for (;;)
    {
      localObject = new QRActionEntity.QRActionTLV(paramInt, (short)4, arrayOfByte);
      a.add(localObject);
      return paramString;
      l1 = 0L;
      break;
      label145:
      if (paramInt == 3)
      {
        paramInt = 7;
        continue;
        return null;
      }
      else
      {
        paramInt = 1;
      }
    }
  }
  
  public int a()
  {
    if (a != null) {
      return a.size();
    }
    return 0;
  }
  
  public QRActionEntity.QRActionTLV a()
  {
    if ((a != null) && (!a.isEmpty())) {
      return (QRActionEntity.QRActionTLV)a.get(0);
    }
    return null;
  }
  
  public QRActionEntity.QRActionTLV a(int paramInt)
  {
    if ((a != null) && (a.size() >= paramInt)) {
      return (QRActionEntity.QRActionTLV)a.get(paramInt);
    }
    return null;
  }
  
  public String a()
  {
    if (a != null)
    {
      localObject1 = a.iterator();
      for (int i1 = 4;; i1 = ((QRActionEntity.QRActionTLV)((Iterator)localObject1).next()).a() + i1)
      {
        i2 = i1;
        if (!((Iterator)localObject1).hasNext()) {
          break;
        }
      }
    }
    int i2 = 4;
    Object localObject1 = ByteBuffer.allocate(i2);
    ((ByteBuffer)localObject1).put((byte)q);
    ((ByteBuffer)localObject1).put((byte)r);
    ((ByteBuffer)localObject1).put((byte)s);
    ((ByteBuffer)localObject1).put((byte)t);
    if ((a != null) && (!a.isEmpty()))
    {
      ((ByteBuffer)localObject1).put((byte)a.size());
      localObject2 = a.iterator();
      while (((Iterator)localObject2).hasNext())
      {
        QRActionEntity.QRActionTLV localQRActionTLV = (QRActionEntity.QRActionTLV)((Iterator)localObject2).next();
        ((ByteBuffer)localObject1).put((byte)jdField_a_of_type_Int);
        ((ByteBuffer)localObject1).putShort(jdField_a_of_type_Short);
        ((ByteBuffer)localObject1).put(jdField_a_of_type_ArrayOfByte);
      }
    }
    ((ByteBuffer)localObject1).flip();
    Object localObject2 = new byte[((ByteBuffer)localObject1).limit()];
    ((ByteBuffer)localObject1).get((byte[])localObject2);
    return HexUtil.a((byte[])localObject2);
  }
  
  public void a(String paramString)
  {
    Object localObject = HexUtil.a(paramString);
    paramString = ByteBuffer.allocate(localObject.length);
    paramString.put((byte[])localObject);
    paramString.flip();
    q = paramString.get();
    r = paramString.get();
    s = paramString.get();
    t = paramString.get();
    int i2 = paramString.get();
    a = new ArrayList(i2);
    int i1 = 0;
    while (i1 < i2)
    {
      localObject = new QRActionEntity.QRActionTLV();
      jdField_a_of_type_Int = paramString.get();
      byte[] arrayOfByte = new byte[2];
      paramString.get(arrayOfByte);
      jdField_a_of_type_Short = QRUtils.a(arrayOfByte);
      arrayOfByte = new byte[jdField_a_of_type_Short];
      paramString.get(arrayOfByte);
      jdField_a_of_type_ArrayOfByte = arrayOfByte;
      a.add(localObject);
      i1 += 1;
    }
  }
}
