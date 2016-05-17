package com.tencent.mobileqq.activity.photo;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.Environment;
import android.preference.PreferenceManager;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.AccountDpcManager.DpcAccountNames;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.util.FileUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbyCardManager;
import com.tencent.mobileqq.richmedia.dc.PhotoUtils;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;

public class StatisticConstants
{
  public static final String A = "PhotoConst.total_save_count";
  public static final String B = "PhotoConst.camerapreviewactivity_enter_times";
  public static final String C = "PhotoConst.camerapreviewactivity_send_times";
  public static final String D = "PhotoConst.camerapreviewactivity_send_rate";
  public static final String E = "PhotoConst.camerapreviewactivity_enter_times_fast";
  public static final String F = "PhotoConst.camerapreviewactivity_send_times_fast";
  public static final String G = "PhotoConst.camerapreviewactivity_send_rate_fast";
  public static final String H = "PhotoConst.photopreviewactivity_send";
  public static final String I = "PhotoConst.photopreviewactivity_send_pic_count";
  public static final String J = "PhotoConst.photopreviewactivity_send_pic_total_count";
  public static final String K = "PhotoConst.photopreviewactivity_send_pic_rate";
  public static final String L = "PhotoConst.photopreviewactivity_send_pic_quality";
  public static final String M = "param_type";
  public static final String N = "param_totalSelNum";
  public static final String O = "param_selNum";
  public static final String P = "param_netType";
  public static final String Q = "param_urlType";
  public static final String R = "param_cancelSelNum";
  public static final String S = "param_consumTime";
  public static final String T = "param_aio_duration";
  public static final String U = "param_second_trans";
  public static final String V = "param_phone_type";
  public static final String W = "param_showing_progress";
  public static final String X = "param_pic_filesize";
  public static final String Y = "param_optimizePercent";
  public static final String Z = "param_averageTime";
  private static final int a = 1001;
  public static final long a = 86400000L;
  public static final String a = "StatisticConstants";
  public static final String aA = "param_screnshot_qq_cnt";
  public static final String aB = "param_screnshot_other_cnt";
  public static final String aC = "param_qq_collection_cnt";
  public static final String aD = "param_qq_image_cnt";
  public static final String aE = "param_qq_filerecv_cnt";
  public static final String aF = "param_qq_zebra_cnt";
  public static final String aG = "param_qq_favorite_cnt";
  public static final String aH = "param_sourceDetailUrl";
  public static final String aI = "param_uinType";
  public static final String aJ = "param_forwardSourceUinType";
  public static final String aK = "param_picSizeType";
  public static final String aL = "param_isForward";
  public static final String aM = "param_age";
  public static final String aN = "param_gender";
  public static final String aO = "param_userType";
  public static final String aP = "param_picSuffixType";
  public static final String aQ = "param_picMD5";
  public static final String aR = "param_isRAWPic";
  public static final String aS = "param_fileName";
  public static final String aT = "param_picReportHour";
  public static final String aU = "param_picInterval";
  public static final String aV = "param_picBatchCount";
  public static final String aW = "param_initTime";
  public static final String aX = "param_compressInitTime";
  public static final String aY = "actPSselectSendPic";
  public static final String aZ = "actPScompressPic";
  public static final String aa = "param_residentTime";
  public static final String ab = "param_selCount";
  public static final String ac = "param_sendCount";
  public static final String ad = "param_saveCount";
  public static final String ae = "param_sendPercent";
  public static final String af = "param_cameraCount";
  public static final String ag = "param_browseCount";
  public static final String ah = "param_WasteSize";
  public static final String ai = "param_cancelType";
  public static final String aj = "param_systemAlbumSendCount";
  public static final String ak = "param_otherSendCount";
  public static final String al = "param_appSendCount";
  public static final String am = "param_weixinSendCount";
  public static final String an = "param_sougouSendCount";
  public static final String ao = "param_qqpinyinSendCount";
  public static final String ap = "param_screnshotQQSendCount";
  public static final String aq = "param_screnshotOtherSendCount";
  public static final String ar = "param_qq_collection_SendCount";
  public static final String as = "param_qq_image_SendCount";
  public static final String at = "param_qq_filerecv_SendCount";
  public static final String au = "param_qq_zebra_SendCount";
  public static final String av = "param_qq_favorite_SendCount";
  public static final String aw = "param_systemAlbumCount";
  public static final String ax = "param_otherCount";
  public static final String ay = "param_appCount";
  public static final String az = "param_weixinCnt";
  private static final int b = 1002;
  public static final String b = "PhotoConst.last_send_select_rate_time";
  public static final String ba = "actPSdonecompressPic";
  public static final String bb = "actPSdoneaioduration";
  public static final String bc = "actPScancelSend";
  public static final String bd = "actPSdaySelSend";
  public static final String be = "actPSdayCameraSend";
  public static final String bf = "actPSdayQuickSend";
  public static final String bg = "actPSdayWastedSize";
  public static final String bh = "actPSWaste";
  public static final String bi = "actPSCompressTimeOut";
  public static final String bj = "actPSprogressTime";
  public static final String bk = "actDaySendPicSourceType";
  public static final String bl = "actPhotoSourceDetailUrl";
  public static final String bm = "actAlbumPicSourceType";
  public static final String bn = "actAIOPhotoSave";
  public static final String bo = "actDayTotalSave";
  public static final String bp = "actVideoCompressTime";
  public static final String bq = "param_compressTime";
  public static final String br = "param_compressSuccess";
  public static final String bs = "param_file_source_size";
  public static final String bt = "param_file_target_sze";
  private static final int c = 1003;
  public static final String c = "PhotoConst.last_send_select_rate_time_preview";
  private static final int d = 1004;
  public static final String d = "PhotoConst.last_send_camera_preview_rate";
  private static final int e = 1005;
  public static final String e = "PhotoConst.last_send_camera_preview_rate_fast";
  private static final int f = 1006;
  public static final String f = "PhotoConst.last_send_pic_source_type";
  private static final int g = 1007;
  public static final String g = "PhotoConst.last_album_source_type";
  private static final int h = 1008;
  public static final String h = "PhotoConst.last_total_save_count";
  private static final int i = 1009;
  public static final String i = "PhotoConst.photolistactivity_send";
  private static final int j = 1010;
  public static final String j = "PhotoConst.photolistactivity_pic_quality";
  private static final int k = 1011;
  public static final String k = "PhotoConst.photolistactivity_pic_count";
  private static final int l = 1012;
  public static final String l = "PhotoConst.photolistactivity_pic_total_count";
  private static final int m = 1013;
  public static final String m = "PhotoConst.photolistactivity_pic_rate";
  private static final int n = 1001;
  public static final String n = "PhotoConst.photolistactivity_systemalbum_send_count";
  private static final int o = 1002;
  public static final String o = "PhotoConst.photolistactivity_other_send_count";
  public static final String p = "PhotoConst.photolistactivity_app_send_count";
  public static final String q = "PhotoConst.photolistactivity_weixin_send_count";
  public static final String r = "PhotoConst.photolistactivity_sougou_send_count";
  public static final String s = "PhotoConst.photolistactivity_qqpinyin_send_count";
  public static final String t = "PhotoConst.photolistactivity_screnshot_qq_send_count";
  public static final String u = "PhotoConst.photolistactivity_screnshot_other_send_count";
  public static final String v = "PhotoConst.photolistactivity_qq_collection_send_count";
  public static final String w = "PhotoConst.photolistactivity_qq_image_send_count";
  public static final String x = "PhotoConst.photolistactivity_qq_filerecv_send_count";
  public static final String y = "PhotoConst.photolistactivity_qq_zebra_send_count";
  public static final String z = "PhotoConst.photolistactivity_qq_favorite_send_count";
  
  public StatisticConstants()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static int a()
  {
    int i2 = 1;
    int i1;
    if ((DeviceInfoUtil.c() >>> 20 < 600L) || (DeviceInfoUtil.b() == 1)) {
      i1 = 0;
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("StatisticConstants", 2, "getDeviceType,DeviceInfoUtil.getSystemTotalMemory() =" + (DeviceInfoUtil.c() >>> 20) + ",DeviceInfoUtil.getCpuNumber() = " + DeviceInfoUtil.b() + ",phoneType = " + i1);
      }
      return i1;
      i1 = i2;
      if (DeviceInfoUtil.c() >>> 20 >= 1536.0D)
      {
        i1 = i2;
        if (DeviceInfoUtil.b() >= 4) {
          i1 = 2;
        }
      }
    }
  }
  
  public static void a()
  {
    SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext());
    int i1 = localSharedPreferences.getInt("PhotoConst.camerapreviewactivity_enter_times", 0);
    localSharedPreferences.edit().putInt("PhotoConst.camerapreviewactivity_enter_times", i1 + 1).commit();
  }
  
  public static void a(int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("StatisticConstants", 2, "sendPhotoPreviewSelectRateStatistic (" + paramInt1 + " ," + paramInt2 + ")");
    }
    SharedPreferences localSharedPreferences;
    if ((paramInt1 > 0) && (paramInt2 > 0))
    {
      localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext());
      long l1 = localSharedPreferences.getLong("PhotoConst.last_send_select_rate_time_preview", 0L);
      long l2 = System.currentTimeMillis();
      paramInt1 = localSharedPreferences.getInt("PhotoConst.photopreviewactivity_send_pic_count", 0) + paramInt1;
      paramInt2 = localSharedPreferences.getInt("PhotoConst.photopreviewactivity_send_pic_total_count", 0) + paramInt2;
      if (l2 - l1 > 86400000L)
      {
        HashMap localHashMap = new HashMap();
        localHashMap.put("PhotoConst.photopreviewactivity_send_pic_count", paramInt1 + "");
        localHashMap.put("PhotoConst.photopreviewactivity_send_pic_rate", paramInt1 / paramInt2 + "");
        StatisticCollector.a(BaseApplication.getContext()).a(null, "PhotoConst.photopreviewactivity_send", false, 0L, 0L, localHashMap, "", false);
        localSharedPreferences.edit().putLong("PhotoConst.last_send_select_rate_time_preview", l2).putInt("PhotoConst.photopreviewactivity_send_pic_count", 0).putInt("PhotoConst.photopreviewactivity_send_pic_total_count", 0).commit();
      }
    }
    else
    {
      return;
    }
    localSharedPreferences.edit().putInt("PhotoConst.photopreviewactivity_send_pic_count", paramInt1).putInt("PhotoConst.photopreviewactivity_send_pic_total_count", paramInt2).commit();
  }
  
  public static void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("StatisticConstants", 4, "userAlbumSourceTypeStatistic (" + paramInt1 + "," + paramInt2 + "," + paramInt3 + "," + paramInt4 + "," + paramInt5 + "," + paramInt6 + "," + paramInt7 + "," + paramInt8 + "," + paramInt9 + "," + paramInt10 + "," + paramInt11 + ")");
    }
    SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext());
    long l1 = localSharedPreferences.getLong("PhotoConst.last_album_source_type", 0L);
    long l2 = System.currentTimeMillis();
    if (l2 - l1 > 86400000L)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("param_systemAlbumCount", paramInt1 + "");
      localHashMap.put("param_screnshot_qq_cnt", paramInt2 + "");
      localHashMap.put("param_screnshot_other_cnt", paramInt3 + "");
      localHashMap.put("param_appCount", paramInt4 + "");
      localHashMap.put("param_otherCount", paramInt5 + "");
      localHashMap.put("param_qq_collection_cnt", paramInt6 + "");
      localHashMap.put("param_qq_filerecv_cnt", paramInt8 + "");
      localHashMap.put("param_qq_image_cnt", paramInt7 + "");
      localHashMap.put("param_qq_zebra_cnt", paramInt9 + "");
      localHashMap.put("param_qq_favorite_cnt", paramInt10 + "");
      localHashMap.put("param_weixinCnt", paramInt11 + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actAlbumPicSourceType", false, 0L, 0L, localHashMap, "", false);
      localSharedPreferences.edit().putLong("PhotoConst.last_album_source_type", l2).commit();
    }
  }
  
  public static void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11, int paramInt12, int paramInt13, int paramInt14, int paramInt15, int paramInt16)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("StatisticConstants", 4, "sendPhotoListSourceTypeStatistic (" + paramInt1 + "," + paramInt2 + "," + paramInt3 + "," + paramInt4 + "," + paramInt5 + "," + paramInt6 + "," + paramInt7 + "," + paramInt8 + "," + paramInt9 + "," + paramInt10 + "," + paramInt11 + "," + paramInt12 + "," + paramInt13 + ")" + ",age = " + paramInt14 + ",gender = " + paramInt15 + ",userType = " + paramInt16);
    }
    SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext());
    long l1 = localSharedPreferences.getLong("PhotoConst.last_send_pic_source_type", 0L);
    long l2 = System.currentTimeMillis();
    paramInt1 = localSharedPreferences.getInt("PhotoConst.photolistactivity_systemalbum_send_count", 0) + paramInt1;
    paramInt2 = localSharedPreferences.getInt("PhotoConst.photolistactivity_screnshot_qq_send_count", 0) + paramInt2;
    paramInt3 = localSharedPreferences.getInt("PhotoConst.photolistactivity_screnshot_other_send_count", 0) + paramInt3;
    paramInt5 = localSharedPreferences.getInt("PhotoConst.photolistactivity_other_send_count", 0) + paramInt5;
    paramInt4 = localSharedPreferences.getInt("PhotoConst.photolistactivity_app_send_count", 0) + paramInt4;
    paramInt6 = localSharedPreferences.getInt("PhotoConst.photolistactivity_qq_collection_send_count", 0) + paramInt6;
    paramInt7 = localSharedPreferences.getInt("PhotoConst.photolistactivity_qq_image_send_count", 0) + paramInt7;
    paramInt8 = localSharedPreferences.getInt("PhotoConst.photolistactivity_qq_filerecv_send_count", 0) + paramInt8;
    paramInt9 = localSharedPreferences.getInt("PhotoConst.photolistactivity_qq_zebra_send_count", 0) + paramInt9;
    paramInt10 = localSharedPreferences.getInt("PhotoConst.photolistactivity_qq_favorite_send_count", 0) + paramInt10;
    paramInt11 = localSharedPreferences.getInt("PhotoConst.photolistactivity_weixin_send_count", 0) + paramInt11;
    paramInt12 = localSharedPreferences.getInt("PhotoConst.photolistactivity_sougou_send_count", 0) + paramInt12;
    paramInt13 = localSharedPreferences.getInt("PhotoConst.photolistactivity_qqpinyin_send_count", 0) + paramInt13;
    if (l2 - l1 > 86400000L)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("param_systemAlbumSendCount", paramInt1 + "");
      localHashMap.put("param_screnshotQQSendCount", paramInt2 + "");
      localHashMap.put("param_screnshotOtherSendCount", paramInt3 + "");
      localHashMap.put("param_otherSendCount", paramInt5 + "");
      localHashMap.put("param_appSendCount", paramInt4 + "");
      localHashMap.put("param_qq_collection_SendCount", paramInt6 + "");
      localHashMap.put("param_qq_image_SendCount", paramInt7 + "");
      localHashMap.put("param_qq_filerecv_SendCount", paramInt8 + "");
      localHashMap.put("param_qq_zebra_SendCount", paramInt9 + "");
      localHashMap.put("param_qq_favorite_SendCount", paramInt10 + "");
      localHashMap.put("param_weixinSendCount", paramInt11 + "");
      localHashMap.put("param_sougouSendCount", paramInt12 + "");
      localHashMap.put("param_qqpinyinSendCount", paramInt13 + "");
      localHashMap.put("param_age", paramInt14 + "");
      localHashMap.put("param_gender", paramInt15 + "");
      localHashMap.put("param_userType", paramInt16 + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actDaySendPicSourceType", false, 0L, 0L, localHashMap, "", false);
      localSharedPreferences.edit().putLong("PhotoConst.last_send_pic_source_type", l2).putInt("PhotoConst.photolistactivity_systemalbum_send_count", 0).putInt("PhotoConst.photolistactivity_screnshot_qq_send_count", 0).putInt("PhotoConst.photolistactivity_screnshot_other_send_count", 0).putInt("PhotoConst.photolistactivity_other_send_count", 0).putInt("PhotoConst.photolistactivity_app_send_count", 0).putInt("PhotoConst.photolistactivity_qq_collection_send_count", 0).putInt("PhotoConst.photolistactivity_qq_image_send_count", 0).putInt("PhotoConst.photolistactivity_qq_filerecv_send_count", 0).putInt("PhotoConst.photolistactivity_qq_zebra_send_count", 0).putInt("PhotoConst.photolistactivity_qq_favorite_send_count", 0).putInt("PhotoConst.photolistactivity_weixin_send_count", 0).putInt("PhotoConst.photolistactivity_sougou_send_count", 0).putInt("PhotoConst.photolistactivity_qqpinyin_send_count", 0).commit();
      return;
    }
    localSharedPreferences.edit().putInt("PhotoConst.photolistactivity_systemalbum_send_count", paramInt1).putInt("PhotoConst.photolistactivity_screnshot_qq_send_count", paramInt2).putInt("PhotoConst.photolistactivity_screnshot_other_send_count", paramInt3).putInt("PhotoConst.photolistactivity_other_send_count", paramInt5).putInt("PhotoConst.photolistactivity_app_send_count", paramInt4).putInt("PhotoConst.photolistactivity_qq_collection_send_count", paramInt6).putInt("PhotoConst.photolistactivity_qq_image_send_count", paramInt7).putInt("PhotoConst.photolistactivity_qq_filerecv_send_count", paramInt8).putInt("PhotoConst.photolistactivity_qq_zebra_send_count", paramInt9).putInt("PhotoConst.photolistactivity_qq_favorite_send_count", paramInt10).putInt("PhotoConst.photolistactivity_weixin_send_count", paramInt11).putInt("PhotoConst.photolistactivity_sougou_send_count", paramInt12).putInt("PhotoConst.photolistactivity_qqpinyin_send_count", paramInt13).commit();
  }
  
  public static void a(long paramLong)
  {
    if (paramLong <= 0L)
    {
      if (QLog.isColorLevel()) {
        QLog.d("StatisticConstants", 2, "reportActPSdayWastedSize,size <= 0,return! size = " + paramLong);
      }
      return;
    }
    HashMap localHashMap = new HashMap();
    if (DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name())) {}
    for (int i1 = 1002;; i1 = 1001)
    {
      int i2 = NetworkUtil.a(BaseApplication.getContext());
      int i3 = a();
      localHashMap.put("param_netType", i2 + "");
      localHashMap.put("param_phone_type", i3 + "");
      localHashMap.put("param_userType", i1 + "");
      localHashMap.put("param_WasteSize", paramLong + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSdayWastedSize", false, 0L, 0L, localHashMap, "", false);
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("StatisticConstants", 2, "reportActPSdayWastedSize,WastedSize =" + paramLong);
      return;
    }
  }
  
  public static void a(long paramLong, int paramInt)
  {
    HashMap localHashMap = new HashMap();
    if (DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name())) {}
    for (int i1 = 1002;; i1 = 1001)
    {
      int i2 = NetworkUtil.a(BaseApplication.getContext());
      int i3 = a();
      localHashMap.put("param_netType", i2 + "");
      localHashMap.put("param_phone_type", i3 + "");
      localHashMap.put("param_userType", i1 + "");
      localHashMap.put("param_WasteSize", paramLong + "");
      localHashMap.put("param_cancelType", paramInt + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSWaste", false, 0L, 0L, localHashMap, "", false);
      if (QLog.isColorLevel()) {
        QLog.d("StatisticConstants", 2, "reportActPSWaste,size = " + paramLong + ",cancelType = " + paramInt);
      }
      return;
    }
  }
  
  public static void a(long paramLong, int paramInt, boolean paramBoolean)
  {
    HashMap localHashMap = new HashMap();
    if ((paramLong == 0L) || (paramInt == 0) || (paramLong > 86400000L))
    {
      if (QLog.isColorLevel()) {
        QLog.d("StatisticConstants", 2, "reportActPSdonecompressPic,invalid arg,return!");
      }
      return;
    }
    long l1 = paramLong / paramInt;
    int i2 = a();
    if (DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name())) {}
    for (int i1 = 1002;; i1 = 1001)
    {
      localHashMap.put("param_userType", i1 + "");
      localHashMap.put("param_phone_type", i2 + "");
      localHashMap.put("param_consumTime", paramLong + "");
      localHashMap.put("param_selNum", paramInt + "");
      localHashMap.put("param_showing_progress", paramBoolean + "");
      localHashMap.put("param_averageTime", l1 + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSdonecompressPic", false, 0L, 0L, localHashMap, "", false);
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("StatisticConstants", 2, "reportActPSdonecompressPic,param_consumTime =" + paramLong + ",param_selNum = " + paramInt + ",param_averageTime = " + l1 + ",isShowing = " + paramBoolean);
      return;
    }
  }
  
  public static void a(long paramLong1, long paramLong2, boolean paramBoolean, double paramDouble)
  {
    HashMap localHashMap = new HashMap();
    if ((paramLong1 > 86400000L) || (paramDouble < 0.0D) || (paramDouble > 1.0D))
    {
      if (QLog.isColorLevel()) {
        QLog.d("StatisticConstants", 2, "reportActPSdoneAioDuration,invalid arg,return!");
      }
      return;
    }
    int i2 = NetworkUtil.a(BaseApplication.getContext());
    int i3 = a();
    if (DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name())) {}
    for (int i1 = 1002;; i1 = 1001)
    {
      localHashMap.put("param_userType", i1 + "");
      localHashMap.put("param_netType", i2 + "");
      localHashMap.put("param_aio_duration", paramLong1 + "");
      localHashMap.put("param_second_trans", paramBoolean + "");
      localHashMap.put("param_phone_type", i3 + "");
      localHashMap.put("param_pic_filesize", paramLong2 + "");
      localHashMap.put("param_optimizePercent", paramDouble + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSdoneaioduration", false, 0L, 0L, localHashMap, "", false);
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("StatisticConstants", 2, "reportActPSdoneAioDuration,aioduration =" + paramLong1 + ",filesize = " + paramLong2 + ",isSecondTrans = " + paramBoolean + ",phoneType = " + i3 + ",percent = " + paramDouble);
      return;
    }
  }
  
  public static void a(Intent paramIntent)
  {
    HashMap localHashMap = new HashMap();
    long l1 = paramIntent.getLongExtra("param_compressInitTime", 0L);
    if (l1 == 0L) {
      if (QLog.isColorLevel()) {
        QLog.d("StatisticConstants", 2, "reportActPScompressPic,initTime == 0,return!");
      }
    }
    long l2;
    int i1;
    do
    {
      do
      {
        return;
        l2 = System.currentTimeMillis() - l1;
      } while (l2 > 86400000L);
      i1 = paramIntent.getIntExtra("param_selNum", 0);
      if (i1 != 0) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("StatisticConstants", 2, "reportActPScompressPic,param_selNum == 0,return!");
    return;
    if (i1 > 0) {}
    for (l1 = l2 / i1;; l1 = 0L)
    {
      localHashMap.put("param_consumTime", l2 + "");
      localHashMap.put("param_selNum", i1 + "");
      localHashMap.put("param_averageTime", l1 + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPScompressPic", false, 0L, 0L, localHashMap, "", false);
      paramIntent.removeExtra("param_compressInitTime");
      paramIntent.removeExtra("param_selNum");
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("StatisticConstants", 2, "reportActPScompressPic,param_consumTime =" + l2 + ",param_selNum = " + i1 + ",param_averageTime = " + l1);
      return;
    }
  }
  
  public static void a(Intent paramIntent, int paramInt)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("StatisticConstants", 4, "sendPhotoListSelectRateStatistic (" + paramInt + ")");
    }
    int i1 = paramIntent.getIntExtra("param_totalSelNum", 0);
    if ((paramInt > 0) && (i1 > 0))
    {
      paramIntent = PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext());
      long l1 = paramIntent.getLong("PhotoConst.last_send_select_rate_time", 0L);
      long l2 = System.currentTimeMillis();
      paramInt = paramIntent.getInt("PhotoConst.photolistactivity_pic_count", 0) + paramInt;
      i1 += paramIntent.getInt("PhotoConst.photolistactivity_pic_total_count", 0);
      if (l2 - l1 > 86400000L)
      {
        HashMap localHashMap = new HashMap();
        localHashMap.put("param_sendCount", paramInt + "");
        localHashMap.put("param_selCount", i1 + "");
        localHashMap.put("param_sendPercent", paramInt / i1 + "");
        StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSdaySelSend", false, 0L, 0L, localHashMap, "", false);
        paramIntent.edit().putLong("PhotoConst.last_send_select_rate_time", l2).putInt("PhotoConst.photolistactivity_pic_count", 0).putInt("PhotoConst.photolistactivity_pic_total_count", 0).commit();
      }
    }
    else
    {
      return;
    }
    paramIntent.edit().putInt("PhotoConst.photolistactivity_pic_count", paramInt).putInt("PhotoConst.photolistactivity_pic_total_count", i1).commit();
  }
  
  public static void a(Intent paramIntent, int paramInt1, int paramInt2)
  {
    long l1 = paramIntent.getLongExtra("param_initTime", 0L);
    if (l1 == 0L) {
      if (QLog.isColorLevel()) {
        QLog.d("StatisticConstants", 2, "reportActPSselectSendPic,initTime == 0,return!");
      }
    }
    long l2;
    do
    {
      return;
      l2 = System.currentTimeMillis() - l1;
    } while (l2 > 86400000L);
    if (paramInt1 > 0) {}
    for (l1 = l2 / paramInt1;; l1 = 0L)
    {
      int i1 = paramIntent.getIntExtra("param_cancelSelNum", 0);
      HashMap localHashMap = new HashMap();
      int i2 = NetworkUtil.a(BaseApplication.getContext());
      localHashMap.put("param_netType", i2 + "");
      localHashMap.put("param_type", paramInt2 + "");
      localHashMap.put("param_cancelSelNum", i1 + "");
      localHashMap.put("param_consumTime", l2 + "");
      localHashMap.put("param_selNum", paramInt1 + "");
      localHashMap.put("param_averageTime", l1 + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSselectSendPic", false, 0L, 0L, localHashMap, "", false);
      paramIntent.removeExtra("param_initTime");
      paramIntent.removeExtra("param_cancelSelNum");
      paramIntent.removeExtra("param_totalSelNum");
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("StatisticConstants", 2, "reportActPSselectSendPic,param_type =" + paramInt2 + ",param_cancelSelNum = " + i1 + ",param_consumTime = " + l2 + ",param_selNum = " + paramInt1 + ",param_averageTime = " + l1);
      return;
    }
  }
  
  public static void a(Intent paramIntent, String paramString)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("StatisticConstants", 4, "incrementStatisticParam(" + paramString);
    }
    if (paramIntent != null) {
      paramIntent.putExtra(paramString, paramIntent.getIntExtra(paramString, 0) + 1);
    }
  }
  
  /* Error */
  public static void a(String paramString, int paramInt, QQAppInterface paramQQAppInterface)
  {
    // Byte code:
    //   0: aload_0
    //   1: ifnonnull +4 -> 5
    //   4: return
    //   5: aload_2
    //   6: bipush 105
    //   8: invokevirtual 645	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   11: checkcast 647	com/tencent/mobileqq/nearby/NearbyCardManager
    //   14: astore_2
    //   15: aload_2
    //   16: ifnull +969 -> 985
    //   19: aload_2
    //   20: invokevirtual 648	com/tencent/mobileqq/nearby/NearbyCardManager:a	()I
    //   23: istore 4
    //   25: aload_2
    //   26: invokevirtual 649	com/tencent/mobileqq/nearby/NearbyCardManager:b	()I
    //   29: istore_3
    //   30: new 651	android/graphics/BitmapFactory$Options
    //   33: dup
    //   34: invokespecial 652	android/graphics/BitmapFactory$Options:<init>	()V
    //   37: astore_2
    //   38: aload_2
    //   39: iconst_1
    //   40: putfield 655	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   43: aload_0
    //   44: aload_2
    //   45: invokestatic 661	android/graphics/BitmapFactory:decodeFile	(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   48: pop
    //   49: aload_2
    //   50: getfield 664	android/graphics/BitmapFactory$Options:outWidth	I
    //   53: istore 7
    //   55: aload_2
    //   56: getfield 667	android/graphics/BitmapFactory$Options:outHeight	I
    //   59: istore 8
    //   61: iload 7
    //   63: i2l
    //   64: iload 8
    //   66: i2l
    //   67: invokestatic 672	com/tencent/mobileqq/richmedia/dc/PhotoUtils:a	(JJ)I
    //   70: istore 9
    //   72: iload_1
    //   73: istore 5
    //   75: iload_1
    //   76: ifeq +24 -> 100
    //   79: iload_1
    //   80: istore 5
    //   82: iload_1
    //   83: iconst_1
    //   84: if_icmpeq +16 -> 100
    //   87: iload_1
    //   88: istore 5
    //   90: iload_1
    //   91: sipush 3000
    //   94: if_icmpeq +6 -> 100
    //   97: iconst_5
    //   98: istore 5
    //   100: aconst_null
    //   101: astore 17
    //   103: new 674	java/io/FileInputStream
    //   106: dup
    //   107: aload_0
    //   108: invokespecial 676	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   111: astore 16
    //   113: aload 16
    //   115: new 678	java/io/File
    //   118: dup
    //   119: aload_0
    //   120: invokespecial 679	java/io/File:<init>	(Ljava/lang/String;)V
    //   123: invokevirtual 682	java/io/File:length	()J
    //   126: invokestatic 688	com/tencent/qphone/base/util/MD5:toMD5Byte	(Ljava/io/InputStream;J)[B
    //   129: astore_2
    //   130: aload_2
    //   131: invokestatic 694	com/qq/taf/jce/HexUtil:bytes2HexStr	([B)Ljava/lang/String;
    //   134: astore_2
    //   135: aload_2
    //   136: astore 17
    //   138: aload 17
    //   140: astore_2
    //   141: aload 16
    //   143: ifnull +11 -> 154
    //   146: aload 16
    //   148: invokevirtual 697	java/io/FileInputStream:close	()V
    //   151: aload 17
    //   153: astore_2
    //   154: aload_0
    //   155: invokestatic 702	com/tencent/mobileqq/utils/FileUtils:a	(Ljava/lang/String;)Ljava/lang/String;
    //   158: astore 16
    //   160: aload 16
    //   162: invokevirtual 707	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   165: ldc_w 709
    //   168: invokevirtual 713	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   171: ifeq +767 -> 938
    //   174: iconst_0
    //   175: istore_1
    //   176: invokestatic 719	java/util/Calendar:getInstance	()Ljava/util/Calendar;
    //   179: bipush 11
    //   181: invokevirtual 723	java/util/Calendar:get	(I)I
    //   184: istore 10
    //   186: invokestatic 542	com/tencent/mobileqq/app/DeviceProfileManager:a	()Lcom/tencent/mobileqq/app/DeviceProfileManager;
    //   189: getstatic 548	com/tencent/mobileqq/app/DeviceProfileManager$AccountDpcManager$DpcAccountNames:picpredownload_whitelist	Lcom/tencent/mobileqq/app/DeviceProfileManager$AccountDpcManager$DpcAccountNames;
    //   192: invokevirtual 551	com/tencent/mobileqq/app/DeviceProfileManager$AccountDpcManager$DpcAccountNames:name	()Ljava/lang/String;
    //   195: invokevirtual 554	com/tencent/mobileqq/app/DeviceProfileManager:a	(Ljava/lang/String;)Z
    //   198: ifeq +745 -> 943
    //   201: sipush 1002
    //   204: istore 6
    //   206: invokestatic 521	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   209: ifeq +160 -> 369
    //   212: ldc 89
    //   214: iconst_4
    //   215: new 420	java/lang/StringBuilder
    //   218: dup
    //   219: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   222: ldc_w 725
    //   225: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   228: aload_0
    //   229: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   232: ldc_w 727
    //   235: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   238: iload 5
    //   240: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   243: ldc_w 729
    //   246: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   249: iload 9
    //   251: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   254: ldc_w 530
    //   257: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   260: iload 4
    //   262: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   265: ldc_w 532
    //   268: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   271: iload_3
    //   272: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   275: ldc_w 731
    //   278: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   281: iload 10
    //   283: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   286: ldc_w 733
    //   289: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   292: aload_2
    //   293: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   296: ldc_w 735
    //   299: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   302: iload_1
    //   303: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   306: ldc_w 737
    //   309: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   312: aload 16
    //   314: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   317: ldc_w 739
    //   320: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   323: aload_0
    //   324: invokestatic 742	com/tencent/qphone/base/util/MD5:toMD5	(Ljava/lang/String;)Ljava/lang/String;
    //   327: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   330: ldc_w 744
    //   333: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   336: iload 7
    //   338: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   341: ldc_w 746
    //   344: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   347: iload 8
    //   349: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   352: ldc_w 534
    //   355: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   358: iload 6
    //   360: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   363: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   366: invokestatic 444	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   369: new 495	java/util/HashMap
    //   372: dup
    //   373: invokespecial 496	java/util/HashMap:<init>	()V
    //   376: astore_0
    //   377: aload_0
    //   378: ldc 116
    //   380: new 420	java/lang/StringBuilder
    //   383: dup
    //   384: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   387: iload 5
    //   389: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   392: ldc_w 498
    //   395: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   398: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   401: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   404: pop
    //   405: aload_0
    //   406: ldc 122
    //   408: new 420	java/lang/StringBuilder
    //   411: dup
    //   412: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   415: iload 9
    //   417: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   420: ldc_w 498
    //   423: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   426: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   429: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   432: pop
    //   433: aload_0
    //   434: ldc -128
    //   436: new 420	java/lang/StringBuilder
    //   439: dup
    //   440: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   443: iload 4
    //   445: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   448: ldc_w 498
    //   451: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   454: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   457: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   460: pop
    //   461: aload_0
    //   462: ldc -125
    //   464: new 420	java/lang/StringBuilder
    //   467: dup
    //   468: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   471: iload_3
    //   472: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   475: ldc_w 498
    //   478: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   481: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   484: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   487: pop
    //   488: aload_0
    //   489: ldc -122
    //   491: new 420	java/lang/StringBuilder
    //   494: dup
    //   495: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   498: iload 6
    //   500: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   503: ldc_w 498
    //   506: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   509: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   512: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   515: pop
    //   516: aload_0
    //   517: ldc -116
    //   519: aload_2
    //   520: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   523: pop
    //   524: aload_0
    //   525: ldc -119
    //   527: new 420	java/lang/StringBuilder
    //   530: dup
    //   531: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   534: iload_1
    //   535: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   538: ldc_w 498
    //   541: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   544: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   547: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   550: pop
    //   551: aload_0
    //   552: ldc -107
    //   554: new 420	java/lang/StringBuilder
    //   557: dup
    //   558: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   561: iload 10
    //   563: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   566: ldc_w 498
    //   569: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   572: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   575: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   578: pop
    //   579: invokestatic 452	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   582: invokestatic 510	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   585: aconst_null
    //   586: ldc_w 291
    //   589: iconst_0
    //   590: lconst_0
    //   591: lconst_0
    //   592: aload_0
    //   593: ldc_w 498
    //   596: iconst_0
    //   597: invokevirtual 513	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   600: invokestatic 452	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   603: invokestatic 458	android/preference/PreferenceManager:getDefaultSharedPreferences	(Landroid/content/Context;)Landroid/content/SharedPreferences;
    //   606: astore_0
    //   607: aload_0
    //   608: ldc_w 333
    //   611: lconst_0
    //   612: invokeinterface 488 4 0
    //   617: lstore 11
    //   619: invokestatic 493	java/lang/System:currentTimeMillis	()J
    //   622: lstore 13
    //   624: aload_0
    //   625: ldc 8
    //   627: iconst_0
    //   628: invokeinterface 464 3 0
    //   633: iconst_1
    //   634: iadd
    //   635: istore_1
    //   636: lload 13
    //   638: lload 11
    //   640: lsub
    //   641: ldc2_w 86
    //   644: lcmp
    //   645: ifle +306 -> 951
    //   648: new 495	java/util/HashMap
    //   651: dup
    //   652: invokespecial 496	java/util/HashMap:<init>	()V
    //   655: astore_2
    //   656: aload_2
    //   657: ldc -128
    //   659: new 420	java/lang/StringBuilder
    //   662: dup
    //   663: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   666: iload 4
    //   668: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   671: ldc_w 498
    //   674: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   677: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   680: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   683: pop
    //   684: aload_2
    //   685: ldc -125
    //   687: new 420	java/lang/StringBuilder
    //   690: dup
    //   691: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   694: iload_3
    //   695: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   698: ldc_w 498
    //   701: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   704: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   707: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   710: pop
    //   711: aload_2
    //   712: ldc -122
    //   714: new 420	java/lang/StringBuilder
    //   717: dup
    //   718: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   721: iload 6
    //   723: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   726: ldc_w 498
    //   729: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   732: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   735: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   738: pop
    //   739: aload_2
    //   740: ldc -77
    //   742: new 420	java/lang/StringBuilder
    //   745: dup
    //   746: invokespecial 421	java/lang/StringBuilder:<init>	()V
    //   749: iload_1
    //   750: invokevirtual 435	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   753: ldc_w 498
    //   756: invokevirtual 427	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   759: invokevirtual 441	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   762: invokevirtual 502	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   765: pop
    //   766: invokestatic 452	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   769: invokestatic 510	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   772: aconst_null
    //   773: ldc_w 294
    //   776: iconst_0
    //   777: lconst_0
    //   778: lconst_0
    //   779: aload_2
    //   780: ldc_w 498
    //   783: iconst_0
    //   784: invokevirtual 513	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   787: aload_0
    //   788: invokeinterface 468 1 0
    //   793: ldc_w 333
    //   796: lload 13
    //   798: invokeinterface 517 4 0
    //   803: ldc 8
    //   805: iconst_0
    //   806: invokeinterface 474 3 0
    //   811: invokeinterface 477 1 0
    //   816: pop
    //   817: return
    //   818: astore_2
    //   819: new 678	java/io/File
    //   822: dup
    //   823: aload_0
    //   824: invokespecial 679	java/io/File:<init>	(Ljava/lang/String;)V
    //   827: astore_2
    //   828: aload_2
    //   829: invokevirtual 749	java/io/File:exists	()Z
    //   832: istore 15
    //   834: iload 15
    //   836: ifeq +144 -> 980
    //   839: aload_2
    //   840: invokestatic 754	com/tencent/qqprotect/singleupdate/MD5FileUtil:a	(Ljava/io/File;)Ljava/lang/String;
    //   843: astore_2
    //   844: aload_2
    //   845: ifnull +11 -> 856
    //   848: aload_2
    //   849: invokestatic 758	com/qq/taf/jce/HexUtil:hexStr2Bytes	(Ljava/lang/String;)[B
    //   852: astore_2
    //   853: goto -723 -> 130
    //   856: ldc_w 498
    //   859: astore_2
    //   860: goto -12 -> 848
    //   863: astore_2
    //   864: aconst_null
    //   865: astore_2
    //   866: goto -736 -> 130
    //   869: astore_2
    //   870: aload_2
    //   871: invokevirtual 761	java/io/IOException:printStackTrace	()V
    //   874: aload 17
    //   876: astore_2
    //   877: goto -723 -> 154
    //   880: astore_2
    //   881: aconst_null
    //   882: astore 16
    //   884: aload 17
    //   886: astore_2
    //   887: aload 16
    //   889: ifnull -735 -> 154
    //   892: aload 16
    //   894: invokevirtual 697	java/io/FileInputStream:close	()V
    //   897: aload 17
    //   899: astore_2
    //   900: goto -746 -> 154
    //   903: astore_2
    //   904: aload_2
    //   905: invokevirtual 761	java/io/IOException:printStackTrace	()V
    //   908: aload 17
    //   910: astore_2
    //   911: goto -757 -> 154
    //   914: astore_0
    //   915: aconst_null
    //   916: astore 16
    //   918: aload 16
    //   920: ifnull +8 -> 928
    //   923: aload 16
    //   925: invokevirtual 697	java/io/FileInputStream:close	()V
    //   928: aload_0
    //   929: athrow
    //   930: astore_2
    //   931: aload_2
    //   932: invokevirtual 761	java/io/IOException:printStackTrace	()V
    //   935: goto -7 -> 928
    //   938: iconst_1
    //   939: istore_1
    //   940: goto -764 -> 176
    //   943: sipush 1001
    //   946: istore 6
    //   948: goto -742 -> 206
    //   951: aload_0
    //   952: invokeinterface 468 1 0
    //   957: ldc 8
    //   959: iload_1
    //   960: invokeinterface 474 3 0
    //   965: invokeinterface 477 1 0
    //   970: pop
    //   971: return
    //   972: astore_0
    //   973: goto -55 -> 918
    //   976: astore_2
    //   977: goto -93 -> 884
    //   980: aconst_null
    //   981: astore_2
    //   982: goto -852 -> 130
    //   985: iconst_m1
    //   986: istore_3
    //   987: iconst_m1
    //   988: istore 4
    //   990: goto -960 -> 30
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	993	0	paramString	String
    //   0	993	1	paramInt	int
    //   0	993	2	paramQQAppInterface	QQAppInterface
    //   29	958	3	i1	int
    //   23	966	4	i2	int
    //   73	315	5	i3	int
    //   204	743	6	i4	int
    //   53	284	7	i5	int
    //   59	289	8	i6	int
    //   70	346	9	i7	int
    //   184	378	10	i8	int
    //   617	22	11	l1	long
    //   622	175	13	l2	long
    //   832	3	15	bool	boolean
    //   111	813	16	localObject	Object
    //   101	808	17	localQQAppInterface	QQAppInterface
    // Exception table:
    //   from	to	target	type
    //   113	130	818	java/lang/UnsatisfiedLinkError
    //   839	844	863	java/io/IOException
    //   848	853	863	java/io/IOException
    //   146	151	869	java/io/IOException
    //   103	113	880	java/io/IOException
    //   892	897	903	java/io/IOException
    //   103	113	914	finally
    //   923	928	930	java/io/IOException
    //   113	130	972	finally
    //   130	135	972	finally
    //   819	834	972	finally
    //   839	844	972	finally
    //   848	853	972	finally
    //   113	130	976	java/io/IOException
    //   130	135	976	java/io/IOException
    //   819	834	976	java/io/IOException
  }
  
  private static void a(String paramString, int paramInt1, boolean paramBoolean1, boolean paramBoolean2, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7)
  {
    if (paramString == null) {
      return;
    }
    Object localObject1 = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeFile(paramString, (BitmapFactory.Options)localObject1);
    int i6 = outWidth;
    int i7 = outHeight;
    int i2 = paramInt1;
    if (paramInt1 != 0)
    {
      i2 = paramInt1;
      if (paramInt1 != 1)
      {
        i2 = paramInt1;
        if (paramInt1 != 3000) {
          i2 = 5;
        }
      }
    }
    int i3 = paramInt2;
    if (paramInt2 != 0)
    {
      i3 = paramInt2;
      if (paramInt2 != 1)
      {
        i3 = paramInt2;
        if (paramInt2 != 3000) {
          i3 = 5;
        }
      }
    }
    for (;;)
    {
      try
      {
        localObject1 = Environment.getExternalStorageDirectory().toString();
        if ((localObject1 != null) && (paramString.contains((CharSequence)localObject1)))
        {
          localObject1 = paramString.replace((CharSequence)localObject1, "");
          paramInt1 = ((String)localObject1).lastIndexOf("/");
          Object localObject2 = localObject1;
          if (paramInt1 != -1) {
            localObject2 = ((String)localObject1).substring(0, paramInt1);
          }
          localObject1 = ((String)localObject2).replace("/", "//");
          int i8 = Calendar.getInstance().get(11);
          paramInt2 = -1;
          localObject2 = new File(paramString);
          paramInt1 = paramInt2;
          if (!paramBoolean2)
          {
            paramInt1 = paramInt2;
            if (((File)localObject2).exists())
            {
              paramInt2 = (int)((System.currentTimeMillis() - ((File)localObject2).lastModified()) / 60000L);
              paramInt1 = paramInt2;
              if (paramInt2 == 0) {
                paramInt1 = 1;
              }
            }
          }
          int i1;
          if (paramString.toLowerCase(Locale.US).contains("gif"))
          {
            i1 = 0;
            paramInt2 = i1;
            int i4 = i7;
            int i5 = i6;
            if (paramString.contains(AppConstants.bl))
            {
              paramString = paramString.split("#");
              paramInt2 = i1;
              i4 = i7;
              i5 = i6;
              if (paramString.length >= 4)
              {
                i5 = Integer.parseInt(paramString[1]);
                i4 = Integer.parseInt(paramString[2]);
                if (Integer.parseInt(paramString[3]) != 3) {
                  continue;
                }
                paramInt2 = 0;
              }
            }
            i1 = PhotoUtils.a(i5, i4);
            i6 = NetworkUtil.a(BaseApplication.getContext());
            if (QLog.isDevelopLevel()) {
              QLog.d("StatisticConstants", 4, "sendPhotoSourceDetailUrlStatistic url=" + (String)localObject1 + ",uinType = " + i2 + ",batchCnt = " + paramInt7 + ",sizeType = " + i1 + ",isRAW = " + paramBoolean1 + ",isForward = " + paramBoolean2 + ",age = " + paramInt3 + ",gender = " + paramInt4 + ",reprotHour = " + i8 + ",width = " + i5 + ",height = " + i4 + ",interval = " + paramInt1 + ",suffixType = " + paramInt2 + ",nettype = " + i6 + ",forwardSourceUinType = " + i3 + ",urlType = " + paramInt6 + ",userType = " + paramInt5 + ",fileName = " + ((File)localObject2).getName());
            }
            paramString = new HashMap();
            paramString.put("param_sourceDetailUrl", localObject1);
            paramString.put("param_uinType", i2 + "");
            paramString.put("param_forwardSourceUinType", i3 + "");
            paramString.put("param_picSizeType", i1 + "");
            paramString.put("param_isForward", paramBoolean2 + "");
            paramString.put("param_age", paramInt3 + "");
            paramString.put("param_gender", paramInt4 + "");
            paramString.put("param_userType", paramInt5 + "");
            paramString.put("param_picReportHour", i8 + "");
            paramString.put("param_picInterval", paramInt1 + "");
            paramString.put("param_isRAWPic", paramBoolean1 + "");
            paramString.put("param_fileName", ((File)localObject2).getName());
            paramString.put("param_picSuffixType", paramInt2 + "");
            paramString.put("param_netType", i6 + "");
            paramString.put("param_urlType", paramInt6 + "");
            paramString.put("param_picBatchCount", paramInt7 + "");
            StatisticCollector.a(BaseApplication.getContext()).a(null, "actPhotoSourceDetailUrl", false, 0L, 0L, paramString, "", false);
          }
          else
          {
            i1 = 1;
            continue;
          }
          paramInt2 = 1;
          continue;
        }
        localObject1 = paramString;
      }
      catch (Exception paramString)
      {
        return;
      }
    }
  }
  
  public static void a(boolean paramBoolean, long paramLong1, long paramLong2, long paramLong3)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_compressSuccess", paramBoolean + "");
    localHashMap.put("param_compressTime", paramLong1 + "");
    localHashMap.put("param_file_source_size", paramLong2 + "");
    localHashMap.put("param_file_target_sze", paramLong3 + "");
    StatisticCollector.a(BaseApplication.getContext()).a(null, "actVideoCompressTime", false, 0L, 0L, localHashMap, "", false);
    if (QLog.isColorLevel()) {
      QLog.d("StatisticConstants", 2, "reportVideoCompressTime, success =" + paramBoolean + ", compressTime = " + paramLong1 + ", fileSourceSize =" + paramLong2 + ", fileTargetSize = " + paramLong3);
    }
  }
  
  public static void a(String[] paramArrayOfString, int paramInt1, boolean paramBoolean1, boolean paramBoolean2, int paramInt2, QQAppInterface paramQQAppInterface)
  {
    if (paramArrayOfString == null) {}
    do
    {
      return;
      paramQQAppInterface = (NearbyCardManager)paramQQAppInterface.getManager(105);
      int i20 = paramArrayOfString.length;
      int i15 = -1;
      int i16 = -1;
      if (paramQQAppInterface != null)
      {
        i15 = paramQQAppInterface.a();
        i16 = paramQQAppInterface.b();
      }
      if (DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name())) {}
      int i1;
      int i2;
      int i6;
      int i4;
      int i5;
      int i14;
      int i7;
      int i8;
      int i9;
      int i10;
      int i11;
      int i12;
      int i13;
      String str2;
      for (int i17 = 1002;; i17 = 1001)
      {
        i1 = 0;
        i2 = 0;
        i6 = 0;
        i4 = 0;
        i5 = 0;
        i14 = 0;
        i7 = 0;
        i8 = 0;
        i9 = 0;
        i10 = 0;
        i11 = 0;
        i12 = 0;
        i13 = 0;
        int i21 = paramArrayOfString.length;
        int i18 = 0;
        for (;;)
        {
          if (i18 >= i21) {
            break label929;
          }
          str2 = paramArrayOfString[i18];
          if (str2 != null) {
            break;
          }
          i18 += 1;
        }
      }
      String str1 = str2.toLowerCase(Locale.US);
      String str3 = FileUtil.b(str1);
      paramQQAppInterface = null;
      try
      {
        str1 = new File(str1).getParentFile().getName();
        paramQQAppInterface = str1;
      }
      catch (Exception localException)
      {
        int i3;
        int i19;
        for (;;) {}
      }
    } while ((str3 == null) || (paramQQAppInterface == null));
    if (str3.contains("/tencent/")) {
      if (str3.contains("/qq_collection/"))
      {
        i14 += 1;
        i3 = i2;
        i19 = 1001;
        i2 = i1;
        i1 = i3;
        i3 = i19;
      }
    }
    for (;;)
    {
      a(str2, paramInt1, paramBoolean1, paramBoolean2, paramInt2, i15, i16, i17, i3, i20);
      i3 = i2;
      i2 = i1;
      i1 = i3;
      break;
      if ((paramQQAppInterface.equals("qq_images")) || (str3.contains("/mobileqq/photo")) || (str3.contains("/mobileqq/diskcache")) || (str3.contains("/AIO_FORWARD/")))
      {
        i7 += 1;
        i19 = i1;
        i3 = 1002;
        i1 = i2;
        i2 = i19;
      }
      else if (paramQQAppInterface.equals("qqfile_recv"))
      {
        i8 += 1;
        i19 = i1;
        i3 = 1003;
        i1 = i2;
        i2 = i19;
      }
      else if (paramQQAppInterface.equals("qq_favorite"))
      {
        i10 += 1;
        i19 = i1;
        i3 = 1004;
        i1 = i2;
        i2 = i19;
      }
      else if (str3.contains("/zebra/cache"))
      {
        i9 += 1;
        i19 = i1;
        i3 = 1005;
        i1 = i2;
        i2 = i19;
      }
      else if ((paramQQAppInterface.equals("weixin")) || (paramQQAppInterface.equals("wechat")) || (paramQQAppInterface.equals("micromsg")))
      {
        i11 += 1;
        i19 = i1;
        i3 = 1006;
        i1 = i2;
        i2 = i19;
      }
      else if (str3.contains("/qqinput/exp/"))
      {
        i13 += 1;
        i19 = i1;
        i3 = 1013;
        i1 = i2;
        i2 = i19;
      }
      else if (a(str3))
      {
        i4 += 1;
        i19 = i1;
        i3 = 1007;
        i1 = i2;
        i2 = i19;
      }
      else
      {
        i5 += 1;
        i19 = i1;
        i3 = 1008;
        i1 = i2;
        i2 = i19;
        continue;
        if (paramQQAppInterface.equals("qq_screenshot"))
        {
          i19 = i2 + 1;
          i2 = i1;
          i3 = 1009;
          i1 = i19;
        }
        else if ((str3.contains("screenshot")) || (str3.contains("截屏")) || (str3.contains("截图")) || (str3.equals("screen_cap")) || (str3.equals("ScreenCapture")))
        {
          i6 += 1;
          i19 = i1;
          i3 = 1010;
          i1 = i2;
          i2 = i19;
        }
        else if ((paramQQAppInterface.contains("camera")) || (paramQQAppInterface.equals("dcim")) || (paramQQAppInterface.equals("100MEDIA")) || (paramQQAppInterface.equals("100ANDRO")) || (paramQQAppInterface.contains("相机")) || (paramQQAppInterface.contains("照片")) || (paramQQAppInterface.contains("相片")))
        {
          i3 = 1011;
          i19 = i1 + 1;
          i1 = i2;
          i2 = i19;
        }
        else if (str3.contains("/sogou/.expression/"))
        {
          i12 += 1;
          i19 = i1;
          i3 = 1012;
          i1 = i2;
          i2 = i19;
        }
        else if (a(str3))
        {
          i4 += 1;
          i19 = i1;
          i3 = 1007;
          i1 = i2;
          i2 = i19;
        }
        else
        {
          i5 += 1;
          i19 = i1;
          i3 = 1008;
          i1 = i2;
          i2 = i19;
        }
      }
    }
    label929:
    a(i1, i2, i6, i4, i5, i14, i7, i8, i9, i10, i11, i12, i13, i15, i16, i17);
  }
  
  public static boolean a(String paramString)
  {
    if (paramString == null) {}
    for (;;)
    {
      return false;
      String[] arrayOfString = new String[14];
      arrayOfString[0] = "/weibo";
      arrayOfString[1] = "/sina/news/save/";
      arrayOfString[2] = "/faceq/";
      arrayOfString[3] = "/newsreader/";
      arrayOfString[4] = "/tieba";
      arrayOfString[5] = "/baidu";
      arrayOfString[6] = "/UCDownloads";
      arrayOfString[7] = "/taobao";
      arrayOfString[8] = "/news_article/";
      arrayOfString[9] = "/sohunewsdown/";
      arrayOfString[10] = "/pitu/";
      arrayOfString[11] = "/pins/";
      arrayOfString[12] = "/tumblr/";
      arrayOfString[13] = "/download";
      int i1 = 0;
      while (i1 < arrayOfString.length)
      {
        if (paramString.contains(arrayOfString[i1])) {
          return true;
        }
        i1 += 1;
      }
    }
  }
  
  public static void b()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("StatisticConstants", 4, "sendNomalCameraPreviewStatistic ");
    }
    SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext());
    long l1 = localSharedPreferences.getLong("PhotoConst.last_send_camera_preview_rate", 0L);
    long l2 = System.currentTimeMillis();
    int i1 = localSharedPreferences.getInt("PhotoConst.camerapreviewactivity_send_times", 0) + 1;
    if (l2 - l1 > 86400000L)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("param_sendCount", i1 + "");
      int i2 = localSharedPreferences.getInt("PhotoConst.camerapreviewactivity_enter_times", 0);
      localHashMap.put("param_cameraCount", i2 + "");
      if (i2 > 0) {
        localHashMap.put("param_sendPercent", i1 / i2 + "");
      }
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSdayCameraSend", false, 0L, 0L, localHashMap, "", false);
      localSharedPreferences.edit().putLong("PhotoConst.last_send_camera_preview_rate", l2).putInt("PhotoConst.camerapreviewactivity_send_times", 0).putInt("PhotoConst.camerapreviewactivity_enter_times", 0).commit();
      return;
    }
    localSharedPreferences.edit().putInt("PhotoConst.camerapreviewactivity_send_times", i1).commit();
  }
  
  public static void b(long paramLong)
  {
    if (paramLong <= 0L) {
      if (QLog.isColorLevel()) {
        QLog.d("StatisticConstants", 2, "reportActPSprogressTime,size <= 0,return! duration = " + paramLong);
      }
    }
    do
    {
      return;
      HashMap localHashMap = new HashMap();
      localHashMap.put("param_consumTime", paramLong + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSprogressTime", false, 0L, 0L, localHashMap, "", false);
    } while (!QLog.isColorLevel());
    QLog.d("StatisticConstants", 2, "reportActPSprogressTime,WastedSize =" + paramLong);
  }
  
  public static void b(Intent paramIntent, int paramInt)
  {
    if (!paramIntent.hasExtra("param_initTime")) {}
    long l1;
    do
    {
      do
      {
        do
        {
          return;
          l1 = paramIntent.getLongExtra("param_initTime", 0L);
          if (l1 != 0L) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.d("StatisticConstants", 2, "reportActPScancelSend,initTime == 0,return!");
        return;
        l1 = System.currentTimeMillis() - l1;
      } while (l1 > 86400000L);
      HashMap localHashMap = new HashMap();
      int i1 = NetworkUtil.a(BaseApplication.getContext());
      localHashMap.put("param_netType", i1 + "");
      localHashMap.put("param_selNum", paramInt + "");
      localHashMap.put("param_residentTime", l1 + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPScancelSend", false, 0L, 0L, localHashMap, "", false);
      paramIntent.removeExtra("param_initTime");
      paramIntent.removeExtra("param_cancelSelNum");
      paramIntent.removeExtra("param_totalSelNum");
    } while (!QLog.isColorLevel());
    QLog.d("StatisticConstants", 2, "reportActPScancelSend,param_residentTime =" + l1 + ",param_selNum = " + paramInt);
  }
  
  public static void c()
  {
    SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext());
    int i1 = localSharedPreferences.getInt("PhotoConst.camerapreviewactivity_enter_times_fast", 0);
    localSharedPreferences.edit().putInt("PhotoConst.camerapreviewactivity_enter_times_fast", i1 + 1).commit();
  }
  
  public static void d()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("StatisticConstants", 4, "sendFastImageCameraPreviewStatistic ");
    }
    SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext());
    long l1 = localSharedPreferences.getLong("PhotoConst.last_send_camera_preview_rate_fast", 0L);
    long l2 = System.currentTimeMillis();
    int i1 = localSharedPreferences.getInt("PhotoConst.camerapreviewactivity_send_times_fast", 0) + 1;
    if (l2 - l1 > 86400000L)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("param_sendCount", i1 + "");
      int i2 = localSharedPreferences.getInt("PhotoConst.camerapreviewactivity_enter_times_fast", 0);
      localHashMap.put("param_browseCount", i2 + "");
      if (i2 > 0) {
        localHashMap.put("param_sendPercent", i1 / i2 + "");
      }
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSdayQuickSend", false, 0L, 0L, localHashMap, "", false);
      localSharedPreferences.edit().putLong("PhotoConst.last_send_camera_preview_rate_fast", l2).putInt("PhotoConst.camerapreviewactivity_send_times_fast", 0).putInt("PhotoConst.camerapreviewactivity_enter_times_fast", 0).commit();
      return;
    }
    localSharedPreferences.edit().putInt("PhotoConst.camerapreviewactivity_send_times_fast", i1).commit();
  }
  
  public static void e()
  {
    HashMap localHashMap = new HashMap();
    if (DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name())) {}
    for (int i1 = 1002;; i1 = 1001)
    {
      int i2 = NetworkUtil.a(BaseApplication.getContext());
      int i3 = a();
      localHashMap.put("param_netType", i2 + "");
      localHashMap.put("param_phone_type", i3 + "");
      localHashMap.put("param_userType", i1 + "");
      StatisticCollector.a(BaseApplication.getContext()).a(null, "actPSCompressTimeOut", false, 0L, 0L, localHashMap, "", false);
      if (QLog.isColorLevel()) {
        QLog.d("StatisticConstants", 2, "reportPresendCompressTimeOut");
      }
      return;
    }
  }
}
