package com.tencent.mobileqq.hitrate;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import mqq.app.AppRuntime;

public class PreloadProcHitSession
{
  public static final boolean a = false;
  public HashMap a;
  public String b;
  protected boolean b;
  public String c;
  public boolean c;
  public String d;
  
  public PreloadProcHitSession(String paramString1, String paramString2)
  {
    this("default", paramString1, paramString2);
  }
  
  protected PreloadProcHitSession(String paramString1, String paramString2, String paramString3)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new HashMap();
    jdField_b_of_type_JavaLangString = paramString1;
    jdField_c_of_type_JavaLangString = paramString2;
    d = paramString3;
    c();
  }
  
  public static boolean a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return false;
    }
    Object localObject = ((ActivityManager)BaseApplicationImpl.getContext().getSystemService("activity")).getRunningAppProcesses();
    if ((localObject == null) || (((List)localObject).size() <= 0)) {
      return false;
    }
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext()) {
      if (paramString.equals(nextprocessName)) {
        return true;
      }
    }
    return false;
  }
  
  protected String a()
  {
    return d + jdField_b_of_type_JavaLangString;
  }
  
  public void a()
  {
    if (jdField_b_of_type_Boolean) {
      d();
    }
    PreloadProcHitMgr.a(this);
    jdField_b_of_type_Boolean = true;
    if (!(this instanceof PreloadProcHitPluginSessionProc)) {
      PreloadProcHitMgr.e(d);
    }
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PreloadProcHitSession", 2, String.format("[%s] [%s] %s", new Object[] { d, jdField_b_of_type_JavaLangString, paramString }));
    }
  }
  
  public void b()
  {
    if (!jdField_b_of_type_Boolean) {}
    do
    {
      return;
      jdField_c_of_type_Boolean = true;
    } while ((this instanceof PreloadProcHitPluginSessionProc));
    PreloadProcHitMgr.d(d);
  }
  
  void c()
  {
    a.put("loss", "0");
    a.put("benefit", "0");
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
  }
  
  public void d()
  {
    if (!jdField_b_of_type_Boolean) {
      return;
    }
    Object localObject = BaseApplicationImpl.a();
    Context localContext;
    String str;
    if (localObject != null)
    {
      localContext = ((BaseApplicationImpl)localObject).getApplicationContext();
      localObject = ((BaseApplicationImpl)localObject).a();
      if (localObject != null)
      {
        localObject = ((AppRuntime)localObject).getAccount();
        str = jdField_c_of_type_JavaLangString;
        if (!jdField_c_of_type_Boolean) {
          break label69;
        }
        StatisticCollector.a(localContext).a((String)localObject, str, true, 0L, 0L, a, null);
      }
    }
    for (;;)
    {
      c();
      return;
      label69:
      StatisticCollector.a(localContext).a((String)localObject, str, false, 0L, 0L, a, null);
    }
  }
}
