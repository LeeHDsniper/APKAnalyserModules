package com.tencent.mobileqq.msf.core;

import LBS.LBSInfo;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.hardware.Sensor;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.RemoteViews;
import com.qq.jce.wup.UniPacket;
import com.tencent.mobileqq.msf.core.push.f;
import com.tencent.mobileqq.msf.service.g;
import com.tencent.msf.service.protocol.QQWiFi.WiFiService;
import com.tencent.msf.service.protocol.QQWiFi.a;
import com.tencent.msf.service.protocol.QQWiFi.b;
import com.tencent.msf.service.protocol.QQWiFi.d;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

public class o
{
  public static final int A = 4;
  public static final int B = 5;
  public static final int C = 6;
  public static final int D = 1;
  public static final int E = 2;
  public static final int F = 3;
  static final String G = "health_manager";
  static int H = 0;
  static long I = 0L;
  static final int J = 1200000;
  static SensorManager K = null;
  static SensorEventListener L = null;
  static boolean M = true;
  static boolean N = false;
  public static int O = 1;
  public static int P = O + 1;
  public static int Q = P + 1;
  static int R = 0;
  static int S = 0;
  static int T = 99999999;
  static int U = 20000;
  static int V = 3000000;
  static volatile int W = 0;
  static volatile int X = 0;
  static volatile int Y = 0;
  static AtomicBoolean Z = new AtomicBoolean(false);
  public static final String a = "mobileqq.service";
  private static BroadcastReceiver aE = new u();
  static long aa = 0L;
  static final String ab = BaseApplication.getContext().getFilesDir() + File.separator + "step.info";
  static JSONObject ac = null;
  static final String ad = "4eY#X@~g.+U)2%$<";
  static AtomicBoolean ae = new AtomicBoolean(false);
  private static final String af = "QQWiFiScanManager";
  private static o ag;
  public static final String b = "MQQ.QQWiFiMgrServer.QQWiFiMgrObj";
  public static final String c = "AvailQQWiFiForMSF";
  public static final String d = "QQWifiSvc.AvailQQWiFiForMSF";
  public static final String e = "MQQ.WiFiMapServer.WiFiMapObj";
  public static final String f = "getNearbyAvailWiFiInfo";
  public static final String g = "QQWifiSvc.getNearbyAvailWiFiInfo";
  public static final long h = 25000L;
  public static final long i = 21600000L;
  public static final int j = 1001;
  public static final int k = 1003;
  public static final int l = 1004;
  public static final int m = 1007;
  public static final int n = 1008;
  public static final int o = 1009;
  public static final int p = -80;
  public static final int q = 20000;
  public static final int r = 1;
  public static final int s = 2;
  public static final int t = 4;
  public static final int u = 1;
  public static final int v = -1;
  public static final int w = 0;
  public static final int x = 1;
  public static final int y = 2;
  public static final int z = 3;
  private boolean aA = true;
  private boolean aB = false;
  private int aC = 1;
  private final BroadcastReceiver aD = new p(this);
  private MsfCore ah;
  private Context ai = BaseApplication.getContext();
  private a aj = new a(null);
  private Notification ak;
  private int al = 0;
  private String am = "";
  private RemoteViews an;
  private LBSInfo ao;
  private long ap = 0L;
  private long aq = 0L;
  private long ar = 0L;
  private List as = Collections.synchronizedList(new ArrayList());
  private List at = Collections.synchronizedList(new ArrayList());
  private List au = Collections.synchronizedList(new ArrayList());
  private List av = Collections.synchronizedList(new ArrayList());
  private boolean aw;
  private boolean ax = false;
  private boolean ay = false;
  private boolean az = false;
  
  private o() {}
  
  public static o a()
  {
    if (ag == null) {
      ag = new o();
    }
    return ag;
  }
  
  private String a(Context paramContext, boolean paramBoolean)
  {
    if (TextUtils.isEmpty(aj.r))
    {
      if (QLog.isColorLevel()) {
        QLog.e("health_manager", 2, "getNotNetworkSupportSsidList mControlConfig.noNetSupport is empty");
      }
      return null;
    }
    paramContext = BaseApplication.getContext();
    int i1;
    SharedPreferences localSharedPreferences;
    int i2;
    if (Build.VERSION.SDK_INT > 10)
    {
      i1 = 4;
      localSharedPreferences = paramContext.getSharedPreferences("no_network_support_qqwifi", i1);
      paramContext = new StringBuffer();
      try
      {
        localJSONArray1 = new JSONArray(aj.r);
        i5 = localJSONArray1.length();
        i1 = 0;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          JSONArray localJSONArray1;
          int i5;
          JSONObject localJSONObject1;
          JSONArray localJSONArray2;
          int i6;
          int i4;
          continue;
          i1 += 1;
        }
      }
      if (i1 < i5)
      {
        localJSONObject1 = localJSONArray1.getJSONObject(i1);
        if ((localJSONObject1 == null) || ((paramBoolean) && (localJSONObject1.optInt("canPush") != 1))) {
          break label276;
        }
        localJSONArray2 = localJSONObject1.optJSONArray("jar");
        i6 = localJSONArray2.length();
        i4 = 0;
        i2 = 0;
      }
    }
    for (;;)
    {
      int i3 = i4;
      if (i2 < i6)
      {
        JSONObject localJSONObject2 = localJSONArray2.optJSONObject(i2);
        String str = localJSONObject2.optString("pkgid");
        i3 = localJSONObject2.optInt("limitVersion");
        if ((localSharedPreferences.contains(str)) && (localSharedPreferences.getInt(str, 0) > i3)) {
          i3 = 1;
        }
      }
      else
      {
        if (i3 != 0)
        {
          paramContext.append(localJSONObject1.optString("ssid"));
          paramContext.append("|");
          break label276;
          if (paramContext.length() > 0) {
            paramContext.delete(paramContext.length() - 1, paramContext.length());
          }
          return paramContext.toString();
        }
        label276:
        i1 = 0;
        break;
      }
      i2 += 1;
    }
  }
  
  private Map a(Context paramContext)
  {
    try
    {
      paramContext = a(new File(paramContext.getDir("qqwifi_dir", 0), "params_file"));
      if (TextUtils.isEmpty(paramContext)) {
        return null;
      }
      paramContext = new JSONObject(paramContext);
      HashMap localHashMap = new HashMap();
      Iterator localIterator = paramContext.keys();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localHashMap.put(str, paramContext.getString(str));
      }
      return localHashMap;
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
      return null;
    }
  }
  
  public static void a(int paramInt)
  {
    if (paramInt == P)
    {
      QLog.i("health_manager", 1, "msf ondestory!");
      if (N)
      {
        BaseApplication.getContext().unregisterReceiver(aE);
        N = false;
      }
    }
    do
    {
      for (;;)
      {
        return;
        if (paramInt == O)
        {
          if (Build.VERSION.SDK_INT < 19) {
            continue;
          }
          K = (SensorManager)BaseApplication.getContext().getSystemService("sensor");
          Sensor localSensor = K.getDefaultSensor(19);
          if (localSensor == null) {
            continue;
          }
          if (!N) {}
          try
          {
            Object localObject = new IntentFilter();
            ((IntentFilter)localObject).addAction("android.intent.action.ACTION_SHUTDOWN");
            ((IntentFilter)localObject).addAction("MSF_Action_Refresh_Steps");
            BaseApplication.getContext().registerReceiver(aE, (IntentFilter)localObject);
            N = true;
            localObject = new Intent("MSF_Action_Refresh_Steps");
            ((Intent)localObject).setAction("MSF_Action_Refresh_Steps");
            localObject = PendingIntent.getBroadcast(BaseApplication.getContext(), 0, (Intent)localObject, 0);
            AlarmManager localAlarmManager = (AlarmManager)BaseApplication.getContext().getSystemService("alarm");
            Calendar localCalendar = Calendar.getInstance();
            localCalendar.set(11, 23);
            localCalendar.set(12, 55);
            localCalendar.set(13, 0);
            localAlarmManager.setRepeating(0, localCalendar.getTimeInMillis(), 86400000L, (PendingIntent)localObject);
            if (ac == null) {
              new Thread(new s()).start();
            }
            L = new t();
            try
            {
              localObject = K.getClass().getMethod("registerListener", new Class[] { SensorEventListener.class, Sensor.class, Integer.TYPE, Integer.TYPE });
              ((Method)localObject).setAccessible(true);
              ((Method)localObject).invoke(K, new Object[] { L, localSensor, Integer.valueOf(3), Integer.valueOf(360000000) });
              return;
            }
            catch (Exception localException1) {}
            if (QLog.isColorLevel())
            {
              QLog.e("health_manager", 2, "Exception:" + localException1.toString());
              return;
            }
          }
          catch (Exception localException2)
          {
            for (;;)
            {
              if (QLog.isColorLevel()) {
                QLog.e("health_manager", 2, "register receiver Exception:" + localException2.toString());
              }
            }
          }
        }
      }
    } while (paramInt != Q);
  }
  
  private void a(int paramInt, Bundle paramBundle)
  {
    Object localObject = BaseApplication.getContext();
    String str = aj.c;
    if (Build.VERSION.SDK_INT > 10) {}
    for (int i1 = 4;; i1 = 0)
    {
      localObject = ((BaseApplication)localObject).getSharedPreferences(str, i1);
      switch (paramInt)
      {
      default: 
        return;
      }
    }
    paramInt = ((SharedPreferences)localObject).getInt("showQQWiFiNotifyCount", 0);
    ((SharedPreferences)localObject).edit().putInt("showQQWiFiNotifyCount", paramInt + 1).commit();
    return;
    ((SharedPreferences)localObject).edit().putInt("QQWiFiShowRedTouch", paramBundle.getInt("id")).commit();
    return;
    paramInt = ((SharedPreferences)localObject).getInt("showQQWiFiAvailExtend", 0);
    ((SharedPreferences)localObject).edit().putInt("showQQWiFiAvailExtend", paramInt + 1).commit();
  }
  
  private void a(int paramInt, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((c(paramInt)) || (paramBoolean2))
    {
      a(paramInt, paramString, paramBoolean1);
      al = paramInt;
      am = paramString;
      if (paramInt != 1008) {
        ay = true;
      }
    }
  }
  
  private void a(Intent paramIntent, int paramInt1, int paramInt2, String paramString1, String paramString2, String paramString3)
  {
    NotificationManager localNotificationManager = (NotificationManager)BaseApplication.getContext().getSystemService("notification");
    if (an == null) {
      an = new RemoteViews(BaseApplication.getContext().getPackageName(), BaseApplication.qqWifiLayout);
    }
    Object localObject;
    int i1;
    if (Build.VERSION.SDK_INT >= 11)
    {
      an.setImageViewResource(BaseApplication.qqWifiSettingViewId, BaseApplication.qqWifiSettings);
      an.setViewVisibility(BaseApplication.qqWifiRedTouchViewId, 8);
      localObject = new Intent("com.tencent.mobileqq.msf.qqwifi.settings");
      ((Intent)localObject).putExtras(new Bundle());
      ((Intent)localObject).addFlags(603979776);
      localObject = PendingIntent.getActivity(BaseApplication.getContext(), 0, (Intent)localObject, 134217728);
      an.setOnClickPendingIntent(BaseApplication.qqWifiSettingViewId, (PendingIntent)localObject);
      localObject = BaseApplication.getContext();
      if (Build.VERSION.SDK_INT <= 10) {
        break label672;
      }
      i1 = 4;
      localObject = ((BaseApplication)localObject).getSharedPreferences("qqwifi", i1);
      i1 = ((SharedPreferences)localObject).getInt("BarOperation_id", 0);
      if (i1 != 0)
      {
        boolean bool = ((SharedPreferences)localObject).getBoolean(aj.c + "hasClicked" + i1, false);
        long l1 = ((SharedPreferences)localObject).getLong("BarOperation_expiry", 0L);
        if ((!bool) && (System.currentTimeMillis() < l1 * 1000L))
        {
          int i2 = ((SharedPreferences)localObject).getInt("BarOperation_type", 0);
          localObject = ((SharedPreferences)localObject).getString("BarOperation_url", "");
          Intent localIntent = new Intent("com.tencent.mobileqq.msf.qqwifi.redtouch");
          localIntent.putExtra("type", i2);
          localIntent.putExtra("url", (String)localObject);
          localIntent.putExtra("id", i1);
          localIntent.addFlags(603979776);
          localObject = PendingIntent.getActivity(BaseApplication.getContext(), 0, localIntent, 134217728);
          an.setOnClickPendingIntent(BaseApplication.qqWifiRedTouchViewId, (PendingIntent)localObject);
          an.setImageViewResource(BaseApplication.qqWifiRedTouchViewId, BaseApplication.qqWifiOperation);
          an.setViewVisibility(BaseApplication.qqWifiRedTouchViewId, 0);
          localObject = new Bundle();
          ((Bundle)localObject).putInt("id", i1);
          a(2, (Bundle)localObject);
        }
      }
    }
    an.setImageViewResource(BaseApplication.qqWifiStateIconViewId, paramInt2);
    an.setTextViewText(BaseApplication.qqWifiStateTextSingleLine, paramString1);
    an.setViewVisibility(BaseApplication.qqWifiTextDoubleLine, 8);
    an.setViewVisibility(BaseApplication.qqWifiStateTextSingleLine, 0);
    if (ak == null)
    {
      ak = new Notification();
      if (Build.VERSION.SDK_INT >= 16) {
        ak.priority = 2;
      }
      localObject = ak;
      flags |= 0x20;
      ak.contentView = an;
    }
    if (paramInt1 == 1008)
    {
      ak.flags = 16;
      label535:
      paramIntent = PendingIntent.getActivity(BaseApplication.getContext(), f.C, paramIntent, 0);
      if (BaseApplication.qqWifiNoSignal != paramInt2) {
        break label690;
      }
      ak.icon = BaseApplication.qqwifinotifynoneicon;
      label564:
      if (paramString3 == null) {
        break label741;
      }
      ak.defaults = 1;
    }
    for (ak.tickerText = paramString3;; ak.tickerText = "")
    {
      ak.contentIntent = paramIntent;
      localNotificationManager.notify(f.C, ak);
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "type=" + paramInt1 + "," + paramString1 + ", " + paramString2 + "," + paramString3);
      }
      return;
      label672:
      i1 = 0;
      break;
      ak.flags = 32;
      break label535;
      label690:
      if (BaseApplication.qqWifiUserful == paramInt2)
      {
        ak.icon = BaseApplication.qqwifinotifyusefulicon;
        break label564;
      }
      if (BaseApplication.qqWifiConnecticon3 == paramInt2)
      {
        ak.icon = BaseApplication.qqwifinotifyconnectedicon;
        break label564;
      }
      ak.icon = paramInt2;
      break label564;
      label741:
      ak.defaults = 0;
    }
  }
  
  private void a(SharedPreferences paramSharedPreferences)
  {
    int i2 = 0;
    Object localObject1 = paramSharedPreferences;
    int i1;
    if (paramSharedPreferences == null)
    {
      paramSharedPreferences = BaseApplication.getContext();
      if (Build.VERSION.SDK_INT > 10)
      {
        i1 = 4;
        localObject1 = paramSharedPreferences.getSharedPreferences("mobileQQ", i1);
      }
    }
    else if (localObject1 != null)
    {
      paramSharedPreferences = ((SharedPreferences)localObject1).getString("autoconnect_bssids", "");
      if (!TextUtils.isEmpty(paramSharedPreferences))
      {
        localObject1 = paramSharedPreferences.split("\\|");
        if ((localObject1 != null) && (localObject1.length != 0)) {
          break label143;
        }
        av.add(paramSharedPreferences);
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "updateConfig, bssidsString=" + paramSharedPreferences + " ssid list=" + av.toString());
      }
      return;
      i1 = 0;
      break;
      label143:
      int i3 = localObject1.length;
      i1 = i2;
      while (i1 < i3)
      {
        Object localObject2 = localObject1[i1];
        av.add(localObject2);
        i1 += 1;
      }
    }
  }
  
  private void a(MsfCore paramMsfCore)
  {
    f();
    paramMsfCore = new IntentFilter();
    paramMsfCore.addAction("android.intent.action.SCREEN_ON");
    paramMsfCore.addAction("android.intent.action.SCREEN_OFF");
    paramMsfCore.addAction("android.net.wifi.SCAN_RESULTS");
    BaseApplication.getContext().registerReceiver(aD, paramMsfCore);
    e();
  }
  
  public static void a(String paramString, ToServiceMsg paramToServiceMsg)
  {
    Object localObject = paramToServiceMsg.getServiceCmd();
    if (TextUtils.isEmpty((CharSequence)localObject)) {}
    do
    {
      do
      {
        return;
        if (((String)localObject).equals("cmd_refresh_steps"))
        {
          if (QLog.isColorLevel()) {
            QLog.i("health_manager", 2, "MSF_Action_Refresh_Steps:" + M);
          }
          if ((!M) && (K != null) && (L != null))
          {
            K.unregisterListener(L);
            K = null;
            L = null;
          }
          if ((!M) || (H <= X))
          {
            localObject = g.a(paramToServiceMsg);
            ((FromServiceMsg)localObject).setMsgSuccess();
            if (ac != null) {
              ((FromServiceMsg)localObject).addAttribute("StepInfoJSON", ac.toString());
            }
            com.tencent.mobileqq.msf.service.c.a(paramString, paramToServiceMsg, (FromServiceMsg)localObject);
            return;
          }
          X = H;
          a(true, paramString, paramToServiceMsg);
          return;
        }
        if (((String)localObject).equals("cmd_health_switch"))
        {
          localObject = g.a(paramToServiceMsg);
          ((FromServiceMsg)localObject).setMsgSuccess();
          boolean bool = ((Boolean)paramToServiceMsg.getAttribute("isOpen", Boolean.valueOf(false))).booleanValue();
          if (QLog.isColorLevel()) {
            QLog.i("health_manager", 2, "Action_Register_Step_Listener:" + bool);
          }
          if (bool) {}
          for (;;)
          {
            try
            {
              if (!M)
              {
                M = true;
                a(O);
              }
              X = H;
              a(false, null, null);
            }
            catch (Exception localException)
            {
              if (!QLog.isColorLevel()) {
                continue;
              }
              QLog.e("health_manager", 2, "Exception:" + localException.toString());
              ((FromServiceMsg)localObject).setMsgFail();
              continue;
            }
            com.tencent.mobileqq.msf.service.c.a(paramString, paramToServiceMsg, (FromServiceMsg)localObject);
            return;
            M = false;
            if ((K != null) && (L != null))
            {
              if (QLog.isColorLevel()) {
                QLog.i("health_manager", 2, "step counter off.");
              }
              K.unregisterListener(L);
              K = null;
              L = null;
            }
          }
        }
      } while (!((String)localObject).equals("cmd_update_lastreport_time"));
      paramString = paramToServiceMsg.getAttribute("last_report_time");
      if ((paramString instanceof Long)) {
        aa = ((Long)paramString).longValue();
      }
      paramString = paramToServiceMsg.getAttribute("has_report_yes");
    } while ((!(paramString instanceof Boolean)) || (!((Boolean)paramString).booleanValue()));
    ac = new JSONObject();
    paramString = Calendar.getInstance();
    paramString.set(11, 0);
    paramString.set(12, 0);
    paramString.set(13, 0);
    paramString.set(14, 0);
    paramString = String.valueOf(paramString.getTimeInMillis());
    try
    {
      ac.put(paramString + "_offset", Y);
      ac.put(paramString + "_init", W);
      ac.put(paramString + "_total", X);
      ac.put("isStepCounterEnable", M);
      ac.put("last_report_time", aa);
      return;
    }
    catch (Exception paramString) {}
  }
  
  private void a(ArrayList paramArrayList)
  {
    if (QLog.isColorLevel()) {
      QLog.i("QQWiFiScanManager", 2, "checkAvailForOperation");
    }
    boolean bool = c(paramArrayList);
    if (QLog.isColorLevel()) {
      QLog.d("QQWiFiScanManager", 2, "processWiFiScanResultForBar, hasIntersection=" + bool);
    }
    if (bool) {
      d(paramArrayList);
    }
    Object localObject = new ArrayList();
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      d localD = (d)localIterator.next();
      if (c < -80) {
        localIterator.remove();
      } else {
        ((List)localObject).add(b);
      }
    }
    if (!a(at, (List)localObject))
    {
      e(paramArrayList);
      at.clear();
      paramArrayList = ((List)localObject).iterator();
      while (paramArrayList.hasNext())
      {
        localObject = (String)paramArrayList.next();
        at.add(localObject);
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("QQWiFiScanManager", 2, "processWiFiScanResultForOperation, isSubset=true");
    }
  }
  
  private void a(List paramList)
  {
    if (paramList != null) {
      try
      {
        if (paramList.isEmpty()) {
          return;
        }
        paramList = new ArrayList(paramList);
        if (QLog.isColorLevel()) {
          QLog.i("QQWiFiScanManager", 2, "startAutoConnect services all avail:" + paramList.toString());
        }
        if (!q())
        {
          if (!QLog.isColorLevel()) {
            return;
          }
          QLog.i("QQWiFiScanManager", 2, "shouldAutoConnect isEnableAutoconnect false,return");
        }
      }
      catch (Exception paramList)
      {
        if (QLog.isColorLevel())
        {
          paramList.printStackTrace();
          return;
          paramList = d(paramList);
          if ((paramList == null) || (paramList.isEmpty()))
          {
            if (QLog.isColorLevel()) {
              QLog.i("QQWiFiScanManager", 2, "shouldAutoConnect services empty after filtered,return");
            }
          }
          else if (b(paramList))
          {
            if (QLog.isColorLevel()) {
              QLog.i("QQWiFiScanManager", 2, "shouldAutoConnect in time protected,return");
            }
          }
          else
          {
            if (QLog.isColorLevel()) {
              QLog.i("QQWiFiScanManager", 2, "startAutoConnect services:" + paramList.toString());
            }
            ar = System.currentTimeMillis();
            Intent localIntent = new Intent("com.tencent.mobileqq.msf.qqwifi.autoconnect");
            localIntent.putExtra("services", new ArrayList(paramList));
            BaseApplication.getContext().sendBroadcast(localIntent);
          }
        }
      }
    }
  }
  
  public static void a(boolean paramBoolean, String paramString, ToServiceMsg paramToServiceMsg)
  {
    if (X == 0.0F) {
      return;
    }
    new Thread(new v(paramBoolean, paramString, paramToServiceMsg)).start();
  }
  
  private boolean a(String paramString)
  {
    boolean bool = false;
    BaseApplication localBaseApplication;
    String str;
    if (!TextUtils.isEmpty(paramString))
    {
      localBaseApplication = BaseApplication.getContext();
      str = localBaseApplication.getPackageName() + "_preferences";
      if (Build.VERSION.SDK_INT <= 10) {
        break label119;
      }
    }
    label119:
    for (int i1 = 4;; i1 = 0)
    {
      bool = localBaseApplication.getSharedPreferences(str, i1).getBoolean("login_auto" + paramString, false);
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "canAutoLogin=" + bool);
      }
      return bool;
    }
  }
  
  private boolean a(List paramList1, List paramList2)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramList1 != null)
    {
      bool1 = bool2;
      if (paramList2 != null)
      {
        bool1 = bool2;
        if (paramList1.size() > 0)
        {
          Iterator localIterator = paramList2.iterator();
          int i1 = 0;
          while ((localIterator.hasNext()) && (paramList1.contains(localIterator.next()))) {
            i1 += 1;
          }
          bool1 = bool2;
          if (i1 == paramList2.size()) {
            bool1 = true;
          }
        }
      }
    }
    return bool1;
  }
  
  private void b(int paramInt)
  {
    int i1 = 4;
    int i2 = 0;
    Object localObject2;
    switch (paramInt)
    {
    default: 
    case 0: 
    case 2: 
    case 6: 
    case 1: 
      do
      {
        do
        {
          for (;;)
          {
            return;
            Object localObject1 = new File(ai.getDir("qqwifi_dir", 0), "enable_file");
            if (((File)localObject1).exists()) {
              try
              {
                localObject1 = new JSONObject(a((File)localObject1));
                if (((JSONObject)localObject1).has("mIsQQWiFiEnable_" + aj.c)) {
                  aj.b = ((JSONObject)localObject1).getBoolean("mIsQQWiFiEnable_" + aj.c);
                }
                if (QLog.isColorLevel())
                {
                  QLog.d("QQWiFiScanManager", 2, "updateConfig, mIsQQWiFiEnable_" + aj.c + "=" + aj.b);
                  return;
                }
              }
              catch (Exception localException1) {}
            }
          }
        } while (!QLog.isColorLevel());
        QLog.e("QQWiFiScanManager", 2, "updateConfig, enable_file exception");
        return;
        localObject2 = BaseApplication.getContext();
        if (Build.VERSION.SDK_INT > 10) {}
        for (;;)
        {
          localObject2 = ((BaseApplication)localObject2).getSharedPreferences("mobileQQ", i1);
          if (localObject2 == null) {
            break;
          }
          aj.d = ((SharedPreferences)localObject2).getInt("bar_switch_operation" + aj.c, 0);
          if (QLog.isColorLevel()) {
            QLog.d("QQWiFiScanManager", 2, "updateConfig, BarSwitch=" + aj.d);
          }
          if (aj.d != -1) {
            break;
          }
          ay = false;
          al = 0;
          return;
          i1 = 0;
        }
        localObject2 = BaseApplication.getContext();
        if (Build.VERSION.SDK_INT > 10) {}
        for (;;)
        {
          localObject2 = ((BaseApplication)localObject2).getSharedPreferences("qqwifi", i1);
          aj.e = ((SharedPreferences)localObject2).getBoolean("availNotificationSwitch", false);
          return;
          i1 = 0;
        }
        localObject2 = new File(ai.getDir("qqwifi_dir", 0), "ssids_file");
      } while (!((File)localObject2).exists());
    }
    for (;;)
    {
      try
      {
        JSONArray localJSONArray = new JSONObject(a((File)localObject2)).getJSONArray("ssidList");
        localObject2 = "";
        i1 = localJSONArray.length();
        paramInt = i2;
        if (paramInt < localJSONArray.length())
        {
          String str = (String)localObject2 + localJSONArray.get(paramInt).toString();
          localObject2 = str;
          if (paramInt >= i1 - 1) {
            break label640;
          }
          localObject2 = str + "|";
          break label640;
        }
        aj.a = ((String)localObject2);
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("QQWiFiScanManager", 2, "updateConfig, pattern - " + (String)localObject2);
        return;
      }
      catch (Exception localException2) {}
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e("QQWiFiScanManager", 2, "updateConfig, ssids_file exception");
      return;
      u();
      return;
      b(null);
      return;
      a(null);
      return;
      label640:
      paramInt += 1;
    }
  }
  
  private void b(SharedPreferences paramSharedPreferences)
  {
    SharedPreferences localSharedPreferences = paramSharedPreferences;
    if (paramSharedPreferences == null)
    {
      paramSharedPreferences = BaseApplication.getContext();
      if (Build.VERSION.SDK_INT <= 10) {
        break label112;
      }
    }
    label112:
    for (int i1 = 4;; i1 = 0)
    {
      localSharedPreferences = paramSharedPreferences.getSharedPreferences("mobileQQ", i1);
      if (localSharedPreferences != null)
      {
        aj.m = localSharedPreferences.getInt("autoconnect_switch_operation" + aj.c, 0);
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "updateConfig, AutoSwitch=" + aj.m);
        }
      }
      return;
    }
  }
  
  private void b(ArrayList paramArrayList)
  {
    boolean bool = c(paramArrayList);
    if (QLog.isColorLevel()) {
      QLog.d("QQWiFiScanManager", 2, "processWiFiScanResultForBar, hasIntersection=" + bool);
    }
    if (bool) {
      if (n())
      {
        if (l()) {
          a(1008, "", false, false);
        }
        d(paramArrayList);
      }
    }
    ArrayList localArrayList;
    do
    {
      return;
      a(1001, "", false, false);
      break;
      localArrayList = new ArrayList();
      Object localObject2;
      d localD;
      if (QLog.isColorLevel())
      {
        localObject1 = new StringBuilder();
        localObject2 = paramArrayList.iterator();
        while (((Iterator)localObject2).hasNext())
        {
          localD = (d)((Iterator)localObject2).next();
          ((StringBuilder)localObject1).append(a + "," + b + "," + c + "|");
        }
        QLog.d("QQWiFiScanManager", 2, "scanlist before filter:" + ((StringBuilder)localObject1).toString());
      }
      Object localObject1 = paramArrayList.iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (d)((Iterator)localObject1).next();
        if (c < -80) {
          ((Iterator)localObject1).remove();
        } else {
          localArrayList.add(b);
        }
      }
      if (QLog.isColorLevel())
      {
        localObject1 = new StringBuilder();
        localObject2 = paramArrayList.iterator();
        while (((Iterator)localObject2).hasNext())
        {
          localD = (d)((Iterator)localObject2).next();
          ((StringBuilder)localObject1).append(a + "," + b + "," + c + "|");
        }
        QLog.d("QQWiFiScanManager", 2, "scanlist after filter:" + ((StringBuilder)localObject1).toString());
        QLog.d("QQWiFiScanManager", 2, "bssidSet:" + localArrayList.toString());
      }
      bool = a(as, localArrayList);
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "processWiFiScanResultForBar, isSubset=" + bool + ", bssidSet.size=" + localArrayList.size());
      }
    } while (bool);
    e(paramArrayList);
    as.clear();
    as.addAll(localArrayList);
  }
  
  private static boolean b(Context paramContext)
  {
    paramContext = (ConnectivityManager)paramContext.getSystemService("connectivity");
    if (paramContext == null) {
      return false;
    }
    try
    {
      paramContext = paramContext.getActiveNetworkInfo();
      if (paramContext != null)
      {
        boolean bool = paramContext.isConnected();
        if (bool) {
          return true;
        }
      }
    }
    catch (Exception paramContext) {}
    return false;
  }
  
  private boolean b(String paramString)
  {
    boolean bool1 = false;
    if (!TextUtils.isEmpty(paramString))
    {
      paramString = paramString.replace("\"", "");
      Pattern localPattern = Pattern.compile(aj.a);
      boolean bool2 = localPattern.matcher(paramString).matches();
      bool1 = bool2;
      if (QLog.isColorLevel())
      {
        QLog.d("QQWiFiScanManager", 2, "isQQWiFi, " + localPattern + ", " + paramString + ", " + bool2);
        bool1 = bool2;
      }
    }
    return bool1;
  }
  
  private boolean b(List paramList)
  {
    boolean bool2 = false;
    Object localObject = BaseApplication.getContext();
    if (Build.VERSION.SDK_INT > 10) {}
    for (int i1 = 4;; i1 = 0)
    {
      localObject = ((BaseApplication)localObject).getSharedPreferences("mobileQQ", i1);
      boolean bool1 = bool2;
      if (localObject != null)
      {
        long l1 = ((SharedPreferences)localObject).getLong("autoconnect_reference_time", 0L);
        long l2 = System.currentTimeMillis() - l1;
        if (QLog.isColorLevel()) {
          QLog.i("QQWiFiScanManager", 2, "isInAutoconnectIntervalProtected lasttime=" + l1 + " interval=" + l2 + " autoConnectProtectedInterval=" + aj.n);
        }
        bool1 = bool2;
        if (l2 < aj.n)
        {
          bool1 = bool2;
          if (c(paramList)) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
  }
  
  private boolean c(int paramInt)
  {
    if (ay)
    {
      if (aw) {
        break label85;
      }
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "canPushNotification, not registered.");
      }
    }
    label29:
    label85:
    label239:
    label292:
    do
    {
      do
      {
        return false;
        try
        {
          List localList = ((WifiManager)ai.getSystemService("wifi")).getScanResults();
          if (localList == null) {
            break label29;
          }
          if (localList.size() > 0) {
            break;
          }
          return false;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.d("QQWiFiScanManager", 2, localException.getMessage());
            }
            localObject = null;
          }
        }
        Object localObject = BaseApplication.getContext();
        if (Build.VERSION.SDK_INT > 10) {}
        for (int i1 = 4;; i1 = 0)
        {
          localObject = ((BaseApplication)localObject).getSharedPreferences("mobileQQ", i1);
          if ((localObject != null) && (!TextUtils.isEmpty(aj.c)))
          {
            aj.d = ((SharedPreferences)localObject).getInt("bar_switch_operation" + aj.c, 0);
            if (QLog.isColorLevel()) {
              QLog.d("QQWiFiScanManager", 2, "canPushNotification, BarSwitch=" + aj.d);
            }
          }
          if ((!n()) || (paramInt == 1008)) {
            break label239;
          }
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d("QQWiFiScanManager", 2, "canPushNotification, bar closed.");
          return false;
        }
        localObject = ((ConnectivityManager)ai.getSystemService("connectivity")).getActiveNetworkInfo();
        if ((localObject == null) || (((NetworkInfo)localObject).getType() != 1) || (paramInt != 1001)) {
          break label292;
        }
      } while (!QLog.isColorLevel());
      QLog.d("QQWiFiScanManager", 2, "canPushNotification, dont push qqwifi info while wifi is connected");
      return false;
    } while (!a(aj.c));
    return true;
  }
  
  private boolean c(ArrayList paramArrayList)
  {
    if (au != null)
    {
      HashSet localHashSet = new HashSet();
      Iterator localIterator = au.iterator();
      while (localIterator.hasNext()) {
        localHashSet.add(nextwifi.b);
      }
      paramArrayList = paramArrayList.iterator();
      while (paramArrayList.hasNext()) {
        if (localHashSet.contains(nextb)) {
          return true;
        }
      }
    }
    return false;
  }
  
  private boolean c(List paramList)
  {
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      localArrayList.add(nextwifi.b);
    }
    int i2 = Math.min(Math.min(localArrayList.size(), av.size()), aj.o);
    if (QLog.isColorLevel()) {
      QLog.i("QQWiFiScanManager", 2, "lastAutoBssids=" + av.toString() + " curSet:" + localArrayList.toString() + " isSubSet=" + " maxAutoConnecttimes=" + aj.o + " min=" + i2);
    }
    int i1 = 0;
    while (i1 < i2)
    {
      paramList = (String)localArrayList.get(i1);
      if (av.contains(paramList))
      {
        if (QLog.isColorLevel()) {
          QLog.i("QQWiFiScanManager", 2, "return true:" + paramList + "has already tryed i=" + i1);
        }
        return true;
      }
      i1 += 1;
    }
    i();
    return false;
  }
  
  private List d(List paramList)
  {
    if (paramList == null) {
      return new ArrayList();
    }
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      WiFiService localWiFiService = (WiFiService)paramList.next();
      if ((autoConnFlag == 1) && (localArrayList.size() < aj.o)) {
        localArrayList.add(localWiFiService);
      }
    }
    if (QLog.isColorLevel()) {
      QLog.i("QQWiFiScanManager", 2, "after filtered:" + localArrayList.toString());
    }
    return localArrayList;
  }
  
  private void d(ArrayList paramArrayList)
  {
    if (q())
    {
      HashSet localHashSet = new HashSet();
      Iterator localIterator = au.iterator();
      while (localIterator.hasNext())
      {
        WiFiService localWiFiService = (WiFiService)localIterator.next();
        if (autoConnFlag == 1) {
          localHashSet.add(wifi.b);
        }
      }
      paramArrayList = paramArrayList.iterator();
      do
      {
        if (!paramArrayList.hasNext()) {
          break;
        }
      } while (!localHashSet.contains(nextb));
    }
    for (boolean bool = true;; bool = false)
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "processWiFiScanResultForBar, hasAutoIntersection=" + bool);
      }
      if (bool) {
        a(au);
      }
      return;
    }
  }
  
  private void e(ArrayList paramArrayList)
  {
    try
    {
      aq = System.currentTimeMillis();
      int i1 = m();
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "getAvailableQQWifi size:" + paramArrayList.size() + " scanType=" + i1 + " needcallback=" + true);
      }
      Object localObject = new UniPacket(true);
      ((UniPacket)localObject).setEncodeName("UTF-8");
      a localA = new a();
      a = paramArrayList;
      b = c.f(ai);
      c = "Android";
      d = i1;
      ((UniPacket)localObject).setServantName("MQQ.QQWiFiMgrServer.QQWiFiMgrObj");
      ((UniPacket)localObject).setFuncName("AvailQQWiFiForMSF");
      ((UniPacket)localObject).put("req", localA);
      paramArrayList = ((UniPacket)localObject).encode();
      localObject = new ToServiceMsg("mobileqq.service", aj.c, "QQWifiSvc.AvailQQWiFiForMSF");
      ((ToServiceMsg)localObject).setAppId(ah.sender.f());
      ((ToServiceMsg)localObject).setRequestSsoSeq(MsfCore.getNextSeq());
      ((ToServiceMsg)localObject).setTimeout(20000L);
      ((ToServiceMsg)localObject).setNeedCallback(true);
      ((ToServiceMsg)localObject).putWupBuffer(paramArrayList);
      ((ToServiceMsg)localObject).addAttribute("isformsf", Boolean.valueOf(true));
      ah.sendSsoMsg((ToServiceMsg)localObject);
      return;
    }
    catch (Exception paramArrayList)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("QQWiFiScanManager", 2, "getAvailableQQWifi exp:" + paramArrayList);
    }
  }
  
  private void f()
  {
    if (ax) {
      return;
    }
    ax = true;
    h();
    g();
    u();
  }
  
  /* Error */
  private void g()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 289	com/tencent/mobileqq/msf/core/o:ai	Landroid/content/Context;
    //   4: ldc_w 398
    //   7: iconst_0
    //   8: invokevirtual 404	android/content/Context:getDir	(Ljava/lang/String;I)Ljava/io/File;
    //   11: astore_3
    //   12: new 214	java/io/File
    //   15: dup
    //   16: aload_3
    //   17: ldc_w 1015
    //   20: invokespecial 409	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   23: astore 4
    //   25: aload 4
    //   27: invokevirtual 1018	java/io/File:exists	()Z
    //   30: ifeq +144 -> 174
    //   33: new 351	org/json/JSONObject
    //   36: dup
    //   37: aload_0
    //   38: aload 4
    //   40: invokevirtual 412	com/tencent/mobileqq/msf/core/o:a	(Ljava/io/File;)Ljava/lang/String;
    //   43: invokespecial 413	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   46: astore 4
    //   48: aload 4
    //   50: new 196	java/lang/StringBuilder
    //   53: dup
    //   54: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   57: ldc_w 1020
    //   60: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: aload_0
    //   64: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   67: getfield 573	com/tencent/mobileqq/msf/core/o$a:c	Ljava/lang/String;
    //   70: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   73: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   76: invokevirtual 1023	org/json/JSONObject:has	(Ljava/lang/String;)Z
    //   79: ifeq +95 -> 174
    //   82: aload_0
    //   83: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   86: aload 4
    //   88: new 196	java/lang/StringBuilder
    //   91: dup
    //   92: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   95: ldc_w 1020
    //   98: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   101: aload_0
    //   102: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   105: getfield 573	com/tencent/mobileqq/msf/core/o$a:c	Ljava/lang/String;
    //   108: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   111: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   114: invokevirtual 1025	org/json/JSONObject:getBoolean	(Ljava/lang/String;)Z
    //   117: putfield 1027	com/tencent/mobileqq/msf/core/o$a:b	Z
    //   120: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   123: ifeq +51 -> 174
    //   126: ldc 64
    //   128: iconst_2
    //   129: new 196	java/lang/StringBuilder
    //   132: dup
    //   133: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   136: ldc_w 1322
    //   139: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: aload_0
    //   143: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   146: getfield 573	com/tencent/mobileqq/msf/core/o$a:c	Ljava/lang/String;
    //   149: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   152: ldc_w 1031
    //   155: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   158: aload_0
    //   159: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   162: getfield 1027	com/tencent/mobileqq/msf/core/o$a:b	Z
    //   165: invokevirtual 840	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   168: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   171: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   174: new 214	java/io/File
    //   177: dup
    //   178: aload_3
    //   179: ldc_w 1045
    //   182: invokespecial 409	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   185: astore_3
    //   186: aload_3
    //   187: invokevirtual 1018	java/io/File:exists	()Z
    //   190: ifeq +170 -> 360
    //   193: new 351	org/json/JSONObject
    //   196: dup
    //   197: aload_0
    //   198: aload_3
    //   199: invokevirtual 412	com/tencent/mobileqq/msf/core/o:a	(Ljava/io/File;)Ljava/lang/String;
    //   202: invokespecial 413	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   205: ldc_w 1047
    //   208: invokevirtual 1050	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   211: astore 5
    //   213: aload 5
    //   215: invokevirtual 343	org/json/JSONArray:length	()I
    //   218: istore_2
    //   219: ldc -13
    //   221: astore_3
    //   222: iconst_0
    //   223: istore_1
    //   224: iload_1
    //   225: aload 5
    //   227: invokevirtual 343	org/json/JSONArray:length	()I
    //   230: if_icmpge +90 -> 320
    //   233: new 196	java/lang/StringBuilder
    //   236: dup
    //   237: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   240: aload_3
    //   241: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   244: aload 5
    //   246: iload_1
    //   247: invokevirtual 1054	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   250: invokevirtual 808	java/lang/Object:toString	()Ljava/lang/String;
    //   253: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   256: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   259: astore 4
    //   261: aload 4
    //   263: astore_3
    //   264: iload_1
    //   265: iload_2
    //   266: iconst_1
    //   267: isub
    //   268: if_icmpge +25 -> 293
    //   271: new 196	java/lang/StringBuilder
    //   274: dup
    //   275: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   278: aload 4
    //   280: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   283: ldc_w 389
    //   286: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   289: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   292: astore_3
    //   293: iload_1
    //   294: iconst_1
    //   295: iadd
    //   296: istore_1
    //   297: goto -73 -> 224
    //   300: astore 4
    //   302: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   305: ifeq -131 -> 174
    //   308: ldc 64
    //   310: iconst_2
    //   311: ldc_w 1324
    //   314: invokestatic 320	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   317: goto -143 -> 174
    //   320: aload_0
    //   321: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   324: aload_3
    //   325: putfield 1056	com/tencent/mobileqq/msf/core/o$a:a	Ljava/lang/String;
    //   328: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   331: ifeq +29 -> 360
    //   334: ldc 64
    //   336: iconst_2
    //   337: new 196	java/lang/StringBuilder
    //   340: dup
    //   341: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   344: ldc_w 1326
    //   347: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   350: aload_3
    //   351: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   354: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   357: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   360: return
    //   361: astore_3
    //   362: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   365: ifeq -5 -> 360
    //   368: ldc 64
    //   370: iconst_2
    //   371: ldc_w 1328
    //   374: invokestatic 320	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   377: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	378	0	this	o
    //   223	74	1	i1	int
    //   218	50	2	i2	int
    //   11	340	3	localObject1	Object
    //   361	1	3	localException1	Exception
    //   23	256	4	localObject2	Object
    //   300	1	4	localException2	Exception
    //   211	34	5	localJSONArray	JSONArray
    // Exception table:
    //   from	to	target	type
    //   33	174	300	java/lang/Exception
    //   193	219	361	java/lang/Exception
    //   224	261	361	java/lang/Exception
    //   271	293	361	java/lang/Exception
    //   320	360	361	java/lang/Exception
  }
  
  private void h()
  {
    int i2 = 4;
    Object localObject = BaseApplication.getContext();
    if (Build.VERSION.SDK_INT > 10)
    {
      i1 = 4;
      localObject = ((BaseApplication)localObject).getSharedPreferences("Last_Login", i1);
      if (localObject != null)
      {
        aj.c = ((SharedPreferences)localObject).getString("uin", "");
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "lastLoginUin = " + aj.c);
        }
      }
      localObject = BaseApplication.getContext();
      if (Build.VERSION.SDK_INT <= 10) {
        break label227;
      }
    }
    label227:
    for (int i1 = i2;; i1 = 0)
    {
      localObject = ((BaseApplication)localObject).getSharedPreferences("mobileQQ", i1);
      if (localObject != null)
      {
        aj.d = ((SharedPreferences)localObject).getInt("bar_switch_operation" + aj.c, 0);
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "initConfig, barOperation=" + aj.d);
        }
        a((SharedPreferences)localObject);
        b((SharedPreferences)localObject);
      }
      ((SharedPreferences)localObject).edit().putBoolean("hasPushedAvailNotification", false).commit();
      return;
      i1 = 0;
      break;
    }
  }
  
  private void i()
  {
    Object localObject = BaseApplication.getContext();
    if (Build.VERSION.SDK_INT > 10) {}
    for (int i1 = 4;; i1 = 0)
    {
      localObject = ((BaseApplication)localObject).getSharedPreferences("mobileQQ", i1);
      if (localObject != null) {
        ((SharedPreferences)localObject).edit().remove("autoconnect_bssids").commit();
      }
      return;
    }
  }
  
  private void j()
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQWiFiScanManager", 2, "onAccountChange");
    }
    b(0);
    b(2);
    b(4);
    b(3);
    if ((aw) && (ay) && (n()))
    {
      ((NotificationManager)BaseApplication.getContext().getSystemService("notification")).cancel(f.C);
      ay = false;
      al = 0;
    }
  }
  
  private boolean k()
  {
    if (aB) {
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult isCurUinQuited true, return false");
      }
    }
    label119:
    label518:
    do
    {
      int i1;
      do
      {
        Object localObject;
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  return false;
                  localObject = BaseApplication.getContext();
                  if (Build.VERSION.SDK_INT > 10) {}
                  for (i1 = 4;; i1 = 0)
                  {
                    localObject = ((BaseApplication)localObject).getSharedPreferences("Last_Login", i1).getString("uin", "");
                    if (!TextUtils.isEmpty((CharSequence)localObject)) {
                      break label119;
                    }
                    if (!QLog.isColorLevel()) {
                      break;
                    }
                    QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult, uin=" + (String)localObject + ", " + aj.c);
                    return false;
                  }
                  if (!((String)localObject).equals(aj.c))
                  {
                    if (QLog.isColorLevel()) {
                      QLog.d("QQWiFiScanManager", 2, "onAccountChange, " + aj.c + ", " + (String)localObject);
                    }
                    aj.c = ((String)localObject);
                    j();
                  }
                } while (!a(aj.c));
                if (aA) {
                  break;
                }
              } while (!QLog.isColorLevel());
              QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult, isScreenOn = false");
              return false;
              if (aw) {
                break;
              }
            } while (!QLog.isColorLevel());
            QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult, isRegistered = false");
            return false;
            if (aj.b) {
              break;
            }
          } while (!QLog.isColorLevel());
          QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult, isQQWifiEnable = false");
          return false;
          localObject = ((ConnectivityManager)ai.getSystemService("connectivity")).getActiveNetworkInfo();
          if ((localObject == null) || (((NetworkInfo)localObject).getType() != 1)) {
            break;
          }
          WifiInfo localWifiInfo = ((WifiManager)BaseApplication.getContext().getSystemService("wifi")).getConnectionInfo();
          String str = "";
          localObject = str;
          if (localWifiInfo != null)
          {
            localObject = str;
            if (!TextUtils.isEmpty(localWifiInfo.getSSID())) {
              localObject = localWifiInfo.getSSID().replace("\"", "");
            }
          }
        } while (b((String)localObject));
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult, push notification, ssid=" + (String)localObject);
        }
        a(1007, (String)localObject, false, false);
        return false;
        if ((localObject == null) || (!((NetworkInfo)localObject).isAvailable()))
        {
          if (QLog.isColorLevel()) {
            QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult, push no network access");
          }
          a(1003, "", false, false);
          return false;
        }
        i1 = m();
        if (i1 > 0) {
          break;
        }
      } while (!l());
      return true;
      if (i1 == 2)
      {
        if (!l()) {
          break label518;
        }
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult, operation can push availwifi to bar-closed user.");
        }
      }
      while (System.currentTimeMillis() - aq >= aj.k)
      {
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult, true");
        }
        return true;
      }
    } while (!QLog.isColorLevel());
    QLog.d("QQWiFiScanManager", 2, "shouldProcessScanResult, operation scan time limit.");
    return false;
  }
  
  private boolean l()
  {
    if (aC == 0) {
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "canPushAvailableWiFiToBarClosedUser, availpush=0");
      }
    }
    label96:
    do
    {
      return false;
      Object localObject = BaseApplication.getContext();
      if (Build.VERSION.SDK_INT > 10) {}
      for (int i1 = 4;; i1 = 0)
      {
        localObject = ((BaseApplication)localObject).getSharedPreferences("qqwifi", i1);
        long l1 = ((SharedPreferences)localObject).getLong("lastPushAvailableWiFiToBarClosedUser", 0L);
        if (System.currentTimeMillis() - l1 >= 21600000L) {
          break label96;
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("QQWiFiScanManager", 2, "canPushAvailableWiFiToBarClosedUser, time limit");
        return false;
      }
      if (((SharedPreferences)localObject).getBoolean("availNotificationSwitch", false)) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("QQWiFiScanManager", 2, "canPushAvailableWiFiToBarClosedUser, avail switch is turned off");
    return false;
    return true;
  }
  
  private int m()
  {
    int i2 = 0;
    if (!n()) {
      i2 = 1;
    }
    int i1 = i2;
    if (aj.g) {
      i1 = i2 | 0x2;
    }
    i2 = i1;
    if (o()) {
      i2 = i1 | 0x4;
    }
    if (QLog.isColorLevel()) {
      QLog.i("QQWiFiScanManager", 2, "scantype=" + i2);
    }
    return i2;
  }
  
  private boolean n()
  {
    if (aj.d == 1) {}
    do
    {
      return false;
      if (aj.d == -1) {
        return true;
      }
    } while (aj.f);
    return true;
  }
  
  private boolean o()
  {
    if (aj.m == 1) {}
    do
    {
      return true;
      if (aj.m == -1) {
        return false;
      }
    } while (aj.l);
    return false;
  }
  
  private void p()
  {
    Object localObject2;
    Object localObject1;
    Object localObject3;
    int i1;
    Object localObject4;
    Object localObject5;
    Object localObject6;
    if (!b(ai))
    {
      localObject2 = a(ai, n());
      if (!TextUtils.isEmpty((CharSequence)localObject2))
      {
        localObject1 = Pattern.compile((String)localObject2);
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "NotNetworkSupportSsidList pattern: " + (String)localObject2);
        }
        localObject2 = ((WifiManager)ai.getSystemService("wifi")).getScanResults();
        if (localObject2 != null)
        {
          localObject3 = new ArrayList();
          i1 = 0;
          while (i1 < ((List)localObject2).size())
          {
            localObject4 = (ScanResult)((List)localObject2).get(i1);
            localObject5 = SSID.replace("\"", "");
            if (((Pattern)localObject1).matcher((CharSequence)localObject5).matches())
            {
              localObject6 = new d();
              a = ((String)localObject5);
              b = BSSID;
              c = ((short)level);
              ((ArrayList)localObject3).add(localObject6);
            }
            i1 += 1;
          }
          if (!((ArrayList)localObject3).isEmpty()) {
            if (n())
            {
              localObject1 = BaseApplication.getContext();
              if (Build.VERSION.SDK_INT > 10)
              {
                i1 = 4;
                long l1 = ((BaseApplication)localObject1).getSharedPreferences("qqwifi", i1).getLong("lastPushAvailableWiFiToBarClosedUser", 0L);
                if ((l1 > 0L) && (System.currentTimeMillis() - l1 < 21600000L)) {
                  break label984;
                }
                a(1008, "", false, true);
                i1 = 1;
              }
            }
          }
        }
      }
    }
    for (;;)
    {
      label290:
      if (i1 != 0) {}
      boolean bool;
      do
      {
        return;
        i1 = 0;
        break;
        a(1001, "", false, true);
        i1 = 1;
        break label290;
        bool = k();
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "checkWiFiScanResult, shouldProcessScanResult=" + bool);
        }
      } while (!bool);
      ap = System.currentTimeMillis();
      localObject5 = new ArrayList();
      if ((!TextUtils.isEmpty(aj.a)) || (!TextUtils.isEmpty(aj.q))) {
        if (TextUtils.isEmpty(aj.a)) {
          break label978;
        }
      }
      label531:
      label966:
      label978:
      for (localObject1 = Pattern.compile(aj.a);; localObject1 = null)
      {
        if (!TextUtils.isEmpty(aj.q)) {}
        for (localObject2 = Pattern.compile(aj.q);; localObject2 = null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("QQWiFiScanManager", 2, "pattern: " + aj.a + " reportPattern: " + aj.q);
          }
          localObject6 = ((WifiManager)ai.getSystemService("wifi")).getScanResults();
          ScanResult localScanResult;
          String str;
          if (localObject6 != null)
          {
            i1 = 0;
            if (i1 < ((List)localObject6).size())
            {
              localScanResult = (ScanResult)((List)localObject6).get(i1);
              str = SSID.replace("\"", "");
              if (localObject1 == null) {
                break label966;
              }
            }
          }
          for (localObject3 = ((Pattern)localObject1).matcher(str);; localObject3 = null)
          {
            if (localObject2 != null) {}
            for (localObject4 = ((Pattern)localObject2).matcher(str);; localObject4 = null)
            {
              if (((localObject3 != null) && (((Matcher)localObject3).matches())) || ((localObject4 != null) && (((Matcher)localObject4).matches())))
              {
                localObject3 = new d();
                a = str;
                b = BSSID;
                c = ((short)level);
                ((ArrayList)localObject5).add(localObject3);
              }
              i1 += 1;
              break label531;
              if (((ArrayList)localObject5).isEmpty())
              {
                i();
                localObject1 = ((ConnectivityManager)ai.getSystemService("connectivity")).getActiveNetworkInfo();
                localObject2 = (WifiManager)ai.getSystemService("wifi");
                i1 = ((WifiManager)localObject2).getWifiState();
                if (localObject1 == null)
                {
                  if (3 == i1)
                  {
                    if (QLog.isColorLevel()) {
                      QLog.d("QQWiFiScanManager", 2, "onResponseNetChange, network inactive, push wlan disabled");
                    }
                    a(1003, "", false, false);
                    return;
                  }
                  if (QLog.isColorLevel()) {
                    QLog.d("QQWiFiScanManager", 2, "onResponseNetChange, network inactive, push no network access");
                  }
                  a(1004, "", false, false);
                  return;
                }
                if (3 != i1)
                {
                  if (QLog.isColorLevel()) {
                    QLog.d("QQWiFiScanManager", 2, "onResponseNetChange, network active, push no network access");
                  }
                  a(1004, "", false, false);
                  return;
                }
                if ((((NetworkInfo)localObject1).getType() == 1) || (((NetworkInfo)localObject1).getType() == 9))
                {
                  localObject3 = ((WifiManager)localObject2).getConnectionInfo();
                  localObject2 = "";
                  localObject1 = localObject2;
                  if (localObject3 != null)
                  {
                    localObject1 = localObject2;
                    if (!TextUtils.isEmpty(((WifiInfo)localObject3).getSSID())) {
                      localObject1 = ((WifiInfo)localObject3).getSSID().replace("\"", "");
                    }
                  }
                  a(1007, (String)localObject1, false, false);
                  return;
                }
                a(1009, "", false, false);
                return;
              }
              i1 = m();
              if (((i1 & 0x1) > 0) || (l()))
              {
                b((ArrayList)localObject5);
                return;
              }
              if (((i1 & 0x2) <= 0) && ((i1 & 0x4) <= 0)) {
                break;
              }
              a((ArrayList)localObject5);
              return;
            }
          }
        }
      }
      label984:
      i1 = 0;
    }
  }
  
  private boolean q()
  {
    if (aB) {
      if (QLog.isColorLevel()) {
        QLog.i("QQWiFiScanManager", 2, "CurUinQuited,return");
      }
    }
    do
    {
      do
      {
        do
        {
          do
          {
            return false;
            if (System.currentTimeMillis() - ar >= 60000L) {
              break;
            }
          } while (!QLog.isColorLevel());
          QLog.i("QQWiFiScanManager", 2, "shouldAutoConnect in frequency limit,return");
          return false;
          if (o()) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.i("QQWiFiScanManager", 2, "shouldAutoConnect isOpened false,return");
        return false;
        if (r()) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.i("QQWiFiScanManager", 2, "shouldAutoConnect isDeviceSituationOk false,return");
      return false;
      if (s()) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.i("QQWiFiScanManager", 2, "shouldAutoConnect isCurNetstatuAvailForAutoconnect false,return");
    return false;
    return true;
  }
  
  private boolean r()
  {
    return aA;
  }
  
  private boolean s()
  {
    NetworkInfo localNetworkInfo = ((ConnectivityManager)ai.getSystemService("connectivity")).getActiveNetworkInfo();
    if ((localNetworkInfo != null) && (localNetworkInfo.isAvailable()))
    {
      if (localNetworkInfo.getType() == 1) {
        return false;
      }
    }
    else {
      return false;
    }
    return true;
  }
  
  private boolean t()
  {
    if (!az)
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "startAccScan");
      }
      new r(this).start();
      return true;
    }
    if (QLog.isColorLevel()) {
      QLog.d("QQWiFiScanManager", 2, "startAccScan, already running.");
    }
    return false;
  }
  
  /* Error */
  private void u()
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_0
    //   2: getfield 289	com/tencent/mobileqq/msf/core/o:ai	Landroid/content/Context;
    //   5: invokespecial 1479	com/tencent/mobileqq/msf/core/o:a	(Landroid/content/Context;)Ljava/util/Map;
    //   8: astore_2
    //   9: aload_2
    //   10: ifnull +998 -> 1008
    //   13: aload_2
    //   14: ldc_w 1481
    //   17: invokeinterface 1484 2 0
    //   22: checkcast 431	java/lang/String
    //   25: astore_3
    //   26: aload_3
    //   27: ifnull +52 -> 79
    //   30: aload_0
    //   31: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   34: aload_3
    //   35: invokestatic 1487	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   38: putfield 1489	com/tencent/mobileqq/msf/core/o$a:h	I
    //   41: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   44: ifeq +35 -> 79
    //   47: ldc 64
    //   49: iconst_2
    //   50: new 196	java/lang/StringBuilder
    //   53: dup
    //   54: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   57: ldc_w 1491
    //   60: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: aload_0
    //   64: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   67: getfield 1489	com/tencent/mobileqq/msf/core/o$a:h	I
    //   70: invokevirtual 667	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   73: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   76: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   79: aload_2
    //   80: ldc_w 1493
    //   83: invokeinterface 1484 2 0
    //   88: checkcast 431	java/lang/String
    //   91: astore_3
    //   92: aload_3
    //   93: ifnull +57 -> 150
    //   96: aload_0
    //   97: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   100: aload_3
    //   101: invokestatic 1487	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   104: sipush 1000
    //   107: imul
    //   108: i2l
    //   109: putfield 1495	com/tencent/mobileqq/msf/core/o$a:i	J
    //   112: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   115: ifeq +35 -> 150
    //   118: ldc 64
    //   120: iconst_2
    //   121: new 196	java/lang/StringBuilder
    //   124: dup
    //   125: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   128: ldc_w 1491
    //   131: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   134: aload_0
    //   135: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   138: getfield 1495	com/tencent/mobileqq/msf/core/o$a:i	J
    //   141: invokevirtual 1138	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   144: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   147: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   150: aload_2
    //   151: ldc_w 1497
    //   154: invokeinterface 1484 2 0
    //   159: checkcast 431	java/lang/String
    //   162: astore_3
    //   163: aload_3
    //   164: ifnull +57 -> 221
    //   167: aload_0
    //   168: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   171: aload_3
    //   172: invokestatic 1487	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   175: sipush 1000
    //   178: imul
    //   179: i2l
    //   180: putfield 1499	com/tencent/mobileqq/msf/core/o$a:j	J
    //   183: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   186: ifeq +35 -> 221
    //   189: ldc 64
    //   191: iconst_2
    //   192: new 196	java/lang/StringBuilder
    //   195: dup
    //   196: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   199: ldc_w 1501
    //   202: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   205: aload_0
    //   206: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   209: getfield 1499	com/tencent/mobileqq/msf/core/o$a:j	J
    //   212: invokevirtual 1138	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   215: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   218: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   221: aload_2
    //   222: ldc_w 1503
    //   225: invokeinterface 1484 2 0
    //   230: checkcast 431	java/lang/String
    //   233: astore_3
    //   234: aload_0
    //   235: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   238: astore 4
    //   240: ldc_w 1505
    //   243: aload_3
    //   244: invokevirtual 835	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   247: ifeq +762 -> 1009
    //   250: iconst_1
    //   251: istore_1
    //   252: aload 4
    //   254: iload_1
    //   255: putfield 1408	com/tencent/mobileqq/msf/core/o$a:f	Z
    //   258: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   261: ifeq +45 -> 306
    //   264: ldc 64
    //   266: iconst_2
    //   267: new 196	java/lang/StringBuilder
    //   270: dup
    //   271: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   274: ldc_w 1507
    //   277: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   280: aload_0
    //   281: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   284: getfield 1408	com/tencent/mobileqq/msf/core/o$a:f	Z
    //   287: invokevirtual 840	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   290: ldc_w 772
    //   293: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   296: aload_3
    //   297: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   300: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   303: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   306: aload_2
    //   307: ldc_w 1509
    //   310: invokeinterface 1484 2 0
    //   315: checkcast 431	java/lang/String
    //   318: astore_3
    //   319: aload_0
    //   320: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   323: astore 4
    //   325: ldc_w 1505
    //   328: aload_3
    //   329: invokevirtual 835	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   332: ifeq +682 -> 1014
    //   335: iconst_1
    //   336: istore_1
    //   337: aload 4
    //   339: iload_1
    //   340: putfield 1402	com/tencent/mobileqq/msf/core/o$a:g	Z
    //   343: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   346: ifeq +45 -> 391
    //   349: ldc 64
    //   351: iconst_2
    //   352: new 196	java/lang/StringBuilder
    //   355: dup
    //   356: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   359: ldc_w 1511
    //   362: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   365: aload_0
    //   366: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   369: getfield 1402	com/tencent/mobileqq/msf/core/o$a:g	Z
    //   372: invokevirtual 840	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   375: ldc_w 770
    //   378: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   381: aload_3
    //   382: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   385: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   388: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   391: aload_2
    //   392: ldc_w 1513
    //   395: invokeinterface 1484 2 0
    //   400: checkcast 431	java/lang/String
    //   403: astore_3
    //   404: aload_0
    //   405: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   408: astore 4
    //   410: ldc_w 1505
    //   413: aload_3
    //   414: invokevirtual 835	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   417: ifeq +602 -> 1019
    //   420: iconst_1
    //   421: istore_1
    //   422: aload 4
    //   424: iload_1
    //   425: putfield 1410	com/tencent/mobileqq/msf/core/o$a:l	Z
    //   428: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   431: ifeq +45 -> 476
    //   434: ldc 64
    //   436: iconst_2
    //   437: new 196	java/lang/StringBuilder
    //   440: dup
    //   441: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   444: ldc_w 1515
    //   447: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   450: aload_0
    //   451: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   454: getfield 1410	com/tencent/mobileqq/msf/core/o$a:l	Z
    //   457: invokevirtual 840	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   460: ldc_w 770
    //   463: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   466: aload_3
    //   467: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   470: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   473: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   476: aload_2
    //   477: ldc_w 1517
    //   480: invokeinterface 1484 2 0
    //   485: checkcast 431	java/lang/String
    //   488: astore_3
    //   489: aload_3
    //   490: ifnull +56 -> 546
    //   493: aload_0
    //   494: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   497: aload_3
    //   498: invokestatic 1521	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   501: ldc2_w 683
    //   504: lmul
    //   505: putfield 1144	com/tencent/mobileqq/msf/core/o$a:n	J
    //   508: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   511: ifeq +35 -> 546
    //   514: ldc 64
    //   516: iconst_2
    //   517: new 196	java/lang/StringBuilder
    //   520: dup
    //   521: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   524: ldc_w 1523
    //   527: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   530: aload_0
    //   531: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   534: getfield 1144	com/tencent/mobileqq/msf/core/o$a:n	J
    //   537: invokevirtual 1138	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   540: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   543: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   546: aload_2
    //   547: ldc_w 1525
    //   550: invokeinterface 1484 2 0
    //   555: checkcast 431	java/lang/String
    //   558: astore_3
    //   559: aload_3
    //   560: ifnull +52 -> 612
    //   563: aload_0
    //   564: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   567: aload_3
    //   568: invokestatic 1487	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   571: putfield 1195	com/tencent/mobileqq/msf/core/o$a:o	I
    //   574: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   577: ifeq +35 -> 612
    //   580: ldc 64
    //   582: iconst_2
    //   583: new 196	java/lang/StringBuilder
    //   586: dup
    //   587: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   590: ldc_w 1527
    //   593: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   596: aload_0
    //   597: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   600: getfield 1195	com/tencent/mobileqq/msf/core/o$a:o	I
    //   603: invokevirtual 667	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   606: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   609: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   612: aload_2
    //   613: ldc_w 1525
    //   616: invokeinterface 1484 2 0
    //   621: checkcast 431	java/lang/String
    //   624: astore 4
    //   626: aload 4
    //   628: ifnull +65 -> 693
    //   631: aload_0
    //   632: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   635: astore 4
    //   637: aload_3
    //   638: ldc_w 1505
    //   641: invokevirtual 835	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   644: ifeq +380 -> 1024
    //   647: iconst_1
    //   648: istore_1
    //   649: aload 4
    //   651: iload_1
    //   652: putfield 1529	com/tencent/mobileqq/msf/core/o$a:p	Z
    //   655: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   658: ifeq +35 -> 693
    //   661: ldc 64
    //   663: iconst_2
    //   664: new 196	java/lang/StringBuilder
    //   667: dup
    //   668: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   671: ldc_w 1531
    //   674: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   677: aload_0
    //   678: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   681: getfield 1529	com/tencent/mobileqq/msf/core/o$a:p	Z
    //   684: invokevirtual 840	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   687: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   690: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   693: aload_2
    //   694: ldc_w 1533
    //   697: invokeinterface 1484 2 0
    //   702: checkcast 431	java/lang/String
    //   705: astore_3
    //   706: aload_3
    //   707: ifnull +57 -> 764
    //   710: aload_0
    //   711: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   714: aload_3
    //   715: ldc_w 1535
    //   718: ldc -13
    //   720: invokevirtual 1538	java/lang/String:replaceAll	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   723: putfield 303	com/tencent/mobileqq/msf/core/o$a:r	Ljava/lang/String;
    //   726: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   729: ifeq +35 -> 764
    //   732: ldc 64
    //   734: iconst_2
    //   735: new 196	java/lang/StringBuilder
    //   738: dup
    //   739: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   742: ldc_w 1540
    //   745: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   748: aload_0
    //   749: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   752: getfield 303	com/tencent/mobileqq/msf/core/o$a:r	Ljava/lang/String;
    //   755: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   758: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   761: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   764: aload_2
    //   765: ldc_w 1542
    //   768: invokeinterface 1484 2 0
    //   773: checkcast 431	java/lang/String
    //   776: astore_2
    //   777: aload_2
    //   778: ifnull +230 -> 1008
    //   781: aload_0
    //   782: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   785: aload_2
    //   786: putfield 1434	com/tencent/mobileqq/msf/core/o$a:q	Ljava/lang/String;
    //   789: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   792: ifeq +216 -> 1008
    //   795: ldc 64
    //   797: iconst_2
    //   798: new 196	java/lang/StringBuilder
    //   801: dup
    //   802: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   805: ldc_w 1544
    //   808: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   811: aload_0
    //   812: getfield 294	com/tencent/mobileqq/msf/core/o:aj	Lcom/tencent/mobileqq/msf/core/o$a;
    //   815: getfield 1434	com/tencent/mobileqq/msf/core/o$a:q	Ljava/lang/String;
    //   818: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   821: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   824: invokestatic 774	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   827: return
    //   828: astore_3
    //   829: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   832: ifeq -791 -> 41
    //   835: ldc 64
    //   837: iconst_2
    //   838: ldc_w 1546
    //   841: aload_3
    //   842: invokestatic 1549	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   845: goto -804 -> 41
    //   848: astore_2
    //   849: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   852: ifeq +156 -> 1008
    //   855: ldc 64
    //   857: iconst_2
    //   858: aload_2
    //   859: invokevirtual 568	java/lang/Exception:toString	()Ljava/lang/String;
    //   862: invokestatic 1551	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   865: return
    //   866: astore_3
    //   867: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   870: ifeq -758 -> 112
    //   873: ldc 64
    //   875: iconst_2
    //   876: ldc_w 1553
    //   879: aload_3
    //   880: invokestatic 1549	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   883: goto -771 -> 112
    //   886: astore_3
    //   887: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   890: ifeq -669 -> 221
    //   893: ldc 64
    //   895: iconst_2
    //   896: ldc_w 1555
    //   899: aload_3
    //   900: invokestatic 1549	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   903: goto -682 -> 221
    //   906: astore_3
    //   907: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   910: ifeq -402 -> 508
    //   913: ldc 64
    //   915: iconst_2
    //   916: ldc_w 1557
    //   919: aload_3
    //   920: invokestatic 1549	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   923: goto -415 -> 508
    //   926: astore 4
    //   928: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   931: ifeq -357 -> 574
    //   934: ldc 64
    //   936: iconst_2
    //   937: ldc_w 1559
    //   940: aload 4
    //   942: invokestatic 1549	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   945: goto -371 -> 574
    //   948: astore_3
    //   949: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   952: ifeq -297 -> 655
    //   955: ldc 64
    //   957: iconst_2
    //   958: ldc_w 1561
    //   961: aload_3
    //   962: invokestatic 1549	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   965: goto -310 -> 655
    //   968: astore_3
    //   969: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   972: ifeq -246 -> 726
    //   975: ldc 64
    //   977: iconst_2
    //   978: ldc_w 1563
    //   981: aload_3
    //   982: invokestatic 1549	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   985: goto -259 -> 726
    //   988: astore_2
    //   989: invokestatic 315	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   992: ifeq -203 -> 789
    //   995: ldc 64
    //   997: iconst_2
    //   998: ldc_w 1565
    //   1001: aload_2
    //   1002: invokestatic 1549	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1005: goto -216 -> 789
    //   1008: return
    //   1009: iconst_0
    //   1010: istore_1
    //   1011: goto -759 -> 252
    //   1014: iconst_0
    //   1015: istore_1
    //   1016: goto -679 -> 337
    //   1019: iconst_0
    //   1020: istore_1
    //   1021: goto -599 -> 422
    //   1024: iconst_0
    //   1025: istore_1
    //   1026: goto -377 -> 649
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1029	0	this	o
    //   251	775	1	bool	boolean
    //   8	778	2	localObject1	Object
    //   848	11	2	localException1	Exception
    //   988	14	2	localException2	Exception
    //   25	690	3	str	String
    //   828	14	3	localNumberFormatException1	NumberFormatException
    //   866	14	3	localNumberFormatException2	NumberFormatException
    //   886	14	3	localNumberFormatException3	NumberFormatException
    //   906	14	3	localNumberFormatException4	NumberFormatException
    //   948	14	3	localException3	Exception
    //   968	14	3	localException4	Exception
    //   238	412	4	localObject2	Object
    //   926	15	4	localException5	Exception
    // Exception table:
    //   from	to	target	type
    //   30	41	828	java/lang/NumberFormatException
    //   0	9	848	java/lang/Exception
    //   13	26	848	java/lang/Exception
    //   30	41	848	java/lang/Exception
    //   41	79	848	java/lang/Exception
    //   79	92	848	java/lang/Exception
    //   96	112	848	java/lang/Exception
    //   112	150	848	java/lang/Exception
    //   150	163	848	java/lang/Exception
    //   167	221	848	java/lang/Exception
    //   221	250	848	java/lang/Exception
    //   252	306	848	java/lang/Exception
    //   306	335	848	java/lang/Exception
    //   337	391	848	java/lang/Exception
    //   391	420	848	java/lang/Exception
    //   422	476	848	java/lang/Exception
    //   476	489	848	java/lang/Exception
    //   493	508	848	java/lang/Exception
    //   508	546	848	java/lang/Exception
    //   546	559	848	java/lang/Exception
    //   574	612	848	java/lang/Exception
    //   612	626	848	java/lang/Exception
    //   655	693	848	java/lang/Exception
    //   693	706	848	java/lang/Exception
    //   726	764	848	java/lang/Exception
    //   764	777	848	java/lang/Exception
    //   789	827	848	java/lang/Exception
    //   829	845	848	java/lang/Exception
    //   867	883	848	java/lang/Exception
    //   887	903	848	java/lang/Exception
    //   907	923	848	java/lang/Exception
    //   928	945	848	java/lang/Exception
    //   949	965	848	java/lang/Exception
    //   969	985	848	java/lang/Exception
    //   989	1005	848	java/lang/Exception
    //   96	112	866	java/lang/NumberFormatException
    //   167	221	886	java/lang/NumberFormatException
    //   493	508	906	java/lang/NumberFormatException
    //   563	574	926	java/lang/Exception
    //   631	647	948	java/lang/Exception
    //   649	655	948	java/lang/Exception
    //   710	726	968	java/lang/Exception
    //   781	789	988	java/lang/Exception
  }
  
  /* Error */
  public String a(File paramFile)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aload_3
    //   3: astore_2
    //   4: aload_1
    //   5: ifnull +12 -> 17
    //   8: aload_1
    //   9: invokevirtual 1018	java/io/File:exists	()Z
    //   12: ifne +7 -> 19
    //   15: aload_3
    //   16: astore_2
    //   17: aload_2
    //   18: areturn
    //   19: new 196	java/lang/StringBuilder
    //   22: dup
    //   23: invokespecial 198	java/lang/StringBuilder:<init>	()V
    //   26: astore 4
    //   28: new 1571	java/io/BufferedReader
    //   31: dup
    //   32: new 1573	java/io/FileReader
    //   35: dup
    //   36: aload_1
    //   37: invokespecial 1576	java/io/FileReader:<init>	(Ljava/io/File;)V
    //   40: invokespecial 1579	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   43: astore_3
    //   44: aload_3
    //   45: astore_2
    //   46: aload_3
    //   47: invokevirtual 1582	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   50: astore_1
    //   51: aload_1
    //   52: ifnull +46 -> 98
    //   55: aload_3
    //   56: astore_2
    //   57: aload 4
    //   59: aload_1
    //   60: invokevirtual 220	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: pop
    //   64: goto -20 -> 44
    //   67: astore 4
    //   69: ldc -13
    //   71: astore_1
    //   72: aload_3
    //   73: astore_2
    //   74: aload 4
    //   76: invokevirtual 1583	java/io/FileNotFoundException:printStackTrace	()V
    //   79: aload_1
    //   80: astore_2
    //   81: aload_3
    //   82: ifnull -65 -> 17
    //   85: aload_3
    //   86: invokevirtual 1586	java/io/BufferedReader:close	()V
    //   89: aload_1
    //   90: areturn
    //   91: astore_2
    //   92: aload_2
    //   93: invokevirtual 1587	java/io/IOException:printStackTrace	()V
    //   96: aload_1
    //   97: areturn
    //   98: aload_3
    //   99: astore_2
    //   100: aload 4
    //   102: invokevirtual 226	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   105: astore_1
    //   106: aload_3
    //   107: astore_2
    //   108: aload_3
    //   109: invokevirtual 1586	java/io/BufferedReader:close	()V
    //   112: aload_1
    //   113: astore_2
    //   114: aload_3
    //   115: ifnull -98 -> 17
    //   118: aload_3
    //   119: invokevirtual 1586	java/io/BufferedReader:close	()V
    //   122: aload_1
    //   123: areturn
    //   124: astore_2
    //   125: goto -33 -> 92
    //   128: astore 4
    //   130: aconst_null
    //   131: astore_3
    //   132: ldc -13
    //   134: astore_1
    //   135: aload_3
    //   136: astore_2
    //   137: aload 4
    //   139: invokevirtual 1587	java/io/IOException:printStackTrace	()V
    //   142: aload_1
    //   143: astore_2
    //   144: aload_3
    //   145: ifnull -128 -> 17
    //   148: aload_3
    //   149: invokevirtual 1586	java/io/BufferedReader:close	()V
    //   152: aload_1
    //   153: areturn
    //   154: astore_2
    //   155: goto -63 -> 92
    //   158: astore_1
    //   159: aconst_null
    //   160: astore_2
    //   161: aload_2
    //   162: ifnull +7 -> 169
    //   165: aload_2
    //   166: invokevirtual 1586	java/io/BufferedReader:close	()V
    //   169: aload_1
    //   170: athrow
    //   171: astore_2
    //   172: aload_2
    //   173: invokevirtual 1587	java/io/IOException:printStackTrace	()V
    //   176: goto -7 -> 169
    //   179: astore_1
    //   180: goto -19 -> 161
    //   183: astore 4
    //   185: ldc -13
    //   187: astore_1
    //   188: goto -53 -> 135
    //   191: astore 4
    //   193: goto -58 -> 135
    //   196: astore 4
    //   198: aconst_null
    //   199: astore_3
    //   200: ldc -13
    //   202: astore_1
    //   203: goto -131 -> 72
    //   206: astore 4
    //   208: goto -136 -> 72
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	211	0	this	o
    //   0	211	1	paramFile	File
    //   3	78	2	localObject1	Object
    //   91	2	2	localIOException1	java.io.IOException
    //   99	15	2	localObject2	Object
    //   124	1	2	localIOException2	java.io.IOException
    //   136	8	2	localObject3	Object
    //   154	1	2	localIOException3	java.io.IOException
    //   160	6	2	localObject4	Object
    //   171	2	2	localIOException4	java.io.IOException
    //   1	199	3	localBufferedReader	java.io.BufferedReader
    //   26	32	4	localStringBuilder	StringBuilder
    //   67	34	4	localFileNotFoundException1	java.io.FileNotFoundException
    //   128	10	4	localIOException5	java.io.IOException
    //   183	1	4	localIOException6	java.io.IOException
    //   191	1	4	localIOException7	java.io.IOException
    //   196	1	4	localFileNotFoundException2	java.io.FileNotFoundException
    //   206	1	4	localFileNotFoundException3	java.io.FileNotFoundException
    // Exception table:
    //   from	to	target	type
    //   46	51	67	java/io/FileNotFoundException
    //   57	64	67	java/io/FileNotFoundException
    //   100	106	67	java/io/FileNotFoundException
    //   85	89	91	java/io/IOException
    //   118	122	124	java/io/IOException
    //   19	44	128	java/io/IOException
    //   148	152	154	java/io/IOException
    //   19	44	158	finally
    //   165	169	171	java/io/IOException
    //   46	51	179	finally
    //   57	64	179	finally
    //   74	79	179	finally
    //   100	106	179	finally
    //   108	112	179	finally
    //   137	142	179	finally
    //   46	51	183	java/io/IOException
    //   57	64	183	java/io/IOException
    //   100	106	183	java/io/IOException
    //   108	112	191	java/io/IOException
    //   19	44	196	java/io/FileNotFoundException
    //   108	112	206	java/io/FileNotFoundException
  }
  
  public void a(int paramInt, String paramString, boolean paramBoolean)
  {
    switch (paramInt)
    {
    case 1002: 
    case 1005: 
    case 1006: 
    default: 
      return;
    case 1001: 
      Intent localIntent = new Intent("com.tencent.mobileqq.action.QQWiFi");
      localIntent.putExtra("hasvailable", true);
      if (paramBoolean)
      {
        i1 = BaseApplication.qqWifiUserful;
        if (TextUtils.isEmpty(paramString)) {
          paramString = "当前有免费WiFi，点击查看";
        }
        for (;;)
        {
          a(localIntent, paramInt, i1, paramString, "试试一键连接", "当前有可用的 QQ WiFi,点击进入连接");
          a(1, null);
          return;
        }
      }
      int i1 = BaseApplication.qqWifiUserful;
      if (TextUtils.isEmpty(paramString)) {
        paramString = "当前有免费WiFi，点击查看";
      }
      for (;;)
      {
        a(localIntent, paramInt, i1, paramString, "试试一键连接", null);
        break;
      }
    case 1003: 
      a(new Intent("com.tencent.mobileqq.action.QQWiFi"), paramInt, BaseApplication.qqWifiNoSignal, "网络连接不可用", "网络恢复后查看", null);
      return;
    case 1004: 
      a(new Intent("com.tencent.mobileqq.action.QQWiFi"), paramInt, BaseApplication.qqWifiNoSignal, "已关闭无线网络", "打开后查看", null);
      return;
    case 1007: 
      a(new Intent("com.tencent.mobileqq.action.QQWiFi"), paramInt, BaseApplication.qqWifiConnecticon3, "已连接 " + paramString, "快来赚取免费QQ WiFi时长", null);
      return;
    case 1008: 
      a(new Intent("com.tencent.mobileqq.action.QQWiFi"), paramInt, BaseApplication.qqWifiUserful, "当前有免费WiFi，点击查看", "试试一键连接", "当前有可用的QQ WiFi，点击进入连接");
      paramString = BaseApplication.getContext();
      if (Build.VERSION.SDK_INT > 10) {}
      for (paramInt = 4;; paramInt = 0)
      {
        paramString.getSharedPreferences("qqwifi", paramInt).edit().putLong("lastPushAvailableWiFiToBarClosedUser", System.currentTimeMillis()).commit();
        a(3, null);
        return;
      }
    }
    a(new Intent("com.tencent.mobileqq.action.QQWiFi"), paramInt, BaseApplication.qqWifiNoSignal, "未连接任何WiFi", "xxx", null);
  }
  
  public void a(Intent paramIntent)
  {
    int i1 = 4;
    if (paramIntent != null)
    {
      if (!paramIntent.hasExtra("isNeedScanRunning")) {
        break label144;
      }
      boolean bool = paramIntent.getBooleanExtra("isNeedScanRunning", false);
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "onReceiveScanStateChange, isNeedScanRunning = " + bool);
      }
      paramIntent = BaseApplication.getContext();
      if (Build.VERSION.SDK_INT <= 10) {
        break label110;
      }
      paramIntent = paramIntent.getSharedPreferences("mobileQQ", i1);
      if (!bool) {
        break label115;
      }
      NetConnInfoCenterImpl localNetConnInfoCenterImpl = NetConnInfoCenter.impl;
      a(NetConnInfoCenterImpl.msfCore, true);
      ay = paramIntent.getBoolean("hasPushedAvailNotification", false);
    }
    label110:
    label115:
    label144:
    label240:
    label293:
    do
    {
      do
      {
        do
        {
          return;
          i1 = 0;
          break;
          b();
          paramIntent.edit().putBoolean("hasPushedAvailNotification", ay).commit();
          return;
          if (paramIntent.hasExtra("enableChange"))
          {
            if (QLog.isColorLevel()) {
              QLog.d("QQWiFiScanManager", 2, "onReceiveScanStateChange, enableChange");
            }
            b(0);
            b(1);
            b(3);
            return;
          }
          if (!paramIntent.hasExtra("barswitch")) {
            break label240;
          }
          if (QLog.isColorLevel()) {
            QLog.d("QQWiFiScanManager", 2, "onReceiveScanStateChange, barswitch");
          }
          b(2);
        } while (n());
        ((WifiManager)ai.getSystemService("wifi")).startScan();
        return;
        if (paramIntent.hasExtra("availswitch"))
        {
          b(6);
          return;
        }
        if (!paramIntent.hasExtra("redTouch")) {
          break label293;
        }
      } while (!paramIntent.getBooleanExtra("redTouch", false));
      a(al, am, false, true);
      return;
      if (paramIntent.hasExtra("autoswitch"))
      {
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "onReceiveScanStateChange, autoswitch");
        }
        b(4);
        return;
      }
    } while (!paramIntent.hasExtra("autoConnectArrived"));
    if (QLog.isColorLevel()) {
      QLog.d("QQWiFiScanManager", 2, "onReceiveScanStateChange, autoConnectArrived");
    }
    b(5);
  }
  
  public void a(MsfCore paramMsfCore, boolean paramBoolean)
  {
    if (aw)
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "QQWifi already register.");
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("QQWiFiScanManager", 2, "QQWifi register,isSyncRegister=" + paramBoolean);
    }
    ah = paramMsfCore;
    aw = true;
    if (paramBoolean)
    {
      a(paramMsfCore);
      return;
    }
    new Thread(new q(this, paramMsfCore)).start();
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    int i1 = 1;
    if (QLog.isColorLevel())
    {
      StringBuilder localStringBuilder = new StringBuilder().append("onRecvAvailResponse :");
      if (paramFromServiceMsg == null)
      {
        paramToServiceMsg = "null";
        QLog.d("QQWiFiScanManager", 2, paramToServiceMsg);
      }
    }
    else
    {
      if ((paramFromServiceMsg == null) || (!paramFromServiceMsg.isSuccess())) {
        break label430;
      }
      paramToServiceMsg = new UniPacket(true);
      paramToServiceMsg.setEncodeName("utf-8");
      paramToServiceMsg.decode(paramFromServiceMsg.getWupBuffer());
      paramToServiceMsg = (b)paramToServiceMsg.getByClass("rsp", new b());
      if ((paramToServiceMsg == null) || (a != 0)) {
        break label351;
      }
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "onRecvAvailResponse, availpush=" + d);
      }
      aC = d;
      if (b.isEmpty()) {
        break label283;
      }
      if (!n()) {
        break label261;
      }
      if ((aj.e) && (aC == 1)) {
        a(1008, "", false, false);
      }
      label199:
      if (!a(au, b)) {
        break label275;
      }
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "onRecvAvailResponse, isSubset=true");
      }
    }
    for (;;)
    {
      au.clear();
      au.addAll(b);
      return;
      paramToServiceMsg = paramFromServiceMsg.toString();
      break;
      label261:
      a(1001, "", false, false);
      break label199;
      label275:
      t();
    }
    for (;;)
    {
      try
      {
        label283:
        paramToServiceMsg = ((ConnectivityManager)ai.getSystemService("connectivity")).getActiveNetworkInfo();
        if ((paramToServiceMsg == null) || (paramToServiceMsg.getType() != 1)) {
          break label346;
        }
        if (i1 != 0) {
          break;
        }
        a(1009, "", false, false);
        return;
      }
      catch (Exception paramToServiceMsg) {}
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e("QQWiFiScanManager", 2, "onRecvAvailResponse, qqwifi not avail", paramToServiceMsg);
      return;
      label346:
      i1 = 0;
    }
    label351:
    as.clear();
    for (;;)
    {
      try
      {
        paramToServiceMsg = ((ConnectivityManager)ai.getSystemService("connectivity")).getActiveNetworkInfo();
        if ((paramToServiceMsg == null) || (paramToServiceMsg.getType() != 1)) {
          break label425;
        }
        i1 = 1;
        if (i1 != 0) {
          break;
        }
        a(1009, "", false, false);
        return;
      }
      catch (Exception paramToServiceMsg) {}
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e("QQWiFiScanManager", 2, "onRecvAvailResponse, qqwifi not avail", paramToServiceMsg);
      return;
      label425:
      i1 = 0;
    }
    label430:
    as.clear();
  }
  
  public void a(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.w("QQWiFiScanManager", 2, "setQuited = " + paramBoolean);
    }
    aB = paramBoolean;
    if (paramBoolean) {
      ((NotificationManager)BaseApplication.getContext().getSystemService("notification")).cancel(f.C);
    }
  }
  
  public void b()
  {
    if (aw) {
      BaseApplication.getContext().unregisterReceiver(aD);
    }
    aw = false;
    if (QLog.isColorLevel()) {
      QLog.d("QQWiFiScanManager", 2, "unregister");
    }
  }
  
  public void b(Intent paramIntent)
  {
    if (aB)
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "onResponseWifiStatechange isCurUinQuited true, return");
      }
      return;
    }
    int i1 = paramIntent.getIntExtra("wifi_state", 0);
    if (QLog.isColorLevel()) {
      QLog.i("QQWiFiScanManager", 2, " onResponseWifiStatechange, wifiState=" + i1);
    }
    switch (i1)
    {
    case 2: 
    default: 
      return;
    case 1: 
      a(1004, "", false, false);
      return;
    }
    paramIntent = (ConnectivityManager)ai.getSystemService("connectivity");
    for (;;)
    {
      try
      {
        paramIntent = paramIntent.getAllNetworkInfo();
        if ((paramIntent == null) || (paramIntent.length >= 0) || (paramIntent[0].getState() != NetworkInfo.State.CONNECTED)) {
          break label181;
        }
        i1 = 1;
        if (i1 != 0) {
          break;
        }
        a(1003, "", false, false);
        return;
      }
      catch (Throwable paramIntent) {}
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e("QQWiFiScanManager", 2, QLog.getStackTraceString(paramIntent));
      return;
      label181:
      i1 = 0;
    }
  }
  
  public void c()
  {
    try
    {
      if (k()) {
        ((WifiManager)ai.getSystemService("wifi")).startScan();
      }
      return;
    }
    catch (Throwable localThrowable)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("QQWiFiScanManager", 2, "scan", localThrowable);
    }
  }
  
  public void d()
  {
    try
    {
      if (aB)
      {
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "onResponseNetChange isCurUinQuited true, return");
        }
      }
      else
      {
        NetworkInfo localNetworkInfo = ((ConnectivityManager)ai.getSystemService("connectivity")).getActiveNetworkInfo();
        localObject2 = (WifiManager)ai.getSystemService("wifi");
        i1 = ((WifiManager)localObject2).getWifiState();
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "onResponseNetChange, wifiState=" + i1);
        }
        if (localNetworkInfo == null) {
          if (3 == i1)
          {
            if (QLog.isColorLevel()) {
              QLog.d("QQWiFiScanManager", 2, "onResponseNetChange, network inactive, push wlan disabled");
            }
            a(1003, "", false, false);
            return;
          }
        }
      }
    }
    catch (Exception localException)
    {
      Object localObject2;
      int i1;
      if (QLog.isColorLevel())
      {
        QLog.e("QQWiFiScanManager", 2, localException.getMessage());
        return;
        if (QLog.isColorLevel()) {
          QLog.d("QQWiFiScanManager", 2, "onResponseNetChange, network inactive, push no network access");
        }
        a(1004, "", false, false);
        return;
        if (3 != i1)
        {
          if (QLog.isColorLevel()) {
            QLog.d("QQWiFiScanManager", 2, "onResponseNetChange, network active, push no network access");
          }
          a(1004, "", false, false);
          return;
        }
        if ((localException.getType() == 1) || (localException.getType() == 9))
        {
          WifiInfo localWifiInfo = ((WifiManager)localObject2).getConnectionInfo();
          localObject2 = "";
          Object localObject1 = localObject2;
          if (localWifiInfo != null)
          {
            localObject1 = localObject2;
            if (!TextUtils.isEmpty(localWifiInfo.getSSID())) {
              localObject1 = localWifiInfo.getSSID().replace("\"", "");
            }
          }
          a(1007, (String)localObject1, false, false);
          if (QLog.isColorLevel()) {
            QLog.d("QQWiFiScanManager", 2, "onResponseNetChange, push ssid");
          }
        }
        else
        {
          if (k()) {
            ((WifiManager)localObject2).startScan();
          }
          if (QLog.isColorLevel()) {
            QLog.d("QQWiFiScanManager", 2, "onResponseNetChange, startScan");
          }
        }
      }
    }
  }
  
  public void e()
  {
    Object localObject3;
    int i1;
    try
    {
      Object localObject1 = ((ConnectivityManager)ai.getSystemService("connectivity")).getActiveNetworkInfo();
      if (localObject1 != null)
      {
        if (((NetworkInfo)localObject1).getType() != 1) {
          return;
        }
        localObject1 = ((ActivityManager)ai.getSystemService("activity")).getRunningAppProcesses();
        if (localObject1 != null)
        {
          localObject1 = ((List)localObject1).iterator();
          while (((Iterator)localObject1).hasNext()) {
            if ("com.tencent.mobileqq:qqwifi".equals(nextprocessName)) {
              return;
            }
          }
        }
        localObject1 = NetConnInfoCenter.impl;
        a(NetConnInfoCenterImpl.msfCore, true);
        localObject3 = "";
        localObject1 = "";
        Object localObject4 = ((WifiManager)ai.getSystemService("wifi")).getConnectionInfo();
        if (localObject4 != null)
        {
          localObject3 = ((WifiInfo)localObject4).getBSSID();
          i1 = ((WifiInfo)localObject4).getIpAddress();
          localObject1 = String.format("%d.%d.%d.%d", new Object[] { Integer.valueOf(i1 & 0xFF), Integer.valueOf(i1 >> 8 & 0xFF), Integer.valueOf(i1 >> 16 & 0xFF), Integer.valueOf(i1 >> 24 & 0xFF) });
        }
        if ((!TextUtils.isEmpty((CharSequence)localObject3)) && (!TextUtils.isEmpty((CharSequence)localObject1)))
        {
          localObject4 = BaseApplication.getContext();
          if (Build.VERSION.SDK_INT <= 10) {
            break label639;
          }
          i1 = 4;
          localObject4 = ((BaseApplication)localObject4).getSharedPreferences("mobileQQ", i1);
          if (localObject4 != null)
          {
            localObject4 = ((SharedPreferences)localObject4).getString("qqwifiConnInfo", "");
            if (!TextUtils.isEmpty((CharSequence)localObject4))
            {
              Object localObject6 = new JSONObject((String)localObject4);
              localObject4 = ((JSONObject)localObject6).optString("ssid");
              Object localObject5 = ((JSONObject)localObject6).optString("bssid");
              localObject6 = ((JSONObject)localObject6).optString("IPAdress");
              if ((((String)localObject3).equals(localObject5)) && (((String)localObject1).equals(localObject6)))
              {
                if (QLog.isColorLevel()) {
                  QLog.i("QQWiFiScanManager", 2, "checkConnection:remove netWork！ssid=" + (String)localObject4 + " bssid=" + (String)localObject5 + " IPAdress=" + (String)localObject6);
                }
                localObject5 = (WifiManager)ai.getSystemService("wifi");
                localObject6 = ((WifiManager)localObject5).getConfiguredNetworks();
                if (localObject6 != null)
                {
                  i1 = 0;
                  localObject1 = localObject4;
                  label419:
                  if (i1 < ((List)localObject6).size())
                  {
                    localObject4 = (WifiConfiguration)((List)localObject6).get(i1);
                    localObject3 = localObject1;
                    if (localObject4 == null) {
                      break label644;
                    }
                    if (TextUtils.isEmpty(SSID)) {
                      break label632;
                    }
                    String str = SSID.replace("\"", "");
                    localObject1 = ((String)localObject1).replace("\"", "");
                    localObject3 = localObject1;
                    if (!str.equals(localObject1)) {
                      break label644;
                    }
                    ((WifiManager)localObject5).removeNetwork(networkId);
                    localObject3 = localObject1;
                    if (!QLog.isColorLevel()) {
                      break label644;
                    }
                    QLog.i("QQWiFiScanManager", 2, "checkConnection：已经删除了" + SSID + "网络" + " networkId:" + networkId + " bssid:" + BSSID);
                    localObject3 = localObject1;
                    break label644;
                  }
                  ((WifiManager)localObject5).saveConfiguration();
                  return;
                }
              }
            }
          }
        }
      }
    }
    catch (Throwable localThrowable)
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQWiFiScanManager", 2, "checkConnection:Exception:" + localThrowable.getMessage());
      }
    }
    return;
    for (;;)
    {
      label632:
      i1 += 1;
      break label419;
      label639:
      i1 = 0;
      break;
      label644:
      Object localObject2 = localObject3;
    }
  }
  
  private class a
  {
    public String a = "";
    public boolean b = false;
    public String c = "";
    public int d = 0;
    public boolean e = false;
    public boolean f = false;
    public boolean g = false;
    public int h = 10;
    public long i = 30000L;
    public long j = 60000L;
    public long k = 86400000L;
    public boolean l = false;
    public int m = 0;
    public long n = 21600000L;
    public int o = 1;
    public boolean p = false;
    public String q;
    public String r;
    
    private a() {}
  }
}
