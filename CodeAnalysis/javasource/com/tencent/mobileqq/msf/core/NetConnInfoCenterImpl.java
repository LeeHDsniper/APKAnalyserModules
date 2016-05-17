package com.tencent.mobileqq.msf.core;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.DetailedState;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.SystemClock;
import android.telephony.PhoneStateListener;
import android.telephony.SignalStrength;
import android.telephony.TelephonyManager;
import com.qq.jce.wup.UniPacket;
import com.tencent.mobileqq.msf.core.b.i;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.core.net.b.n;
import com.tencent.mobileqq.msf.core.net.h;
import com.tencent.mobileqq.msf.core.push.f;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.msf.boot.config.NativeConfigStore;
import com.tencent.msf.service.protocol.security.c;
import com.tencent.msf.service.protocol.security.d;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public class NetConnInfoCenterImpl
{
  public static final int CONFIGDEFAULTAPPID = 100;
  public static final String KEY_RECORD_SERVER_TIME = "recordSysTimeKey";
  private static int _activeNetInfoType = 0;
  static int _dayOfYear = 0;
  private static String _lastMobileApn;
  private static String _lastWifiSSID;
  private static AtomicBoolean _netSupport;
  static String currentAPN;
  private static long lastCheckTime = 0L;
  private static long lastCompareTime = 0L;
  private static AtomicBoolean lastConnSuccWithoutNet;
  private static long lastConnSuccWithoutNetTime = 0L;
  private static int mobileNetworkType = 0;
  private static final byte mobileStat = 0;
  public static MsfCore msfCore;
  static boolean needWifiAuth = false;
  static AtomicInteger netChangeCount;
  private static final String serverTimeDiffKey = "servetTimeDiff";
  static String subtypeName;
  static String tag = "MSF.C.NetConnInfoCenter";
  private static final byte wifiStat = 1;
  boolean calculateSignalLevel = true;
  private long firstGetServerTime = 0L;
  int lastCdmaStrenght;
  private long lastGetServerTimeInterval = 0L;
  int lastGsmStrength;
  int lastWifiStrength;
  private int sendGetServerTimeMsgCount = 0;
  
  static
  {
    netChangeCount = new AtomicInteger(0);
    _dayOfYear = Calendar.getInstance().get(6);
    _activeNetInfoType = 0;
    _netSupport = new AtomicBoolean(false);
    lastCheckTime = -1L;
    lastCompareTime = 0L;
    lastConnSuccWithoutNet = new AtomicBoolean();
    lastConnSuccWithoutNetTime = 0L;
    currentAPN = "";
    subtypeName = "";
  }
  
  public NetConnInfoCenterImpl() {}
  
  public static void callQQProcess(String paramString)
  {
    try
    {
      if (f.o)
      {
        long l = com.tencent.mobileqq.msf.core.a.a.R();
        Object localObject = new Intent(paramString);
        paramString = f.p;
        int i = msfCore.getUinPushStatus(paramString);
        ((Intent)localObject).putExtra("uin", paramString);
        ((Intent)localObject).putExtra("istatus", i);
        ((Intent)localObject).putExtra("gatewayip", w.j());
        if (l > 0L)
        {
          localObject = PendingIntent.getBroadcast(BaseApplication.getContext(), 0, (Intent)localObject, 0);
          ((AlarmManager)BaseApplication.getContext().getSystemService("alarm")).set(0, System.currentTimeMillis() + com.tencent.mobileqq.msf.core.a.a.R(), (PendingIntent)localObject);
          QLog.d(tag, 1, "send bootAction for QQ " + MsfSdkUtils.getShortUin(paramString) + " delayed: " + l);
        }
        for (;;)
        {
          f.o = false;
          return;
          BaseApplication.getContext().sendBroadcast((Intent)localObject);
          QLog.d(tag, 1, "send bootAction for QQ " + MsfSdkUtils.getShortUin(paramString) + " right now");
        }
      }
      QLog.d(tag, 1, "not need send bootAction for QQ");
    }
    catch (Exception paramString)
    {
      QLog.d(tag, 1, "send bootAction for QQ error " + paramString);
      return;
    }
  }
  
  private void closeNowConn()
  {
    if ((msfCore != null) && (msfCoresender != null)) {
      msfCoresender.a(com.tencent.qphone.base.a.b);
    }
  }
  
  public static String getCurrentAPN()
  {
    return currentAPN;
  }
  
  public static String getLastWifiSSID()
  {
    return _lastWifiSSID;
  }
  
  public static int getMobileNetworkType()
  {
    return mobileNetworkType;
  }
  
  private static String getNetStatusMsg(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return "UNKNOWN";
    case 0: 
      return "NONE";
    case 1: 
      return "MOBILE";
    case 2: 
      return "WiFi";
    }
    return "WiFi";
  }
  
  public static String getNetSubtypeName()
  {
    return subtypeName;
  }
  
  public static int getSystemNetState()
  {
    if (isWifiConn()) {
      return 2;
    }
    if (isMobileConn()) {
      return 1;
    }
    return 0;
  }
  
  public static int getSystemNetworkType()
  {
    int i = 0;
    if (isWifiConn()) {
      i = _activeNetInfoType;
    }
    while (!isMobileConn()) {
      return i;
    }
    return getMobileNetworkType() + 10000;
  }
  
  public static InetAddress intToInetAddress(int paramInt)
  {
    int i = (byte)(paramInt & 0xFF);
    int j = (byte)(paramInt >> 8 & 0xFF);
    int k = (byte)(paramInt >> 16 & 0xFF);
    int m = (byte)(paramInt >> 24 & 0xFF);
    try
    {
      InetAddress localInetAddress = InetAddress.getByAddress(new byte[] { i, j, k, m });
      return localInetAddress;
    }
    catch (UnknownHostException localUnknownHostException)
    {
      throw new AssertionError();
    }
  }
  
  public static boolean isMobileConn()
  {
    return _activeNetInfoType == 1;
  }
  
  public static boolean isMobileNetworkInfo(NetworkInfo paramNetworkInfo)
  {
    return (paramNetworkInfo.getType() == 0) || (50 == paramNetworkInfo.getType());
  }
  
  public static boolean isNeedWifiAuth()
  {
    return needWifiAuth;
  }
  
  public static boolean isNetSupport()
  {
    return _netSupport.get();
  }
  
  public static boolean isWifiConn()
  {
    return (_activeNetInfoType == 2) || (_activeNetInfoType == 3);
  }
  
  public static boolean isWifiOrMobileConn()
  {
    return (isWifiConn()) || (isMobileConn());
  }
  
  private void mobileConnected(NetworkInfo paramNetworkInfo)
  {
    if (paramNetworkInfo != null) {
      mobileNetworkType = paramNetworkInfo.getSubtype();
    }
    for (;;)
    {
      setConnInfo(_activeNetInfoType | 0x1);
      return;
      try
      {
        mobileNetworkType = ((TelephonyManager)BaseApplication.getContext().getSystemService("phone")).getNetworkType();
      }
      catch (Exception paramNetworkInfo)
      {
        paramNetworkInfo.printStackTrace();
      }
    }
  }
  
  private void mobileDisConnected()
  {
    setConnInfo(_activeNetInfoType & 0xFFFFFFFE);
  }
  
  private void onMobileConnChnaged()
  {
    if ((isMobileConn()) && (msfCore != null) && (msfCorestandbyModeManager != null)) {
      msfCorestandbyModeManager.d();
    }
  }
  
  private void onWifiConnChanged()
  {
    if (isWifiConn()) {
      if ((msfCore != null) && (msfCoresender != null))
      {
        msfCoresender.a.h.a(_lastWifiSSID);
        msfCorestandbyModeManager.e();
      }
    }
    while ((msfCore == null) || (msfCoresender == null)) {
      return;
    }
    msfCoresender.a.h.a();
  }
  
  private static void resetLastConnSuccWithoutNet()
  {
    lastConnSuccWithoutNet.set(false);
    lastConnSuccWithoutNetTime = 0L;
  }
  
  private void sendNewCheckServerTime()
  {
    if (msfCore != null)
    {
      localToServiceMsg = new ToServiceMsg("", "0", "Client.CorrectTime");
      localToServiceMsg.setMsfCommand(MsfCommand.getServerTime);
      if (msfCoresender.f() == -1)
      {
        i = 100;
        localToServiceMsg.setAppId(i);
        localToServiceMsg.setTimeout(30000L);
        localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
        localToServiceMsg.addAttribute("__base_tag_isAppMsg", Boolean.valueOf(true));
        localToServiceMsg.putWupBuffer(MsfSdkUtils.convertInt2Bytes(4));
        msfCoresender.b(localToServiceMsg);
      }
    }
    while (!QLog.isDevelopLevel()) {
      for (;;)
      {
        ToServiceMsg localToServiceMsg;
        return;
        int i = msfCoresender.f();
      }
    }
    QLog.d(tag, 4, "msfCore not inited. can not send checkServerTimeMsg.");
  }
  
  private void sendOldCheckServerTime()
  {
    if (msfCore != null)
    {
      localToServiceMsg = new ToServiceMsg("", "0", "login.time");
      localToServiceMsg.setMsfCommand(MsfCommand.getServerTime);
      if (msfCoresender.f() == -1)
      {
        i = 100;
        localToServiceMsg.setAppId(i);
        localToServiceMsg.setTimeout(30000L);
        localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
        localUniPacket = new UniPacket(true);
        localUniPacket.setServantName("test");
        localUniPacket.setFuncName("cmdstr");
        localD = new d(1, 15, MsfCore.getNextSeq(), 1, "0", msfCoresender.f(), String.valueOf(msfCoresender.f()), "123", 0);
        localC = new c();
        a = ((int)(System.currentTimeMillis() / 1000L));
        localUniPacket.put("RequestHeader", localD);
        localUniPacket.put("RequestGetServerTime", localC);
        localToServiceMsg.putWupBuffer(localUniPacket.encode());
        msfCoresender.b(localToServiceMsg);
      }
    }
    while (!QLog.isDevelopLevel()) {
      for (;;)
      {
        ToServiceMsg localToServiceMsg;
        UniPacket localUniPacket;
        d localD;
        c localC;
        return;
        int i = msfCoresender.f();
      }
    }
    QLog.d(tag, 4, "msfCore not inited. can not send checkServerTimeMsg.");
  }
  
  public static void setLastConnSuccWithoutNet()
  {
    lastConnSuccWithoutNetTime = System.currentTimeMillis();
    lastConnSuccWithoutNet.set(true);
  }
  
  static void setMsfCore(MsfCore paramMsfCore)
  {
    msfCore = paramMsfCore;
    NetConnInfoCenter.servetTimeSecondInterv = BaseApplication.getContext().getSharedPreferences(tag, 0).getLong("servetTimeDiff", 0L);
  }
  
  public static void setNeedWifiAuth(boolean paramBoolean)
  {
    needWifiAuth = paramBoolean;
  }
  
  public static void setNetSupport(boolean paramBoolean)
  {
    _netSupport.set(paramBoolean);
    if (QLog.isColorLevel()) {
      QLog.d(tag, 2, "setNetSupport " + _netSupport.get());
    }
  }
  
  private void wifiConnected()
  {
    WifiInfo localWifiInfo = ((WifiManager)BaseApplication.getContext().getSystemService("wifi")).getConnectionInfo();
    if (localWifiInfo != null)
    {
      int i = localWifiInfo.getIpAddress();
      if (QLog.isColorLevel()) {
        QLog.d(tag, 2, "wifiConnected localAddress " + i + "(" + intToInetAddress(i).getHostAddress() + "), " + localWifiInfo.toString());
      }
      if (msfCore != null) {
        msfCore.getStatReporter().a(localWifiInfo);
      }
    }
    setConnInfo(_activeNetInfoType | 0x2);
  }
  
  private void wifiDisConnected()
  {
    setConnInfo(_activeNetInfoType & 0xFFFFFFFD);
  }
  
  public void checkConnInfo(Context paramContext, NetworkInfo paramNetworkInfo)
  {
    checkConnInfo(paramContext, paramNetworkInfo, false);
  }
  
  public void checkConnInfo(Context paramContext, NetworkInfo paramNetworkInfo, boolean paramBoolean)
  {
    ConnectivityManager localConnectivityManager = (ConnectivityManager)paramContext.getSystemService("connectivity");
    if (paramBoolean) {
      i.e();
    }
    checkConnInfo(localConnectivityManager.getActiveNetworkInfo(), paramNetworkInfo);
    try
    {
      paramContext = localConnectivityManager.getNetworkInfo(0);
      if (paramContext != null) {
        break label98;
      }
      paramContext = localConnectivityManager.getNetworkInfo(50);
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        QLog.d(tag, 1, "get currentAPN error " + paramContext);
      }
    }
    if (paramContext != null) {
      currentAPN = paramContext.getExtraInfo();
    }
    if (paramBoolean) {
      i.e();
    }
  }
  
  public void checkConnInfo(NetworkInfo paramNetworkInfo1, NetworkInfo paramNetworkInfo2)
  {
    String str;
    if (paramNetworkInfo1 != null) {
      str = paramNetworkInfo1.getTypeName();
    }
    do
    {
      do
      {
        try
        {
          subtypeName = paramNetworkInfo1.getSubtypeName();
          if (str.toLowerCase().contains("mobile_mms")) {
            return;
          }
        }
        catch (Exception localException)
        {
          do
          {
            do
            {
              do
              {
                for (;;)
                {
                  QLog.d(tag, 1, "get subtypeName error " + localException);
                }
                QLog.d(tag, 1, "currentAPN:" + currentAPN + ". received networkInfo: " + paramNetworkInfo1.getDetailedState() + " :" + paramNetworkInfo1 + ". extra NetworkInfo: " + paramNetworkInfo2);
                if ((!paramNetworkInfo1.isAvailable()) || (paramNetworkInfo1.getDetailedState() != NetworkInfo.DetailedState.CONNECTED)) {
                  break;
                }
                if (1 == paramNetworkInfo1.getType())
                {
                  wifiConnected();
                  return;
                }
              } while (!isMobileNetworkInfo(paramNetworkInfo1));
              wifiDisConnected();
              mobileConnected(paramNetworkInfo1);
              return;
            } while ((paramNetworkInfo1.getDetailedState() != NetworkInfo.DetailedState.DISCONNECTED) && (paramNetworkInfo1.getDetailedState() != NetworkInfo.DetailedState.FAILED) && (paramNetworkInfo1.getDetailedState() != NetworkInfo.DetailedState.IDLE) && (paramNetworkInfo1.getDetailedState() != NetworkInfo.DetailedState.SUSPENDED));
            if (1 == paramNetworkInfo1.getType())
            {
              wifiDisConnected();
              return;
            }
          } while (!isMobileNetworkInfo(paramNetworkInfo1));
          mobileDisConnected();
          return;
        }
        if (QLog.isColorLevel()) {
          QLog.d(tag, 2, "currentAPN:" + currentAPN + ". active NetworkInfo: " + paramNetworkInfo1 + ". extra NetworkInfo: " + paramNetworkInfo2);
        }
      } while ((paramNetworkInfo2 == null) || ((paramNetworkInfo2.getDetailedState() != NetworkInfo.DetailedState.DISCONNECTED) && (paramNetworkInfo2.getDetailedState() != NetworkInfo.DetailedState.FAILED) && (paramNetworkInfo2.getDetailedState() != NetworkInfo.DetailedState.IDLE) && (paramNetworkInfo2.getDetailedState() != NetworkInfo.DetailedState.SUSPENDED)));
      if (1 == paramNetworkInfo2.getType())
      {
        wifiDisConnected();
        return;
      }
    } while (!isMobileNetworkInfo(paramNetworkInfo2));
    mobileDisConnected();
  }
  
  public void checkRecordTime()
  {
    try
    {
      long l = SystemClock.elapsedRealtime();
      if ((0L != lastCompareTime) && (l > lastCompareTime + com.tencent.mobileqq.msf.core.a.a.J()))
      {
        lastCompareTime = l;
        String str;
        if ((-1L == lastCheckTime) && (MsfStore.getNativeConfigStore() != null))
        {
          str = MsfStore.getNativeConfigStore().getConfig("recordSysTimeKey");
          if (str == null) {}
        }
        try
        {
          lastCheckTime = Long.parseLong(str);
          l = System.currentTimeMillis();
          if (-1L != lastCheckTime)
          {
            if (l <= lastCheckTime + com.tencent.mobileqq.msf.core.a.a.H() + Math.random() * com.tencent.mobileqq.msf.core.a.a.I()) {
              return;
            }
            checkServerTime();
          }
        }
        catch (Exception localException1)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.d(tag, 2, "get lastCheckTime catch Exception " + localException1);
            }
          }
        }
      }
      return;
    }
    catch (Exception localException2)
    {
      if (QLog.isColorLevel())
      {
        QLog.d(tag, 2, "checkRecordTime catch Exception " + localException2);
        return;
        lastCheckTime = l;
        if (MsfStore.getNativeConfigStore() != null)
        {
          MsfStore.getNativeConfigStore().n_setConfig("recordSysTimeKey", String.valueOf(lastCheckTime));
          return;
          if (0L == lastCompareTime) {
            lastCompareTime = l;
          }
        }
      }
    }
  }
  
  public void checkServerTime()
  {
    System.currentTimeMillis();
    long l1 = SystemClock.elapsedRealtime();
    if ((l1 - lastGetServerTimeInterval > 0L) && (l1 - lastGetServerTimeInterval <= com.tencent.mobileqq.msf.core.a.a.G()))
    {
      if (QLog.isColorLevel()) {
        QLog.d(tag, 2, "quit to checkTimeMsg too frequency.");
      }
      return;
    }
    if (sendGetServerTimeMsgCount < 10)
    {
      sendNewCheckServerTime();
      sendGetServerTimeMsgCount += 1;
      lastGetServerTimeInterval = l1;
    }
    for (;;)
    {
      long l2 = System.currentTimeMillis();
      if ((firstGetServerTime == 0L) || (l1 - firstGetServerTime > 600000L))
      {
        firstGetServerTime = l1;
        sendGetServerTimeMsgCount = 0;
      }
      lastCheckTime = l2;
      if (MsfStore.getNativeConfigStore() == null) {
        break;
      }
      MsfStore.getNativeConfigStore().n_setConfig("recordSysTimeKey", String.valueOf(l2));
      return;
      if (QLog.isColorLevel()) {
        QLog.d(tag, 2, "also send checkTimeMsg " + sendGetServerTimeMsgCount);
      }
    }
  }
  
  void checkWifiSignalStrengths()
  {
    for (;;)
    {
      try
      {
        boolean bool = calculateSignalLevel;
        if (!bool) {
          break label134;
        }
        try
        {
          Object localObject1 = (WifiManager)BaseApplication.getContext().getSystemService("wifi");
          if (localObject1 != null)
          {
            localObject1 = ((WifiManager)localObject1).getConnectionInfo();
            if (localObject1 == null) {
              continue;
            }
            i = 1;
            if (((WifiInfo)localObject1).getBSSID() == null) {
              continue;
            }
            j = 1;
            if ((j & i) != 0) {
              lastWifiStrength = WifiManager.calculateSignalLevel(((WifiInfo)localObject1).getRssi(), 32);
            }
          }
        }
        catch (Exception localException)
        {
          int i;
          int j;
          QLog.d(tag, 1, "check WifiState error " + localException, localException);
          calculateSignalLevel = false;
          continue;
        }
        return;
      }
      finally {}
      i = 0;
      continue;
      j = 0;
      continue;
      label134:
      lastWifiStrength = 0;
    }
  }
  
  public void handleGetServerTimeResp(long paramLong)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(tag, 4, "handleGetServerTimeResp servertime is " + paramLong);
    }
    NetConnInfoCenter.servetTimeSecondInterv = paramLong - System.currentTimeMillis() / 1000L;
    SharedPreferences.Editor localEditor = BaseApplication.getContext().getSharedPreferences(tag, 0).edit();
    localEditor.putLong("servetTimeDiff", NetConnInfoCenter.servetTimeSecondInterv);
    localEditor.commit();
    if (QLog.isColorLevel()) {
      QLog.d(tag, 2, "set serverTime is " + msfCoretimeFormatter.format(Long.valueOf(System.currentTimeMillis() + NetConnInfoCenter.servetTimeSecondInterv * 1000L)));
    }
    MsfCore.initAppProMsg("*", msfCoresender.f());
  }
  
  public void onConnClosed(com.tencent.qphone.base.a paramA)
  {
    NetConnInfoCenter.socketConnState = 1;
    if ((msfCore != null) || (msfCorepushManager != null)) {
      try
      {
        msfCorepushManager.a(paramA);
        if ((msfCorestandbyModeManager != null) && (!msfCorestandbyModeManager.b()))
        {
          paramA = new FromServiceMsg(msfCore.getMsfAppid(), MsfCore.getNextSeq(), "0", "cmd_connClosed");
          paramA.setMsgSuccess();
          paramA.setMsfCommand(MsfCommand.onConnClosed);
          MsfSdkUtils.addFromMsgProcessName("*", paramA);
          msfCore.addRespToQuque(null, paramA);
          return;
        }
        QLog.d(tag, 1, "onConnClosed, stop notify by standby");
        return;
      }
      catch (Exception paramA)
      {
        QLog.d(tag, 1, "", paramA);
      }
    }
  }
  
  public void onConnOpened(String paramString1, String paramString2)
  {
    NetConnInfoCenter.socketConnState = 2;
    msfCorepushManager.d();
    if ((msfCorestandbyModeManager != null) && (!msfCorestandbyModeManager.b()))
    {
      FromServiceMsg localFromServiceMsg = new FromServiceMsg(msfCore.getMsfAppid(), MsfCore.getNextSeq(), "0", "cmd_connOpened");
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
      localFromServiceMsg.setMsfCommand(MsfCommand.onConnOpened);
      localFromServiceMsg.addAttribute("resp_connopen_serverAdd", paramString1);
      localFromServiceMsg.addAttribute("resp_connopen_localAdd", paramString2);
      if (msfCorepushManager.b()) {
        localFromServiceMsg.addAttribute("resp_needBootApp", Integer.valueOf(1));
      }
      MsfSdkUtils.addFromMsgProcessName("*", localFromServiceMsg);
      msfCore.addRespToQuque(null, localFromServiceMsg);
      return;
    }
    if (msfCorestandbyModeManager != null) {
      msfCorestandbyModeManager.g();
    }
    QLog.d(tag, 1, "onConnOpened, stop notify by standby");
  }
  
  public void onOepnConnAllFailed()
  {
    if ((msfCorestandbyModeManager != null) && (!msfCorestandbyModeManager.b()))
    {
      NetConnInfoCenter.socketConnState = 3;
      FromServiceMsg localFromServiceMsg = new FromServiceMsg(msfCore.getMsfAppid(), MsfCore.getNextSeq(), "0", "cmd_connAllFailed");
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
      localFromServiceMsg.setMsfCommand(MsfCommand.onOepnConnAllFailed);
      if (msfCorepushManager.b()) {
        localFromServiceMsg.addAttribute("resp_needBootApp", Integer.valueOf(1));
      }
      MsfSdkUtils.addFromMsgProcessName("*", localFromServiceMsg);
      msfCore.addRespToQuque(null, localFromServiceMsg);
    }
    for (;;)
    {
      msfCoresender.a.h.b();
      return;
      QLog.d(tag, 1, "onOepnConnAllFailed, stop notify by standby");
    }
  }
  
  public void onRecvFirstResp()
  {
    if (isWifiConn()) {
      msfCoresender.a.h.b(_lastWifiSSID);
    }
    if ((msfCorestandbyModeManager != null) && (!msfCorestandbyModeManager.b()))
    {
      NetConnInfoCenter.socketConnState = 4;
      FromServiceMsg localFromServiceMsg = new FromServiceMsg(msfCore.getMsfAppid(), MsfCore.getNextSeq(), "0", "cmd_recvFirstResp");
      localFromServiceMsg.setMsgSuccess();
      localFromServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
      localFromServiceMsg.setMsfCommand(MsfCommand.onReceFirstResp);
      if (msfCorepushManager.b()) {
        localFromServiceMsg.addAttribute("resp_needBootApp", Integer.valueOf(1));
      }
      MsfSdkUtils.addFromMsgProcessName("*", localFromServiceMsg);
      msfCore.addRespToQuque(null, localFromServiceMsg);
      return;
    }
    QLog.d(tag, 1, "onRecvFirstResp, stop notify by standby");
  }
  
  public void registerSignalStrengthsChanged(Context paramContext)
  {
    Object localObject = new a(null);
    ((TelephonyManager)paramContext.getSystemService("phone")).listen((PhoneStateListener)localObject, 256);
    localObject = new b(null);
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("android.net.wifi.RSSI_CHANGED");
    paramContext.registerReceiver((BroadcastReceiver)localObject, localIntentFilter);
  }
  
  /* Error */
  public void setConnInfo(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: invokestatic 857	com/tencent/mobileqq/msf/core/a/d:c	()Ljava/lang/String;
    //   5: astore 5
    //   7: invokestatic 859	com/tencent/mobileqq/msf/core/a/d:b	()Ljava/lang/String;
    //   10: astore 6
    //   12: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   15: iload_1
    //   16: if_icmpne +247 -> 263
    //   19: invokestatic 495	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   22: ifeq +54 -> 76
    //   25: getstatic 63	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:tag	Ljava/lang/String;
    //   28: iconst_2
    //   29: new 202	java/lang/StringBuilder
    //   32: dup
    //   33: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   36: ldc_w 861
    //   39: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: invokestatic 863	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:isNetSupport	()Z
    //   45: invokevirtual 500	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   48: ldc_w 865
    //   51: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: iload_1
    //   55: invokevirtual 519	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   58: ldc_w 867
    //   61: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   64: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   67: invokevirtual 519	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   70: invokevirtual 223	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   73: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   76: aload 5
    //   78: ifnull +90 -> 168
    //   81: getstatic 259	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastWifiSSID	Ljava/lang/String;
    //   84: ifnull +14 -> 98
    //   87: getstatic 259	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastWifiSSID	Ljava/lang/String;
    //   90: aload 5
    //   92: invokevirtual 871	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   95: ifne +73 -> 168
    //   98: invokestatic 495	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   101: ifeq +43 -> 144
    //   104: getstatic 63	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:tag	Ljava/lang/String;
    //   107: iconst_2
    //   108: new 202	java/lang/StringBuilder
    //   111: dup
    //   112: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   115: ldc_w 873
    //   118: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   121: aload 5
    //   123: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   126: ldc_w 875
    //   129: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   132: getstatic 259	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastWifiSSID	Ljava/lang/String;
    //   135: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   138: invokevirtual 223	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   141: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   144: aload 5
    //   146: putstatic 259	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastWifiSSID	Ljava/lang/String;
    //   149: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   152: ifnull +16 -> 168
    //   155: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   158: getfield 879	com/tencent/mobileqq/msf/core/MsfCore:ssoListManager	Lcom/tencent/mobileqq/msf/core/a/d;
    //   161: invokevirtual 881	com/tencent/mobileqq/msf/core/a/d:f	()V
    //   164: aload_0
    //   165: invokespecial 883	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:onWifiConnChanged	()V
    //   168: aload 6
    //   170: ifnull +90 -> 260
    //   173: getstatic 885	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastMobileApn	Ljava/lang/String;
    //   176: ifnull +14 -> 190
    //   179: getstatic 885	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastMobileApn	Ljava/lang/String;
    //   182: aload 6
    //   184: invokevirtual 871	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   187: ifne +73 -> 260
    //   190: invokestatic 495	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   193: ifeq +43 -> 236
    //   196: ldc_w 887
    //   199: iconst_2
    //   200: new 202	java/lang/StringBuilder
    //   203: dup
    //   204: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   207: ldc_w 889
    //   210: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   213: aload 6
    //   215: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   218: ldc_w 891
    //   221: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   224: getstatic 885	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastMobileApn	Ljava/lang/String;
    //   227: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   230: invokevirtual 223	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   233: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   236: aload 6
    //   238: putstatic 885	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastMobileApn	Ljava/lang/String;
    //   241: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   244: ifnull +12 -> 256
    //   247: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   250: getfield 879	com/tencent/mobileqq/msf/core/MsfCore:ssoListManager	Lcom/tencent/mobileqq/msf/core/a/d;
    //   253: invokevirtual 892	com/tencent/mobileqq/msf/core/a/d:e	()V
    //   256: aload_0
    //   257: invokespecial 894	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:onMobileConnChnaged	()V
    //   260: aload_0
    //   261: monitorexit
    //   262: return
    //   263: iload_1
    //   264: ifle +254 -> 518
    //   267: iconst_1
    //   268: invokestatic 896	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:setNetSupport	(Z)V
    //   271: getstatic 102	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:lastConnSuccWithoutNet	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   274: invokevirtual 309	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   277: ifeq +74 -> 351
    //   280: new 898	java/util/HashMap
    //   283: dup
    //   284: invokespecial 899	java/util/HashMap:<init>	()V
    //   287: astore 7
    //   289: aload 7
    //   291: ldc_w 901
    //   294: invokestatic 196	java/lang/System:currentTimeMillis	()J
    //   297: getstatic 104	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:lastConnSuccWithoutNetTime	J
    //   300: lsub
    //   301: ldc2_w 457
    //   304: ldiv
    //   305: invokestatic 678	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   308: invokeinterface 906 3 0
    //   313: pop
    //   314: aload 7
    //   316: ldc_w 908
    //   319: iload_1
    //   320: invokestatic 448	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   323: invokeinterface 906 3 0
    //   328: pop
    //   329: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   332: invokevirtual 533	com/tencent/mobileqq/msf/core/MsfCore:getStatReporter	()Lcom/tencent/mobileqq/msf/core/b/m;
    //   335: ldc_w 910
    //   338: iconst_0
    //   339: lconst_0
    //   340: lconst_0
    //   341: aload 7
    //   343: iconst_0
    //   344: iconst_0
    //   345: invokevirtual 913	com/tencent/mobileqq/msf/core/b/m:a	(Ljava/lang/String;ZJJLjava/util/Map;ZZ)V
    //   348: invokestatic 915	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:resetLastConnSuccWithoutNet	()V
    //   351: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   354: invokestatic 917	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:getNetStatusMsg	(I)Ljava/lang/String;
    //   357: astore 7
    //   359: iload_1
    //   360: invokestatic 917	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:getNetStatusMsg	(I)Ljava/lang/String;
    //   363: astore 8
    //   365: getstatic 63	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:tag	Ljava/lang/String;
    //   368: iconst_1
    //   369: new 202	java/lang/StringBuilder
    //   372: dup
    //   373: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   376: ldc_w 919
    //   379: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   382: aload 7
    //   384: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   387: ldc_w 921
    //   390: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   393: aload 8
    //   395: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   398: invokevirtual 223	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   401: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   404: aload_0
    //   405: invokevirtual 923	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:checkWifiSignalStrengths	()V
    //   408: iload_1
    //   409: iconst_2
    //   410: if_icmpeq +8 -> 418
    //   413: iload_1
    //   414: iconst_3
    //   415: if_icmpne +375 -> 790
    //   418: iconst_1
    //   419: istore 4
    //   421: iload 4
    //   423: invokestatic 925	com/tencent/mobileqq/msf/core/b/i:a	(Z)V
    //   426: ldc 106
    //   428: invokestatic 927	com/tencent/mobileqq/msf/core/w:c	(Ljava/lang/String;)V
    //   431: iconst_0
    //   432: invokestatic 929	com/tencent/mobileqq/msf/core/w:d	(I)V
    //   435: iconst_0
    //   436: istore_3
    //   437: iload_1
    //   438: iconst_1
    //   439: if_icmpne +362 -> 801
    //   442: iload_3
    //   443: istore_2
    //   444: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   447: ifeq +13 -> 460
    //   450: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   453: bipush -2
    //   455: if_icmpne +103 -> 558
    //   458: iload_3
    //   459: istore_2
    //   460: iload_1
    //   461: putstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   464: aload_0
    //   465: invokespecial 883	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:onWifiConnChanged	()V
    //   468: aload_0
    //   469: invokespecial 894	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:onMobileConnChnaged	()V
    //   472: iload_2
    //   473: ifeq +7 -> 480
    //   476: aload_0
    //   477: invokespecial 931	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:closeNowConn	()V
    //   480: iload_1
    //   481: ifle -221 -> 260
    //   484: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   487: ifnull -227 -> 260
    //   490: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   493: getfield 755	com/tencent/mobileqq/msf/core/MsfCore:pushManager	Lcom/tencent/mobileqq/msf/core/push/f;
    //   496: ifnull -236 -> 260
    //   499: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   502: getfield 755	com/tencent/mobileqq/msf/core/MsfCore:pushManager	Lcom/tencent/mobileqq/msf/core/push/f;
    //   505: invokevirtual 933	com/tencent/mobileqq/msf/core/push/f:c	()V
    //   508: goto -248 -> 260
    //   511: astore 5
    //   513: aload_0
    //   514: monitorexit
    //   515: aload 5
    //   517: athrow
    //   518: iconst_0
    //   519: invokestatic 896	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:setNetSupport	(Z)V
    //   522: goto -171 -> 351
    //   525: astore 7
    //   527: getstatic 63	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:tag	Ljava/lang/String;
    //   530: iconst_1
    //   531: new 202	java/lang/StringBuilder
    //   534: dup
    //   535: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   538: ldc_w 935
    //   541: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   544: aload 7
    //   546: invokevirtual 240	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   549: invokevirtual 223	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   552: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   555: goto -129 -> 426
    //   558: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   561: iconst_2
    //   562: if_icmpeq +12 -> 574
    //   565: iload_3
    //   566: istore_2
    //   567: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   570: iconst_3
    //   571: if_icmpne -111 -> 460
    //   574: aload 6
    //   576: ifnull +220 -> 796
    //   579: getstatic 885	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastMobileApn	Ljava/lang/String;
    //   582: ifnull +14 -> 596
    //   585: getstatic 885	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastMobileApn	Ljava/lang/String;
    //   588: aload 6
    //   590: invokevirtual 871	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   593: ifne +203 -> 796
    //   596: invokestatic 495	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   599: ifeq +43 -> 642
    //   602: ldc_w 887
    //   605: iconst_2
    //   606: new 202	java/lang/StringBuilder
    //   609: dup
    //   610: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   613: ldc_w 937
    //   616: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   619: aload 6
    //   621: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   624: ldc_w 891
    //   627: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   630: getstatic 885	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastMobileApn	Ljava/lang/String;
    //   633: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   636: invokevirtual 223	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   639: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   642: aload 6
    //   644: putstatic 885	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastMobileApn	Ljava/lang/String;
    //   647: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   650: ifnull +146 -> 796
    //   653: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   656: getfield 879	com/tencent/mobileqq/msf/core/MsfCore:ssoListManager	Lcom/tencent/mobileqq/msf/core/a/d;
    //   659: invokevirtual 892	com/tencent/mobileqq/msf/core/a/d:e	()V
    //   662: goto +134 -> 796
    //   665: iload_3
    //   666: istore_2
    //   667: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   670: ifeq -210 -> 460
    //   673: iload_3
    //   674: istore_2
    //   675: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   678: bipush -2
    //   680: if_icmpeq -220 -> 460
    //   683: iload_3
    //   684: istore_2
    //   685: getstatic 85	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_activeNetInfoType	I
    //   688: iconst_1
    //   689: if_icmpne -229 -> 460
    //   692: aload 5
    //   694: ifnull +86 -> 780
    //   697: getstatic 259	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastWifiSSID	Ljava/lang/String;
    //   700: ifnull +14 -> 714
    //   703: getstatic 259	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastWifiSSID	Ljava/lang/String;
    //   706: aload 5
    //   708: invokevirtual 871	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   711: ifne +69 -> 780
    //   714: invokestatic 495	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   717: ifeq +43 -> 760
    //   720: getstatic 63	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:tag	Ljava/lang/String;
    //   723: iconst_2
    //   724: new 202	java/lang/StringBuilder
    //   727: dup
    //   728: invokespecial 203	java/lang/StringBuilder:<init>	()V
    //   731: ldc_w 873
    //   734: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   737: aload 5
    //   739: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   742: ldc_w 875
    //   745: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   748: getstatic 259	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastWifiSSID	Ljava/lang/String;
    //   751: invokevirtual 209	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   754: invokevirtual 223	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   757: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   760: aload 5
    //   762: putstatic 259	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:_lastWifiSSID	Ljava/lang/String;
    //   765: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   768: ifnull +12 -> 780
    //   771: getstatic 146	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:msfCore	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   774: getfield 879	com/tencent/mobileqq/msf/core/MsfCore:ssoListManager	Lcom/tencent/mobileqq/msf/core/a/d;
    //   777: invokevirtual 881	com/tencent/mobileqq/msf/core/a/d:f	()V
    //   780: iconst_1
    //   781: istore_2
    //   782: goto -322 -> 460
    //   785: iconst_1
    //   786: istore_2
    //   787: goto -327 -> 460
    //   790: iconst_0
    //   791: istore 4
    //   793: goto -372 -> 421
    //   796: iconst_1
    //   797: istore_2
    //   798: goto -338 -> 460
    //   801: iload_1
    //   802: iconst_2
    //   803: if_icmpeq -138 -> 665
    //   806: iload_1
    //   807: iconst_3
    //   808: if_icmpne -23 -> 785
    //   811: goto -146 -> 665
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	814	0	this	NetConnInfoCenterImpl
    //   0	814	1	paramInt	int
    //   443	355	2	i	int
    //   436	248	3	j	int
    //   419	373	4	bool	boolean
    //   5	140	5	str1	String
    //   511	250	5	localObject1	Object
    //   10	633	6	str2	String
    //   287	96	7	localObject2	Object
    //   525	20	7	localIOException	java.io.IOException
    //   363	31	8	str3	String
    // Exception table:
    //   from	to	target	type
    //   2	76	511	finally
    //   81	98	511	finally
    //   98	144	511	finally
    //   144	168	511	finally
    //   173	190	511	finally
    //   190	236	511	finally
    //   236	256	511	finally
    //   256	260	511	finally
    //   267	351	511	finally
    //   351	408	511	finally
    //   421	426	511	finally
    //   426	435	511	finally
    //   444	458	511	finally
    //   460	472	511	finally
    //   476	480	511	finally
    //   484	508	511	finally
    //   518	522	511	finally
    //   527	555	511	finally
    //   558	565	511	finally
    //   567	574	511	finally
    //   579	596	511	finally
    //   596	642	511	finally
    //   642	662	511	finally
    //   667	673	511	finally
    //   675	683	511	finally
    //   685	692	511	finally
    //   697	714	511	finally
    //   714	760	511	finally
    //   760	780	511	finally
    //   421	426	525	java/io/IOException
  }
  
  private class a
    extends PhoneStateListener
  {
    private a() {}
    
    public void onSignalStrengthsChanged(SignalStrength paramSignalStrength)
    {
      super.onSignalStrengthsChanged(paramSignalStrength);
      int i = paramSignalStrength.getCdmaDbm();
      lastCdmaStrenght = i;
      int j = paramSignalStrength.getGsmSignalStrength();
      i = j;
      if (j == 99) {
        i = -3;
      }
      lastGsmStrength = i;
      checkWifiSignalStrengths();
    }
  }
  
  private class b
    extends BroadcastReceiver
  {
    private b() {}
    
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      checkWifiSignalStrengths();
    }
  }
}
