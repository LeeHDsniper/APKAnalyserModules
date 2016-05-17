package com.tencent.mobileqq.msf.core.net.b;

import android.text.TextUtils;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.qphone.base.util.QLog;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

public class b
  extends a
{
  private static final String g = "HttpEchoTask";
  private String h;
  private URL i;
  private String j;
  private int k = 10000;
  private HttpURLConnection l;
  private int m;
  private String n;
  
  public b(int paramInt1, String paramString1, String paramString2, int paramInt2, a.a paramA)
  {
    super(paramInt1, paramA);
    h = (paramString1 + b(paramString1));
    h = MsfSdkUtils.insertMtype("netdetect", h);
    j = paramString2;
    k = paramInt2;
  }
  
  private String b(String paramString)
  {
    Object localObject = new Random(System.currentTimeMillis());
    localObject = "r=" + String.valueOf(((Random)localObject).nextInt(100000));
    if (paramString.contains("?"))
    {
      if (paramString.endsWith("?")) {
        return paramString + (String)localObject;
      }
      return (String)localObject + "&" + (String)localObject;
    }
    return "?" + (String)localObject;
  }
  
  protected int a(String paramString)
  {
    if ((m == 200) && (i.getHost().equals(n)) && (!TextUtils.isEmpty(paramString)) && (paramString.equals(j)))
    {
      if (QLog.isColorLevel()) {
        QLog.d("HttpEchoTask", 2, "WIFI detect, HttpEchoTask " + e + " valid succ");
      }
      return 0;
    }
    if (QLog.isColorLevel()) {
      QLog.d("HttpEchoTask", 2, "WIFI detect, HttpEchoTask " + e + " valid failed.");
    }
    return -3;
  }
  
  protected boolean a()
  {
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d("HttpEchoTask", 2, "WIFI detect, HttpEchoTask " + e + " try connect " + h);
      }
      i = new URL(h);
      l = ((HttpURLConnection)i.openConnection());
      l.setDoOutput(true);
      l.setDoInput(true);
      l.setUseCaches(false);
      l.setRequestMethod("GET");
      l.setConnectTimeout(k);
      l.setReadTimeout(10000);
      l.connect();
      if (QLog.isColorLevel()) {
        QLog.d("HttpEchoTask", 2, "WIFI detect, HttpEchoTask " + e + " connect " + h + " succ.");
      }
      return true;
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
      if (QLog.isColorLevel()) {
        QLog.d("HttpEchoTask", 2, "WIFI detect, HttpEchoTask " + e + " connect " + h + " failed.");
      }
      if (l != null) {
        l.disconnect();
      }
    }
    return false;
  }
  
  protected void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("HttpEchoTask", 2, "WIFI detect, HttpEchoTask " + e + " disconnect " + h);
    }
    if (l != null) {
      l.disconnect();
    }
  }
  
  protected String c()
  {
    try
    {
      m = l.getResponseCode();
      n = l.getURL().getHost();
      Object localObject1 = new BufferedReader(new InputStreamReader(l.getInputStream()));
      Object localObject2;
      for (String str = "";; str = str + (String)localObject2)
      {
        localObject2 = ((BufferedReader)localObject1).readLine();
        if (localObject2 == null) {
          break;
        }
      }
      ((BufferedReader)localObject1).close();
      if (QLog.isColorLevel())
      {
        localObject2 = new StringBuilder().append("WIFI detect, HttpEchoTask ").append(e).append(" echo content: ");
        if (str.length() <= 10) {
          break label149;
        }
      }
      label149:
      for (localObject1 = str.substring(0, 10);; localObject1 = str)
      {
        QLog.d("HttpEchoTask", 2, (String)localObject1);
        return str;
      }
      return null;
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
      if (QLog.isColorLevel()) {
        QLog.d("HttpEchoTask", 2, "WIFI detect, HttpEchoTask " + e + " echo failed");
      }
    }
  }
  
  protected Object d()
  {
    return h;
  }
}
