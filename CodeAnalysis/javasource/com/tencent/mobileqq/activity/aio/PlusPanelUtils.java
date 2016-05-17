package com.tencent.mobileqq.activity.aio;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler.Callback;
import android.preference.PreferenceManager;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.Pair;
import com.dataline.activities.LiteActivity;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.camera.QavCameraUsage;
import com.tencent.av.utils.PstnUtils;
import com.tencent.av.utils.VideoActionSheet;
import com.tencent.biz.PoiMapActivity;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.pubaccount.PublicAccountBrowser;
import com.tencent.common.app.AppInterface;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.utils.SmartDeviceReport;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.panel.AIOPanelUtiles;
import com.tencent.mobileqq.activity.aio.rebuild.FriendChatPie;
import com.tencent.mobileqq.activity.photo.AlbumListActivity;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagManager;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.activity.shortvideo.SendVideoActivity;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.AccountDpcManager.DpcAccountNames;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.filemanager.activity.FMActivity;
import com.tencent.mobileqq.filemanager.activity.FMLocalFileActivity;
import com.tencent.mobileqq.hitrate.PreloadProcHitSession;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.jumplightalk.AIOJumpLightalkConfig;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.pic.IPresendPicMgr;
import com.tencent.mobileqq.pic.PresendPicMgrService;
import com.tencent.mobileqq.qcall.PstnCardInfo;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.qcall.PstnSwitchConfig;
import com.tencent.mobileqq.sensewhere.SenseWhereManager;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.util.HbThemeConfigManager.HBThemeConfig;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.AlbumConstants;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.utils.AudioHelper;
import com.tencent.mobileqq.utils.Base64Util;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.BinderWarpper;
import com.tencent.widget.ActionSheet;
import cooperation.peak.PeakUtils;
import cooperation.qqfav.QfavHelper;
import cooperation.qqfav.QfavReport;
import cooperation.qwallet.plugin.QWalletHelper;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import kqx;
import kqy;
import kqz;
import kra;
import krb;
import krc;
import krd;
import kre;
import krf;
import krg;
import mqq.app.MobileQQ;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class PlusPanelUtils
{
  public static final int a = 1;
  private static TroopObserver jdField_a_of_type_ComTencentMobileqqAppTroopObserver = null;
  public static String a;
  public static final int b = 2;
  public static String b;
  public static final int c = 3;
  public static final int d = 4;
  public static final int e = 4;
  public static final int f = 0;
  public static final int g = 1;
  public static final int h = 2;
  public static final int i = 0;
  public static final int j = 3;
  static int k = 0;
  public static int l = 0;
  public static int m = 0;
  public long a;
  private Dialog jdField_a_of_type_AndroidAppDialog;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public PlusPanelUtils() {}
  
  private static int a(int paramInt)
  {
    switch (paramInt)
    {
    case 0: 
    default: 
      return 0;
    case 1: 
      return 1;
    }
    return 2;
  }
  
  public static int a(SessionInfo paramSessionInfo)
  {
    if (AlbumUtil.a(jdField_a_of_type_Int)) {}
    for (int n = 0; AnonymousChatHelper.a().a(jdField_a_of_type_JavaLangString); n = 1) {
      return 1;
    }
    return n;
  }
  
  public static ActionSheet a(QQAppInterface paramQQAppInterface, Activity paramActivity, int paramInt1, String paramString, boolean paramBoolean1, boolean paramBoolean2, Handler.Callback paramCallback, int paramInt2)
  {
    paramCallback = ActionSheet.a(paramActivity);
    int i1 = 0;
    int n;
    if (paramInt2 == 0)
    {
      paramCallback.c(2131364981);
      paramCallback.a(2131364982, 5);
      n = i1;
    }
    for (;;)
    {
      paramCallback.d(2131366996);
      paramCallback.a(new kra(paramQQAppInterface));
      paramCallback.a(new krb(paramCallback, paramQQAppInterface, paramActivity, paramInt1, paramString, paramInt2, n));
      paramCallback.show();
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8004D6C", "0X8004D6C", 0, 0, "", "", "", "");
      return paramCallback;
      n = i1;
      if (paramInt2 == 1)
      {
        paramCallback.c(2131367815);
        PstnManager localPstnManager = (PstnManager)paramQQAppInterface.getManager(142);
        PstnCardInfo localPstnCardInfo = localPstnManager.a(paramQQAppInterface.a());
        n = i1;
        if (localPstnManager.a() == 1)
        {
          n = i1;
          if (af == 1)
          {
            paramCallback.a(2131372009);
            if (pstn_multi_call_time > 0)
            {
              paramCallback.a(paramQQAppInterface.getApplication().getBaseContext().getResources().getString(2131372007), paramQQAppInterface.getApplication().getBaseContext().getResources().getDrawable(2130839032), 0);
              ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80063FE", "0X80063FE", 1, 0, "", "", "", "");
              n = 3;
            }
            else if ((localPstnManager.c() == 1) && (pstn_multi_try_status == 0))
            {
              paramCallback.a(paramQQAppInterface.getApplication().getBaseContext().getResources().getString(2131372007), paramQQAppInterface.getApplication().getBaseContext().getResources().getDrawable(2130839031), 0);
              ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80063FE", "0X80063FE", 3, 0, "", "", "", "");
              n = 4;
            }
            else
            {
              paramCallback.a(paramQQAppInterface.getApplication().getBaseContext().getResources().getString(2131372007), paramQQAppInterface.getApplication().getBaseContext().getResources().getDrawable(2130839030), 0);
              ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80063FE", "0X80063FE", 2, 0, "", "", "", "");
              n = 5;
            }
          }
        }
      }
    }
  }
  
  public static String a()
  {
    Calendar localCalendar = Calendar.getInstance();
    StringBuilder localStringBuilder = new StringBuilder(AppConstants.bn);
    localStringBuilder.append("IMG");
    localStringBuilder.append(localCalendar.get(1));
    int n = localCalendar.get(2) + 1;
    if (n < 10)
    {
      localObject = "0" + n;
      localStringBuilder.append(localObject);
      n = localCalendar.get(5);
      if (n >= 10) {
        break label300;
      }
      localObject = "0" + n;
      label108:
      localStringBuilder.append(localObject);
      n = localCalendar.get(11);
      if (n >= 10) {
        break label308;
      }
      localObject = "0" + n;
      label148:
      localStringBuilder.append(localObject);
      n = localCalendar.get(12);
      if (n >= 10) {
        break label316;
      }
      localObject = "0" + n;
      label188:
      localStringBuilder.append(localObject);
      n = localCalendar.get(13);
      if (n >= 10) {
        break label324;
      }
    }
    label300:
    label308:
    label316:
    label324:
    for (Object localObject = "0" + n;; localObject = Integer.valueOf(n))
    {
      localStringBuilder.append(localObject);
      if (new File(localStringBuilder.toString() + ".jpg").exists()) {
        break label332;
      }
      return localStringBuilder.toString() + ".jpg";
      localObject = Integer.valueOf(n);
      break;
      localObject = Integer.valueOf(n);
      break label108;
      localObject = Integer.valueOf(n);
      break label148;
      localObject = Integer.valueOf(n);
      break label188;
    }
    label332:
    localObject = new StringBuilder(localStringBuilder);
    int i1 = localStringBuilder.length();
    n = 1;
    for (;;)
    {
      if (n < Integer.MAX_VALUE)
      {
        ((StringBuilder)localObject).append('(');
        ((StringBuilder)localObject).append(n);
        ((StringBuilder)localObject).append(')');
        ((StringBuilder)localObject).append(".jpg");
        if (new File(((StringBuilder)localObject).toString()).exists()) {}
      }
      else
      {
        return ((StringBuilder)localObject).toString();
      }
      ((StringBuilder)localObject).delete(i1, ((StringBuilder)localObject).length());
      n += 1;
    }
  }
  
  /* Error */
  public static List a(QQAppInterface paramQQAppInterface)
  {
    // Byte code:
    //   0: invokestatic 262	com/tencent/mobileqq/util/HbThemeConfigManager:a	()Lcom/tencent/mobileqq/util/HbThemeConfigManager;
    //   3: astore 8
    //   5: new 264	java/util/ArrayList
    //   8: dup
    //   9: invokespecial 265	java/util/ArrayList:<init>	()V
    //   12: astore 9
    //   14: aload 8
    //   16: getfield 268	com/tencent/mobileqq/util/HbThemeConfigManager:a	Ljava/util/List;
    //   19: ifnull +180 -> 199
    //   22: aload 8
    //   24: getfield 268	com/tencent/mobileqq/util/HbThemeConfigManager:a	Ljava/util/List;
    //   27: invokeinterface 273 1 0
    //   32: ifle +167 -> 199
    //   35: iconst_0
    //   36: istore_1
    //   37: iload_1
    //   38: aload 8
    //   40: getfield 268	com/tencent/mobileqq/util/HbThemeConfigManager:a	Ljava/util/List;
    //   43: invokeinterface 273 1 0
    //   48: if_icmpge +151 -> 199
    //   51: aload 8
    //   53: getfield 268	com/tencent/mobileqq/util/HbThemeConfigManager:a	Ljava/util/List;
    //   56: iload_1
    //   57: invokeinterface 276 2 0
    //   62: checkcast 278	com/tencent/mobileqq/util/HbThemeConfigManager$HBThemeConfig
    //   65: astore 10
    //   67: aload 10
    //   69: ifnull +39 -> 108
    //   72: aload 10
    //   74: getfield 279	com/tencent/mobileqq/util/HbThemeConfigManager$HBThemeConfig:jdField_a_of_type_Int	I
    //   77: iconst_1
    //   78: if_icmple +30 -> 108
    //   81: aload 10
    //   83: getfield 280	com/tencent/mobileqq/util/HbThemeConfigManager$HBThemeConfig:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   86: ifnull +22 -> 108
    //   89: aload 10
    //   91: getfield 283	com/tencent/mobileqq/util/HbThemeConfigManager$HBThemeConfig:jdField_b_of_type_OrgJsonJSONArray	Lorg/json/JSONArray;
    //   94: ifnull +14 -> 108
    //   97: aload 10
    //   99: getfield 283	com/tencent/mobileqq/util/HbThemeConfigManager$HBThemeConfig:jdField_b_of_type_OrgJsonJSONArray	Lorg/json/JSONArray;
    //   102: invokevirtual 286	org/json/JSONArray:length	()I
    //   105: ifgt +10 -> 115
    //   108: iload_1
    //   109: iconst_1
    //   110: iadd
    //   111: istore_1
    //   112: goto -75 -> 37
    //   115: invokestatic 292	java/lang/System:currentTimeMillis	()J
    //   118: lstore 6
    //   120: new 294	java/text/SimpleDateFormat
    //   123: dup
    //   124: ldc_w 296
    //   127: invokespecial 297	java/text/SimpleDateFormat:<init>	(Ljava/lang/String;)V
    //   130: astore_0
    //   131: aload_0
    //   132: aload 10
    //   134: getfield 299	com/tencent/mobileqq/util/HbThemeConfigManager$HBThemeConfig:e	Ljava/lang/String;
    //   137: invokevirtual 303	java/text/SimpleDateFormat:parse	(Ljava/lang/String;)Ljava/util/Date;
    //   140: invokevirtual 308	java/util/Date:getTime	()J
    //   143: lstore_2
    //   144: aload_0
    //   145: aload 10
    //   147: getfield 310	com/tencent/mobileqq/util/HbThemeConfigManager$HBThemeConfig:f	Ljava/lang/String;
    //   150: invokevirtual 303	java/text/SimpleDateFormat:parse	(Ljava/lang/String;)Ljava/util/Date;
    //   153: invokevirtual 308	java/util/Date:getTime	()J
    //   156: lstore 4
    //   158: lload 6
    //   160: lload_2
    //   161: lcmp
    //   162: iflt -54 -> 108
    //   165: lload 6
    //   167: lload 4
    //   169: lcmp
    //   170: ifgt -62 -> 108
    //   173: aload 9
    //   175: aload 10
    //   177: invokeinterface 314 2 0
    //   182: pop
    //   183: goto -75 -> 108
    //   186: astore_0
    //   187: lconst_0
    //   188: lstore_2
    //   189: aload_0
    //   190: invokevirtual 317	java/text/ParseException:printStackTrace	()V
    //   193: lconst_0
    //   194: lstore 4
    //   196: goto -38 -> 158
    //   199: aload 9
    //   201: areturn
    //   202: astore_0
    //   203: goto -14 -> 189
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	206	0	paramQQAppInterface	QQAppInterface
    //   36	76	1	n	int
    //   143	46	2	l1	long
    //   156	39	4	l2	long
    //   118	48	6	l3	long
    //   3	49	8	localHbThemeConfigManager	com.tencent.mobileqq.util.HbThemeConfigManager
    //   12	188	9	localArrayList	ArrayList
    //   65	111	10	localHBThemeConfig	HbThemeConfigManager.HBThemeConfig
    // Exception table:
    //   from	to	target	type
    //   131	144	186	java/text/ParseException
    //   144	158	202	java/text/ParseException
  }
  
  public static List a(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo)
  {
    return a(paramQQAppInterface);
  }
  
  public static void a(Activity paramActivity, SessionInfo paramSessionInfo, ArrayList paramArrayList, Intent paramIntent)
  {
    Intent localIntent = new Intent(paramActivity, AlbumListActivity.class);
    localIntent.putExtra("PhotoConst.SEND_BUSINESS_TYPE", 1007);
    int i1;
    boolean bool2;
    int n;
    boolean bool1;
    if ((!SplashActivity.class.isInstance(paramActivity)) && (!ChatActivity.class.isInstance(paramActivity)) && (!LiteActivity.class.isInstance(paramActivity)))
    {
      localIntent.putExtras(paramActivity.getIntent());
      if (QLog.isColorLevel()) {
        QLog.d("PEAK", 2, "enterAlbum() INIT_ACTIVITY_CLASS_NAME=" + localIntent.getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME"));
      }
      localIntent.putExtra("PhotoConst.HANDLE_DEST_RESULT", true);
      i1 = 20;
      bool2 = false;
      if (paramIntent == null) {
        break label859;
      }
      n = paramIntent.getIntExtra("peakconstant.request_code", -1);
      localIntent.putExtra("PhotoConst.CURRENT_QUALITY_TYPE", paramIntent.getIntExtra("PhotoConst.CURRENT_QUALITY_TYPE", 0));
      i1 = paramIntent.getIntExtra("PhotoConst.MAXUM_SELECTED_NUM", 20);
      bool2 = paramIntent.getBooleanExtra("PhotoConst.PHOTOLIST_KEY_FILTER_GIF_VIDEO", false);
      bool1 = paramIntent.getBooleanExtra("filter_photolist_troopalbum_toolbar", false);
      if (paramIntent.getIntExtra("PhotoConst.SEND_BUSINESS_TYPE", -1) == 1039) {
        localIntent.putExtra("PhotoConst.SEND_BUSINESS_TYPE", 1039);
      }
      PhotoUtils.a(paramIntent, localIntent);
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("PlusPanelUtils", 2, "enterAlbum  maxNum = " + i1);
      }
      if (jdField_a_of_type_Int == 9501) {
        localIntent.putExtra("isdevicesupportmultiupload", true);
      }
      localIntent.putExtra("PhotoConst.PHOTOLIST_KEY_FILTER_GIF_VIDEO", bool2);
      localIntent.putExtra("filter_photolist_troopalbum_toolbar", bool1);
      localIntent.putExtra("PhotoConst.MAXUM_SELECTED_NUM", i1);
      localIntent.putExtra("extra_image_sender_tag", "sessionInfo.enterAlbum");
      localIntent.putExtra("PhotoConst.IS_RECODE_LAST_ALBUMPATH", true);
      localIntent.putExtra("album_enter_directly", true);
      localIntent.putExtra("ALBUM_ID", AlbumUtil.a(paramActivity));
      localIntent.putExtra("ALBUM_NAME", AlbumUtil.b(paramActivity));
      localIntent.putExtra("PhotoConst.PHOTO_LIST_SHOW_PREVIEW", true);
      localIntent.putExtra("uin", jdField_a_of_type_JavaLangString);
      localIntent.putExtra("uintype", jdField_a_of_type_Int);
      localIntent.putExtra("troop_uin", jdField_b_of_type_JavaLangString);
      localIntent.putExtra("uinname", d);
      localIntent.putExtra("PhotoConst.IS_SHOW_CAMERA", false);
      if ((((paramActivity instanceof SplashActivity)) || ((paramActivity instanceof ChatActivity))) && (((FragmentActivity)paramActivity).getChatFragment() != null)) {
        localIntent.putExtra("isBack2Root", getChatFragmentah);
      }
      localIntent.putExtra("is_anonymous", AnonymousChatHelper.a().a(jdField_a_of_type_JavaLangString));
      localIntent.putExtra("PhotoConst.PHOTOLIST_KEY_SHOW_MEDIA", a(paramSessionInfo));
      localIntent.getExtras().remove("forward_type");
      if ((paramArrayList != null) && (!paramArrayList.isEmpty())) {
        localIntent.putExtra("PhotoConst.PHOTO_PATHS", paramArrayList);
      }
      if (n == -1) {
        paramActivity.startActivity(localIntent);
      }
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("PEAK", 2, "enterPhotoPicker");
        }
        AlbumUtil.a(paramActivity, false, true);
        if (PeakUtils.a != null) {
          PeakUtils.a.b();
        }
        return;
        if ((paramActivity instanceof SplashActivity))
        {
          localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
          localIntent = AIOUtils.a(localIntent, null);
          label620:
          localIntent.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
          if (jdField_a_of_type_Int != 9501) {
            break label808;
          }
          if (!(paramActivity instanceof SplashActivity)) {
            break label790;
          }
          localIntent.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
          localIntent = AIOUtils.a(localIntent, null);
          label672:
          localIntent.putExtra(AlbumConstants.i, 80);
          localIntent.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
          localIntent.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
          localIntent.putExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", true);
        }
        for (;;)
        {
          localIntent.putExtra("PhotoConst.DEST_VIDEO_ACTIVITY_CLASS_NAME", SendVideoActivity.class.getName());
          localIntent.putExtra("PhotoConst.DEST_VIDEO_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
          break;
          if ((paramActivity instanceof LiteActivity))
          {
            localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", LiteActivity.class.getName());
            break label620;
          }
          localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", ChatActivity.class.getName());
          break label620;
          label790:
          localIntent.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", ChatActivity.class.getName());
          break label672;
          label808:
          localIntent.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SendPhotoActivity.class.getName());
          localIntent.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
          localIntent.putExtra("PhotoConst.SHOULD_SEND_RAW_PHOTO", true);
        }
        paramActivity.startActivityForResult(localIntent, n);
      }
      label859:
      bool1 = false;
      n = -1;
    }
  }
  
  public static void a(Context paramContext, SessionInfo paramSessionInfo)
  {
    Intent localIntent = new Intent(paramContext, PublicAccountBrowser.class);
    localIntent.putExtra("url", "http://app.p.qq.com/games/zhuagui/game.html");
    localIntent.putExtra("uin", jdField_a_of_type_JavaLangString);
    localIntent.putExtra("uin_type", jdField_a_of_type_Int);
    localIntent.putExtra("uin_name", d);
    paramContext.startActivity(localIntent);
  }
  
  public static void a(Intent paramIntent, SessionInfo paramSessionInfo, QQAppInterface paramQQAppInterface)
  {
    if (a(paramSessionInfo, paramQQAppInterface.b(jdField_a_of_type_JavaLangString)))
    {
      if (QLog.isColorLevel()) {
        QLog.d("PEAK", 2, "prepareForPicPresend add binder!");
      }
      paramIntent.putExtra("binder_presendService", new BinderWarpper(new PresendPicMgrService(jdField_a_of_type_Int, jdField_a_of_type_JavaLangString, jdField_b_of_type_JavaLangString, paramQQAppInterface.getAccount()).asBinder()));
    }
  }
  
  public static void a(AppInterface paramAppInterface, Activity paramActivity, int paramInt, SessionInfo paramSessionInfo)
  {
    if (QavCameraUsage.b(BaseApplicationImpl.getContext())) {
      return;
    }
    if (!Utils.d())
    {
      QQToast.a(paramActivity, paramActivity.getResources().getString(2131368675), 0).a();
      return;
    }
    paramAppInterface = new File(AppConstants.bn);
    if (!paramAppInterface.exists()) {
      paramAppInterface.mkdirs();
    }
    paramSessionInfo = a();
    paramAppInterface = Uri.fromFile(new File(paramSessionInfo));
    PreferenceManager.getDefaultSharedPreferences(paramActivity).edit().putString("camera_photo_path", paramSessionInfo).commit();
    paramSessionInfo = new Intent("android.media.action.IMAGE_CAPTURE");
    paramSessionInfo.putExtra("output", paramAppInterface);
    paramSessionInfo.putExtra("android.intent.extra.videoQuality", 100);
    try
    {
      paramActivity.startActivityForResult(paramSessionInfo, paramInt);
      return;
    }
    catch (Exception paramAppInterface)
    {
      paramAppInterface.printStackTrace();
      QQToast.a(paramActivity, 2131368698, 0).a();
    }
  }
  
  public static void a(BaseActivity paramBaseActivity, SessionInfo paramSessionInfo, QQAppInterface paramQQAppInterface, Intent paramIntent)
  {
    a(paramBaseActivity, paramSessionInfo, null, null);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Activity paramActivity)
  {
    try
    {
      ((FragmentActivity)paramActivity).getChatFragment().a().ai();
      paramActivity.startActivityForResult(new Intent(paramActivity, PoiMapActivity.class).putExtra("uin", paramQQAppInterface.getAccount()), 18);
      ((SenseWhereManager)paramQQAppInterface.getManager(125)).e();
      return;
    }
    catch (Exception paramActivity)
    {
      for (;;)
      {
        paramActivity.printStackTrace();
      }
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo)
  {
    localIntent = new Intent(paramActivity, FMActivity.class);
    paramQQAppInterface = (SmartDeviceProxyMgr)paramQQAppInterface.a(51);
    long l1 = 0L;
    try
    {
      long l2 = Long.parseLong(jdField_a_of_type_JavaLangString);
      l1 = l2;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
        continue;
        localIntent.putExtra("from_aio", true);
        localIntent.addFlags(536870912);
        localIntent.putExtra("selectMode", true);
        localIntent.putExtra("peerType", jdField_a_of_type_Int);
        localIntent.putExtra("targetUin", jdField_a_of_type_JavaLangString);
        if (jdField_a_of_type_Int == 1000) {
          localIntent.putExtra("srcDiscGroup", jdField_b_of_type_JavaLangString);
        } else if (jdField_a_of_type_Int == 1006) {
          localIntent.putExtra("srcDiscGroup", e);
        } else {
          localIntent.putExtra("srcDiscGroup", c);
        }
      }
    }
    if ((jdField_a_of_type_Int == 9501) && (paramQQAppInterface != null) && (paramQQAppInterface.a()))
    {
      localIntent.putExtra("category", 6);
      localIntent.putExtra("selectMode", true);
      localIntent.putExtra("targetUin", jdField_a_of_type_JavaLangString);
      localIntent.putExtra("peerType", jdField_a_of_type_Int);
      localIntent.putExtra("tab_tab_type", 5);
      localIntent.putExtra("smart_device_support_flag", paramQQAppInterface.a(l1));
      paramActivity.startActivityForResult(localIntent, 5);
      paramActivity.overridePendingTransition(2130968585, 2130968586);
      return;
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo, int paramInt)
  {
    paramQQAppInterface = (SmartDeviceProxyMgr)paramQQAppInterface.a(51);
    long l1;
    if ((paramQQAppInterface != null) && (paramQQAppInterface.a())) {
      l1 = 0L;
    }
    try
    {
      long l2 = Long.parseLong(jdField_a_of_type_JavaLangString);
      l1 = l2;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        int n;
        localException.printStackTrace();
      }
    }
    n = paramQQAppInterface.a(l1);
    paramQQAppInterface = new Intent(paramActivity, FMActivity.class);
    paramQQAppInterface.putExtra("category", 6);
    paramQQAppInterface.putExtra("selectMode", true);
    paramQQAppInterface.putExtra("targetUin", jdField_a_of_type_JavaLangString);
    paramQQAppInterface.putExtra("peerType", jdField_a_of_type_Int);
    paramQQAppInterface.putExtra("tab_tab_type", 5);
    paramQQAppInterface.putExtra("smart_device_support_flag", n);
    paramQQAppInterface.putExtra("smart_device_switch_tab_flag", paramInt);
    paramActivity.startActivityForResult(paramQQAppInterface, 5);
    paramActivity.overridePendingTransition(2130968585, 2130968586);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo, HbThemeConfigManager.HBThemeConfig paramHBThemeConfig, int paramInt)
  {
    Object localObject3 = (PasswdRedBagManager)paramQQAppInterface.getManager(124);
    int n = 0;
    int i2 = 1;
    int i1;
    Object localObject1;
    if (jdField_a_of_type_Int == 0)
    {
      i1 = 0;
      n = 1;
      localObject1 = "";
    }
    for (;;)
    {
      JSONObject localJSONObject = new JSONObject();
      try
      {
        localJSONObject.put("recv_uin", jdField_a_of_type_JavaLangString);
        if (i1 > 0) {
          localJSONObject.put("people_num", i1);
        }
        localJSONObject.put("recv_type", n);
        if (!TextUtils.isEmpty((CharSequence)localObject1)) {
          localJSONObject.put("session_token", localObject1);
        }
        localJSONObject.put("channel", i2);
        if (localObject3 != null)
        {
          localObject1 = ((PasswdRedBagManager)localObject3).a();
          if (localObject1 != null) {
            localJSONObject.put("placeholder", localObject1);
          }
        }
      }
      catch (JSONException localJSONException)
      {
        for (;;)
        {
          localJSONException.printStackTrace();
        }
      }
      if (QLog.isColorLevel()) {
        QLog.d("PlusPanel", 2, "click HongBao:params=" + localJSONObject.toString());
      }
      localObject1 = new Intent(BaseApplicationImpl.getContext(), SendHbActivity.class);
      ((Intent)localObject1).putExtra("come_from", 2);
      localObject3 = new JSONObject();
      boolean bool1 = false;
      boolean bool2;
      if (paramHBThemeConfig != null) {
        bool2 = true;
      }
      try
      {
        ((JSONObject)localObject3).put("hb_theme_id", jdField_a_of_type_Int);
        if (!TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
          ((JSONObject)localObject3).put("hb_theme_name", jdField_a_of_type_JavaLangString);
        }
        if (!TextUtils.isEmpty(jdField_b_of_type_JavaLangString)) {
          ((JSONObject)localObject3).put("hb_theme_img", jdField_b_of_type_JavaLangString);
        }
        if ((jdField_b_of_type_OrgJsonJSONArray != null) && (jdField_b_of_type_OrgJsonJSONArray.length() > 0)) {
          ((JSONObject)localObject3).put("hb_theme_money_array", jdField_b_of_type_OrgJsonJSONArray);
        }
        bool1 = bool2;
        if (jdField_a_of_type_OrgJsonJSONArray != null)
        {
          bool1 = bool2;
          if (jdField_a_of_type_OrgJsonJSONArray.length() > 0)
          {
            ((JSONObject)localObject3).put("hb_theme_wish_array", jdField_a_of_type_OrgJsonJSONArray);
            bool1 = bool2;
          }
        }
      }
      catch (JSONException paramHBThemeConfig)
      {
        do
        {
          for (;;)
          {
            Object localObject2;
            paramHBThemeConfig.printStackTrace();
            bool1 = bool2;
          }
        } while (paramInt != 1);
        AIOPanelUtiles.a(paramQQAppInterface, "0X8005FC9", jdField_a_of_type_Int);
        return;
      }
      ((Intent)localObject1).putExtra("theme", bool1);
      ((Intent)localObject1).putExtra("theme_config", ((JSONObject)localObject3).toString());
      ((Intent)localObject1).putExtra("app_info", "appid#1344242394|bargainor_id#1000030201|channel#aio");
      ((Intent)localObject1).putExtra("extra_data", localJSONObject.toString());
      ((Intent)localObject1).putExtra("vacreport_key_seq", VACDReportUtil.a(null, "qqwallet", "makeHongbao", "click", "groupType=" + n, 0, null));
      paramActivity.startActivity((Intent)localObject1);
      if (jdField_a_of_type_Int == 1)
      {
        paramActivity = (HotChatManager)paramQQAppInterface.getManager(59);
        if ((paramActivity != null) && (paramActivity.b(jdField_a_of_type_JavaLangString))) {
          ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8005B9C", "0X8005B9C", 0, 0, "", "", "", "");
        }
      }
      if (jdField_a_of_type_Int == 1001) {
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8005B9D", "0X8005B9D", 0, 0, "", "", "", "");
      }
      if (paramInt == 0)
      {
        AIOPanelUtiles.a(paramQQAppInterface, "0X8005CAF", jdField_a_of_type_Int);
        return;
        if (jdField_a_of_type_Int == 3000)
        {
          n = 2;
          i1 = ((DiscussionManager)paramQQAppInterface.getManager(52)).a(jdField_a_of_type_JavaLangString);
          localObject1 = "";
          continue;
        }
        if (jdField_a_of_type_Int == 1)
        {
          localObject1 = ((TroopManager)paramQQAppInterface.getManager(51)).a(jdField_a_of_type_JavaLangString);
          if (localObject1 != null)
          {
            n = wMemberNum;
            if (QLog.isColorLevel()) {
              QLog.d("PlusPanelUtils", 2, "群uin：" + jdField_a_of_type_JavaLangString + " 群成员个数：" + n);
            }
          }
          if (QWalletHelper.a(jdField_a_of_type_JavaLangString)) {}
          try
          {
            long l1 = Long.parseLong(jdField_a_of_type_JavaLangString);
            localObject1 = (TroopHandler)paramQQAppInterface.a(20);
            if (jdField_a_of_type_ComTencentMobileqqAppTroopObserver == null) {
              jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new krf(paramSessionInfo);
            }
            paramQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
            ((TroopHandler)localObject1).b(l1, 32, 0);
          }
          catch (NumberFormatException localNumberFormatException)
          {
            for (;;)
            {
              int i3;
              if (QLog.isColorLevel())
              {
                QLog.d("angelzhuang", 2, "群uin：" + jdField_a_of_type_JavaLangString + " 解析失败");
                continue;
                i2 = 3;
                i1 = 1;
              }
            }
          }
          localObject1 = (HotChatManager)paramQQAppInterface.getManager(59);
          if ((localObject1 != null) && (((HotChatManager)localObject1).b(jdField_a_of_type_JavaLangString)))
          {
            i2 = 6;
            i1 = 5;
            i3 = n;
            n = i2;
            localObject1 = "";
            i2 = i1;
            i1 = i3;
            continue;
          }
        }
        if (jdField_a_of_type_Int == 1000)
        {
          localObject2 = jdField_b_of_type_JavaLangString;
          i1 = 0;
          n = 4;
          continue;
        }
        if (jdField_a_of_type_Int == 1004)
        {
          localObject2 = jdField_b_of_type_JavaLangString;
          i1 = 0;
          n = 5;
          continue;
        }
        if (jdField_a_of_type_Int != 1001) {
          break label1021;
        }
        i2 = 5;
        localObject2 = paramQQAppInterface.a().k(jdField_a_of_type_JavaLangString);
        if (localObject2 == null) {
          break label1007;
        }
        localObject2 = Base64Util.encodeToString((byte[])localObject2, 2);
        i1 = 0;
        n = 7;
      }
      label1007:
      String str = "";
      i1 = 0;
      n = 7;
      continue;
      label1021:
      i1 = 0;
      n = 0;
      str = "";
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo, String paramString)
  {
    ReportController.b(paramQQAppInterface, "CliOper", "", jdField_a_of_type_JavaLangString, "Music_gene", "Music_gene_AIO", 0, 0, String.valueOf(a(jdField_a_of_type_Int)), "", "", "");
    paramQQAppInterface = new Intent(paramActivity, QQBrowserActivity.class);
    if (TextUtils.isEmpty(paramString))
    {
      paramQQAppInterface.putExtra("url", "http://y.qq.com/m/qzonemusic/mqzsearch.html" + "?touin=" + jdField_a_of_type_JavaLangString + "&uintype=" + jdField_a_of_type_Int + "&_wv=1&entry=aio&_bid=203");
      if (QLog.isColorLevel()) {
        QLog.d("PlusPanelUtils", 2, "enterQQMusic url is null");
      }
    }
    for (;;)
    {
      paramQQAppInterface.putExtra("hide_left_button", true);
      paramQQAppInterface.putExtra("show_right_close_button", true);
      paramQQAppInterface.putExtra("finish_animation_up_down", true);
      paramActivity.startActivity(paramQQAppInterface);
      paramActivity.overridePendingTransition(2130968585, 0);
      return;
      paramQQAppInterface.putExtra("url", paramString.replace("$FriendUin$", jdField_a_of_type_JavaLangString).replace("$CurType$", String.valueOf(jdField_a_of_type_Int)));
      if (QLog.isColorLevel()) {
        QLog.d("PlusPanelUtils", 2, "enterQQMusic url is get from file");
      }
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Context paramContext, Uri paramUri, SessionInfo paramSessionInfo)
  {
    new krc(paramSessionInfo, paramQQAppInterface, paramContext, ImageUtil.c(paramContext, paramUri)).execute(new Void[0]);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Context paramContext, SessionInfo paramSessionInfo, boolean paramBoolean, String paramString, BaseChatPie paramBaseChatPie)
  {
    if (VideoActionSheet.a()) {
      return;
    }
    VideoActionSheet localVideoActionSheet = VideoActionSheet.a(paramContext);
    int[] arrayOfInt = new int[4];
    arrayOfInt[0] = 1;
    localVideoActionSheet.c(2131367815);
    Object localObject1 = (PstnManager)paramQQAppInterface.getManager(142);
    Object localObject2 = ((PstnManager)localObject1).a(paramQQAppInterface.a());
    PstnSessionInfo localPstnSessionInfo = PstnUtils.a(paramQQAppInterface, new PstnSessionInfo(), jdField_a_of_type_JavaLangString, jdField_a_of_type_Int);
    int i2;
    int i1;
    if ((jdField_b_of_type_JavaLangString != null) && (c != null))
    {
      d = d;
      if ((((PstnManager)localObject1).a() == 1) && (ac == 1))
      {
        localVideoActionSheet.a(2131372009);
        if (pstn_c2c_call_time > 0)
        {
          localVideoActionSheet.a(paramQQAppInterface.getApplication().getBaseContext().getResources().getString(2131372007), paramQQAppInterface.getApplication().getBaseContext().getResources().getDrawable(2130839032), 0);
          ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80063FD", "0X80063FD", 1, 0, "", "", "", "");
          n = 1;
          arrayOfInt[1] = 4;
          i2 = 2;
          i1 = n;
        }
      }
    }
    for (int n = i2;; n = 1)
    {
      arrayOfInt[n] = 2;
      localVideoActionSheet.c(2131367812);
      if ((paramBaseChatPie instanceof FriendChatPie))
      {
        localObject1 = ((FriendChatPie)paramBaseChatPie).a();
        if (localObject1 != null)
        {
          if ((!NetworkUtil.e(paramContext)) || (TextUtils.isEmpty(g))) {
            break label568;
          }
          localObject2 = URLDrawable.getDrawable(g, 0, 0, null, null, false);
          localVideoActionSheet.a(f, (Drawable)localObject2, 0);
        }
      }
      for (;;)
      {
        arrayOfInt[(n + 1)] = 3;
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8005B01", "0X8005B01", 0, 0, "", "", "", "");
        localVideoActionSheet.d(2131366996);
        localVideoActionSheet.a(new kqx(paramQQAppInterface, arrayOfInt));
        localVideoActionSheet.a(new kqz(localVideoActionSheet, arrayOfInt, i1, paramQQAppInterface, paramContext, localPstnSessionInfo, paramSessionInfo, paramBaseChatPie, paramString));
        localVideoActionSheet.show();
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8004D68", "0X8004D68", 0, 0, "", "", "", "");
        return;
        if ((((PstnManager)localObject1).b() == 1) && (pstn_c2c_try_status == 0))
        {
          localVideoActionSheet.a(paramQQAppInterface.getApplication().getBaseContext().getResources().getString(2131372007), paramQQAppInterface.getApplication().getBaseContext().getResources().getDrawable(2130839031), 0);
          ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80063FD", "0X80063FD", 3, 0, "", "", "", "");
          n = 2;
          break;
        }
        localVideoActionSheet.a(paramQQAppInterface.getApplication().getBaseContext().getResources().getString(2131372007), paramQQAppInterface.getApplication().getBaseContext().getResources().getDrawable(2130839029), 0);
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80063FD", "0X80063FD", 2, 0, "", "", "", "");
        n = 5;
        break;
        label568:
        localVideoActionSheet.c(f);
      }
      i1 = 0;
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Context paramContext, SessionInfo paramSessionInfo, boolean paramBoolean, String paramString, Map paramMap)
  {
    String str2;
    String str1;
    if (paramBoolean)
    {
      str2 = "0X80049C5";
      switch (jdField_a_of_type_Int)
      {
      default: 
        str1 = "0";
      }
    }
    for (;;)
    {
      ReportController.b(paramQQAppInterface, "CliOper", "", "", str2, str2, 0, 0, str1, "", "", "");
      b(paramQQAppInterface, paramContext, paramSessionInfo, paramBoolean, paramString, paramMap);
      return;
      str2 = "0X80049C7";
      break;
      str1 = "0";
      continue;
      str1 = "1";
      continue;
      str1 = "2";
      continue;
      str1 = "3";
      continue;
      str1 = "4";
      continue;
      str1 = "5";
      continue;
      str1 = "6";
      continue;
      str1 = "7";
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Context paramContext, BaseActivity paramBaseActivity, SessionInfo paramSessionInfo, int paramInt)
  {
    if (AudioHelper.b(0)) {
      DialogUtil.a(paramContext, 230, paramContext.getString(2131367386), paramContext.getString(2131367387), new krd(), null).show();
    }
    do
    {
      return;
      if (AudioHelper.a(0))
      {
        DialogUtil.a(paramContext, 230, paramContext.getString(2131367386), paramContext.getString(2131367388), new kre(), null).show();
        return;
      }
      paramQQAppInterface.a().c();
      a(paramQQAppInterface, paramBaseActivity, 1, paramSessionInfo);
      paramBaseActivity.setCanLock(false);
    } while (jdField_a_of_type_Int != 9501);
    SmartDeviceReport.a(paramQQAppInterface, Long.parseLong(jdField_a_of_type_JavaLangString), "Usr_AIO_SendMsg", 2, 0, paramInt);
  }
  
  public static boolean a(SessionInfo paramSessionInfo, boolean paramBoolean)
  {
    boolean bool3 = true;
    boolean bool4 = DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpresend_whitelist.name());
    Object localObject = BaseApplication.getContext();
    int n;
    boolean bool2;
    boolean bool1;
    boolean bool5;
    boolean bool6;
    boolean bool7;
    if (Build.VERSION.SDK_INT > 10)
    {
      n = 4;
      localObject = ((BaseApplication)localObject).getSharedPreferences("presend_config_sp", n);
      bool2 = ((SharedPreferences)localObject).getBoolean("key_presend_off_flag", false);
      bool1 = bool2;
      if (bool2)
      {
        long l1 = ((SharedPreferences)localObject).getLong("key_presend_off_time", 0L);
        bool1 = bool2;
        if (System.currentTimeMillis() - l1 > 86400000L)
        {
          if (QLog.isColorLevel()) {
            QLog.d("PEAK", 2, "isPresendAllowed,PicPresend off more than 24h ,enable PicPresend!");
          }
          ((SharedPreferences)localObject).edit().putBoolean("key_presend_off_flag", false).commit();
          bool1 = false;
        }
      }
      if (DeviceProfileManager.a().a(DeviceProfileManager.AccountDpcManager.DpcAccountNames.picpredownload_whitelist.name()))
      {
        if (QLog.isColorLevel()) {
          QLog.d("PEAK", 2, "isPresendAllowed ,is VIP User");
        }
        bool1 = false;
      }
      bool2 = bool1;
      if (jdField_a_of_type_Int == 1001)
      {
        bool2 = bool1;
        if (!paramBoolean)
        {
          if (QLog.isColorLevel()) {
            QLog.d("PEAK", 2, "isPresendAllowed,old lbs protocol ,disable PicPresend!");
          }
          bool2 = true;
        }
      }
      if (jdField_a_of_type_Int != 9500)
      {
        paramBoolean = bool2;
        if (jdField_a_of_type_Int != 9501) {}
      }
      else
      {
        if (QLog.isColorLevel()) {
          QLog.d("PEAK", 2, "curType is smart device ,disable PicPresend!");
        }
        paramBoolean = true;
      }
      paramSessionInfo = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.pic_presend.name(), "0|0|0|0|1|0|1|1|1048576|0|307200|307200|0|90|70|50");
      bool1 = paramBoolean;
      if (!paramBoolean)
      {
        bool1 = paramBoolean;
        if (paramSessionInfo != null)
        {
          bool1 = paramBoolean;
          if (paramSessionInfo.length() > 0)
          {
            paramSessionInfo = paramSessionInfo.split("\\|");
            bool1 = paramBoolean;
            if (paramSessionInfo.length >= 4)
            {
              bool2 = paramSessionInfo[0].equals("1");
              bool5 = paramSessionInfo[1].equals("1");
              bool6 = paramSessionInfo[2].equals("1");
              bool7 = paramSessionInfo[3].equals("1");
              n = NetworkUtil.a(BaseApplicationImpl.getContext());
            }
          }
        }
      }
      switch (n)
      {
      default: 
        label380:
        bool1 = paramBoolean;
        if (QLog.isColorLevel())
        {
          QLog.d("PEAK", 2, "isPresendAllowed netType = " + n + ",enablePreCompress_WIFI:" + bool2 + ", enablePreCompress_2G = " + bool5 + ", enablePreCompress_3G = " + bool6 + ", enablePreCompress_4G = " + bool7 + ", presendOFF  = " + paramBoolean);
          bool1 = paramBoolean;
        }
        if ((bool4) || (bool1)) {
          break;
        }
      }
    }
    for (paramBoolean = bool3;; paramBoolean = false)
    {
      if (QLog.isColorLevel()) {
        QLog.d("PEAK", 2, "isPresendAllowed, isInDPCPicPresendWhiteList :" + bool4 + ", presendOFF = " + bool1 + ", result  = " + paramBoolean);
      }
      return paramBoolean;
      n = 0;
      break;
      if (!bool2)
      {
        paramBoolean = true;
        break label380;
      }
      paramBoolean = false;
      break label380;
      if (!bool5)
      {
        paramBoolean = true;
        break label380;
      }
      paramBoolean = false;
      break label380;
      if (!bool6)
      {
        paramBoolean = true;
        break label380;
      }
      paramBoolean = false;
      break label380;
      if (!bool7)
      {
        paramBoolean = true;
        break label380;
      }
      paramBoolean = false;
      break label380;
    }
  }
  
  public static void b(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo)
  {
    ReportController.b(paramQQAppInterface, "CliOper", "", "", "Grp", "Up_sent_files\t", 0, 0, "", jdField_a_of_type_JavaLangString, "", "");
    paramQQAppInterface = new Intent(paramActivity, FMActivity.class);
    paramQQAppInterface.putExtra("from_aio", true);
    paramQQAppInterface.addFlags(536870912);
    paramQQAppInterface.putExtra("selectMode", true);
    paramQQAppInterface.putExtra("peerType", jdField_a_of_type_Int);
    paramQQAppInterface.putExtra("targetUin", jdField_a_of_type_JavaLangString);
    paramQQAppInterface.putExtra("tab_tab_type", 5);
    paramQQAppInterface.putExtra("key_check_troop_privilege", true);
    paramActivity.startActivityForResult(paramQQAppInterface, 5);
    paramActivity.overridePendingTransition(2130968585, 2130968586);
  }
  
  public static void b(QQAppInterface paramQQAppInterface, Context paramContext, SessionInfo paramSessionInfo, boolean paramBoolean, String paramString, Map paramMap)
  {
    Object localObject = (PhoneContactManager)paramQQAppInterface.getManager(10);
    String str;
    if (jdField_a_of_type_Int == 1006) {
      str = ((PhoneContactManager)localObject).a(jdField_a_of_type_JavaLangString);
    }
    for (localObject = jdField_a_of_type_JavaLangString; paramString == null; localObject = ((PhoneContactManager)localObject).b(str))
    {
      ChatActivityUtils.a(paramQQAppInterface, paramContext, jdField_a_of_type_Int, str, d, (String)localObject, paramBoolean, jdField_b_of_type_JavaLangString, true, true, null, "from_internal", paramMap);
      return;
      str = jdField_a_of_type_JavaLangString;
    }
    ChatActivityUtils.a(paramQQAppInterface, paramContext, jdField_a_of_type_Int, str, d, (String)localObject, paramBoolean, jdField_b_of_type_JavaLangString, true, true, null, paramString, paramMap);
  }
  
  public static void c(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo)
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("bEnterToSelect", true);
    localIntent.putExtra("paSessionInfo", paramSessionInfo);
    QfavHelper.a(paramActivity, paramQQAppInterface.getAccount(), localIntent, -1, false);
    QfavReport.b(paramQQAppInterface, 3, jdField_a_of_type_Int);
  }
  
  public static void d(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo)
  {
    paramQQAppInterface = new Intent(paramActivity, FMLocalFileActivity.class);
    paramQQAppInterface.putExtra("category", 15);
    paramQQAppInterface.putExtra("busiType", 5);
    paramQQAppInterface.putExtra("selectMode", true);
    paramQQAppInterface.putExtra("peerType", jdField_a_of_type_Int);
    paramQQAppInterface.putExtra("targetUin", jdField_a_of_type_JavaLangString);
    paramQQAppInterface.putExtra("STRING_Show_Music_Category", false);
    paramQQAppInterface.putExtra("STRING_Show_Video_Category", false);
    paramQQAppInterface.putExtra("STRING_Show_Apk_Category", false);
    paramQQAppInterface.putExtra("STRING_Show_Pic_Category", false);
    paramQQAppInterface.putExtra("STRING_SingleSelect", true);
    paramQQAppInterface.putExtra(AlbumConstants.i, 84);
    paramQQAppInterface.putExtra("STRING_Show_Within_Suffixs", new String[] { "doc", "docx", "txt", "pdf", "ppt", "pptx", "xls", "xlsx", "bmp", "jpg", "gif", "png" });
    paramActivity.startActivityForResult(paramQQAppInterface, 84);
    AlbumUtil.a(paramActivity, false, true);
  }
  
  public void a()
  {
    if ((jdField_a_of_type_AndroidAppDialog != null) && (jdField_a_of_type_AndroidAppDialog.isShowing())) {}
    try
    {
      jdField_a_of_type_AndroidAppDialog.dismiss();
      return;
    }
    catch (Exception localException) {}
  }
  
  public void a(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo, List paramList)
  {
    int i1 = 0;
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "showActionSheet");
    }
    a();
    if (jdField_a_of_type_AndroidAppDialog != null) {}
    Object localObject;
    try
    {
      jdField_a_of_type_AndroidAppDialog.show();
      return;
    }
    catch (Exception paramQQAppInterface) {}
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    if ((paramList != null) && (paramList.size() > 0))
    {
      n = 0;
      while (n < paramList.size())
      {
        localObject = (HbThemeConfigManager.HBThemeConfig)paramList.get(n);
        if (!TextUtils.isEmpty(jdField_a_of_type_JavaLangString))
        {
          localArrayList1.add(new Pair(Integer.valueOf(k + n), jdField_a_of_type_JavaLangString));
          localArrayList2.add(localObject);
        }
        n += 1;
      }
    }
    int n = localArrayList2.size();
    if (n > 0)
    {
      l = n + k;
      m = l + 1;
      paramList = paramActivity.getResources().getString(2131371657);
      localObject = paramActivity.getResources().getString(2131371658);
      localArrayList1.add(new Pair(Integer.valueOf(l), paramList));
      localArrayList1.add(new Pair(Integer.valueOf(m), localObject));
    }
    paramList = ActionSheet.c(paramActivity);
    n = i1;
    if (n < localArrayList1.size())
    {
      if (m == ((Integer)getfirst).intValue()) {
        paramList.d((CharSequence)getsecond);
      }
      for (;;)
      {
        n += 1;
        break;
        paramList.c((CharSequence)getsecond);
      }
    }
    paramList.a(new krg(this, localArrayList1, paramQQAppInterface, paramActivity, paramSessionInfo, localArrayList2, paramList));
    paramList.a(new kqy(this));
    paramList.setCanceledOnTouchOutside(true);
    jdField_a_of_type_AndroidAppDialog = paramList;
    try
    {
      jdField_a_of_type_AndroidAppDialog.show();
      return;
    }
    catch (Exception paramQQAppInterface) {}
  }
  
  public void b(QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo, int paramInt)
  {
    List localList = a(paramQQAppInterface, paramActivity, paramSessionInfo);
    if ((localList != null) && (localList.size() > 0))
    {
      a(paramQQAppInterface, paramActivity, paramSessionInfo, localList);
      return;
    }
    a(paramQQAppInterface, paramActivity, paramSessionInfo, null, paramInt);
  }
}
