package com.tencent.mobileqq.utils.httputils;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.RichMediaStrategy.OldEngineDPCProfile.TimeoutParam;
import com.tencent.mobileqq.transfile.RichMediaUtil;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicBoolean;

public class HttpMsg
{
  public static final String A = "application/vnd.wap.xhtml+xml";
  public static final String B = "application/xhtml+xml";
  public static final String C = "image";
  public static final String D = "the package is over max limit";
  public static final String E = "HttpCommunicator closed or msg caceled!";
  public static final String F = "preempted by higher msg";
  public static final String G = "httpcommunicator closed";
  public static final String H = "request cancelled";
  public static final String I = "jad";
  public static final String J = "jar";
  public static final String K = "wtai://wp/mc;";
  public static final String L = "unknown";
  public static final String M = "charset";
  public static final String N = "utf-8";
  public static final String O = "GET";
  public static final String P = "POST";
  public static final String Q = "Range";
  public static final String R = "X-Range";
  public static final String S = "If-Modified-Since";
  public static final String T = "Content-Length";
  public static final String U = "User-ReturnCode";
  public static final String V = "X-User-ReturnCode";
  public static final String W = "User-Range";
  public static final String X = "2";
  public static final String Y = "Connection";
  public static final String Z = "multipart/form-data";
  public static final int a = 2048;
  public static final String a = "cache-control";
  public static final String aa = "content-range";
  public static final String ab = "host";
  public static final String ac = "Content-Encoding";
  public static final String ad = "Transfer-Encoding";
  public static final String ae = "X-RtFlag";
  public static final String af = "X-httime";
  public static final String ag = "X-piccachetime";
  public static final String ah = "User-Agent";
  public static String an = "param_reason";
  public static final String b = "last-modified";
  public static final String c = "max-age";
  public static final String d = "no-cache";
  public static final String e = "Pragma";
  public static final String f = "Expires";
  public static final String g = "0";
  public static final String h = "Accept";
  public static final String i = "text/vnd.wap.wml,image/*,audio/*,text/vnd.sun.j2me.app-descriptor,application/*";
  public static final String j = "Location";
  public static final String k = "Referer";
  public static final String l = "X-ErrNo";
  public static final String m = "Content-Type";
  public static final String n = "Set-Q-Cookie";
  public static final String o = "Q-Cookie";
  public static final String p = "Set-Cookie";
  public static final String q = "Cookie";
  public static final String r = "Accept-Encoding";
  public static final String s = "mType";
  public static final String t = "text/vnd.wap.wml";
  public static final String u = "application/vnd.wap.wmlc";
  public static final String v = "application/vnd.wap.wbxml";
  public static final String w = "text/vnd.sun.j2me.app-descriptor";
  public static final String x = "application/java-archive";
  public static final String y = "text/html";
  public static final String z = "text/plain";
  public long a;
  public RichMediaStrategy.OldEngineDPCProfile.TimeoutParam a;
  private final IHttpCommunicatorListener jdField_a_of_type_ComTencentMobileqqUtilsHttputilsIHttpCommunicatorListener;
  public Object a;
  public HttpURLConnection a;
  HashMap jdField_a_of_type_JavaUtilHashMap = new HashMap();
  public AtomicBoolean a;
  private boolean jdField_a_of_type_Boolean = false;
  private byte[] jdField_a_of_type_ArrayOfByte;
  public String ai;
  public String aj;
  public String ak = null;
  public String al;
  public String am;
  private String ao;
  private String ap;
  private String aq = "GET";
  public int b;
  public long b;
  public HashMap b;
  public AtomicBoolean b;
  final boolean jdField_b_of_type_Boolean;
  private byte[] jdField_b_of_type_ArrayOfByte;
  public int c;
  public long c;
  public AtomicBoolean c;
  public boolean c;
  public int d;
  public long d;
  public boolean d;
  public int e;
  public long e;
  public boolean e;
  public int f;
  public long f;
  private boolean f;
  public int g;
  public long g;
  public int h;
  public int i;
  private int j = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public HttpMsg(String paramString, byte[] paramArrayOfByte, IHttpCommunicatorListener paramIHttpCommunicatorListener)
  {
    this(paramString, paramArrayOfByte, paramIHttpCommunicatorListener, false);
  }
  
  public HttpMsg(String paramString, byte[] paramArrayOfByte, IHttpCommunicatorListener paramIHttpCommunicatorListener, boolean paramBoolean)
  {
    jdField_b_of_type_Int = 201;
    jdField_f_of_type_Boolean = true;
    jdField_c_of_type_Boolean = false;
    jdField_d_of_type_Int = -1;
    jdField_e_of_type_Int = -1;
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
    jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
    jdField_a_of_type_JavaLangObject = null;
    jdField_a_of_type_JavaNetHttpURLConnection = null;
    jdField_g_of_type_Int = -1;
    jdField_a_of_type_Long = 0L;
    jdField_b_of_type_Long = 0L;
    jdField_b_of_type_JavaUtilHashMap = new HashMap();
    jdField_d_of_type_Long = 0L;
    jdField_e_of_type_Long = 0L;
    jdField_f_of_type_Long = 0L;
    jdField_g_of_type_Long = 0L;
    jdField_d_of_type_Boolean = true;
    jdField_e_of_type_Boolean = false;
    ao = paramString;
    if (paramString != null)
    {
      ap = paramString.substring(0, paramString.length());
      jdField_a_of_type_ComTencentMobileqqUtilsHttputilsIHttpCommunicatorListener = paramIHttpCommunicatorListener;
      if (paramArrayOfByte != null) {
        break label204;
      }
      jdField_a_of_type_ArrayOfByte = null;
    }
    for (;;)
    {
      jdField_b_of_type_Boolean = paramBoolean;
      return;
      ap = null;
      break;
      label204:
      jdField_a_of_type_ArrayOfByte = new byte[paramArrayOfByte.length];
      System.arraycopy(paramArrayOfByte, 0, jdField_a_of_type_ArrayOfByte, 0, jdField_a_of_type_ArrayOfByte.length);
    }
  }
  
  public int a()
  {
    return j;
  }
  
  public long a()
  {
    return jdField_a_of_type_Long;
  }
  
  public IHttpCommunicatorListener a()
  {
    return jdField_a_of_type_ComTencentMobileqqUtilsHttputilsIHttpCommunicatorListener;
  }
  
  public String a()
  {
    return ao;
  }
  
  public String a(String paramString)
  {
    return (String)jdField_b_of_type_JavaUtilHashMap.get(paramString);
  }
  
  public HashMap a()
  {
    return jdField_a_of_type_JavaUtilHashMap;
  }
  
  public void a()
  {
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
    jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
    if (jdField_c_of_type_JavaUtilConcurrentAtomicAtomicBoolean != null) {
      jdField_c_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
    }
    jdField_a_of_type_JavaNetHttpURLConnection = null;
  }
  
  public void a(int paramInt)
  {
    j = paramInt;
  }
  
  public void a(int paramInt1, int paramInt2, String paramString)
  {
    h = paramInt1;
    jdField_g_of_type_Int = paramInt2;
    ak = paramString;
    if ((jdField_a_of_type_ComTencentMobileqqUtilsHttputilsIHttpCommunicatorListener instanceof BaseTransProcessor)) {
      ((BaseTransProcessor)jdField_a_of_type_ComTencentMobileqqUtilsHttputilsIHttpCommunicatorListener).b(paramInt1, paramInt2, 0L, paramString);
    }
  }
  
  public void a(String paramString)
  {
    ao = paramString;
    ap = ao.substring(0, ao.length());
  }
  
  public void a(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return;
    }
    jdField_a_of_type_JavaUtilHashMap.put(paramString1, paramString2);
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    jdField_b_of_type_ArrayOfByte = paramArrayOfByte;
  }
  
  public boolean a()
  {
    return jdField_a_of_type_Boolean;
  }
  
  public byte[] a()
  {
    return jdField_b_of_type_ArrayOfByte;
  }
  
  public int b()
  {
    return jdField_b_of_type_Int;
  }
  
  public String b()
  {
    return ap;
  }
  
  public void b()
  {
    a();
    h = 0;
    jdField_g_of_type_Int = 0;
    ak = null;
    jdField_b_of_type_ArrayOfByte = null;
  }
  
  public void b(int paramInt)
  {
    if (paramInt == 5)
    {
      jdField_b_of_type_Int = 201;
      return;
    }
    if (paramInt == 1)
    {
      jdField_b_of_type_Int = 202;
      return;
    }
    if (paramInt == 10)
    {
      jdField_b_of_type_Int = 200;
      return;
    }
    jdField_b_of_type_Int = paramInt;
  }
  
  public void b(String paramString)
  {
    ap = paramString;
  }
  
  public void b(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return;
    }
    jdField_b_of_type_JavaUtilHashMap.put(paramString1, paramString2);
  }
  
  public void b(boolean paramBoolean)
  {
    jdField_f_of_type_Boolean = paramBoolean;
  }
  
  public void b(byte[] paramArrayOfByte)
  {
    jdField_a_of_type_ArrayOfByte = paramArrayOfByte;
  }
  
  public boolean b()
  {
    return jdField_f_of_type_Boolean;
  }
  
  public byte[] b()
  {
    return jdField_a_of_type_ArrayOfByte;
  }
  
  public int c()
  {
    return jdField_g_of_type_Int;
  }
  
  public String c()
  {
    String str2 = a();
    String str1 = str2;
    if (!jdField_d_of_type_Boolean) {
      str1 = RichMediaUtil.a(str2);
    }
    return str1;
  }
  
  public void c(int paramInt)
  {
    jdField_g_of_type_Int = paramInt;
  }
  
  public void c(String paramString)
  {
    aq = paramString;
  }
  
  public void c(boolean paramBoolean)
  {
    jdField_c_of_type_Boolean = paramBoolean;
  }
  
  public boolean c()
  {
    return jdField_c_of_type_Boolean;
  }
  
  public String d()
  {
    return ak;
  }
  
  public void d(String paramString)
  {
    ao = paramString;
  }
  
  public boolean d()
  {
    if ((jdField_b_of_type_JavaUtilHashMap.containsKey("X-RtFlag")) && ("0".equals(jdField_b_of_type_JavaUtilHashMap.get("X-RtFlag")))) {
      return false;
    }
    if ((h == 56009) && (jdField_g_of_type_Int == 404))
    {
      String str = (String)jdField_b_of_type_JavaUtilHashMap.get(an);
      return (!"H_404_-6101".equals(str)) && (!"H_404_-5062".equals(str));
    }
    return (h != 9048) && (h != 9057) && (h != 9020) && (h != 9022) && (h != 9366) && (h != 9058);
  }
  
  public String e()
  {
    return aq;
  }
}
