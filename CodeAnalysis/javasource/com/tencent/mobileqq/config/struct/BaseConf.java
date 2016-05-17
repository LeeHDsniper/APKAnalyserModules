package com.tencent.mobileqq.config.struct;

import com.tencent.mobileqq.config.ConfigManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.util.ArrayList;
import java.util.List;

public abstract class BaseConf
{
  public static final String a = "NearbyBannerPic";
  public static final int b = 2;
  public static final int c = 3;
  public static final int d = 4;
  public static final int e = 5;
  public static final int f = 6;
  public static final int g = 7;
  public static final int h = 8;
  public static final int z_ = 1;
  public long a;
  protected ArrayList a;
  public short a;
  private boolean a;
  public byte a_;
  public long b;
  public long c;
  private final int i;
  
  public BaseConf(short paramShort, byte paramByte)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    i = ConfigManager.a();
    jdField_a_of_type_Short = 0;
    jdField_a_of_type_Long = 0L;
    b = -1L;
    c = -1L;
    a_ = -1;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Short = paramShort;
    a_ = paramByte;
  }
  
  public final int a()
  {
    return i;
  }
  
  public List a()
  {
    return jdField_a_of_type_JavaUtilArrayList;
  }
  
  public final short a()
  {
    return jdField_a_of_type_Short;
  }
  
  public abstract void a();
  
  public void a(int paramInt)
  {
    if (paramInt >= jdField_a_of_type_JavaUtilArrayList.size()) {
      return;
    }
    jdField_a_of_type_JavaUtilArrayList.remove(paramInt);
  }
  
  public abstract void a(DataInputStream paramDataInputStream);
  
  public abstract void a(DataOutputStream paramDataOutputStream);
  
  public void a(Object paramObject)
  {
    jdField_a_of_type_JavaUtilArrayList.add(paramObject);
  }
  
  public final void a(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public final boolean a()
  {
    return (c > 0L) && (c <= System.currentTimeMillis());
  }
  
  public final int b()
  {
    return jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public void b()
  {
    jdField_a_of_type_JavaUtilArrayList.clear();
  }
  
  public void b(String paramString)
  {
    if ((paramString == null) || (paramString.trim().equals(""))) {}
    label85:
    for (;;)
    {
      return;
      int j = 0;
      if (j < jdField_a_of_type_JavaUtilArrayList.size())
      {
        PicAndAdConf.PicStruct localPicStruct = (PicAndAdConf.PicStruct)jdField_a_of_type_JavaUtilArrayList.get(j);
        if ((d == null) || (!d.contains(paramString))) {}
      }
      for (;;)
      {
        if (j == -1) {
          break label85;
        }
        jdField_a_of_type_JavaUtilArrayList.remove(j);
        return;
        j += 1;
        break;
        j = -1;
      }
    }
  }
  
  public final boolean b()
  {
    return b > System.currentTimeMillis();
  }
  
  public final boolean c()
  {
    return jdField_a_of_type_Boolean;
  }
}
