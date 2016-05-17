package com.tencent.mobileqq.activity.qwallet;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.support.v4.util.MQLruCache;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.PayBridgeActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.QQWalletMsgItemBuilder;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QWalletHandler;
import com.tencent.mobileqq.app.QWalletObserver;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.utils.TroopTipsMsgMgr;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import mcm;
import mco;
import mcp;
import mcq;
import mcr;
import mcs;
import mct;
import mqq.manager.Manager;
import mqq.os.MqqHandler;
import org.json.JSONObject;
import tencent.im.msg.im_msg_body.QQWalletAioBody;
import tencent.im.msg.im_msg_body.QQWalletAioElem;
import tencent.im.oidb.cmd0x438.oidb_0x438.RedBagInfo;
import tencent.im.oidb.cmd0x438.oidb_0x438.ReqInfo;

public class PasswdRedBagManager
  implements Manager
{
  public static final int a = 0;
  public static final String a;
  public static final int b = 1;
  public static final String b = "sp_passwd_configs";
  public static final int c = 2;
  public static final String c = "key_passwd_configs";
  public static final int d = 3;
  public static final String d = "key_db_update";
  public static final int e = 4;
  public static final int f = 0;
  public static final int g = 1;
  public static final int h = 2;
  public static final int i = 3;
  public Context a;
  Handler jdField_a_of_type_AndroidOsHandler = new mcm(this, Looper.getMainLooper());
  private PasswdRedBagDBManager jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private QWalletHandler jdField_a_of_type_ComTencentMobileqqAppQWalletHandler;
  private QWalletObserver jdField_a_of_type_ComTencentMobileqqAppQWalletObserver = new QWalletObserver(jdField_a_of_type_AndroidOsHandler);
  public HashMap a;
  public List a;
  private boolean jdField_a_of_type_Boolean;
  public HashMap b;
  public List b;
  private boolean b;
  public HashMap c;
  private List c;
  private HashMap d;
  public String e;
  private HashMap e;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = PasswdRedBagManager.class.getSimpleName();
  }
  
  public PasswdRedBagManager(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidContentContext = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication();
    jdField_e_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBManager = new PasswdRedBagDBManager(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppQWalletObserver);
    jdField_a_of_type_ComTencentMobileqqAppQWalletHandler = ((QWalletHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(76));
    jdField_b_of_type_JavaUtilHashMap = new HashMap();
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    jdField_c_of_type_JavaUtilHashMap = new HashMap();
    jdField_c_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_b_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_Boolean = true;
    c();
  }
  
  private void a(PasswdRedBagInfo paramPasswdRedBagInfo)
  {
    String str1 = jdField_a_of_type_JavaLangString;
    String str2 = jdField_c_of_type_JavaLangString;
    jdField_a_of_type_JavaUtilHashMap.put(str1, paramPasswdRedBagInfo);
    Object localObject = (List)jdField_b_of_type_JavaUtilHashMap.get(str2);
    if (localObject == null)
    {
      localObject = new LinkedList();
      jdField_b_of_type_JavaUtilHashMap.put(str2, localObject);
    }
    for (;;)
    {
      int k = ((List)localObject).size();
      int j = 0;
      if (j < k) {
        if (jdField_a_of_type_JavaUtilHashMap.get(((List)localObject).get(j))).jdField_a_of_type_Long >= jdField_a_of_type_Long) {}
      }
      for (;;)
      {
        ((List)localObject).add(j, str1);
        return;
        j += 1;
        break;
        j = 0;
      }
    }
  }
  
  public int a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return 0;
    case 1: 
      return 1;
    case 0: 
    case 1000: 
    case 1001: 
    case 1004: 
      return 3;
    }
    return 2;
  }
  
  public Bitmap a()
  {
    Object localObject1 = null;
    if (BaseApplicationImpl.a != null) {}
    for (Bitmap localBitmap = (Bitmap)BaseApplicationImpl.a.get("StatusIcon_HongBaoIcon");; localBitmap = null)
    {
      if (localBitmap == null) {
        for (;;)
        {
          try
          {
            Object localObject2 = BitmapFactory.decodeResource(jdField_a_of_type_AndroidContentContext.getResources(), 2130841221);
            localObject1 = localObject2;
            localObject2 = localObject1;
            if (localObject1 != null) {}
            localException1.printStackTrace();
          }
          catch (Exception localException1)
          {
            try
            {
              localObject2 = Bitmap.createScaledBitmap(localObject1, DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 20.0F), DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 20.0F), true);
              if (localObject2 == null) {
                break;
              }
              if (BaseApplicationImpl.a != null) {
                BaseApplicationImpl.a.put("StatusIcon_HongBaoIcon", localObject2);
              }
              return localObject2;
            }
            catch (Exception localException2)
            {
              Object localObject3;
              for (;;) {}
            }
            localException1 = localException1;
          }
          localObject3 = localObject1;
        }
      }
      return localBitmap;
    }
  }
  
  public PasswdRedBagInfo a(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    c();
    return (PasswdRedBagInfo)jdField_a_of_type_JavaUtilHashMap.get(paramString);
  }
  
  public String a()
  {
    e();
    if (jdField_c_of_type_JavaUtilList.size() == 0) {
      return null;
    }
    int j = new Random(System.currentTimeMillis()).nextInt(jdField_c_of_type_JavaUtilList.size());
    return (String)jdField_c_of_type_JavaUtilList.get(j);
  }
  
  public void a()
  {
    if ((d == null) || (d.size() == 0)) {}
    ArrayList localArrayList;
    do
    {
      return;
      jdField_a_of_type_JavaUtilList.clear();
      localArrayList = new ArrayList();
      List localList = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBManager.a(1);
      Iterator localIterator = d.keySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (String)localIterator.next();
        PasswdRedBagUpdateInfo localPasswdRedBagUpdateInfo = new PasswdRedBagUpdateInfo();
        jdField_a_of_type_Long = Long.parseLong((String)localObject);
        jdField_a_of_type_Int = 1;
        b = Long.parseLong((String)d.get(localObject));
        int j = localList.indexOf(localPasswdRedBagUpdateInfo);
        if (j != -1)
        {
          localObject = (PasswdRedBagUpdateInfo)localList.get(j);
          if (b <= b) {}
        }
        else
        {
          localObject = new oidb_0x438.ReqInfo();
          uint64_code.set(jdField_a_of_type_Long);
          uint64_last_redbag_time.set(b);
          localArrayList.add(localObject);
          jdField_a_of_type_JavaUtilList.add(localPasswdRedBagUpdateInfo);
        }
      }
      d.clear();
    } while (jdField_a_of_type_JavaUtilList.isEmpty());
    jdField_a_of_type_ComTencentMobileqqAppQWalletHandler.a(0, localArrayList);
  }
  
  public void a(SessionInfo paramSessionInfo, PasswdRedBagInfo paramPasswdRedBagInfo, long paramLong)
  {
    if ((paramSessionInfo == null) || (paramPasswdRedBagInfo == null)) {}
    String str;
    do
    {
      return;
      str = (String)jdField_c_of_type_JavaUtilHashMap.get(a(jdField_a_of_type_Int) + "_" + jdField_a_of_type_JavaLangString + "_" + jdField_a_of_type_JavaLangString);
    } while (TextUtils.isEmpty(str));
    int j;
    Object localObject2;
    if ((jdField_a_of_type_Int == 0) || (jdField_a_of_type_Int == 2) || (jdField_a_of_type_Int == 1004) || (jdField_a_of_type_Int == 1001))
    {
      j = 1;
      localObject1 = jdField_a_of_type_JavaLangString;
      localObject2 = String.valueOf(jdField_b_of_type_JavaLangString);
      if (j != 0) {
        if (!((String)localObject2).equals(jdField_e_of_type_JavaLangString)) {
          break label389;
        }
      }
    }
    label389:
    for (Object localObject1 = jdField_a_of_type_JavaLangString;; localObject1 = jdField_e_of_type_JavaLangString)
    {
      localObject2 = QQWalletMsgItemBuilder.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramSessionInfo);
      j = ((Bundle)localObject2).getInt("groupType");
      localObject2 = ((Bundle)localObject2).getString("name");
      paramPasswdRedBagInfo = jdField_a_of_type_JavaLangString;
      paramSessionInfo = QQWalletMsgItemBuilder.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramSessionInfo, j, (String)localObject2, paramPasswdRedBagInfo, str, (String)localObject1, "appid#1344242394|bargainor_id#1000030201|channel#msg", "graphb", null);
      localObject1 = new Bundle();
      ((Bundle)localObject1).putString("json", paramSessionInfo.toString());
      ((Bundle)localObject1).putString("callbackSn", "0");
      paramSessionInfo = paramPasswdRedBagInfo;
      if (paramPasswdRedBagInfo != null)
      {
        paramSessionInfo = paramPasswdRedBagInfo;
        if (paramPasswdRedBagInfo.length() > 4) {
          paramSessionInfo = "****" + paramPasswdRedBagInfo.substring(4);
        }
      }
      VACDReportUtil.a(paramLong, null, "open", "groupType=" + j + "&msgType=6&redId=" + paramSessionInfo, 0, null);
      ((Bundle)localObject1).putLong("vacreport_key_seq", paramLong);
      paramSessionInfo = new Intent(jdField_a_of_type_AndroidContentContext, PayBridgeActivity.class);
      paramSessionInfo.putExtras((Bundle)localObject1);
      paramSessionInfo.addFlags(268435456);
      paramSessionInfo.putExtra("pay_requestcode", 5);
      jdField_a_of_type_AndroidContentContext.startActivity(paramSessionInfo);
      return;
      j = 0;
      break;
    }
  }
  
  public void a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    PasswdRedBagInfo localPasswdRedBagInfo;
    do
    {
      return;
      c();
      localPasswdRedBagInfo = (PasswdRedBagInfo)jdField_a_of_type_JavaUtilHashMap.get(paramString);
    } while ((localPasswdRedBagInfo == null) || (jdField_b_of_type_Boolean));
    jdField_b_of_type_Boolean = true;
    ThreadManager.a().post(new mcr(this, paramString));
  }
  
  public void a(String paramString1, String paramString2, String paramString3, long paramLong, String paramString4, String paramString5, String paramString6, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((PasswdRedBagInfo)jdField_a_of_type_JavaUtilHashMap.get(paramString1) == null)
    {
      paramString2 = new PasswdRedBagInfo(paramString1, paramString3, paramLong, paramString2, paramBoolean1, paramBoolean2, false);
      a(paramString2);
      ThreadManager.a().post(new mcp(this, paramString2));
    }
    paramString2 = new StringBuilder();
    paramString2.append(paramString4);
    paramString2.append("_");
    paramString2.append(paramString5);
    paramString2.append("_");
    paramString2.append(paramString1);
    if (TextUtils.isEmpty((String)jdField_c_of_type_JavaUtilHashMap.get(paramString2.toString())))
    {
      jdField_c_of_type_JavaUtilHashMap.put(paramString2.toString(), paramString6);
      ThreadManager.a().post(new mcq(this, paramString4, paramString5, paramString1, paramString6));
    }
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    if (paramBoolean) {}
    for (String str = "0";; str = "1")
    {
      ReportController.b(localQQAppInterface, "CliOper", "", "", "0X8006115", "0X8006115", 0, 0, "", str, paramString, "0");
      return;
    }
  }
  
  public void a(HashMap paramHashMap)
  {
    if (d == null) {
      d = new HashMap();
    }
    d.putAll(paramHashMap);
  }
  
  public void a(HashSet paramHashSet)
  {
    jdField_c_of_type_JavaUtilList.clear();
    jdField_c_of_type_JavaUtilList.addAll(paramHashSet);
    a(paramHashSet);
  }
  
  public void a(Set paramSet)
  {
    try
    {
      SharedPreferences.Editor localEditor = jdField_a_of_type_AndroidContentContext.getSharedPreferences("sp_passwd_configs_" + jdField_e_of_type_JavaLangString, 0).edit();
      if (Build.VERSION.SDK_INT >= 11) {
        localEditor.putStringSet("key_passwd_configs", paramSet);
      }
      for (;;)
      {
        localEditor.commit();
        return;
        localEditor.putInt("key_passwd_configs_count", paramSet.size());
        paramSet = paramSet.iterator();
        int j = 0;
        while (paramSet.hasNext())
        {
          String str = (String)paramSet.next();
          localEditor.putString("key_passwd_configs_" + j, str);
          j += 1;
        }
      }
      return;
    }
    catch (Throwable paramSet)
    {
      paramSet.printStackTrace();
    }
  }
  
  public void a(im_msg_body.QQWalletAioBody paramQQWalletAioBody, int paramInt, long paramLong1, long paramLong2, long paramLong3)
  {
    a(bytes_billno.get().toStringUtf8(), receiver.bytes_title.get().toStringUtf8(), String.valueOf(paramLong2), 90000L + paramLong3, String.valueOf(paramInt), String.valueOf(paramLong1), bytes_authkey.get().toStringUtf8(), false, false);
  }
  
  public void a(oidb_0x438.RedBagInfo paramRedBagInfo)
  {
    a(string_redbag_id.get().toStringUtf8(), string_password.get().toStringUtf8(), String.valueOf(uint64_creator_uin.get()), uint64_expire_time.get(), String.valueOf(uint32_source.get()), String.valueOf(uint64_code.get()), string_authkey.get().toStringUtf8(), false, false);
  }
  
  public boolean a()
  {
    return !jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(jdField_e_of_type_JavaLangString);
  }
  
  public long[] a(SessionInfo paramSessionInfo, String paramString)
  {
    long[] arrayOfLong = new long[2];
    long[] tmp7_5 = arrayOfLong;
    tmp7_5[0] = 0L;
    long[] tmp11_7 = tmp7_5;
    tmp11_7[1] = 0L;
    tmp11_7;
    if (paramSessionInfo == null) {
      return arrayOfLong;
    }
    if (TextUtils.isEmpty(paramString)) {
      return arrayOfLong;
    }
    if (QLog.isColorLevel())
    {
      localObject = new StringBuilder();
      ((StringBuilder)localObject).append(paramString.charAt(0));
      ((StringBuilder)localObject).append("|");
      ((StringBuilder)localObject).append(paramString.length());
      QLog.d(jdField_a_of_type_JavaLangString, 2, "openPasswdRedBagByPassword, passwd = " + ((StringBuilder)localObject).toString());
    }
    long l = SystemClock.uptimeMillis();
    c();
    paramString = (List)jdField_b_of_type_JavaUtilHashMap.get(paramString);
    if ((paramString == null) || (paramString.isEmpty())) {
      return arrayOfLong;
    }
    Object localObject = a(jdField_a_of_type_Int) + "_" + jdField_a_of_type_JavaLangString + "_";
    Iterator localIterator = paramString.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      paramString = (String)localObject + str;
      if (jdField_c_of_type_JavaUtilHashMap.containsKey(paramString))
      {
        paramString = (PasswdRedBagInfo)jdField_a_of_type_JavaUtilHashMap.get(str);
        if ((paramString != null) && (!jdField_a_of_type_Boolean))
        {
          arrayOfLong[1] = Long.valueOf(jdField_b_of_type_JavaLangString).longValue();
          if (jdField_b_of_type_Boolean)
          {
            arrayOfLong[0] = 2L;
          }
          else if ((jdField_c_of_type_Boolean) || (jdField_a_of_type_Long < NetConnInfoCenter.getServerTimeMillis() / 1000L))
          {
            if (!jdField_c_of_type_Boolean) {
              b(str);
            }
            arrayOfLong[0] = 3L;
          }
          else
          {
            jdField_a_of_type_Boolean = true;
            arrayOfLong[0] = 1L;
          }
        }
      }
    }
    for (;;)
    {
      if (paramString == null) {
        return arrayOfLong;
      }
      l = VACDReportUtil.a(null, "qqwallet", "graphb", "pwd.sendByPwd", "msgType=6", 0, null, l);
      c(jdField_a_of_type_JavaLangString);
      a(paramSessionInfo, paramString, l);
      return arrayOfLong;
      paramString = null;
    }
  }
  
  public void b()
  {
    if ((jdField_e_of_type_JavaUtilHashMap == null) || (jdField_e_of_type_JavaUtilHashMap.size() == 0)) {}
    ArrayList localArrayList;
    do
    {
      return;
      jdField_b_of_type_JavaUtilList.clear();
      localArrayList = new ArrayList();
      List localList = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBManager.a(2);
      Iterator localIterator = jdField_e_of_type_JavaUtilHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject = (String)localIterator.next();
        PasswdRedBagUpdateInfo localPasswdRedBagUpdateInfo = new PasswdRedBagUpdateInfo();
        jdField_a_of_type_Long = Long.parseLong((String)localObject);
        jdField_a_of_type_Int = 2;
        b = Long.parseLong((String)jdField_e_of_type_JavaUtilHashMap.get(localObject));
        int j = localList.indexOf(localPasswdRedBagUpdateInfo);
        if (j != -1)
        {
          localObject = (PasswdRedBagUpdateInfo)localList.get(j);
          if (b <= b) {}
        }
        else
        {
          localObject = new oidb_0x438.ReqInfo();
          uint64_code.set(jdField_a_of_type_Long);
          uint64_last_redbag_time.set(b);
          localArrayList.add(localObject);
          jdField_b_of_type_JavaUtilList.add(localPasswdRedBagUpdateInfo);
        }
      }
      jdField_e_of_type_JavaUtilHashMap.clear();
    } while (jdField_b_of_type_JavaUtilList.isEmpty());
    jdField_a_of_type_ComTencentMobileqqAppQWalletHandler.a(1, localArrayList);
  }
  
  public void b(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    PasswdRedBagInfo localPasswdRedBagInfo;
    do
    {
      return;
      c();
      localPasswdRedBagInfo = (PasswdRedBagInfo)jdField_a_of_type_JavaUtilHashMap.get(paramString);
    } while ((localPasswdRedBagInfo == null) || (jdField_c_of_type_Boolean));
    jdField_c_of_type_Boolean = true;
    ThreadManager.a().post(new mcs(this, paramString));
  }
  
  public void b(HashMap paramHashMap)
  {
    if (jdField_e_of_type_JavaUtilHashMap == null) {
      jdField_e_of_type_JavaUtilHashMap = new HashMap();
    }
    jdField_e_of_type_JavaUtilHashMap.putAll(paramHashMap);
  }
  
  public long[] b(SessionInfo paramSessionInfo, String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "openPasswdRedBagById, id = " + paramString);
    }
    long[] arrayOfLong = new long[2];
    long[] tmp40_38 = arrayOfLong;
    tmp40_38[0] = 0L;
    long[] tmp44_40 = tmp40_38;
    tmp44_40[1] = 0L;
    tmp44_40;
    if (paramSessionInfo == null) {
      return arrayOfLong;
    }
    if (TextUtils.isEmpty(paramString)) {
      return arrayOfLong;
    }
    long l = VACDReportUtil.a(null, "qqwallet", "graphb", "pwd.sendById", "msgType=6", 0, null);
    c();
    PasswdRedBagInfo localPasswdRedBagInfo = (PasswdRedBagInfo)jdField_a_of_type_JavaUtilHashMap.get(paramString);
    if (localPasswdRedBagInfo == null)
    {
      VACDReportUtil.a(l, "pwd.end", "", -1, "no redid");
      return arrayOfLong;
    }
    arrayOfLong[1] = Long.valueOf(jdField_b_of_type_JavaLangString).longValue();
    if (jdField_a_of_type_Boolean)
    {
      VACDReportUtil.a(l, "pwd.end", "", -1, "opened");
      return arrayOfLong;
    }
    if (jdField_b_of_type_Boolean)
    {
      arrayOfLong[0] = 2L;
      VACDReportUtil.a(l, "pwd.end", "", -1, "finish");
      return arrayOfLong;
    }
    if ((jdField_c_of_type_Boolean) || (jdField_a_of_type_Long < NetConnInfoCenter.getServerTimeMillis() / 1000L))
    {
      if (!jdField_c_of_type_Boolean) {
        b(paramString);
      }
      arrayOfLong[0] = 3L;
      VACDReportUtil.a(l, "pwd.end", "", -1, "overdue");
      return arrayOfLong;
    }
    c(paramString);
    a(paramSessionInfo, localPasswdRedBagInfo, l);
    arrayOfLong[0] = 1L;
    return arrayOfLong;
  }
  
  public void c()
  {
    for (;;)
    {
      try
      {
        if (a()) {
          d();
        }
        boolean bool = jdField_a_of_type_Boolean;
        if (!bool) {
          return;
        }
        Object localObject1 = jdField_a_of_type_AndroidContentContext.getSharedPreferences("sp_passwd_configs_" + jdField_e_of_type_JavaLangString, 0);
        if (((SharedPreferences)localObject1).getBoolean("key_db_update", true))
        {
          ThreadManager.a().post(new mco(this));
          ((SharedPreferences)localObject1).edit().putBoolean("key_db_update", false);
          ((SharedPreferences)localObject1).edit().commit();
        }
        jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBManager.b();
        Object localObject3 = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBManager.a();
        localObject1 = jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBManager.a();
        localObject3 = ((HashMap)localObject3).entrySet().iterator();
        if (((Iterator)localObject3).hasNext())
        {
          Map.Entry localEntry = (Map.Entry)((Iterator)localObject3).next();
          jdField_c_of_type_JavaUtilHashMap.put(localEntry.getKey(), localEntry.getValue());
          continue;
        }
        localIterator = localObject2.iterator();
      }
      finally {}
      Iterator localIterator;
      while (localIterator.hasNext()) {
        a((PasswdRedBagInfo)localIterator.next());
      }
      jdField_a_of_type_Boolean = false;
    }
  }
  
  public void c(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    PasswdRedBagInfo localPasswdRedBagInfo;
    do
    {
      return;
      c();
      localPasswdRedBagInfo = (PasswdRedBagInfo)jdField_a_of_type_JavaUtilHashMap.get(paramString);
    } while ((localPasswdRedBagInfo == null) || (jdField_a_of_type_Boolean));
    jdField_a_of_type_Boolean = true;
    ThreadManager.a().post(new mct(this, paramString));
  }
  
  public void d()
  {
    jdField_e_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBManager = new PasswdRedBagDBManager(this);
    jdField_b_of_type_JavaUtilHashMap.clear();
    jdField_c_of_type_JavaUtilHashMap.clear();
    jdField_a_of_type_JavaUtilHashMap.clear();
    jdField_c_of_type_JavaUtilList.clear();
    jdField_a_of_type_Boolean = true;
  }
  
  public void d(String paramString)
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8006116", "0X8006116", 0, 0, "", "0", paramString, "0");
  }
  
  public void e()
  {
    int j = 0;
    if (jdField_b_of_type_Boolean) {
      return;
    }
    for (;;)
    {
      try
      {
        localObject = jdField_a_of_type_AndroidContentContext.getSharedPreferences("sp_passwd_configs_" + jdField_e_of_type_JavaLangString, 0);
        if (Build.VERSION.SDK_INT < 11) {
          continue;
        }
        localObject = ((SharedPreferences)localObject).getStringSet("key_passwd_configs", new HashSet());
        if ((localObject != null) && (((Set)localObject).size() > 0)) {
          jdField_c_of_type_JavaUtilList.addAll((Collection)localObject);
        }
      }
      catch (Throwable localThrowable)
      {
        Object localObject;
        int k;
        localThrowable.printStackTrace();
        continue;
      }
      jdField_b_of_type_Boolean = true;
      return;
      k = ((SharedPreferences)localObject).getInt("key_passwd_configs_count", 0);
      if (k > 0) {
        if (j < k)
        {
          jdField_c_of_type_JavaUtilList.add(((SharedPreferences)localObject).getString("key_passwd_configs_" + j, ""));
          j += 1;
        }
      }
    }
  }
  
  public void e(String paramString)
  {
    ((TroopTipsMsgMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(80)).a(paramString, "匿名不能抢口令红包哦", NetConnInfoCenter.getServerTime(), 10000L, 0);
  }
  
  public void onDestroy()
  {
    jdField_a_of_type_ComTencentMobileqqAppQWalletObserver.a();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppQWalletObserver);
    jdField_a_of_type_ComTencentMobileqqActivityQwalletPasswdRedBagDBManager.a();
  }
}
