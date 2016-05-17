package com.tencent.mobileqq.transfile;

import KQQFS.VerifyCode;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.httputils.HttpMsg;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileMsg
{
  public static final int A = 33;
  public static final String A = "photo/";
  public static final int B = 34;
  public static final String B = "ptt/";
  public static final int C = 65536;
  public static final int D = 65537;
  public static final int E = 65538;
  public static final int F = 131072;
  public static final int G = 131074;
  public static final int H = 131075;
  public static final int I = 131076;
  public static final int J = 131077;
  public static final int K = 131078;
  public static final int L = 131079;
  public static final int O = 998;
  public static final int P = 999;
  public static final int Q = 1000;
  public static final int R = 1001;
  public static final int S = 1002;
  public static final int T = 1003;
  public static final int U = 1004;
  public static final int V = 1005;
  public static final int W = 1006;
  public static final int X = 1007;
  public static final int Y = 2000;
  public static final int Z = 2001;
  public static final String a = "gif";
  static String[] a;
  public static final int aA = 9048;
  public static final int aB = 9015;
  public static final int aC = 9011;
  public static final int aD = 9003;
  public static final int aE = 9004;
  public static final int aF = 9008;
  public static final int aG = 9023;
  public static final int aH = 9040;
  public static final int aI = 9041;
  public static final int aJ = 9042;
  public static final int aK = 9043;
  public static final int aL = 9045;
  public static final int aM = 9080;
  public static final int aN = 9081;
  public static final int aO = 9082;
  public static final int aP = 9009;
  public static final int aQ = 4606;
  public static final int aR = 8;
  public static final int aS = 9061;
  public static final int aT = 9060;
  public static final int aU = 9024;
  public static final int aV = 9035;
  public static final int aW = 9053;
  public static final int aX = 9052;
  public static final int aY = 9054;
  public static final int aZ = 9057;
  public static final int aa = 2002;
  public static final int ab = 2003;
  public static final int ac = 2004;
  public static final int ad = 2005;
  public static final int ae = 2006;
  public static final int af = 2007;
  public static final int ag = 2008;
  public static final int ah = 3000;
  public static final int ai = 3001;
  public static final int aj = 3002;
  public static final int ak = 4001;
  public static final int al = 5000;
  public static final int am = 5001;
  public static final int an = 5002;
  public static final int ao = 7000;
  public static final int ar = 0;
  public static final int as = 1;
  public static final int at = 2;
  public static final int au = 3;
  public static final int av = 4;
  public static final int aw = 5;
  public static final int ax = 9001;
  public static final int ay = 9006;
  public static final int az = 9005;
  public static final int b = 0;
  static String[] b;
  public static final int ba = 9032;
  public static final int bb = 9001;
  public static final int bc = 90451;
  public static final int bd = 90460;
  public static final int be = 0;
  public static final int bf = 1;
  public static final int bg = 2;
  public static final int bi = 0;
  public static final int bj = 1;
  public static final int bk = 2;
  public static final int c = 1;
  private static String[] c;
  public static final int d = 2;
  public static final int g = 0;
  public static final int h = 1;
  public static final int i = 2;
  public static final int j = 3;
  public static final long j = 612345L;
  public static final int k = 5;
  public static final int l = 6;
  public static final int m = 7;
  public static final int n = 8;
  public static final int o = 9;
  public static final int p = 16;
  public static final int q = 17;
  public static final int r = 18;
  public static final int s = 19;
  public static final int t = 20;
  public static final int u = 21;
  public static final int v = 22;
  public static final int w = 23;
  public static final int x = 24;
  public static String x = "defaultTag";
  public static final int y = 25;
  public static final int z = 32;
  public static String z = "richfile";
  public String C = "";
  public int M = -1;
  public int N = -1;
  public int a;
  public long a;
  public VerifyCode a;
  public BaseTransProcessor a;
  public FileMsg.StepBaseInfo a;
  public FileMsg.StepTransInfo a;
  public HttpMsg a;
  public File a;
  public InputStream a;
  public OutputStream a;
  public boolean a;
  public byte[] a;
  public int ap;
  public int aq;
  public long b;
  public FileMsg.StepBaseInfo b;
  public FileMsg.StepTransInfo b;
  public String b;
  public boolean b;
  public byte[] b;
  public int bh = -1;
  private int bl = 0;
  public long c;
  public FileMsg.StepBaseInfo c;
  public String c;
  public byte[] c;
  public long d;
  public String d;
  public byte[] d;
  public int e;
  public long e;
  public String e;
  public int f;
  public long f;
  public String f = "";
  public long g;
  public String g = "";
  public long h;
  public String h;
  public long i;
  public String i;
  public String j;
  public long k;
  public String k;
  public String l;
  public String m;
  public String n;
  public String o;
  public String p;
  public String q;
  public String r;
  public String s;
  public String t;
  public String u = "";
  public String v = "";
  public String w = "";
  public String y = x;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { "up", "down", "down" };
    jdField_b_of_type_ArrayOfJavaLangString = new String[] { "file", "pic", "ptt", "video", "map", "thumbpic", "emo", "multimsg" };
    jdField_c_of_type_ArrayOfJavaLangString = new String[] { "LogEventSignalSigFinish", "LogEventSignalUrlFinish", "LogEventRetry", "LogEventFlowUp", "LogEventFlowDown" };
  }
  
  public FileMsg()
  {
    jdField_a_of_type_Int = -1;
    jdField_e_of_type_Int = -1;
    jdField_a_of_type_Boolean = false;
    jdField_c_of_type_JavaLangString = "";
    jdField_e_of_type_JavaLangString = "";
    jdField_a_of_type_JavaIoOutputStream = null;
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransProcessor = null;
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepBaseInfo = new FileMsg.StepBaseInfo();
    jdField_b_of_type_ComTencentMobileqqTransfileFileMsg$StepBaseInfo = new FileMsg.StepBaseInfo();
    jdField_c_of_type_ComTencentMobileqqTransfileFileMsg$StepBaseInfo = new FileMsg.StepBaseInfo();
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo = new FileMsg.StepTransInfo();
    jdField_b_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo = new FileMsg.StepTransInfo();
    jdField_b_of_type_Boolean = false;
    jdField_k_of_type_Long = 0L;
    h = System.currentTimeMillis();
  }
  
  public FileMsg(String paramString1, String paramString2, int paramInt)
  {
    jdField_a_of_type_Int = -1;
    jdField_e_of_type_Int = -1;
    jdField_a_of_type_Boolean = false;
    jdField_c_of_type_JavaLangString = "";
    jdField_e_of_type_JavaLangString = "";
    jdField_a_of_type_JavaIoOutputStream = null;
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransProcessor = null;
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepBaseInfo = new FileMsg.StepBaseInfo();
    jdField_b_of_type_ComTencentMobileqqTransfileFileMsg$StepBaseInfo = new FileMsg.StepBaseInfo();
    jdField_c_of_type_ComTencentMobileqqTransfileFileMsg$StepBaseInfo = new FileMsg.StepBaseInfo();
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo = new FileMsg.StepTransInfo();
    jdField_b_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo = new FileMsg.StepTransInfo();
    jdField_b_of_type_Boolean = false;
    jdField_k_of_type_Long = 0L;
    try
    {
      h = System.currentTimeMillis();
      r = paramString1;
      jdField_a_of_type_Int = paramInt;
      if (paramString2 == null) {
        return;
      }
      if (paramInt == 0)
      {
        jdField_e_of_type_JavaLangString = paramString2;
        jdField_a_of_type_JavaIoFile = new File(jdField_e_of_type_JavaLangString);
        if (jdField_a_of_type_JavaIoFile.exists())
        {
          jdField_a_of_type_Long = jdField_a_of_type_JavaIoFile.length();
          paramInt = paramString2.lastIndexOf(".");
          if ((paramInt >= 0) && (paramInt < paramString2.length())) {
            d = paramString2.substring(paramInt).toLowerCase();
          }
        }
        g(paramString2);
        return;
      }
    }
    catch (Exception paramString1)
    {
      paramString1.printStackTrace();
      return;
    }
    i = paramString2;
  }
  
  public static String a()
  {
    try
    {
      Thread.sleep(10L);
      long l1 = System.currentTimeMillis();
      String str = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date(l1));
      return str;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException.printStackTrace();
      }
    }
    finally {}
  }
  
  private void g(String paramString)
  {
    jdField_a_of_type_JavaIoInputStream = new FileInputStream(paramString);
  }
  
  public InputStream a()
  {
    try
    {
      jdField_a_of_type_JavaIoInputStream = new FileInputStream(jdField_e_of_type_JavaLangString);
      return jdField_a_of_type_JavaIoInputStream;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      for (;;)
      {
        jdField_a_of_type_JavaIoInputStream = null;
      }
    }
  }
  
  public OutputStream a()
  {
    if (jdField_a_of_type_JavaIoOutputStream == null) {}
    try
    {
      if (jdField_e_of_type_Int == 0) {}
      for (jdField_a_of_type_JavaIoOutputStream = new FileOutputStream(jdField_e_of_type_JavaLangString, true);; jdField_a_of_type_JavaIoOutputStream = new FileOutputStream(jdField_e_of_type_JavaLangString)) {
        return jdField_a_of_type_JavaIoOutputStream;
      }
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      for (;;) {}
    }
  }
  
  public String a(String paramString1, String paramString2)
  {
    Object localObject = AppConstants.bd + paramString1 + "/";
    paramString1 = "";
    String str2;
    String str3;
    String str1;
    switch (jdField_e_of_type_Int)
    {
    default: 
      return "";
    case 2: 
      str2 = (String)localObject + "ptt/";
      str3 = ".amr";
      localObject = str3;
      str1 = str2;
      if (paramString2 == null)
      {
        paramString1 = "手机qq语音_" + a();
        str1 = str2;
        localObject = str3;
      }
      break;
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("photo", 2, "getTransferFilePath dir: " + str1);
      }
      paramString2 = new File(str1);
      if (!paramString2.exists()) {
        paramString2.mkdirs();
      }
      return new File(str1 + paramString1 + (String)localObject).getAbsoluteFile().toString();
      str2 = (String)localObject + "photo/";
      str3 = ".jpg";
      localObject = str3;
      str1 = str2;
      if (paramString2 == null)
      {
        paramString1 = a();
        localObject = str3;
        str1 = str2;
      }
    }
  }
  
  public void a()
  {
    try
    {
      if (jdField_a_of_type_JavaIoOutputStream != null) {
        jdField_a_of_type_JavaIoOutputStream.close();
      }
      jdField_a_of_type_JavaIoOutputStream = null;
      return;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("8pic", 2, "exception io FileMsg, " + localIOException.toString());
        }
        localIOException.printStackTrace();
      }
    }
  }
  
  public void a(int paramInt)
  {
    jdField_e_of_type_Int = paramInt;
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    FileMsg.StepTransInfo localStepTransInfo;
    switch (paramInt1)
    {
    default: 
      return;
    case 2: 
      localStepTransInfo = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo;
      b += 1;
      return;
    case 4: 
      localStepTransInfo = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo;
      e += paramInt2;
      return;
    case 3: 
      localStepTransInfo = jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo;
      d += paramInt2;
      return;
    }
    jdField_a_of_type_ComTencentMobileqqTransfileFileMsg$StepTransInfo.c = true;
  }
  
  public void a(long paramLong)
  {
    jdField_c_of_type_Long = paramLong;
  }
  
  public void a(String paramString)
  {
    jdField_k_of_type_JavaLangString = paramString;
  }
  
  public byte[] a(int paramInt1, int paramInt2)
  {
    InputStream localInputStream = jdField_a_of_type_JavaIoInputStream;
    jdField_b_of_type_ArrayOfByte = new byte[paramInt2];
    if (paramInt1 == 0) {}
    for (;;)
    {
      try
      {
        localInputStream = a();
        if (paramInt1 <= bl) {
          continue;
        }
        localInputStream.skip(paramInt1 - bl);
        bl = paramInt1;
        localInputStream.read(jdField_b_of_type_ArrayOfByte, 0, paramInt2);
        bl += paramInt2;
      }
      catch (Exception localException)
      {
        jdField_b_of_type_ArrayOfByte = null;
        continue;
      }
      return jdField_b_of_type_ArrayOfByte;
      if (paramInt1 < bl)
      {
        localInputStream = a();
        localInputStream.skip(paramInt1);
      }
    }
  }
  
  public String b(String paramString1, String paramString2)
  {
    Object localObject = AppConstants.bd + paramString1 + "/";
    paramString1 = "";
    String str2;
    String str3;
    String str1;
    switch (jdField_e_of_type_Int)
    {
    default: 
      return "";
    case 2: 
      str2 = (String)localObject + "ptt/";
      str3 = ".amr";
      localObject = str3;
      str1 = str2;
      if (paramString2 == null)
      {
        paramString1 = "手机qq语音_" + a();
        str1 = str2;
        localObject = str3;
      }
      break;
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("photo", 2, "getTransferFilePath dir: " + str1);
      }
      paramString2 = new File(str1);
      if (!paramString2.exists()) {
        paramString2.mkdirs();
      }
      paramString1 = new File(str1 + paramString1 + (String)localObject);
      if (!paramString1.exists()) {}
      try
      {
        paramString1.createNewFile();
        paramString1 = paramString1.getAbsoluteFile().toString();
        if (QLog.isColorLevel()) {
          QLog.d("photo", 2, "getTransferFilePath : " + paramString1);
        }
        c(paramString1);
        return paramString1;
        str2 = (String)localObject + "photo/";
        str3 = ".jpg";
        localObject = str3;
        str1 = str2;
        if (paramString2 != null) {
          continue;
        }
        paramString1 = a();
        localObject = str3;
        str1 = str2;
      }
      catch (IOException paramString2)
      {
        for (;;)
        {
          paramString2.printStackTrace();
        }
      }
    }
  }
  
  public void b()
  {
    try
    {
      if (jdField_a_of_type_JavaIoInputStream != null) {
        jdField_a_of_type_JavaIoInputStream.close();
      }
      jdField_a_of_type_JavaIoInputStream = null;
      return;
    }
    catch (IOException localIOException)
    {
      for (;;) {}
    }
  }
  
  public void b(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
  }
  
  public void b(String paramString)
  {
    jdField_c_of_type_JavaLangString = paramString;
  }
  
  public void c(int paramInt)
  {
    aq = paramInt;
  }
  
  public void c(String paramString)
  {
    if (paramString == null) {}
    do
    {
      return;
      try
      {
        jdField_e_of_type_JavaLangString = paramString;
        jdField_a_of_type_JavaIoFile = new File(paramString);
        File localFile = jdField_a_of_type_JavaIoFile.getParentFile();
        if ((localFile != null) && (!localFile.exists())) {
          localFile.mkdirs();
        }
        if ((jdField_a_of_type_Int == 0) && (jdField_a_of_type_JavaIoInputStream == null))
        {
          if (jdField_a_of_type_JavaIoFile.exists())
          {
            jdField_a_of_type_Long = jdField_a_of_type_JavaIoFile.length();
            if ((paramString != null) && (paramString.contains("."))) {
              d = paramString.substring(paramString.lastIndexOf(".")).toLowerCase();
            }
          }
          jdField_a_of_type_JavaIoInputStream = new FileInputStream(paramString);
          return;
        }
      }
      catch (FileNotFoundException paramString)
      {
        jdField_e_of_type_JavaLangString = null;
        return;
      }
    } while (jdField_a_of_type_JavaIoOutputStream != null);
    if (jdField_e_of_type_Int == 0)
    {
      jdField_a_of_type_JavaIoOutputStream = new FileOutputStream(paramString, true);
      return;
    }
    jdField_a_of_type_JavaIoOutputStream = new FileOutputStream(paramString);
  }
  
  public void d(String paramString)
  {
    if (paramString == null) {}
    for (;;)
    {
      return;
      try
      {
        if (jdField_a_of_type_JavaIoOutputStream == null) {
          if (jdField_e_of_type_Int == 0)
          {
            jdField_a_of_type_JavaIoOutputStream = new FileOutputStream(paramString, true);
            return;
          }
        }
      }
      catch (FileNotFoundException paramString)
      {
        jdField_e_of_type_JavaLangString = null;
        return;
      }
    }
    jdField_a_of_type_JavaIoOutputStream = new FileOutputStream(paramString);
  }
  
  public void e(String paramString)
  {
    i = paramString;
  }
  
  public void f(String paramString)
  {
    try
    {
      d(FileUtils.a(paramString).getAbsoluteFile().toString());
      return;
    }
    catch (IOException paramString)
    {
      paramString.printStackTrace();
    }
  }
}
