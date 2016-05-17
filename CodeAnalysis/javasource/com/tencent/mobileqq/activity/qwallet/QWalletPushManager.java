package com.tencent.mobileqq.activity.qwallet;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.os.Vibrator;
import android.text.TextUtils;
import com.tencent.av.utils.PhoneStatusTools;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.PayBridgeActivity;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.gesturelock.GesturePWDUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.theme.ThemeUtil;
import com.tencent.mobileqq.util.NoDisturbUtil;
import com.tencent.mobileqq.utils.AudioUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.QQUtils;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qwallet.plugin.QWalletHelper;
import cooperation.qwallet.plugin.QWalletLockScreenActivity;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mde;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;
import org.json.JSONException;
import org.json.JSONObject;
import tencent.im.s2c.msgtype0x210.submsgtype0x66.submsgtype0x66.MsgBody;

public class QWalletPushManager
{
  private static final int jdField_a_of_type_Int = 1;
  public static long a = 0L;
  private static ArrayList jdField_a_of_type_JavaUtilArrayList;
  private static final long[] jdField_a_of_type_ArrayOfLong = { 100L, 200L, 200L, 100L };
  private static final int jdField_b_of_type_Int = 2;
  private static long jdField_b_of_type_Long = 0L;
  private static ArrayList jdField_b_of_type_JavaUtilArrayList;
  private static final int c = 3;
  private static final int d = 4;
  private static final int e = 5;
  private static final int f = 6;
  private static final int g = 7;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_b_of_type_JavaUtilArrayList = new ArrayList();
  }
  
  public QWalletPushManager() {}
  
  public static int a()
  {
    if (jdField_a_of_type_JavaUtilArrayList == null) {
      return 0;
    }
    int i = 0;
    int k;
    for (int j = 0; i < jdField_a_of_type_JavaUtilArrayList.size(); j = k)
    {
      QWalletPushManager.PCPayData localPCPayData = (QWalletPushManager.PCPayData)jdField_a_of_type_JavaUtilArrayList.get(i);
      k = j;
      if (localPCPayData != null)
      {
        k = j;
        if (f == 0) {
          k = j + 1;
        }
      }
      i += 1;
    }
    return j;
  }
  
  public static int a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return 0;
    case 1: 
      return 9;
    case 2: 
      return 4;
    case 3: 
      return 11;
    case 4: 
      return 8;
    case 5: 
      return 7;
    case 6: 
      return 6;
    }
    return 14;
  }
  
  private static QWalletPushManager.PCPayData a()
  {
    Object localObject;
    if (jdField_a_of_type_JavaUtilArrayList == null)
    {
      localObject = null;
      return localObject;
    }
    int i = 0;
    for (;;)
    {
      if (i >= jdField_a_of_type_JavaUtilArrayList.size()) {
        break label54;
      }
      QWalletPushManager.PCPayData localPCPayData = (QWalletPushManager.PCPayData)jdField_a_of_type_JavaUtilArrayList.get(i);
      if (localPCPayData != null)
      {
        localObject = localPCPayData;
        if (f == 1) {
          break;
        }
      }
      i += 1;
    }
    label54:
    return null;
  }
  
  public static QWalletPushManager.PCPayData a(boolean paramBoolean)
  {
    Object localObject;
    if (jdField_a_of_type_JavaUtilArrayList == null)
    {
      localObject = null;
      return localObject;
    }
    QWalletPushManager.PCPayData localPCPayData;
    if (paramBoolean)
    {
      i = jdField_a_of_type_JavaUtilArrayList.size() - 1;
      for (;;)
      {
        if (i < 0) {
          break label101;
        }
        localPCPayData = (QWalletPushManager.PCPayData)jdField_a_of_type_JavaUtilArrayList.get(i);
        if (localPCPayData != null)
        {
          localObject = localPCPayData;
          if (f == 0) {
            break;
          }
        }
        i -= 1;
      }
    }
    int i = 0;
    for (;;)
    {
      if (i >= jdField_a_of_type_JavaUtilArrayList.size()) {
        break label101;
      }
      localPCPayData = (QWalletPushManager.PCPayData)jdField_a_of_type_JavaUtilArrayList.get(i);
      if (localPCPayData != null)
      {
        localObject = localPCPayData;
        if (f == 0) {
          break;
        }
      }
      i += 1;
    }
    label101:
    return null;
  }
  
  public static void a()
  {
    if (jdField_a_of_type_JavaUtilArrayList == null) {}
    for (;;)
    {
      return;
      int i = jdField_a_of_type_JavaUtilArrayList.size() - 1;
      while (i >= 0)
      {
        QWalletPushManager.PCPayData localPCPayData = (QWalletPushManager.PCPayData)jdField_a_of_type_JavaUtilArrayList.get(i);
        if ((localPCPayData == null) || (f == 1)) {
          jdField_a_of_type_JavaUtilArrayList.remove(i);
        }
        i -= 1;
      }
    }
  }
  
  private static void a(QQAppInterface paramQQAppInterface, QWalletPushManager.PCPayData paramPCPayData)
  {
    String str1;
    boolean bool1;
    if (QQUtils.a(paramQQAppInterface.a()))
    {
      ((PowerManager)paramQQAppInterface.a().getSystemService("power")).newWakeLock(268435462, "Q.qwallet.push").acquire(10000L);
      String str2 = String.format(BaseApplication.getContext().getString(2131366341), new Object[] { Integer.valueOf(a()) });
      if (!TextUtils.isEmpty(jdField_c_of_type_JavaLangString))
      {
        str1 = jdField_c_of_type_JavaLangString;
        Intent localIntent = new Intent(paramQQAppInterface.a(), QWalletLockScreenActivity.class);
        localIntent.addFlags(67108864);
        localIntent.addFlags(268435456);
        localIntent.addFlags(262144);
        localIntent.addFlags(1073741824);
        localIntent.putExtra("title", str2);
        localIntent.putExtra("content", str1);
        localIntent.putExtra("time", TimeFormatterUtils.c(BaseApplication.getContext(), jdField_b_of_type_Long));
        paramQQAppInterface.a().startActivity(localIntent);
      }
    }
    else
    {
      bool1 = paramQQAppInterface.h();
      bool2 = PhoneStatusTools.e(paramQQAppInterface.a());
      boolean bool3 = paramQQAppInterface.d();
      boolean bool4 = paramQQAppInterface.q();
      boolean bool5 = NoDisturbUtil.a(paramQQAppInterface.a().getApplicationContext(), paramQQAppInterface);
      if (QLog.isColorLevel()) {
        QLog.d("Q.qwallet.push", 2, "isRingerSilent=" + bool1 + ",isCalling=" + bool2 + ",isVideoChatting=" + bool3 + ",isRecordingPtt=" + bool4 + ",canDisturb=" + bool5);
      }
      if ((bool5) && (!bool2) && (!bool1) && (!bool3) && (!bool4))
      {
        if (paramQQAppInterface.d() != 0) {
          break label466;
        }
        bool1 = false;
        label311:
        if (paramQQAppInterface.e() != 0) {
          break label471;
        }
      }
    }
    label466:
    label471:
    for (boolean bool2 = false;; bool2 = true)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.qwallet.push", 2, "canPlaySound=" + bool1 + ",canVibrator=" + bool2);
      }
      if (bool2)
      {
        paramQQAppInterface = (Vibrator)paramQQAppInterface.a().getSystemService("vibrator");
        if (paramQQAppInterface != null) {
          paramQQAppInterface.vibrate(jdField_a_of_type_ArrayOfLong, -1);
        }
      }
      if (bool1)
      {
        paramQQAppInterface = ThemeUtil.getThemeVoiceRootPath();
        if (paramQQAppInterface == null) {
          break label476;
        }
        paramQQAppInterface = new File(paramQQAppInterface + File.separatorChar + "message.mp3");
        if (!paramQQAppInterface.exists()) {
          break label476;
        }
        AudioUtil.a(Uri.fromFile(paramQQAppInterface), false, true);
      }
      return;
      str1 = BaseApplication.getContext().getString(2131366342);
      break;
      bool1 = true;
      break label311;
    }
    label476:
    AudioUtil.a(2131165206, false);
  }
  
  private static void a(QQAppInterface paramQQAppInterface, String paramString)
  {
    int i = 4;
    int k = 0;
    int j = 0;
    if (TextUtils.isEmpty(paramString)) {
      if (QLog.isColorLevel())
      {
        QLog.d("Q.qwallet.push", 2, "PCPayData is empty.");
        break label29;
      }
    }
    label29:
    while (paramQQAppInterface == null) {
      return;
    }
    for (;;)
    {
      int m;
      int n;
      try
      {
        paramString = new JSONObject(paramString);
        m = paramString.optInt("module", 0);
        n = paramString.optInt("action", 0);
        if ((m < 1) || (m > 2) || (n < 1) || (n > 2)) {
          break label29;
        }
        if ((m != 1) || (n != 1)) {
          break label205;
        }
        paramString = paramQQAppInterface.a();
        if (Build.VERSION.SDK_INT <= 10) {
          break label200;
        }
        paramString = paramString.getSharedPreferences("qwallet_multi", i);
        if (paramString == null) {
          break label397;
        }
        paramString.edit().putBoolean("is_refresh_home", true).commit();
      }
      catch (JSONException paramQQAppInterface)
      {
        paramQQAppInterface.printStackTrace();
      }
      if ((i == 0) || (!QWalletHelper.a(paramQQAppInterface.a()))) {
        break;
      }
      if (m == 1)
      {
        paramString = "com.qwallet.refresh.home";
        b(paramQQAppInterface, paramString);
        return;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.qwallet.push", 2, "Parsing PCPAYDATA throws JSONException.");
        return;
        label200:
        i = 0;
        continue;
        label205:
        if ((m == 1) && (n == 2))
        {
          FileUtils.d(paramQQAppInterface.a().getFilesDir() + "/" + QWalletHelper.d(paramQQAppInterface.a()));
          i = 1;
          continue;
        }
        if ((m == 2) && (n == 1))
        {
          paramString = paramQQAppInterface.a();
          i = k;
          if (Build.VERSION.SDK_INT > 10) {
            i = 4;
          }
          paramString = paramString.getSharedPreferences("qwallet_multi", i);
          if (paramString == null) {
            break label402;
          }
          paramString.edit().putBoolean("is_refresh_center", true).commit();
          break label402;
        }
        i = j;
        if (m != 2) {
          continue;
        }
        i = j;
        if (n != 2) {
          continue;
        }
        FileUtils.d(paramQQAppInterface.a().getFilesDir() + "/" + QWalletHelper.b(paramQQAppInterface.a()));
        i = 1;
        continue;
      }
      paramString = "com.qwallet.refresh.center";
      continue;
      label397:
      i = 1;
      continue;
      label402:
      i = 1;
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.qwallet.push", 2, "onQQForeground isFromGestureLock=" + paramBoolean);
    }
    if (paramQQAppInterface == null) {
      break label36;
    }
    label36:
    while (a(false) == null) {
      return;
    }
    if (paramBoolean) {}
    for (int i = 5;; i = 1000)
    {
      MqqHandler localMqqHandler = ThreadManager.b();
      if (localMqqHandler == null) {
        break;
      }
      localMqqHandler.postDelayed(new mde(paramQQAppInterface), i);
      return;
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      label3:
      break label4;
    }
    label4:
    while (a(paramArrayOfByte)) {
      return;
    }
    Object localObject = null;
    for (;;)
    {
      int i;
      try
      {
        paramArrayOfByte = (submsgtype0x66.MsgBody)new submsgtype0x66.MsgBody().mergeFrom(paramArrayOfByte);
        if (!uint32_type.has()) {
          break label254;
        }
        i = uint32_type.get();
      }
      catch (Exception paramArrayOfByte)
      {
        i = -1;
        paramArrayOfByte.printStackTrace();
        paramArrayOfByte = localObject;
        int j = i;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("Q.qwallet.push", 2, "Parsing Msg0x210Sub0x66 data throws Exception.");
        paramArrayOfByte = localObject;
        j = i;
        continue;
        try
        {
          c(paramQQAppInterface, new String(paramArrayOfByte, "UTF-8"));
          return;
        }
        catch (Exception paramArrayOfByte)
        {
          paramArrayOfByte.printStackTrace();
          if (QLog.isColorLevel()) {
            QLog.d("Q.qwallet.push", 2, "Coverting pushData to String throws Exception.");
          }
          PayBridgeActivity.a(paramQQAppInterface, -1, 2, "", "Coverting pushData to String throws Exception.");
          return;
        }
        try
        {
          a(paramQQAppInterface, new String(paramArrayOfByte, "UTF-8"));
          return;
        }
        catch (Exception paramQQAppInterface)
        {
          paramQQAppInterface.printStackTrace();
        }
      }
      try
      {
        if (!bytes_push_data.has()) {
          break label249;
        }
        paramArrayOfByte = bytes_push_data.get();
        if (paramArrayOfByte == null) {
          break label249;
        }
        paramArrayOfByte = paramArrayOfByte.toByteArray();
      }
      catch (Exception paramArrayOfByte)
      {
        continue;
        label249:
        paramArrayOfByte = null;
        continue;
      }
      j = i;
      if ((j == -1) || (paramArrayOfByte == null)) {
        break;
      }
      switch (j)
      {
      default: 
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.qwallet.push", 2, "Unknow pushType.");
        return;
      case 1: 
      case 2: 
        if (!QLog.isColorLevel()) {
          break label3;
        }
        QLog.d("Q.qwallet.push", 2, "Coverting pushData to String throws Exception.");
        return;
        label254:
        i = -1;
      }
    }
  }
  
  protected static boolean a(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      return true;
    }
    long l = System.currentTimeMillis();
    int i = jdField_b_of_type_JavaUtilArrayList.size();
    if ((i > 0) && (Math.abs(l - jdField_b_of_type_Long) > 1800000L)) {
      jdField_b_of_type_JavaUtilArrayList.clear();
    }
    int j = ByteBuffer.wrap(paramArrayOfByte).hashCode();
    i -= 1;
    while (i >= 0)
    {
      if (((Integer)jdField_b_of_type_JavaUtilArrayList.get(i)).intValue() == j) {
        return true;
      }
      i -= 1;
    }
    jdField_b_of_type_JavaUtilArrayList.add(Integer.valueOf(j));
    jdField_b_of_type_Long = l;
    return false;
  }
  
  public static void b()
  {
    if (jdField_a_of_type_JavaUtilArrayList == null) {
      return;
    }
    jdField_a_of_type_JavaUtilArrayList.clear();
  }
  
  private static void b(QQAppInterface paramQQAppInterface)
  {
    boolean bool1 = false;
    if ((paramQQAppInterface == null) || (jdField_a_of_type_JavaUtilArrayList == null)) {}
    label388:
    label391:
    for (;;)
    {
      return;
      boolean bool2 = QQUtils.a(paramQQAppInterface.a());
      if (QLog.isColorLevel()) {
        QLog.d("Q.qwallet.push", 2, "startForegroundPay isScreenLock=" + bool2);
      }
      if (!bool2)
      {
        QWalletPushManager.PCPayData localPCPayData = a();
        int i;
        if (localPCPayData == null)
        {
          if (jdField_a_of_type_JavaUtilArrayList.size() <= 0) {
            continue;
          }
          localPCPayData = (QWalletPushManager.PCPayData)jdField_a_of_type_JavaUtilArrayList.get(0);
          if (localPCPayData == null)
          {
            jdField_a_of_type_JavaUtilArrayList.remove(0);
            b(paramQQAppInterface);
            return;
          }
          i = a(e);
          if (i == 0)
          {
            jdField_a_of_type_JavaUtilArrayList.remove(0);
            b(paramQQAppInterface);
            return;
          }
          bool2 = PayBridgeActivity.a();
          if ((!bool2) || (QWalletHelper.a(paramQQAppInterface.getApplication().getApplicationContext()))) {
            break label388;
          }
        }
        for (;;)
        {
          if (bool1) {
            break label391;
          }
          try
          {
            f = 1;
            paramQQAppInterface = new Intent(BaseApplication.getContext(), PayBridgeActivity.class);
            paramQQAppInterface.addFlags(268435456);
            Bundle localBundle = new Bundle();
            localBundle.putString("json", jdField_b_of_type_JavaLangString);
            localBundle.putString("callbackSn", "0");
            localBundle.putBoolean("payparmas_from_pcpush", true);
            paramQQAppInterface.addFlags(67108864);
            paramQQAppInterface.addFlags(536870912);
            paramQQAppInterface.putExtras(localBundle);
            paramQQAppInterface.putExtra("pay_requestcode", i);
            paramQQAppInterface.putExtra("payparmas_paytype", 2);
            paramQQAppInterface.putExtra("vacreport_key_seq", jdField_a_of_type_Long);
            BaseApplication.getContext().startActivity(paramQQAppInterface);
            return;
          }
          catch (Exception paramQQAppInterface)
          {
            paramQQAppInterface.printStackTrace();
            f = 2;
          }
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d("Q.qwallet.push", 2, "Starting pay throws Exception.");
          return;
          bool2 = PayBridgeActivity.a();
          bool1 = bool2;
          if (bool2)
          {
            bool1 = bool2;
            if (!QWalletHelper.a(paramQQAppInterface.getApplication().getApplicationContext())) {
              bool1 = false;
            }
          }
          bool2 = bool1;
          if (bool1)
          {
            long l = System.currentTimeMillis();
            bool2 = bool1;
            if (43200L * 1000L + jdField_c_of_type_Long > l) {
              bool2 = false;
            }
          }
          if (bool2) {
            break;
          }
          f = 2;
          b(paramQQAppInterface);
          return;
          bool1 = bool2;
        }
      }
    }
  }
  
  private static void b(QQAppInterface paramQQAppInterface, QWalletPushManager.PCPayData paramPCPayData)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.qwallet.push", 2, "startBackgroundPay");
    }
    if ((paramQQAppInterface == null) || (paramQQAppInterface.a() == null) || (paramPCPayData == null)) {}
    Object localObject1;
    do
    {
      return;
      String str = String.format(BaseApplication.getContext().getString(2131366341), new Object[] { Integer.valueOf(a()) });
      localObject1 = jdField_c_of_type_JavaLangString;
      paramPCPayData = (QWalletPushManager.PCPayData)localObject1;
      if (TextUtils.isEmpty((CharSequence)localObject1)) {
        paramPCPayData = BaseApplication.getContext().getString(2131366342);
      }
      localObject1 = new Bundle();
      ((Bundle)localObject1).putString("callbackSn", "0");
      ((Bundle)localObject1).putBoolean("payparmas_from_pcpush", true);
      ((Bundle)localObject1).putInt("pay_requestcode", 12);
      ((Bundle)localObject1).putInt("payparmas_paytype", 2);
      ((Bundle)localObject1).putLong("vacreport_key_seq", jdField_a_of_type_Long);
      Object localObject2 = new Intent(paramQQAppInterface.a(), PayBridgeActivity.class);
      ((Intent)localObject2).addFlags(268435456);
      ((Intent)localObject2).putExtras((Bundle)localObject1);
      localObject2 = PendingIntent.getActivity(paramQQAppInterface.a(), 12, (Intent)localObject2, 1073741824);
      localObject1 = new Notification(2130838557, str, System.currentTimeMillis());
      flags = 16;
      ((Notification)localObject1).setLatestEventInfo(paramQQAppInterface.a(), str, paramPCPayData, (PendingIntent)localObject2);
      paramQQAppInterface = (NotificationManager)paramQQAppInterface.a().getSystemService("notification");
    } while (paramQQAppInterface == null);
    paramQQAppInterface.cancel(128);
    paramQQAppInterface.notify(128, (Notification)localObject1);
  }
  
  private static void b(QQAppInterface paramQQAppInterface, String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return;
    }
    paramString = new Intent(paramString);
    paramQQAppInterface.a().sendBroadcast(paramString);
  }
  
  /* Error */
  public static void b(QQAppInterface paramQQAppInterface, byte[] paramArrayOfByte)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +4 -> 5
    //   4: return
    //   5: aload_1
    //   6: invokestatic 388	com/tencent/mobileqq/activity/qwallet/QWalletPushManager:a	([B)Z
    //   9: ifne -5 -> 4
    //   12: new 593	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$MsgBody
    //   15: dup
    //   16: invokespecial 594	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$MsgBody:<init>	()V
    //   19: aload_1
    //   20: invokevirtual 595	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   23: checkcast 593	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$MsgBody
    //   26: astore_1
    //   27: aload_1
    //   28: getfield 599	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$MsgBody:msg_online_push	Ltencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush;
    //   31: invokevirtual 602	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:has	()Z
    //   34: ifeq -30 -> 4
    //   37: aload_1
    //   38: getfield 599	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$MsgBody:msg_online_push	Ltencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush;
    //   41: invokevirtual 605	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:get	()Lcom/tencent/mobileqq/pb/MessageMicro;
    //   44: checkcast 601	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush
    //   47: astore 12
    //   49: aload 12
    //   51: ifnull -47 -> 4
    //   54: iconst_m1
    //   55: istore_2
    //   56: iconst_m1
    //   57: istore_3
    //   58: ldc_w 438
    //   61: astore 11
    //   63: ldc_w 438
    //   66: astore_1
    //   67: iconst_m1
    //   68: istore 4
    //   70: aload 12
    //   72: getfield 608	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:uint32_action	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   75: invokevirtual 404	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   78: ifeq +12 -> 90
    //   81: aload 12
    //   83: getfield 608	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:uint32_action	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   86: invokevirtual 406	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   89: istore_2
    //   90: aload 12
    //   92: getfield 611	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:uint32_timestamp	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   95: invokevirtual 404	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   98: ifeq +12 -> 110
    //   101: aload 12
    //   103: getfield 611	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:uint32_timestamp	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   106: invokevirtual 406	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   109: istore_3
    //   110: aload 11
    //   112: astore 10
    //   114: aload 12
    //   116: getfield 614	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:bytes_extend	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   119: invokevirtual 413	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   122: ifeq +39 -> 161
    //   125: aload 12
    //   127: getfield 614	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:bytes_extend	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   130: invokevirtual 416	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   133: astore 13
    //   135: aload 11
    //   137: astore 10
    //   139: aload 13
    //   141: ifnull +20 -> 161
    //   144: new 124	java/lang/String
    //   147: dup
    //   148: aload 13
    //   150: invokevirtual 422	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   153: ldc_w 429
    //   156: invokespecial 432	java/lang/String:<init>	([BLjava/lang/String;)V
    //   159: astore 10
    //   161: aload 12
    //   163: getfield 618	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:str_serialno	Lcom/tencent/mobileqq/pb/PBStringField;
    //   166: invokevirtual 621	com/tencent/mobileqq/pb/PBStringField:has	()Z
    //   169: ifeq +12 -> 181
    //   172: aload 12
    //   174: getfield 618	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:str_serialno	Lcom/tencent/mobileqq/pb/PBStringField;
    //   177: invokevirtual 623	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   180: astore_1
    //   181: aload 12
    //   183: getfield 626	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:str_billno	Lcom/tencent/mobileqq/pb/PBStringField;
    //   186: invokevirtual 621	com/tencent/mobileqq/pb/PBStringField:has	()Z
    //   189: ifeq +12 -> 201
    //   192: aload 12
    //   194: getfield 626	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:str_billno	Lcom/tencent/mobileqq/pb/PBStringField;
    //   197: invokevirtual 623	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   200: astore_1
    //   201: aload 12
    //   203: getfield 629	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:str_appinfo	Lcom/tencent/mobileqq/pb/PBStringField;
    //   206: invokevirtual 621	com/tencent/mobileqq/pb/PBStringField:has	()Z
    //   209: ifeq +12 -> 221
    //   212: aload 12
    //   214: getfield 629	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:str_appinfo	Lcom/tencent/mobileqq/pb/PBStringField;
    //   217: invokevirtual 623	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   220: astore_1
    //   221: aload 12
    //   223: getfield 632	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:uint32_amount	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   226: invokevirtual 404	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   229: ifeq +13 -> 242
    //   232: aload 12
    //   234: getfield 632	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:uint32_amount	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   237: invokevirtual 406	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   240: istore 4
    //   242: aload 12
    //   244: getfield 635	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:str_jumpurl	Lcom/tencent/mobileqq/pb/PBStringField;
    //   247: invokevirtual 621	com/tencent/mobileqq/pb/PBStringField:has	()Z
    //   250: ifeq +12 -> 262
    //   253: aload 12
    //   255: getfield 635	tencent/im/s2c/msgtype0x210/submsgtype0x7e/submsgtype0x7e$WalletMsgPush:str_jumpurl	Lcom/tencent/mobileqq/pb/PBStringField;
    //   258: invokevirtual 623	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   261: astore_1
    //   262: new 288	org/json/JSONObject
    //   265: dup
    //   266: invokespecial 636	org/json/JSONObject:<init>	()V
    //   269: astore 11
    //   271: new 288	org/json/JSONObject
    //   274: dup
    //   275: invokespecial 636	org/json/JSONObject:<init>	()V
    //   278: astore 12
    //   280: new 288	org/json/JSONObject
    //   283: dup
    //   284: aload 10
    //   286: invokespecial 289	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   289: astore 13
    //   291: aload 12
    //   293: ldc_w 297
    //   296: iload_2
    //   297: invokevirtual 640	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   300: pop
    //   301: aload 12
    //   303: ldc_w 642
    //   306: aload 13
    //   308: invokevirtual 645	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   311: pop
    //   312: aload 11
    //   314: ldc_w 647
    //   317: aload_0
    //   318: invokevirtual 348	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   321: invokevirtual 645	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   324: pop
    //   325: aload 11
    //   327: ldc_w 649
    //   330: ldc_w 651
    //   333: invokevirtual 645	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   336: pop
    //   337: aload 11
    //   339: ldc_w 653
    //   342: ldc_w 655
    //   345: invokevirtual 645	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   348: pop
    //   349: aload 11
    //   351: ldc_w 657
    //   354: aload 12
    //   356: invokevirtual 645	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   359: pop
    //   360: aload_0
    //   361: invokevirtual 76	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   364: astore 13
    //   366: getstatic 302	android/os/Build$VERSION:SDK_INT	I
    //   369: bipush 10
    //   371: if_icmple +448 -> 819
    //   374: iconst_4
    //   375: istore 5
    //   377: aload 13
    //   379: ldc_w 304
    //   382: iload 5
    //   384: invokevirtual 308	com/tencent/qphone/base/util/BaseApplication:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   387: astore 13
    //   389: aload 13
    //   391: ifnull +89 -> 480
    //   394: aload_0
    //   395: invokevirtual 348	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   398: astore_0
    //   399: aload 13
    //   401: new 202	java/lang/StringBuilder
    //   404: dup
    //   405: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   408: ldc_w 659
    //   411: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   414: aload_0
    //   415: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   418: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   421: lconst_0
    //   422: invokeinterface 663 4 0
    //   427: lstore 6
    //   429: invokestatic 668	com/tencent/mobileqq/msf/core/NetConnInfoCenter:getServerTimeMillis	()J
    //   432: ldc2_w 543
    //   435: ldiv
    //   436: lstore 8
    //   438: lload 8
    //   440: lload 6
    //   442: lcmp
    //   443: ifge +277 -> 720
    //   446: aload 13
    //   448: invokeinterface 314 1 0
    //   453: new 202	java/lang/StringBuilder
    //   456: dup
    //   457: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   460: ldc_w 659
    //   463: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   466: aload_0
    //   467: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   470: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   473: lconst_0
    //   474: invokeinterface 671 4 0
    //   479: pop
    //   480: new 501	android/os/Bundle
    //   483: dup
    //   484: invokespecial 502	android/os/Bundle:<init>	()V
    //   487: astore_0
    //   488: aload_0
    //   489: ldc_w 504
    //   492: aload 11
    //   494: invokevirtual 672	org/json/JSONObject:toString	()Ljava/lang/String;
    //   497: invokevirtual 510	android/os/Bundle:putString	(Ljava/lang/String;Ljava/lang/String;)V
    //   500: aload_0
    //   501: ldc_w 512
    //   504: ldc_w 514
    //   507: invokevirtual 510	android/os/Bundle:putString	(Ljava/lang/String;Ljava/lang/String;)V
    //   510: new 139	android/content/Intent
    //   513: dup
    //   514: invokestatic 109	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   517: ldc_w 440
    //   520: invokespecial 144	android/content/Intent:<init>	(Landroid/content/Context;Ljava/lang/Class;)V
    //   523: astore 12
    //   525: aload 12
    //   527: ldc -106
    //   529: invokevirtual 149	android/content/Intent:addFlags	(I)Landroid/content/Intent;
    //   532: pop
    //   533: aload 12
    //   535: aload_0
    //   536: invokevirtual 524	android/content/Intent:putExtras	(Landroid/os/Bundle;)Landroid/content/Intent;
    //   539: pop
    //   540: aload 12
    //   542: ldc_w 526
    //   545: iconst_5
    //   546: invokevirtual 529	android/content/Intent:putExtra	(Ljava/lang/String;I)Landroid/content/Intent;
    //   549: pop
    //   550: invokestatic 109	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   553: aload 12
    //   555: invokevirtual 173	com/tencent/qphone/base/util/BaseApplication:startActivity	(Landroid/content/Intent;)V
    //   558: invokestatic 675	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   561: ifeq -557 -> 4
    //   564: ldc 94
    //   566: iconst_4
    //   567: new 202	java/lang/StringBuilder
    //   570: dup
    //   571: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   574: ldc_w 677
    //   577: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   580: iload_2
    //   581: invokevirtual 680	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   584: ldc_w 682
    //   587: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   590: iload_3
    //   591: invokevirtual 680	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   594: ldc_w 684
    //   597: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   600: aload 10
    //   602: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   605: ldc_w 686
    //   608: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   611: aload_1
    //   612: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   615: ldc_w 688
    //   618: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   621: ldc_w 438
    //   624: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   627: ldc_w 690
    //   630: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   633: ldc_w 438
    //   636: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   639: ldc_w 692
    //   642: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   645: iload 4
    //   647: invokevirtual 680	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   650: ldc_w 694
    //   653: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   656: ldc_w 438
    //   659: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   662: ldc_w 696
    //   665: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   668: aload 11
    //   670: invokevirtual 672	org/json/JSONObject:toString	()Ljava/lang/String;
    //   673: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   676: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   679: invokestatic 699	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   682: return
    //   683: astore_0
    //   684: aload_0
    //   685: invokevirtual 425	java/lang/Exception:printStackTrace	()V
    //   688: invokestatic 200	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   691: ifeq -687 -> 4
    //   694: ldc 94
    //   696: iconst_2
    //   697: ldc_w 701
    //   700: invokestatic 227	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   703: return
    //   704: astore 13
    //   706: invokestatic 675	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   709: ifeq -349 -> 360
    //   712: aload 13
    //   714: invokevirtual 425	java/lang/Exception:printStackTrace	()V
    //   717: goto -357 -> 360
    //   720: lload 8
    //   722: lload 6
    //   724: lsub
    //   725: ldc2_w 702
    //   728: lcmp
    //   729: ifge -249 -> 480
    //   732: new 288	org/json/JSONObject
    //   735: dup
    //   736: invokespecial 636	org/json/JSONObject:<init>	()V
    //   739: astore_0
    //   740: aload_0
    //   741: ldc_w 705
    //   744: iconst_0
    //   745: invokevirtual 640	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   748: pop
    //   749: aload_0
    //   750: ldc_w 707
    //   753: ldc_w 438
    //   756: invokevirtual 645	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   759: pop
    //   760: aload_0
    //   761: ldc_w 709
    //   764: iconst_4
    //   765: invokevirtual 640	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   768: pop
    //   769: aload_0
    //   770: ldc_w 711
    //   773: aload 12
    //   775: invokevirtual 645	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   778: pop
    //   779: new 713	com/tencent/mobileqq/openapi/sdk/QQResult$QQStringResult
    //   782: dup
    //   783: iconst_4
    //   784: iconst_0
    //   785: aload_0
    //   786: invokevirtual 672	org/json/JSONObject:toString	()Ljava/lang/String;
    //   789: invokespecial 716	com/tencent/mobileqq/openapi/sdk/QQResult$QQStringResult:<init>	(IILjava/lang/String;)V
    //   792: astore_0
    //   793: invokestatic 721	com/tencent/mobileqq/openapi/OpenApiManager:a	()Lcom/tencent/mobileqq/openapi/OpenApiManager;
    //   796: aload_0
    //   797: invokevirtual 724	com/tencent/mobileqq/openapi/OpenApiManager:a	(Lcom/tencent/mobileqq/openapi/sdk/QQResult$QQStringResult;)V
    //   800: goto -320 -> 480
    //   803: astore 12
    //   805: invokestatic 675	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   808: ifeq -29 -> 779
    //   811: aload 12
    //   813: invokevirtual 425	java/lang/Exception:printStackTrace	()V
    //   816: goto -37 -> 779
    //   819: iconst_0
    //   820: istore 5
    //   822: goto -445 -> 377
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	825	0	paramQQAppInterface	QQAppInterface
    //   0	825	1	paramArrayOfByte	byte[]
    //   55	526	2	i	int
    //   57	534	3	j	int
    //   68	578	4	k	int
    //   375	446	5	m	int
    //   427	296	6	l1	long
    //   436	285	8	l2	long
    //   112	489	10	localObject1	Object
    //   61	608	11	localObject2	Object
    //   47	727	12	localObject3	Object
    //   803	9	12	localException1	Exception
    //   133	314	13	localObject4	Object
    //   704	9	13	localException2	Exception
    // Exception table:
    //   from	to	target	type
    //   12	49	683	java/lang/Exception
    //   70	90	683	java/lang/Exception
    //   90	110	683	java/lang/Exception
    //   114	135	683	java/lang/Exception
    //   144	161	683	java/lang/Exception
    //   161	181	683	java/lang/Exception
    //   181	201	683	java/lang/Exception
    //   201	221	683	java/lang/Exception
    //   221	242	683	java/lang/Exception
    //   242	262	683	java/lang/Exception
    //   262	280	683	java/lang/Exception
    //   360	374	683	java/lang/Exception
    //   377	389	683	java/lang/Exception
    //   394	438	683	java/lang/Exception
    //   446	480	683	java/lang/Exception
    //   480	682	683	java/lang/Exception
    //   706	717	683	java/lang/Exception
    //   732	740	683	java/lang/Exception
    //   779	800	683	java/lang/Exception
    //   805	816	683	java/lang/Exception
    //   280	360	704	java/lang/Exception
    //   740	779	803	java/lang/Exception
  }
  
  private static boolean b(QQAppInterface paramQQAppInterface)
  {
    Object localObject1 = BaseApplicationImpl.a();
    if (localObject1 == null) {
      return false;
    }
    boolean bool = GesturePWDUtils.getGestureLocking((Context)localObject1);
    if (QLog.isColorLevel()) {
      QLog.d("Q.qwallet.push", 2, "isQQForeground isQQLock=" + bool);
    }
    if ((paramQQAppInterface == null) || (bool)) {
      return false;
    }
    if (!isBackground_Pause) {
      return true;
    }
    try
    {
      Object localObject2 = (ActivityManager)((Context)localObject1).getApplicationContext().getSystemService("activity");
      if (localObject2 == null) {
        return false;
      }
      paramQQAppInterface = ((Context)localObject1).getApplicationContext().getPackageName();
      if (TextUtils.isEmpty(paramQQAppInterface)) {
        return false;
      }
      localObject1 = ((ActivityManager)localObject2).getRunningAppProcesses();
      if (localObject1 == null) {
        return false;
      }
      localObject1 = ((List)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject1).next();
        if ((importance == 100) && (processName != null))
        {
          if (processName.equals(paramQQAppInterface + ":video")) {
            return false;
          }
          if (!processName.equals(paramQQAppInterface))
          {
            bool = processName.startsWith(paramQQAppInterface + ":");
            if (!bool) {
              break;
            }
          }
          else
          {
            return true;
          }
        }
      }
    }
    catch (Exception paramQQAppInterface)
    {
      paramQQAppInterface.printStackTrace();
      return false;
    }
    return false;
  }
  
  private static void c(QQAppInterface paramQQAppInterface, String paramString)
  {
    if (TextUtils.isEmpty(paramString))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.qwallet.push", 2, "PCPayData is empty.");
      }
      PayBridgeActivity.a(paramQQAppInterface, -1, 2, "", "PCPayData is empty.");
    }
    while ((paramQQAppInterface == null) || (jdField_a_of_type_JavaUtilArrayList == null)) {
      return;
    }
    try
    {
      QWalletPushManager.PCPayData localPCPayData1 = new QWalletPushManager.PCPayData();
      jdField_b_of_type_Long = System.currentTimeMillis();
      ??? = new JSONObject(paramString);
      jdField_a_of_type_Long = ((JSONObject)???).optLong("tradeTime", 0L);
      d = ((JSONObject)???).optInt("expTime", 0);
      e = ((JSONObject)???).optInt("payType", 0);
      jdField_c_of_type_JavaLangString = ((JSONObject)???).optString("notifyText");
      ??? = ((JSONObject)???).optJSONObject("payData");
      if (??? != null) {
        jdField_b_of_type_JavaLangString = ((JSONObject)???).toString();
      }
      if ((e < 1) || (e > 6) || (TextUtils.isEmpty(jdField_b_of_type_JavaLangString)))
      {
        PayBridgeActivity.a(paramQQAppInterface, -1, 2, "pcPayData.payType:" + e, "payType error or payData empty");
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
      if (QLog.isColorLevel()) {
        QLog.d("Q.qwallet.push", 2, "Parsing PCPAYDATA throws JSONException.");
      }
      PayBridgeActivity.a(paramQQAppInterface, -1, 2, "PayData:" + paramString, "PayData JSONException.");
      return;
    }
    if (e == 1) {
      jdField_a_of_type_Long = VACDReportUtil.a(null, "qqwallet", "pay-pcpush", "payinvoke", null, 0, null);
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaUtilArrayList)
      {
        jdField_a_of_type_JavaUtilArrayList.add(localJSONException);
        if (b(paramQQAppInterface))
        {
          if (jdField_a_of_type_Long != 0L) {
            VACDReportUtil.a(jdField_a_of_type_Long, null, "startForegroundPay", null, 0, null);
          }
          b(paramQQAppInterface);
          jdField_a_of_type_Long = 0L;
          a(paramQQAppInterface, localJSONException);
          return;
        }
      }
      if (jdField_a_of_type_Long != 0L) {
        VACDReportUtil.a(jdField_a_of_type_Long, null, "startBackgroundPay", null, 0, null);
      }
      b(paramQQAppInterface, localPCPayData2);
    }
  }
}
