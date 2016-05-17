package com.tencent.mobileqq.filemanager.core;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mqq.manager.ProxyIpManager;
import mqq.manager.ProxyIpManager.ProxyIp;

public class HttpUrlProcessor
{
  private static final String jdField_a_of_type_JavaLangString = "HttpUrlProcessor";
  private Iterator jdField_a_of_type_JavaUtilIterator;
  private List jdField_a_of_type_JavaUtilList;
  private ProxyIpManager.ProxyIp jdField_a_of_type_MqqManagerProxyIpManager$ProxyIp;
  private boolean jdField_a_of_type_Boolean;
  private String jdField_b_of_type_JavaLangString;
  private Iterator jdField_b_of_type_JavaUtilIterator;
  private List jdField_b_of_type_JavaUtilList;
  
  public HttpUrlProcessor(QQAppInterface paramQQAppInterface, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    int i = paramString.indexOf("://");
    int j;
    if (i == -1)
    {
      i = 0;
      j = paramString.substring(i).indexOf("/") + i;
      if ((-1 != j) || (-1 != j)) {
        break label121;
      }
      paramString = null;
    }
    for (;;)
    {
      if ((localObject != null) && (paramString != null))
      {
        jdField_a_of_type_JavaUtilList = new ArrayList(1);
        jdField_a_of_type_JavaUtilList.add(localObject);
        jdField_a_of_type_JavaUtilIterator = jdField_a_of_type_JavaUtilList.iterator();
        jdField_b_of_type_JavaLangString = paramString;
      }
      a(paramQQAppInterface);
      return;
      i += 3;
      break;
      label121:
      int k = paramString.indexOf("&bHost=");
      if (-1 == k) {
        localObject = str;
      }
      for (;;)
      {
        if (localObject != null) {
          break label243;
        }
        localObject = paramString.substring(i, j);
        paramString = paramString.substring(j);
        break;
        int m = paramString.indexOf("&bPort=", k);
        localObject = str;
        if (-1 != m)
        {
          localObject = paramString.substring("&bHost=".length() + k, m);
          str = paramString.substring(m + "&bPort=".length());
          localObject = (String)localObject + ":" + str;
        }
      }
      label243:
      paramString = paramString.substring(j, k);
    }
  }
  
  public HttpUrlProcessor(QQAppInterface paramQQAppInterface, List paramList, String paramString)
  {
    jdField_a_of_type_JavaUtilList = paramList;
    jdField_b_of_type_JavaLangString = paramString;
    if (jdField_a_of_type_JavaUtilList != null) {
      jdField_a_of_type_JavaUtilIterator = jdField_a_of_type_JavaUtilList.iterator();
    }
    a(paramQQAppInterface);
  }
  
  private void a(QQAppInterface paramQQAppInterface)
  {
    jdField_b_of_type_JavaUtilList = ((ProxyIpManager)paramQQAppInterface.getManager(3)).getProxyIp(5);
    if (jdField_b_of_type_JavaUtilList == null)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("HttpUrlProcessor", 4, "HttpUrlProcessor: getProxyIp return null, so new empty ProxyList");
      }
      jdField_b_of_type_JavaUtilList = new ArrayList();
    }
    a();
  }
  
  public String a()
  {
    String str1 = null;
    String str2;
    if ((jdField_a_of_type_JavaUtilList == null) || (jdField_a_of_type_JavaUtilList.size() == 0))
    {
      str2 = str1;
      if (QLog.isDevelopLevel())
      {
        QLog.d("HttpUrlProcessor", 4, "getNextUrl: no host, so return null");
        str2 = str1;
      }
      return str2;
    }
    if (!jdField_a_of_type_JavaUtilIterator.hasNext())
    {
      if (jdField_b_of_type_JavaUtilIterator.hasNext())
      {
        jdField_a_of_type_MqqManagerProxyIpManager$ProxyIp = ((ProxyIpManager.ProxyIp)jdField_b_of_type_JavaUtilIterator.next());
        jdField_a_of_type_JavaUtilIterator = jdField_a_of_type_JavaUtilList.iterator();
      }
    }
    else
    {
      label94:
      str1 = (String)jdField_a_of_type_JavaUtilIterator.next();
      if (!jdField_a_of_type_Boolean) {
        break label295;
      }
      int i = str1.indexOf(":");
      if (i <= 0) {
        break label287;
      }
      str2 = str1.substring(0, i);
      str1 = str1.substring(i + 1);
    }
    label140:
    label287:
    label295:
    for (str1 = "http://" + jdField_a_of_type_MqqManagerProxyIpManager$ProxyIp.ip + ":" + jdField_a_of_type_MqqManagerProxyIpManager$ProxyIp.port + jdField_b_of_type_JavaLangString + "&bHost=" + str2 + "&bPort=" + str1;; str1 = "http://" + str1 + jdField_b_of_type_JavaLangString)
    {
      str2 = str1;
      if (!QLog.isDevelopLevel()) {
        break;
      }
      QLog.d("HttpUrlProcessor", 4, "getNextUrl: url:" + str1);
      return str1;
      if (jdField_a_of_type_Boolean)
      {
        jdField_a_of_type_Boolean = false;
        jdField_a_of_type_JavaUtilIterator = jdField_a_of_type_JavaUtilList.iterator();
        break label94;
      }
      str2 = str1;
      if (!QLog.isDevelopLevel()) {
        break;
      }
      QLog.d("HttpUrlProcessor", 4, "getNextUrl: no proxy no host, so return null");
      return null;
      str2 = str1;
      str1 = "80";
      break label140;
    }
  }
  
  public void a()
  {
    jdField_b_of_type_JavaUtilIterator = jdField_b_of_type_JavaUtilList.iterator();
    if (jdField_b_of_type_JavaUtilIterator.hasNext()) {
      jdField_a_of_type_MqqManagerProxyIpManager$ProxyIp = ((ProxyIpManager.ProxyIp)jdField_b_of_type_JavaUtilIterator.next());
    }
    for (jdField_a_of_type_Boolean = true;; jdField_a_of_type_Boolean = false)
    {
      if (jdField_a_of_type_JavaUtilList != null) {
        jdField_a_of_type_JavaUtilIterator = jdField_a_of_type_JavaUtilList.iterator();
      }
      return;
    }
  }
}
