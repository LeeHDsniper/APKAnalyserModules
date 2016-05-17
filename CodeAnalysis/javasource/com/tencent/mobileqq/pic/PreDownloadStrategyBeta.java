package com.tencent.mobileqq.pic;

import com.tencent.mobileqq.activity.PredownloadTest.ConfigInfo;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.AccountDpcManager.DpcAccountNames;
import com.tencent.mobileqq.app.DeviceProfileManager.DPCObserver;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.asyncdb.CacheManager;
import com.tencent.mobileqq.app.asyncdb.cache.TroopStatisticsCache;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.TroopStatisticsInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.Calendar;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicBoolean;

public class PreDownloadStrategyBeta
  extends BaseStrategy
  implements DeviceProfileManager.DPCObserver
{
  public static final String A = "xgFlowWasteBalance";
  public static final String B = "PicDPy471";
  public static final String C = "AMaxWFlow3G";
  public static final String D = "AMaxPDFlow3G";
  public static final String E = "AFBFlowHit3G";
  public static final String F = "AFBFlowMiss3G";
  public static final String G = "APicAvgSize";
  public static final String H = "APicMaxSize";
  public static final String I = "enablePeakFlow";
  public static final String J = "PeakFlowTimePeriod";
  public static final String K = "PeakFlowMaxPicSize";
  private static final String L = "PIC_TAG_PRELOAD.PreDownloadStrategyBeta";
  public static String h = "PRE_DOWNLOAD_TROOP_STATISTICS_KEY";
  public static String i = "PRE_DOWNLOAD_TROOP_STATISTICS_TIME";
  public static final String j = "4gFlowPre";
  public static final String k = "4gFlowWaste";
  public static final String l = "xgFlowPre";
  public static final String m = "xgFlowWaste";
  public static final String n = "xgPreDownCount";
  public static final String o = "xgHitCount";
  public static final String p = "xgMissCount";
  public static final String q = "xgManulClickCount";
  public static final String r = "wifiPreDownCout";
  public static final String s = "wifiHitCount";
  public static final String t = "wifiMissCount";
  public static final String u = "wifiManulClickCount";
  public static final String v = "accFlowPreTotal";
  public static final String w = "accFlowWasteTotal";
  public static final String x = "accDays";
  public static final String y = "accStartDay";
  public static final String z = "lastDayTime";
  public long A;
  public long B;
  public long C;
  public long D;
  public long E;
  public long F;
  public long G = -1L;
  public long H;
  public long I;
  public long J;
  public long K;
  public long L;
  public long M;
  public long N;
  public long O;
  public long P;
  public long Q;
  public long R;
  public long S;
  public long T = 2147483647L;
  public long U = 2147483647L;
  public long V = 2147483647L;
  public long W = 2147483647L;
  public long X = 0L;
  public long Y;
  public float a;
  public TroopStatisticsCache a;
  private PicStatisticsManager a;
  public AtomicBoolean a;
  public boolean a;
  public long[] a;
  private QQAppInterface b;
  public long m;
  public long n;
  public long o;
  public long p;
  public long q;
  public long r;
  public long s;
  public long t;
  public long u;
  public long v;
  public long w;
  public long x;
  public long y;
  public long z;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public PreDownloadStrategyBeta()
  {
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
  }
  
  private long a(long paramLong)
  {
    long l1 = paramLong;
    if (paramLong == 0L)
    {
      paramLong = q;
      l1 = paramLong;
      if (QLog.isColorLevel())
      {
        Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "calcFlowConsume", "picSize==0,fix by pisSizeAvg");
        l1 = paramLong;
      }
    }
    return l1;
  }
  
  private void a(int paramInt, long paramLong1, long paramLong2, boolean paramBoolean)
  {
    if (paramInt == 1)
    {
      l2 = E;
      l1 = F;
      E += paramLong1;
      F += paramLong2;
      if (E > w)
      {
        paramLong1 = w;
        E = paramLong1;
        if (E >= 0L) {
          break label204;
        }
        paramLong1 = 0L;
        label71:
        E = paramLong1;
        if (F >= 0L) {
          break label212;
        }
      }
      label204:
      label212:
      for (paramLong1 = 0L;; paramLong1 = F)
      {
        F = paramLong1;
        paramLong2 = E;
        paramLong1 = F;
        PicPreDownloadUtils.a("4gFlowPre", E, false);
        PicPreDownloadUtils.a("4gFlowWaste", F, paramBoolean);
        if (QLog.isColorLevel()) {
          Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "updateFlow", "networkType=" + paramInt + ", preFlowPre=" + l2 + " preFlowWaste=" + l1 + "flowPre=" + paramLong2 + ", flowWaste:" + paramLong1);
        }
        return;
        paramLong1 = E;
        break;
        paramLong1 = E;
        break label71;
      }
    }
    long l2 = G;
    long l1 = H;
    G += paramLong1;
    H += paramLong2;
    if (G > C)
    {
      paramLong1 = C;
      label270:
      G = paramLong1;
      if (G >= 0L) {
        break label350;
      }
      paramLong1 = 0L;
      label286:
      G = paramLong1;
      if (H >= 0L) {
        break label358;
      }
    }
    label350:
    label358:
    for (paramLong1 = 0L;; paramLong1 = H)
    {
      H = paramLong1;
      paramLong2 = G;
      paramLong1 = H;
      PicPreDownloadUtils.a("xgFlowPre", G, false);
      PicPreDownloadUtils.a("xgFlowWaste", H, paramBoolean);
      break;
      paramLong1 = G;
      break label270;
      paramLong1 = G;
      break label286;
    }
  }
  
  private void a(MessageForPic paramMessageForPic, long paramLong, int paramInt1, int paramInt2)
  {
    jdField_a_of_type_ComTencentMobileqqPicPicStatisticsManager.a(paramInt1, paramInt2, mNotPredownloadReason);
    preDownState = 2;
    a(paramMessageForPic);
    if (paramInt1 == 0)
    {
      Q += 1L;
      PicPreDownloadUtils.a("wifiHitCount", Q, true);
      if (QLog.isColorLevel()) {
        Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "payHit", "networkType:" + paramInt1 + ",wifiHitCount:" + Q + ",uniseq:" + uniseq);
      }
    }
    do
    {
      return;
      paramLong = a(paramLong);
      a(paramInt1, n * paramLong / 100L, -paramLong, false);
      M += 1L;
      J -= paramLong;
      PicPreDownloadUtils.a("accFlowWasteTotal", J, false);
      PicPreDownloadUtils.a("xgHitCount", M, true);
    } while (!QLog.isColorLevel());
    Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "payHit", "networkType:" + paramInt1 + ",xgHitCount:" + M + ",uniseq:" + uniseq);
    Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "payHit", "accFlowPreTotal:" + I + ",accFlowWasteTotal:" + J);
  }
  
  private void b(MessageForPic paramMessageForPic, long paramLong, int paramInt1, int paramInt2)
  {
    if (b != null)
    {
      PicPreDownloader localPicPreDownloader = b.a();
      if (localPicPreDownloader != null)
      {
        if ((mNotPredownloadReason != 0) && (mNotPredownloadReason != 1)) {
          break label166;
        }
        int i1 = localPicPreDownloader.a(paramMessageForPic);
        jdField_a_of_type_ComTencentMobileqqPicPicStatisticsManager.e(paramInt1, i1);
        jdField_a_of_type_ComTencentMobileqqPicPicStatisticsManager.a(paramInt1, i1);
        jdField_a_of_type_ComTencentMobileqqPicPicStatisticsManager.c(paramInt1, paramInt2);
      }
    }
    preDownState = 3;
    a(paramMessageForPic);
    if (paramInt1 == 0)
    {
      R += 1L;
      PicPreDownloadUtils.a("wifiMissCount", R, true);
      Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "payMiss", "networkType:" + paramInt1 + ",wifiMissCount:" + R + ",uniseq:" + uniseq);
    }
    label166:
    do
    {
      return;
      jdField_a_of_type_ComTencentMobileqqPicPicStatisticsManager.a(preDownNetworkType, mNotPredownloadReason);
      if (mNotPredownloadReason == -1) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqPicPicStatisticsManager.c(paramInt1, paramInt2);
      break;
      a(paramInt1, o, 0L, false);
      N += 1L;
      PicPreDownloadUtils.a("xgMissCount", N, true);
    } while (!QLog.isColorLevel());
    Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "payMiss", "networkType:" + paramInt1 + ", xgMissCount:" + N + ", uniseq:" + uniseq);
  }
  
  private void c(MessageForPic paramMessageForPic, long paramLong, int paramInt1, int paramInt2)
  {
    preDownState = 5;
    a(paramMessageForPic);
    if (paramInt1 == 0) {
      if (QLog.isColorLevel()) {
        Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "payLeftRight", "networkType:" + paramInt1 + ",wifiHitCount:" + Q + ",uniseq:" + uniseq);
      }
    }
    do
    {
      return;
      a(paramInt1, p, 0L, true);
    } while (!QLog.isColorLevel());
    Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "payLeftRight", "networkType:" + paramInt1 + ",xgHitCount:" + M + ",uniseq:" + uniseq);
  }
  
  private void d(MessageForPic paramMessageForPic, long paramLong, int paramInt1, int paramInt2)
  {
    jdField_a_of_type_ComTencentMobileqqPicPicStatisticsManager.d(paramInt1, paramInt2);
    preDownState = 6;
    a(paramMessageForPic);
    if (paramInt1 == 0) {
      if (QLog.isColorLevel()) {
        Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "payNotSupport", "networkType:" + paramInt1 + ",wifiHitCount:" + Q + ",uniseq:" + uniseq);
      }
    }
    do
    {
      return;
      a(paramInt1, p, 0L, true);
    } while (!QLog.isColorLevel());
    Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "payNotSupport", "networkType:" + paramInt1 + ",xgHitCount:" + M + ", uniseq:" + uniseq);
  }
  
  private void e()
  {
    E = PicPreDownloadUtils.a("4gFlowPre", w);
    F = PicPreDownloadUtils.a("4gFlowWaste", 0L);
    G = PicPreDownloadUtils.a("xgFlowPre", C);
    H = PicPreDownloadUtils.a("xgFlowWaste", 0L);
    Q = PicPreDownloadUtils.a("wifiHitCount", Q);
    R = PicPreDownloadUtils.a("wifiMissCount", R);
    S = PicPreDownloadUtils.a("wifiManulClickCount", S);
    P = PicPreDownloadUtils.a("wifiPreDownCout", P);
    M = PicPreDownloadUtils.a("xgHitCount", M);
    N = PicPreDownloadUtils.a("xgMissCount", N);
    O = PicPreDownloadUtils.a("xgManulClickCount", O);
    L = PicPreDownloadUtils.a("xgPreDownCount", L);
    I = PicPreDownloadUtils.a("accFlowPreTotal", I);
    J = PicPreDownloadUtils.a("accFlowWasteTotal", J);
    if (QLog.isColorLevel()) {
      QLog.d("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, "getLocalConfig(): wifiHitCount=" + Q + " wifiMissCount=" + R + " wifiManulClickCount=" + S + " wifiPreDownCout=" + P + " _4gFlowPre=" + E + " _4gFlowWaste=" + F + " xgFlowPre=" + G + " xgFlowWaste=" + H + " xgHitCount=" + M + " xgMissCount=" + N + " xgManulClickCount=" + O + " xgPreDownCout=" + L + " accFlowPreTotal=" + I + " accFlowWasteTotal=" + J);
    }
  }
  
  private void f()
  {
    Object localObject = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.PicPredownloadFlow.name(), "1200|400|1400|400|600|200|700|200");
    if (QLog.isColorLevel()) {
      QLog.d("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, "initDPCConfig(): config=" + (String)localObject);
    }
    if (localObject != null)
    {
      localObject = ((String)localObject).split("\\|");
      if (localObject.length == 8) {}
    }
    else
    {
      if (QLog.isColorLevel()) {
        QLog.d("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, "initDPCConfig(): Error, use Server config");
      }
      y = PicPreDownloadUtils.a(b, "AMaxPDFlow3G", 614400L);
      z = PicPreDownloadUtils.a(b, "AMaxWFlow3G", 716800L);
      A = 0L;
      B = 0L;
      s = y;
      u = 0L;
      t = z;
      v = 0L;
      w = (s + u);
      x = (t + v);
      C = (y + A);
      D = (z + B);
      if (QLog.isColorLevel()) {
        QLog.d("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, "initDPCConfig():_4gFlowPreLimit=" + s + " _4gFlowWasteLimit=" + t + "" + " _4gFlowPreFloatLimit" + u + " _4gFlowWasteFloatLimit=" + v + " xgFlowPreLimit=" + y + " xgFlowWasteLimit=" + z + " xgFlowPreFloatLimit=" + A + " xgFlowWasteFloatLimit=" + B);
      }
      localObject = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.PicPredownloadConfig.name(), "");
      if (QLog.isColorLevel()) {
        QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "initDPCConfig(): troopConfig=" + (String)localObject);
      }
      if (localObject == null) {}
    }
    for (;;)
    {
      try
      {
        if (!"".equals(localObject))
        {
          localObject = ((String)localObject).split("\\|");
          if (localObject.length >= 4) {
            continue;
          }
        }
        if (QLog.isColorLevel()) {
          QLog.d("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, "initDPCConfig(): troopConfig Error, use default config");
        }
      }
      catch (Exception localException)
      {
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.e("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, localException.getMessage());
        continue;
      }
      if (QLog.isColorLevel()) {
        QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "initDPCConfig(): troopDefaultCount=" + T + ", troopIncreaseCountEnterAIO=" + U + ", troopMaxCount=" + V + ", troopMinPicSize=" + W);
      }
      return;
      s = (Integer.valueOf(localObject[0]).intValue() * 1024);
      u = (Integer.valueOf(localObject[1]).intValue() * 1024);
      t = (Integer.valueOf(localObject[2]).intValue() * 1024);
      v = (Integer.valueOf(localObject[3]).intValue() * 1024);
      y = (Integer.valueOf(localObject[4]).intValue() * 1024);
      A = (Integer.valueOf(localObject[5]).intValue() * 1024);
      z = (Integer.valueOf(localObject[6]).intValue() * 1024);
      B = (Integer.valueOf(localObject[7]).intValue() * 1024);
      break;
      T = Long.parseLong(localObject[0]);
      U = Long.parseLong(localObject[1]);
      V = Long.parseLong(localObject[2]);
      W = (Long.parseLong(localObject[3]) * 1024L);
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
    }
  }
  
  public int a(long paramLong, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    int i1 = super.a(paramLong, paramInt1, paramInt2, paramBoolean);
    if (i1 != 0) {
      paramInt1 = i1;
    }
    do
    {
      boolean bool;
      do
      {
        return paramInt1;
        i1 = 0;
        bool = DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name());
        if (QLog.isColorLevel()) {
          Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "isOverLimit()", "NetworkType:" + paramInt2 + " isInDPCWhiteList:" + bool);
        }
        if (paramInt2 != 0) {
          break;
        }
        paramInt1 = i1;
      } while (!QLog.isColorLevel());
      Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "isOverLimit()", "Wifi, result=" + 0);
      return 0;
      if ((!bool) || (paramInt2 == 3)) {
        break;
      }
      paramInt1 = i1;
    } while (!QLog.isColorLevel());
    Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "isOverLimit()", "InDPCWhiteList, result=" + 0);
    return 0;
    long l3 = a(paramLong);
    long l1;
    label219:
    long l2;
    if (paramBoolean) {
      if (paramInt2 == 1)
      {
        paramLong = t;
        if (paramInt2 != 1) {
          break label396;
        }
        l1 = E - u;
        if (paramInt2 != 1) {
          break label410;
        }
        l2 = F;
        label231:
        if ((l1 >= l3) && (l2 + l3 < paramLong)) {
          break label490;
        }
        if (l1 >= l3) {
          break label483;
        }
        i1 = -9;
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "isOverLimit", "result:" + i1 + ",FlowWaste +picSize=" + (l2 + l3) + ",FlowWasteLimit：" + paramLong + ",FlowPre:" + l1 + ",picSize:" + l3 + ",FlowWaste:" + l2 + ",uinType:" + paramInt1 + ",networkType:" + paramInt2 + ",isDynamic:" + paramBoolean);
      }
      return i1;
      paramLong = z;
      break;
      label396:
      l1 = G - A;
      break label219;
      label410:
      l2 = H;
      break label231;
      if (paramInt2 == 1)
      {
        paramLong = x;
        label430:
        if (paramInt2 != 1) {
          break label465;
        }
        l1 = E;
        label442:
        if (paramInt2 != 1) {
          break label474;
        }
      }
      label465:
      label474:
      for (l2 = F;; l2 = H)
      {
        break;
        paramLong = D;
        break label430;
        l1 = G;
        break label442;
      }
      label483:
      i1 = -10;
      continue;
      label490:
      if ((!paramBoolean) && (l1 - l3 < u)) {
        i1 = 1;
      } else {
        i1 = 0;
      }
    }
  }
  
  public PredownloadTest.ConfigInfo a()
  {
    PredownloadTest.ConfigInfo localConfigInfo = new PredownloadTest.ConfigInfo();
    a = z;
    b = y;
    d = G;
    c = H;
    e = n;
    f = o;
    return localConfigInfo;
  }
  
  public HashMap a()
  {
    HashMap localHashMap = new HashMap();
    long l1 = PicPreDownloadUtils.a("4gFlowPre", E);
    long l2 = PicPreDownloadUtils.a("4gFlowWaste", F);
    long l3 = PicPreDownloadUtils.a("xgFlowPre", G);
    long l4 = PicPreDownloadUtils.a("xgFlowWaste", H);
    long l5 = PicPreDownloadUtils.a("accFlowPreTotal", I);
    long l6 = PicPreDownloadUtils.a("xgPreDownCount", L);
    long l7 = PicPreDownloadUtils.a("xgHitCount", M);
    long l8 = PicPreDownloadUtils.a("xgMissCount", N);
    long l9 = PicPreDownloadUtils.a("wifiPreDownCout", P);
    long l10 = PicPreDownloadUtils.a("wifiHitCount", Q);
    long l11 = PicPreDownloadUtils.a("wifiMissCount", R);
    long l12 = PicPreDownloadUtils.a("xgManulClickCount", O);
    long l13 = PicPreDownloadUtils.a("wifiManulClickCount", S);
    if (QLog.isColorLevel()) {
      Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "getReportInfo", "\n|- sp4gFlowPre:" + l1 + "\n|- sp4gFlowWaste:" + l2 + "\n|- spXgFlowPre:" + l3 + "\n|-  spXgFlowWaste：" + l4 + "\n|-  spFlowPreTotal:" + l5 + "\n|-  spXgPreDownCount：" + l6 + "\n|-  spXgHitCount:" + l7 + "\n|-  spXgMissCount：" + l8 + "\n|-  spWifiPreDownCount:" + l9 + "\n|-  spWifiHitCount：" + l10 + "\n|-  spWifiMissCount:" + l11 + "\n|-  spXgManulClickCount：" + l12 + "\n|-  spWifiManulClickCount:" + l13);
    }
    localHashMap.put("4gFlowPre", String.valueOf(l1));
    localHashMap.put("4gFlowWaste", String.valueOf(l2));
    localHashMap.put("xgFlowPre", String.valueOf(l3));
    localHashMap.put("xgFlowWaste", String.valueOf(l4));
    if ((l7 != 0L) || (l8 != 0L) || (l6 != 0L))
    {
      localHashMap.put("accFlowPreTotal", String.valueOf(l5));
      localHashMap.put("xgPreDownCount", String.valueOf(l6));
      localHashMap.put("xgHitCount", String.valueOf(l7));
      localHashMap.put("xgMissCount", String.valueOf(l6 - l7));
      localHashMap.put("xgManulClickCount", String.valueOf(l12));
      localHashMap.put("xgFlowWasteBalance", String.valueOf(z - l4));
    }
    localHashMap.put("wifiPreDownCout", String.valueOf(l9));
    localHashMap.put("wifiHitCount", String.valueOf(l10));
    localHashMap.put("wifiMissCount", String.valueOf(l11));
    localHashMap.put("wifiManulClickCount", String.valueOf(l13));
    return localHashMap;
  }
  
  public void a(long paramLong, int paramInt)
  {
    if (paramInt == 0)
    {
      P += 1L;
      PicPreDownloadUtils.a("wifiPreDownCout", P, true);
    }
    do
    {
      return;
      paramLong = a(paramLong);
      a(paramInt, -paramLong, paramLong, false);
      I += paramLong;
      J += paramLong;
      L += 1L;
      PicPreDownloadUtils.a("accFlowPreTotal", I, false);
      PicPreDownloadUtils.a("accFlowWasteTotal", J, false);
      PicPreDownloadUtils.a("xgPreDownCount", L, true);
    } while (!QLog.isColorLevel());
    Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "calcFlowConsume", "networkType:" + paramInt + ",wifiPreDownCout:" + P + ",xgPreDownCout:" + L);
    Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "calcFlowConsume", "accFlowPreTotal:" + I + ",accFlowWasteTotal:" + J);
  }
  
  public void a(PredownloadTest.ConfigInfo paramConfigInfo)
  {
    if (a != -1L) {
      z = a;
    }
    if (b != -1L) {
      y = b;
    }
    if (d != -1L)
    {
      G = d;
      PicPreDownloadUtils.a("xgFlowPre", G, true);
    }
    if (c != -1L)
    {
      H = c;
      PicPreDownloadUtils.a("xgFlowWaste", H, true);
    }
    if (e != -1L) {
      n = e;
    }
    if (f != -1L) {
      o = f;
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    super.a(paramQQAppInterface);
    b = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqPicPicStatisticsManager = ((PicStatisticsManager)b.getManager(72));
    jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheTroopStatisticsCache = ((TroopStatisticsCache)b.a().a(3));
    f();
    c();
    e();
    long l1 = System.currentTimeMillis();
    if (l1 - PicPreDownloadUtils.a("lastDayTime", 0L) > 86400000L) {
      if (paramQQAppInterface == null) {
        break label142;
      }
    }
    label142:
    for (String str = paramQQAppInterface.a();; str = null)
    {
      PicPreDownloadUtils.a("lastDayTime", l1, true);
      PicReporter.a(str, a());
      d();
      if (paramQQAppInterface != null) {
        ((PicStatisticsManager)paramQQAppInterface.getManager(72)).a();
      }
      if (QLog.isColorLevel()) {
        Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "init", "");
      }
      return;
    }
  }
  
  public void a(MessageForPic paramMessageForPic)
  {
    PicPreDownloadUtils.a(b, paramMessageForPic);
  }
  
  public void a(MessageForPic paramMessageForPic, long paramLong)
  {
    if ((paramMessageForPic != null) && (size == 0L) && ((preDownState == 1) || (preDownState == 2) || (preDownState == 3)))
    {
      size = paramLong;
      a(paramMessageForPic);
      if (preDownNetworkType != 0) {
        break label55;
      }
    }
    label55:
    do
    {
      return;
      paramLong = q - paramLong;
      a(preDownNetworkType, paramLong, -paramLong, false);
      I -= paramLong;
      J -= paramLong;
      PicPreDownloadUtils.a("accFlowPreTotal", I, false);
      PicPreDownloadUtils.a("accFlowWasteTotal", J, true);
    } while (!QLog.isColorLevel());
    Logger.a("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", "fixPicSizeAfter", "accFlowPreTotal:" + I + ",accFlowWasteTotal:" + J);
  }
  
  public void a(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheTroopStatisticsCache == null) {}
    TroopStatisticsInfo localTroopStatisticsInfo;
    do
    {
      do
      {
        return;
        if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "DPC has not been initialized");
      return;
      localTroopStatisticsInfo = jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheTroopStatisticsCache.a(paramString);
      if (localTroopStatisticsInfo == null) {
        break label139;
      }
      paramString = Long.valueOf(count - 1L);
      if (paramString.longValue() >= 0L) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "payPredownloadTroopPicCount troopRemainCount = 0");
    return;
    count = paramString.longValue();
    for (paramString = localTroopStatisticsInfo;; paramString = localTroopStatisticsInfo)
    {
      jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheTroopStatisticsCache.a(paramString);
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "payPredownloadTroopPicCount troopRemainCount = " + count);
      return;
      label139:
      localTroopStatisticsInfo = new TroopStatisticsInfo();
      troopUin = paramString;
      count = (T - 1L);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    if (!jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get())
    {
      if (QLog.isColorLevel()) {
        Logger.a("PIC_TAG_PRELOAD_TROOP", "onDpcPullFinished", "try to initDPCConfig again");
      }
      f();
    }
  }
  
  public boolean a(MessageForPic paramMessageForPic)
  {
    if (PicPreDownloadUtils.a(b, istroop, frienduin) != 0) {}
    label337:
    for (;;)
    {
      return true;
      if (!jdField_a_of_type_Boolean)
      {
        if (QLog.isColorLevel())
        {
          QLog.d("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, "canPredownloadInPeakFlowTime(): Peek Flow is disable[true]");
          return true;
        }
      }
      else
      {
        int i2 = jdField_a_of_type_ArrayOfLong.length;
        if ((i2 == 0) || ((i2 & 0x1) != 0))
        {
          if (QLog.isColorLevel()) {
            QLog.d("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, "canPredownloadInPeakFlowTime():  The length(" + i2 + ") of PeakFlowTimePeriod is error![false]");
          }
          return false;
        }
        int i3 = PicPreDownloadUtils.a();
        int i4 = Calendar.getInstance().get(11);
        int i1 = 0;
        for (;;)
        {
          if (i1 >= i2) {
            break label337;
          }
          if ((i4 >= jdField_a_of_type_ArrayOfLong[i1]) && (i4 < jdField_a_of_type_ArrayOfLong[(i1 + 1)]))
          {
            if (size > Y)
            {
              if (QLog.isColorLevel()) {
                QLog.d("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, "picSize=" + size + " is larger than PeakFlowMaxPicSize(" + Y + ")[false]");
              }
              return false;
            }
            if ((size > W) && (i3 == 0))
            {
              if (!a(frienduin)) {
                return false;
              }
              if (!paramMessageForPic.hasBigFile())
              {
                a(frienduin);
                return true;
              }
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "try to download, but the big picture already exists");
              return true;
            }
            if (QLog.isColorLevel()) {
              QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "try to download because the pic.size=" + size + " < troopMinPicSize=" + W);
            }
          }
          i1 += 2;
        }
      }
    }
  }
  
  public boolean a(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheTroopStatisticsCache == null) {}
    do
    {
      do
      {
        return true;
        if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "DPC has not been initialized");
      return true;
      paramString = jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheTroopStatisticsCache.a(paramString);
    } while ((paramString == null) || (count - 1L >= 0L));
    if (QLog.isColorLevel()) {
      QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "don't predownload because troopRemainCount = 0");
    }
    return false;
  }
  
  public boolean[] a(int paramInt1, int paramInt2)
  {
    int i2;
    int i1;
    boolean bool1;
    if ((DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name())) && (paramInt2 != 3))
    {
      i2 = PicPreDownloadUtils.a(0, paramInt1, 0);
      i1 = PicPreDownloadUtils.a(0, paramInt1, 1);
      if ((m >> i2 & 1L) != 1L) {
        break label180;
      }
      bool1 = true;
      label52:
      if ((m >> i1 & 1L) != 1L) {
        break label186;
      }
    }
    label180:
    label186:
    for (boolean bool2 = true;; bool2 = false)
    {
      if (QLog.isColorLevel()) {
        Logger.a("PIC_TAG_PRELOAD", "isPreDownload", "netWokrType:" + paramInt2 + ",uinType:" + paramInt1 + ",preDownThumb:" + bool1 + ",preDownBig:" + bool2 + ",xGPreDownPolicy:" + m);
      }
      return new boolean[] { bool1, bool2 };
      i2 = PicPreDownloadUtils.a(paramInt2, paramInt1, 0);
      i1 = PicPreDownloadUtils.a(paramInt2, paramInt1, 1);
      break;
      bool1 = false;
      break label52;
    }
  }
  
  public void b(MessageForPic paramMessageForPic, long paramLong)
  {
    if (paramMessageForPic.isSendFromLocal()) {}
    int i1;
    do
    {
      do
      {
        return;
      } while (subVersion < 5);
      i1 = PicPreDownloadUtils.a(b, istroop, frienduin);
      if (preDownState == 1)
      {
        a(paramMessageForPic, paramLong, preDownNetworkType, i1);
        return;
      }
      if (preDownState == 0)
      {
        if (a(i1, preDownNetworkType)[1] == 0)
        {
          d(paramMessageForPic, paramLong, preDownNetworkType, i1);
          return;
        }
        b(paramMessageForPic, paramLong, preDownNetworkType, i1);
        return;
      }
    } while (preDownState != 4);
    c(paramMessageForPic, paramLong, preDownNetworkType, i1);
  }
  
  public void b(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheTroopStatisticsCache == null) {}
    do
    {
      return;
      if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "DPC has not been initialized");
    return;
    TroopStatisticsInfo localTroopStatisticsInfo = jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheTroopStatisticsCache.a(paramString);
    long l1;
    if (localTroopStatisticsInfo != null)
    {
      long l2 = count + U;
      l1 = l2;
      if (l2 > V) {
        l1 = V;
      }
      count = l1;
    }
    for (paramString = localTroopStatisticsInfo;; paramString = localTroopStatisticsInfo)
    {
      jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheTroopStatisticsCache.b(paramString);
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("PIC_TAG_PRELOAD_TROOP", 2, "increaseTroopCountWhenEnterAIO troopRemainCount=" + l1);
      return;
      l1 = T + U;
      localTroopStatisticsInfo = new TroopStatisticsInfo();
      troopUin = paramString;
      count = l1;
    }
  }
  
  public void c()
  {
    int i1 = 0;
    m = PicPreDownloadUtils.a(b, "PicDPy471", 1374942199L);
    n = PicPreDownloadUtils.a(b, "AFBFlowHit3G", 150L);
    o = PicPreDownloadUtils.a(b, "AFBFlowMiss3G", 40960L);
    p = o;
    q = PicPreDownloadUtils.a(b, "APicAvgSize", 71680L);
    r = PicPreDownloadUtils.a(b, "APicMaxSize", 204800L);
    jdField_a_of_type_Boolean = PicPreDownloadUtils.a(b, false);
    jdField_a_of_type_ArrayOfLong = PicPreDownloadUtils.a(b);
    Y = PicPreDownloadUtils.a(b, "APicMaxSize", 921600L);
    int i2;
    if (QLog.isColorLevel())
    {
      i2 = jdField_a_of_type_ArrayOfLong.length;
      if ((i2 != 0) && ((i2 & 0x1) == 0)) {
        break label309;
      }
    }
    for (Object localObject = "Error(Length=" + i2 + ")";; localObject = ((StringBuilder)localObject).toString())
    {
      QLog.d("PIC_TAG_PRELOAD.PreDownloadStrategyBeta", 2, "getServerConfig(): xGPreDownPolicy=" + m + " xgFlowHitFeedback=" + n + " XgFlowMissFeedback=" + o + " XgFlowLeftRightFeddback=" + p + " pisSizeAvg=" + q + " pisSizeMax=" + r + " mEnablePeakFlow=" + jdField_a_of_type_Boolean + " mPeakFlowTimePeriod=" + (String)localObject + " mPeakFlowMaxPicSize=" + Y);
      return;
      label309:
      localObject = new StringBuilder();
      while (i1 < i2)
      {
        ((StringBuilder)localObject).append(String.valueOf(jdField_a_of_type_ArrayOfLong[i1])).append("-").append(String.valueOf(jdField_a_of_type_ArrayOfLong[(i1 + 1)])).append(" ");
        i1 += 2;
      }
    }
  }
  
  public void d()
  {
    Q = 0L;
    R = 0L;
    S = 0L;
    P = 0L;
    F = 0L;
    H = 0L;
    M = 0L;
    N = 0L;
    O = 0L;
    L = 0L;
    PicPreDownloadUtils.a("wifiHitCount", Q, false);
    PicPreDownloadUtils.a("wifiMissCount", R, false);
    PicPreDownloadUtils.a("wifiManulClickCount", S, false);
    PicPreDownloadUtils.a("wifiPreDownCout", P, false);
    PicPreDownloadUtils.a("4gFlowWaste", F, false);
    PicPreDownloadUtils.a("xgFlowWaste", H, false);
    PicPreDownloadUtils.a("xgHitCount", M, false);
    PicPreDownloadUtils.a("xgMissCount", N, false);
    PicPreDownloadUtils.a("xgManulClickCount", O, false);
    PicPreDownloadUtils.a("xgPreDownCount", L, true);
  }
}
