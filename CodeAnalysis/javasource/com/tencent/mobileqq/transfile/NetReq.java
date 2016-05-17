package com.tencent.mobileqq.transfile;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

public class NetReq
{
  public static final int d = 0;
  public static final int e = 1;
  public static final int f = 2;
  public static final int g = 0;
  public static final int h = 1;
  public static final int i = 2;
  public long a;
  public INetEngine.IBreakDownFix a;
  public INetEngine.INetEngineListener a;
  public NetResp a;
  public OutputStream a;
  public Object a;
  public HashMap a;
  public List a;
  public boolean a;
  public byte[] a;
  public long b;
  private Object b;
  public boolean b;
  public long c;
  public String c;
  public boolean c;
  public long d;
  public String d;
  public boolean d;
  public String e;
  public boolean e;
  public String f;
  public boolean f;
  public boolean g;
  int j;
  public int k;
  public int l;
  public int m;
  public int n;
  public int o;
  
  public NetReq()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    j = 1;
    jdField_a_of_type_Long = 0L;
    jdField_b_of_type_Long = 0L;
    jdField_b_of_type_Boolean = true;
    jdField_c_of_type_Long = 0L;
    jdField_d_of_type_Long = 480000L;
    k = 8;
    l = 5;
    jdField_c_of_type_Boolean = false;
    m = 1;
    jdField_a_of_type_ComTencentMobileqqTransfileNetResp = null;
    jdField_d_of_type_Boolean = true;
    e = true;
    jdField_f_of_type_Boolean = true;
    g = false;
    jdField_f_of_type_JavaLangString = null;
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
  }
  
  public Object a()
  {
    try
    {
      Object localObject1 = jdField_b_of_type_JavaLangObject;
      return localObject1;
    }
    finally
    {
      localObject2 = finally;
      throw localObject2;
    }
  }
  
  public void a(Object paramObject)
  {
    try
    {
      jdField_b_of_type_JavaLangObject = paramObject;
      return;
    }
    finally
    {
      paramObject = finally;
      throw paramObject;
    }
  }
  
  public boolean a()
  {
    return (jdField_c_of_type_JavaLangString != null) || (jdField_a_of_type_JavaIoOutputStream != null);
  }
  
  public boolean b()
  {
    return jdField_c_of_type_JavaLangString != null;
  }
  
  public boolean c()
  {
    return jdField_a_of_type_JavaIoOutputStream != null;
  }
}
