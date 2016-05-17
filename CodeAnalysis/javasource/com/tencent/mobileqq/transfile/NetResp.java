package com.tencent.mobileqq.transfile;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.HashMap;

public class NetResp
{
  public static final int a = 0;
  public static final int b = 1;
  public static final String b = "param_rspHeader";
  public static final int c = 2;
  public static final String c = "param_reqHeader";
  public static final int d = 3;
  public static final String d = "firstserverip";
  public static final String e = "serverip";
  public static final String f = "param_url";
  public static final String g = "netresp_param_reason";
  public static final String h = "qzone_desc";
  public static final String i = "qzone_detail_download_info";
  public long a;
  public NetReq a;
  public String a;
  public HashMap a;
  public byte[] a;
  public long b;
  public long c;
  public long d;
  public int e;
  long e;
  public int f;
  long f;
  public int g;
  public long g;
  public int h;
  public long h;
  int i;
  
  public NetResp(NetReq paramNetReq)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_e_of_type_Int = 2;
    jdField_a_of_type_Long = 0L;
    b = 0L;
    c = 0L;
    d = 0L;
    jdField_h_of_type_Int = 0;
    jdField_e_of_type_Long = 0L;
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    jdField_g_of_type_Long = 0L;
    jdField_h_of_type_Long = 0L;
    jdField_a_of_type_ComTencentMobileqqTransfileNetReq = paramNetReq;
    jdField_f_of_type_Long = System.currentTimeMillis();
  }
  
  public void a()
  {
    jdField_e_of_type_Int = 2;
    jdField_f_of_type_Int = 0;
    jdField_a_of_type_JavaLangString = "";
    jdField_g_of_type_Int = 0;
    jdField_a_of_type_Long = 0L;
    b = 0L;
    c = 0L;
    d = 0L;
    jdField_h_of_type_Int = 0;
    jdField_a_of_type_ArrayOfByte = null;
    jdField_a_of_type_JavaUtilHashMap.clear();
  }
  
  public void a(int paramInt1, int paramInt2, String paramString, HashMap paramHashMap)
  {
    jdField_e_of_type_Int = paramInt1;
    jdField_f_of_type_Int = paramInt2;
    jdField_a_of_type_JavaLangString = paramString;
    if (paramHashMap != null) {
      jdField_a_of_type_JavaUtilHashMap.putAll(paramHashMap);
    }
  }
}
