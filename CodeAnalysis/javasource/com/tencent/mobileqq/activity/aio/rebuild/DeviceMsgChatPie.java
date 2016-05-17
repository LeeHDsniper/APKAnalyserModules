package com.tencent.mobileqq.activity.aio.rebuild;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Message;
import android.os.Parcelable;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.dataline.activities.PrinterOptionActivity;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.datadef.ProductInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.file.DevAudioMsgProcessor;
import com.tencent.device.file.DeviceAVFileMsgObserver;
import com.tencent.device.msg.data.DevSingleStructMsgProcessor;
import com.tencent.device.msg.data.DeviceComnFileMsgProcessor;
import com.tencent.device.msg.data.DeviceMsgHandle;
import com.tencent.device.msg.data.MessageForDevPtt;
import com.tencent.device.utils.LightAppSettingInfo;
import com.tencent.device.utils.LightAppUtil;
import com.tencent.device.utils.SmartDeviceReport;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.panel.AIOPanelUtiles;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.emoticonview.EmoticonMainPanel;
import com.tencent.mobileqq.equipmentlock.EquipmentLockImpl;
import com.tencent.mobileqq.filemanager.data.FileInfo;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter.fileAssistantReportData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.pic.PicBusiManager;
import com.tencent.mobileqq.pic.PicPreDownloadUtils;
import com.tencent.mobileqq.pic.PicReq;
import com.tencent.mobileqq.ptt.PttBuffer;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.streamtransfile.StreamDataManager;
import com.tencent.mobileqq.utils.AlbumConstants;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.PerformanceReportUtils;
import com.tencent.mobileqq.utils.QQRecorder;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.utils.RecordParams;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.mobileqq.voicechange.VoiceTuneUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.widget.PatchedButton;
import com.tencent.widget.XEditTextEx;
import com.tencent.widget.XPanelContainer;
import cooperation.smartdevice.SmartDevicePluginLoader;
import cooperation.smartdevice.SmartDevicePluginProxyActivity;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import lgb;
import lgg;
import lgh;
import mqq.os.MqqHandler;
import org.json.JSONException;
import org.json.JSONObject;

public class DeviceMsgChatPie
  extends BaseChatPie
{
  public static boolean K = false;
  public static ConcurrentHashMap a;
  static final String af = "devicemsg_showsupporttips_first";
  static final String ag = "devicemsg_openchat_firsttrue";
  public static final String ah = "devicemsg_showvideotips_first";
  public static final String aj = "device_groupchat";
  private static final String ak = "lock_red_dot_show";
  private static final String al = "ota_showupdatereddot";
  public static final int dA = 8;
  public static final int dB = 9;
  public static final int dC = 10;
  public static final int dD = 11;
  static final int dG = 1;
  static final int dH = 2;
  static final int dI = 3;
  static int dJ = 100100;
  static int dK = 10;
  static int dL = 11;
  public static final int dt = 1;
  public static final int du = 2;
  public static final int dv = 3;
  public static final int dw = 4;
  public static final int dx = 5;
  public static final int dy = 6;
  public static final int dz = 7;
  boolean G = false;
  public volatile boolean H = false;
  boolean I = false;
  boolean J = false;
  boolean L = false;
  boolean M = false;
  private boolean N = false;
  BroadcastReceiver a;
  public Boolean a;
  final String ae = DeviceMsgChatPie.class.getSimpleName();
  public String ai = "";
  int dE = 0;
  int dF = 0;
  public int ds = 0;
  private ImageView g;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    K = false;
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap(20);
  }
  
  public DeviceMsgChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    jdField_a_of_type_JavaLangBoolean = Boolean.valueOf(false);
    jdField_a_of_type_AndroidContentBroadcastReceiver = new lgg(this);
  }
  
  public static void a(int paramInt, MessageRecord paramMessageRecord)
  {
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(Integer.valueOf(paramInt), paramMessageRecord);
  }
  
  public static boolean b(MessageRecord paramMessageRecord)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
    while (localIterator.hasNext()) {
      if (nextgetValueuniseq == uniseq) {
        return true;
      }
    }
    return false;
  }
  
  protected void A()
  {
    super.A();
    if ((dE == 3) || (dE == 4))
    {
      if (!L) {
        L = true;
      }
    }
    else {
      return;
    }
    super.v();
  }
  
  protected void B()
  {
    PerformanceReportUtils.a();
    AIOUtils.a(false);
    h = false;
    j = true;
    k = false;
    m = false;
    n = false;
    p = false;
    r = false;
    q = false;
    B = true;
    C = false;
    jdField_a_of_type_Boolean = true;
    jdField_b_of_type_Boolean = false;
    if (jdField_b_of_type_AndroidWidgetRelativeLayout != null)
    {
      jdField_b_of_type_AndroidWidgetRelativeLayout.removeAllViews();
      e = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
    }
    if (jdField_c_of_type_AndroidViewView != null)
    {
      jdField_c_of_type_AndroidViewView.setVisibility(4);
      jdField_c_of_type_AndroidViewView = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel != null)
    {
      jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel.c();
      jdField_a_of_type_ComTencentMobileqqEmoticonviewEmoticonMainPanel = null;
    }
    if (jdField_a_of_type_ComTencentWidgetXPanelContainer != null)
    {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
      jdField_a_of_type_ComTencentWidgetXPanelContainer.b();
    }
  }
  
  public QQRecorder.RecorderParam a()
  {
    Object localObject = ((SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51)).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    localObject = new LightAppUtil().a((DeviceInfo)localObject);
    if ((localObject != null) && (a.get(Integer.valueOf(11007)) != null)) {}
    try
    {
      String str = (String)a.get(Integer.valueOf(11007));
      localObject = str;
      if (TextUtils.isEmpty(str)) {
        localObject = "";
      }
      if (new JSONObject(((String)localObject).replace("&quot;", "\"")).optString("Audio", "").toLowerCase().equals("slk"))
      {
        localObject = new QQRecorder.RecorderParam(RecordParams.i, 16000, 1);
        return localObject;
      }
    }
    catch (JSONException localJSONException)
    {
      if (QLog.isColorLevel()) {
        QLog.d(ae, 2, "getString from json JSONException error:" + localJSONException.getMessage());
      }
      return new QQRecorder.RecorderParam(RecordParams.f, 0, 0);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d(ae, 2, "getString from json Exception error:" + localException.getMessage());
        }
      }
    }
  }
  
  public void a(int paramInt)
  {
    super.a(paramInt);
    jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessage(20);
  }
  
  /* Error */
  protected void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 10
    //   3: aconst_null
    //   4: astore 12
    //   6: aload_0
    //   7: iload_1
    //   8: iload_2
    //   9: aload_3
    //   10: invokespecial 422	com/tencent/mobileqq/activity/BaseChatPie:a	(IILandroid/content/Intent;)V
    //   13: bipush 84
    //   15: iload_1
    //   16: if_icmpne +124 -> 140
    //   19: aload_3
    //   20: ifnull +120 -> 140
    //   23: aload_3
    //   24: ldc_w 424
    //   27: invokevirtual 430	android/content/Intent:getParcelableArrayListExtra	(Ljava/lang/String;)Ljava/util/ArrayList;
    //   30: astore 9
    //   32: new 426	android/content/Intent
    //   35: dup
    //   36: aload_0
    //   37: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   40: ldc_w 435
    //   43: invokespecial 438	android/content/Intent:<init>	(Landroid/content/Context;Ljava/lang/Class;)V
    //   46: astore 10
    //   48: aload 10
    //   50: ldc_w 424
    //   53: aload 9
    //   55: invokevirtual 442	android/content/Intent:putParcelableArrayListExtra	(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;
    //   58: pop
    //   59: aload 10
    //   61: getstatic 446	com/tencent/mobileqq/utils/AlbumConstants:i	Ljava/lang/String;
    //   64: iload_1
    //   65: invokevirtual 450	android/content/Intent:putExtra	(Ljava/lang/String;I)Landroid/content/Intent;
    //   68: pop
    //   69: aload 10
    //   71: ldc_w 452
    //   74: iconst_1
    //   75: invokevirtual 455	android/content/Intent:putExtra	(Ljava/lang/String;Z)Landroid/content/Intent;
    //   78: pop
    //   79: aload_0
    //   80: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   83: aload 10
    //   85: bipush 102
    //   87: invokevirtual 461	android/support/v4/app/FragmentActivity:startActivityForResult	(Landroid/content/Intent;I)V
    //   90: iload_1
    //   91: tableswitch	default:+25->116, 81:+803->894, 82:+25->116, 83:+871->962
    //   116: aload_0
    //   117: getfield 126	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:dE	I
    //   120: iconst_4
    //   121: if_icmpne +18 -> 139
    //   124: iload_2
    //   125: iconst_m1
    //   126: if_icmpne +13 -> 139
    //   129: iload_1
    //   130: iconst_1
    //   131: if_icmpne +8 -> 139
    //   134: aload_0
    //   135: iconst_0
    //   136: putfield 136	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:L	Z
    //   139: return
    //   140: iload_1
    //   141: bipush 102
    //   143: if_icmpne +232 -> 375
    //   146: iload_2
    //   147: iconst_m1
    //   148: if_icmpne -58 -> 90
    //   151: aload_3
    //   152: ifnull -62 -> 90
    //   155: aload_0
    //   156: getfield 291	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   159: bipush 51
    //   161: invokevirtual 296	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   164: checkcast 298	com/tencent/device/devicemgr/SmartDeviceProxyMgr
    //   167: aload_0
    //   168: getfield 301	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   171: getfield 305	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   174: invokestatic 311	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   177: invokevirtual 464	com/tencent/device/devicemgr/SmartDeviceProxyMgr:g	(J)Z
    //   180: ifne +21 -> 201
    //   183: aload_0
    //   184: getfield 467	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   187: ldc_w 469
    //   190: sipush 2000
    //   193: invokestatic 474	com/tencent/mobileqq/widget/QQToast:a	(Landroid/content/Context;Ljava/lang/CharSequence;I)Lcom/tencent/mobileqq/widget/QQToast;
    //   196: invokevirtual 477	com/tencent/mobileqq/widget/QQToast:a	()Landroid/widget/Toast;
    //   199: pop
    //   200: return
    //   201: aload_3
    //   202: ldc_w 424
    //   205: invokevirtual 430	android/content/Intent:getParcelableArrayListExtra	(Ljava/lang/String;)Ljava/util/ArrayList;
    //   208: astore 10
    //   210: aload 10
    //   212: ifnull -122 -> 90
    //   215: aload 10
    //   217: invokevirtual 483	java/util/ArrayList:size	()I
    //   220: ifle -130 -> 90
    //   223: new 479	java/util/ArrayList
    //   226: dup
    //   227: invokespecial 484	java/util/ArrayList:<init>	()V
    //   230: astore 9
    //   232: aload 10
    //   234: invokevirtual 485	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   237: astore 10
    //   239: aload 10
    //   241: invokeinterface 180 1 0
    //   246: ifeq +25 -> 271
    //   249: aload 9
    //   251: aload 10
    //   253: invokeinterface 184 1 0
    //   258: checkcast 487	com/tencent/mobileqq/filemanager/data/FileInfo
    //   261: invokevirtual 489	com/tencent/mobileqq/filemanager/data/FileInfo:d	()Ljava/lang/String;
    //   264: invokevirtual 492	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   267: pop
    //   268: goto -29 -> 239
    //   271: aload_3
    //   272: ldc_w 494
    //   275: invokevirtual 498	android/content/Intent:getStringExtra	(Ljava/lang/String;)Ljava/lang/String;
    //   278: astore 10
    //   280: aload_0
    //   281: getfield 467	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   284: invokestatic 503	com/tencent/mobileqq/utils/NetworkUtil:b	(Landroid/content/Context;)Z
    //   287: ifne +77 -> 364
    //   290: aload_0
    //   291: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   294: sipush 230
    //   297: aload_0
    //   298: getfield 467	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   301: ldc_w 504
    //   304: invokevirtual 510	android/content/Context:getString	(I)Ljava/lang/String;
    //   307: aload_0
    //   308: getfield 467	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   311: ldc_w 511
    //   314: invokevirtual 510	android/content/Context:getString	(I)Ljava/lang/String;
    //   317: ldc_w 513
    //   320: ldc_w 515
    //   323: new 517	lgc
    //   326: dup
    //   327: aload_0
    //   328: aload 9
    //   330: aload 10
    //   332: invokespecial 520	lgc:<init>	(Lcom/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie;Ljava/util/ArrayList;Ljava/lang/String;)V
    //   335: new 522	lgd
    //   338: dup
    //   339: aload_0
    //   340: invokespecial 523	lgd:<init>	(Lcom/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie;)V
    //   343: invokestatic 528	com/tencent/mobileqq/utils/DialogUtil:a	(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Lcom/tencent/mobileqq/utils/QQCustomDialog;
    //   346: astore 9
    //   348: aload 9
    //   350: invokevirtual 533	com/tencent/mobileqq/utils/QQCustomDialog:isShowing	()Z
    //   353: ifne -263 -> 90
    //   356: aload 9
    //   358: invokevirtual 536	com/tencent/mobileqq/utils/QQCustomDialog:show	()V
    //   361: goto -271 -> 90
    //   364: aload_0
    //   365: aload 9
    //   367: aload 10
    //   369: invokevirtual 539	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:a	(Ljava/util/ArrayList;Ljava/lang/String;)V
    //   372: goto -282 -> 90
    //   375: bipush 81
    //   377: iload_1
    //   378: if_icmpeq +9 -> 387
    //   381: bipush 83
    //   383: iload_1
    //   384: if_icmpne +430 -> 814
    //   387: aload_0
    //   388: getfield 291	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   391: bipush 51
    //   393: invokevirtual 296	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   396: checkcast 298	com/tencent/device/devicemgr/SmartDeviceProxyMgr
    //   399: astore 11
    //   401: aload 11
    //   403: aload_0
    //   404: getfield 301	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   407: getfield 305	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   410: invokestatic 311	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   413: invokevirtual 314	com/tencent/device/devicemgr/SmartDeviceProxyMgr:a	(J)Lcom/tencent/device/datadef/DeviceInfo;
    //   416: astore 9
    //   418: aload 9
    //   420: ifnull +821 -> 1241
    //   423: aload 11
    //   425: aload 9
    //   427: getfield 544	com/tencent/device/datadef/DeviceInfo:productId	I
    //   430: invokevirtual 547	com/tencent/device/devicemgr/SmartDeviceProxyMgr:a	(I)Lcom/tencent/device/datadef/ProductInfo;
    //   433: astore 11
    //   435: aload 11
    //   437: ifnull +804 -> 1241
    //   440: aload 11
    //   442: iconst_2
    //   443: invokevirtual 552	com/tencent/device/datadef/ProductInfo:isSupportFuncMsgType	(I)Z
    //   446: ifeq +795 -> 1241
    //   449: iconst_1
    //   450: istore 4
    //   452: lconst_0
    //   453: lstore 6
    //   455: aload 9
    //   457: ifnull +778 -> 1235
    //   460: aload 9
    //   462: getfield 555	com/tencent/device/datadef/DeviceInfo:din	J
    //   465: lstore 6
    //   467: aload 9
    //   469: getfield 544	com/tencent/device/datadef/DeviceInfo:productId	I
    //   472: istore 5
    //   474: iload 4
    //   476: ifne +34 -> 510
    //   479: aload_0
    //   480: getfield 291	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   483: bipush 49
    //   485: invokevirtual 296	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   488: checkcast 557	com/tencent/device/msg/data/DeviceMsgHandle
    //   491: astore_3
    //   492: aload_0
    //   493: getfield 291	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   496: lload 6
    //   498: ldc_w 559
    //   501: bipush 7
    //   503: iconst_0
    //   504: iload 5
    //   506: invokestatic 564	com/tencent/device/utils/SmartDeviceReport:a	(Lmqq/app/AppRuntime;JLjava/lang/String;III)V
    //   509: return
    //   510: aload_0
    //   511: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   514: aload_0
    //   515: getfield 301	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   518: getfield 305	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   521: aconst_null
    //   522: ldc 19
    //   524: iconst_1
    //   525: invokestatic 570	com/tencent/mobileqq/msf/sdk/SettingCloneUtil:readValue	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    //   528: istore 8
    //   530: getstatic 81	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:K	Z
    //   533: ifeq +57 -> 590
    //   536: iload 8
    //   538: ifeq +52 -> 590
    //   541: aload_0
    //   542: getfield 291	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   545: bipush 49
    //   547: invokevirtual 296	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   550: checkcast 557	com/tencent/device/msg/data/DeviceMsgHandle
    //   553: aload_0
    //   554: getfield 301	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   557: getfield 305	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   560: ldc_w 572
    //   563: invokestatic 577	com/tencent/mobileqq/service/message/MessageCache:a	()J
    //   566: iconst_1
    //   567: iconst_0
    //   568: iconst_1
    //   569: invokevirtual 580	com/tencent/device/msg/data/DeviceMsgHandle:a	(Ljava/lang/String;Ljava/lang/String;JZZZ)V
    //   572: aload_0
    //   573: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   576: aload_0
    //   577: getfield 301	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   580: getfield 305	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   583: aconst_null
    //   584: ldc 19
    //   586: iconst_0
    //   587: invokestatic 584	com/tencent/mobileqq/msf/sdk/SettingCloneUtil:writeValue	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    //   590: getstatic 589	android/os/Build$VERSION:SDK_INT	I
    //   593: bipush 10
    //   595: if_icmpgt -505 -> 90
    //   598: aload_0
    //   599: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   602: invokevirtual 593	android/support/v4/app/FragmentActivity:getContentResolver	()Landroid/content/ContentResolver;
    //   605: aload_3
    //   606: invokevirtual 597	android/content/Intent:getData	()Landroid/net/Uri;
    //   609: ldc_w 598
    //   612: invokevirtual 604	android/content/ContentResolver:openAssetFileDescriptor	(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    //   615: astore 9
    //   617: aload 9
    //   619: ifnull +135 -> 754
    //   622: aload 9
    //   624: invokevirtual 610	android/content/res/AssetFileDescriptor:createInputStream	()Ljava/io/FileInputStream;
    //   627: astore 9
    //   629: new 612	java/io/FileOutputStream
    //   632: dup
    //   633: new 614	java/io/File
    //   636: dup
    //   637: aload_0
    //   638: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   641: invokevirtual 618	android/support/v4/app/FragmentActivity:getApplicationContext	()Landroid/content/Context;
    //   644: invokestatic 624	android/preference/PreferenceManager:getDefaultSharedPreferences	(Landroid/content/Context;)Landroid/content/SharedPreferences;
    //   647: ldc_w 626
    //   650: ldc 114
    //   652: invokeinterface 630 3 0
    //   657: invokespecial 631	java/io/File:<init>	(Ljava/lang/String;)V
    //   660: invokespecial 634	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   663: astore 11
    //   665: sipush 1024
    //   668: newarray byte
    //   670: astore 13
    //   672: aload 9
    //   674: aload 13
    //   676: invokevirtual 640	java/io/FileInputStream:read	([B)I
    //   679: istore 4
    //   681: aload 11
    //   683: astore 12
    //   685: aload 9
    //   687: astore 10
    //   689: iload 4
    //   691: ifle +69 -> 760
    //   694: aload 11
    //   696: aload 13
    //   698: iconst_0
    //   699: iload 4
    //   701: invokevirtual 644	java/io/FileOutputStream:write	([BII)V
    //   704: goto -32 -> 672
    //   707: astore 12
    //   709: aload 9
    //   711: astore 10
    //   713: aload 11
    //   715: astore 9
    //   717: aload 12
    //   719: astore 11
    //   721: aload 11
    //   723: invokevirtual 647	java/lang/Exception:printStackTrace	()V
    //   726: aload 10
    //   728: ifnull +8 -> 736
    //   731: aload 10
    //   733: invokevirtual 650	java/io/FileInputStream:close	()V
    //   736: aload 9
    //   738: ifnull -648 -> 90
    //   741: aload 9
    //   743: invokevirtual 651	java/io/FileOutputStream:close	()V
    //   746: goto -656 -> 90
    //   749: astore 9
    //   751: goto -661 -> 90
    //   754: aconst_null
    //   755: astore 12
    //   757: aconst_null
    //   758: astore 10
    //   760: aload 10
    //   762: ifnull +8 -> 770
    //   765: aload 10
    //   767: invokevirtual 650	java/io/FileInputStream:close	()V
    //   770: aload 12
    //   772: ifnull -682 -> 90
    //   775: aload 12
    //   777: invokevirtual 651	java/io/FileOutputStream:close	()V
    //   780: goto -690 -> 90
    //   783: astore 9
    //   785: goto -695 -> 90
    //   788: astore_3
    //   789: aconst_null
    //   790: astore 9
    //   792: aload 9
    //   794: ifnull +8 -> 802
    //   797: aload 9
    //   799: invokevirtual 650	java/io/FileInputStream:close	()V
    //   802: aload 10
    //   804: ifnull +8 -> 812
    //   807: aload 10
    //   809: invokevirtual 651	java/io/FileOutputStream:close	()V
    //   812: aload_3
    //   813: athrow
    //   814: iload_1
    //   815: getstatic 92	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:dJ	I
    //   818: if_icmpne -728 -> 90
    //   821: iload_2
    //   822: getstatic 94	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:dK	I
    //   825: if_icmpne +54 -> 879
    //   828: aload_0
    //   829: invokevirtual 652	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:v	()V
    //   832: aload_0
    //   833: getfield 291	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   836: bipush 51
    //   838: invokevirtual 296	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   841: checkcast 298	com/tencent/device/devicemgr/SmartDeviceProxyMgr
    //   844: aload_0
    //   845: getfield 301	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   848: getfield 305	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   851: invokestatic 311	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   854: invokevirtual 314	com/tencent/device/devicemgr/SmartDeviceProxyMgr:a	(J)Lcom/tencent/device/datadef/DeviceInfo;
    //   857: invokestatic 657	com/tencent/device/utils/SmartDeviceUtil:a	(Lcom/tencent/device/datadef/DeviceInfo;)Ljava/lang/String;
    //   860: astore 9
    //   862: aload 9
    //   864: ifnull -774 -> 90
    //   867: aload_0
    //   868: getfield 659	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_b_of_type_AndroidWidgetTextView	Landroid/widget/TextView;
    //   871: aload 9
    //   873: invokevirtual 665	android/widget/TextView:setText	(Ljava/lang/CharSequence;)V
    //   876: goto -786 -> 90
    //   879: iload_2
    //   880: getstatic 96	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:dL	I
    //   883: if_icmpne -51 -> 832
    //   886: aload_0
    //   887: iconst_1
    //   888: putfield 140	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:N	Z
    //   891: goto -59 -> 832
    //   894: iload_2
    //   895: iconst_m1
    //   896: if_icmpne -780 -> 116
    //   899: aload_3
    //   900: ifnull -784 -> 116
    //   903: aload_3
    //   904: ldc_w 667
    //   907: invokevirtual 430	android/content/Intent:getParcelableArrayListExtra	(Ljava/lang/String;)Ljava/util/ArrayList;
    //   910: astore_3
    //   911: aload_3
    //   912: ifnull -796 -> 116
    //   915: aload_3
    //   916: invokevirtual 483	java/util/ArrayList:size	()I
    //   919: ifle -803 -> 116
    //   922: aload_0
    //   923: aload_3
    //   924: iconst_0
    //   925: invokevirtual 670	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   928: checkcast 672	com/dataline/util/file/SendInfo
    //   931: invokevirtual 674	com/dataline/util/file/SendInfo:a	()Ljava/lang/String;
    //   934: putfield 116	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ai	Ljava/lang/String;
    //   937: aload_0
    //   938: getfield 291	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   941: aload_0
    //   942: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   945: aload_0
    //   946: getfield 301	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   949: getfield 305	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   952: aload_0
    //   953: getfield 116	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ai	Ljava/lang/String;
    //   956: invokestatic 679	com/tencent/device/file/DevVideoMsgProcessor:a	(Lcom/tencent/mobileqq/app/QQAppInterface;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    //   959: goto -843 -> 116
    //   962: aload_0
    //   963: aload_0
    //   964: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   967: invokevirtual 618	android/support/v4/app/FragmentActivity:getApplicationContext	()Landroid/content/Context;
    //   970: invokestatic 624	android/preference/PreferenceManager:getDefaultSharedPreferences	(Landroid/content/Context;)Landroid/content/SharedPreferences;
    //   973: ldc_w 626
    //   976: ldc 114
    //   978: invokeinterface 630 3 0
    //   983: putfield 116	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ai	Ljava/lang/String;
    //   986: aload_0
    //   987: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   990: invokevirtual 618	android/support/v4/app/FragmentActivity:getApplicationContext	()Landroid/content/Context;
    //   993: invokestatic 624	android/preference/PreferenceManager:getDefaultSharedPreferences	(Landroid/content/Context;)Landroid/content/SharedPreferences;
    //   996: invokeinterface 683 1 0
    //   1001: ldc_w 626
    //   1004: invokeinterface 689 2 0
    //   1009: invokeinterface 692 1 0
    //   1014: pop
    //   1015: iload_2
    //   1016: iconst_m1
    //   1017: if_icmpne +130 -> 1147
    //   1020: aload_0
    //   1021: getfield 116	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ai	Ljava/lang/String;
    //   1024: invokestatic 340	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   1027: ifne -911 -> 116
    //   1030: aload_0
    //   1031: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   1034: sipush 230
    //   1037: invokestatic 695	com/tencent/mobileqq/utils/DialogUtil:a	(Landroid/content/Context;I)Lcom/tencent/mobileqq/utils/QQCustomDialog;
    //   1040: astore_3
    //   1041: aload_3
    //   1042: ldc_w 696
    //   1045: new 698	lge
    //   1048: dup
    //   1049: aload_0
    //   1050: invokespecial 699	lge:<init>	(Lcom/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie;)V
    //   1053: invokevirtual 703	com/tencent/mobileqq/utils/QQCustomDialog:setNegativeButton	(ILandroid/content/DialogInterface$OnClickListener;)Lcom/tencent/mobileqq/utils/QQCustomDialog;
    //   1056: pop
    //   1057: aload_3
    //   1058: ldc_w 704
    //   1061: new 706	lgf
    //   1064: dup
    //   1065: aload_0
    //   1066: invokespecial 707	lgf:<init>	(Lcom/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie;)V
    //   1069: invokevirtual 710	com/tencent/mobileqq/utils/QQCustomDialog:setPositiveButton	(ILandroid/content/DialogInterface$OnClickListener;)Lcom/tencent/mobileqq/utils/QQCustomDialog;
    //   1072: pop
    //   1073: aload_3
    //   1074: ldc_w 712
    //   1077: invokevirtual 716	com/tencent/mobileqq/utils/QQCustomDialog:setTitle	(Ljava/lang/String;)Lcom/tencent/mobileqq/utils/QQCustomDialog;
    //   1080: pop
    //   1081: new 614	java/io/File
    //   1084: dup
    //   1085: aload_0
    //   1086: getfield 116	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ai	Ljava/lang/String;
    //   1089: invokespecial 631	java/io/File:<init>	(Ljava/lang/String;)V
    //   1092: astore 9
    //   1094: aload_0
    //   1095: getfield 433	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_AndroidSupportV4AppFragmentActivity	Landroid/support/v4/app/FragmentActivity;
    //   1098: aload 9
    //   1100: invokevirtual 719	java/io/File:length	()J
    //   1103: invokestatic 724	com/tencent/mobileqq/shortvideo/ShortVideoUtils:a	(Landroid/content/Context;J)Ljava/lang/String;
    //   1106: astore 9
    //   1108: aload_3
    //   1109: new 385	java/lang/StringBuilder
    //   1112: dup
    //   1113: invokespecial 386	java/lang/StringBuilder:<init>	()V
    //   1116: ldc_w 726
    //   1119: invokevirtual 392	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1122: aload 9
    //   1124: invokevirtual 392	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1127: ldc_w 728
    //   1130: invokevirtual 392	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1133: invokevirtual 398	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1136: invokevirtual 732	com/tencent/mobileqq/utils/QQCustomDialog:setMessage	(Ljava/lang/CharSequence;)Lcom/tencent/mobileqq/utils/QQCustomDialog;
    //   1139: pop
    //   1140: aload_3
    //   1141: invokevirtual 536	com/tencent/mobileqq/utils/QQCustomDialog:show	()V
    //   1144: goto -1028 -> 116
    //   1147: aload_0
    //   1148: getfield 116	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ai	Ljava/lang/String;
    //   1151: invokestatic 340	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   1154: ifne +11 -> 1165
    //   1157: aload_0
    //   1158: getfield 116	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ai	Ljava/lang/String;
    //   1161: invokestatic 737	com/tencent/mobileqq/utils/FileUtils:d	(Ljava/lang/String;)Z
    //   1164: pop
    //   1165: aload_0
    //   1166: ldc 114
    //   1168: putfield 116	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ai	Ljava/lang/String;
    //   1171: goto -1055 -> 116
    //   1174: astore 9
    //   1176: goto -364 -> 812
    //   1179: astore_3
    //   1180: goto -388 -> 792
    //   1183: astore_3
    //   1184: aload 11
    //   1186: astore 10
    //   1188: goto -396 -> 792
    //   1191: astore_3
    //   1192: aload 9
    //   1194: astore 11
    //   1196: aload 10
    //   1198: astore 9
    //   1200: aload 11
    //   1202: astore 10
    //   1204: goto -412 -> 792
    //   1207: astore 11
    //   1209: aconst_null
    //   1210: astore 9
    //   1212: aload 12
    //   1214: astore 10
    //   1216: goto -495 -> 721
    //   1219: astore 11
    //   1221: aconst_null
    //   1222: astore 12
    //   1224: aload 9
    //   1226: astore 10
    //   1228: aload 12
    //   1230: astore 9
    //   1232: goto -511 -> 721
    //   1235: iconst_0
    //   1236: istore 5
    //   1238: goto -764 -> 474
    //   1241: iconst_0
    //   1242: istore 4
    //   1244: goto -792 -> 452
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1247	0	this	DeviceMsgChatPie
    //   0	1247	1	paramInt1	int
    //   0	1247	2	paramInt2	int
    //   0	1247	3	paramIntent	Intent
    //   450	793	4	i	int
    //   472	765	5	j	int
    //   453	44	6	l	long
    //   528	9	8	bool	boolean
    //   30	712	9	localObject1	Object
    //   749	1	9	localException1	Exception
    //   783	1	9	localException2	Exception
    //   790	333	9	localObject2	Object
    //   1174	19	9	localException3	Exception
    //   1198	33	9	localObject3	Object
    //   1	1226	10	localObject4	Object
    //   399	802	11	localObject5	Object
    //   1207	1	11	localException4	Exception
    //   1219	1	11	localException5	Exception
    //   4	680	12	localObject6	Object
    //   707	11	12	localException6	Exception
    //   755	474	12	localObject7	Object
    //   670	27	13	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   665	672	707	java/lang/Exception
    //   672	681	707	java/lang/Exception
    //   694	704	707	java/lang/Exception
    //   731	736	749	java/lang/Exception
    //   741	746	749	java/lang/Exception
    //   765	770	783	java/lang/Exception
    //   775	780	783	java/lang/Exception
    //   598	617	788	finally
    //   622	629	788	finally
    //   797	802	1174	java/lang/Exception
    //   807	812	1174	java/lang/Exception
    //   629	665	1179	finally
    //   665	672	1183	finally
    //   672	681	1183	finally
    //   694	704	1183	finally
    //   721	726	1191	finally
    //   598	617	1207	java/lang/Exception
    //   622	629	1207	java/lang/Exception
    //   629	665	1219	java/lang/Exception
  }
  
  public void a(Object paramObject)
  {
    if ((paramObject == null) || (!(paramObject instanceof Integer))) {
      return;
    }
    int i = ((Integer)paramObject).intValue();
    if (QLog.isColorLevel()) {
      QLog.d("XPanel", 2, "onPanelIconClick panelID=" + i + "currentID=" + jdField_a_of_type_ComTencentWidgetXPanelContainer.a());
    }
    if (i == jdField_a_of_type_ComTencentWidgetXPanelContainer.a())
    {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
      return;
    }
    switch (i)
    {
    }
    do
    {
      for (;;)
      {
        super.a(paramObject);
        return;
        jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
        AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
        continue;
        jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
        if (n())
        {
          o(2);
          continue;
          AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "0X800407C", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
          Object localObject = new FileManagerReporter.fileAssistantReportData();
          b = "send_file";
          jdField_a_of_type_Int = 1;
          FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), (FileManagerReporter.fileAssistantReportData)localObject);
          localObject = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
          long l = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
          if ((localObject != null) && (((SmartDeviceProxyMgr)localObject).d(l)) && (((SmartDeviceProxyMgr)localObject).a(l, 17))) {
            PlusPanelUtils.d(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
          } else {
            PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
          }
        }
      }
    } while (!M);
    PlusPanelUtils.a(super.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, null, null);
  }
  
  public void a(String paramString)
  {
    if (G) {
      super.a(paramString);
    }
  }
  
  protected void a(String paramString, long paramLong, int paramInt1, int paramInt2, QQRecorder.RecorderParam paramRecorderParam, int paramInt3, boolean paramBoolean)
  {
    if (!G) {
      return;
    }
    if (jdField_a_of_type_JavaLangObject == null)
    {
      paramInt1 = 1;
      if (paramInt1 != 0) {
        break label289;
      }
      StreamDataManager.a(paramString, false);
      StreamDataManager.a(paramString);
      label33:
      if (new File(paramString).exists()) {
        break label509;
      }
      paramInt1 = 0;
      paramRecorderParam = paramString;
      label53:
      if (paramInt1 < 6)
      {
        paramRecorderParam = VoiceTuneUtil.a(paramString, paramInt1);
        if (!new File(paramRecorderParam).exists()) {
          break label297;
        }
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("AIOAudioPanel", 2, "sendPttInner(),recordingUniseq is:" + paramLong + ",path is:" + paramRecorderParam);
      }
      SmartDeviceProxyMgr localSmartDeviceProxyMgr = null;
      paramString = localSmartDeviceProxyMgr;
      if (!TextUtils.isEmpty(paramRecorderParam))
      {
        paramString = localSmartDeviceProxyMgr;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo != null) {
          if (paramLong == 0L) {
            break label306;
          }
        }
      }
      label289:
      label297:
      label306:
      for (paramString = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, paramLong);; paramString = DevAudioMsgProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramRecorderParam, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, -2L))
      {
        if (paramString == null) {
          break label341;
        }
        super.a(0, paramRecorderParam, uniseq);
        if ((!K) || (!J)) {
          break label456;
        }
        if ((NetworkUtil.e(BaseApplication.getContext())) || (!(paramString instanceof MessageForDevPtt))) {
          break label343;
        }
        paramString = (MessageForDevPtt)paramString;
        fileSize = -1L;
        extraflag = 32768;
        extStr = "device_groupchat";
        paramString.serial();
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, uniseq, msgData);
        return;
        paramInt1 = 0;
        break;
        PttBuffer.b(paramString);
        break label33;
        paramInt1 += 1;
        break label53;
      }
      label341:
      break;
      label343:
      localSmartDeviceProxyMgr = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
      paramInt1 = localSmartDeviceProxyMgr.a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), paramRecorderParam, QQRecorder.a(paramInt2));
      if ((paramString instanceof MessageForDevPtt)) {
        voiceLength = QQRecorder.a(paramInt2);
      }
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(Integer.valueOf(paramInt1), paramString);
      paramString = localSmartDeviceProxyMgr.a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
      if (paramString == null) {
        break;
      }
      SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, din, "Usr_AIO_SendGroupMsg", 1, 0, productId);
      return;
      label456:
      ((DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(DeviceMsgHandle.f, paramRecorderParam, Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString), uniseq, istroop, QQRecorder.a(paramInt2));
      paramLong = uniseq;
      return;
      label509:
      paramRecorderParam = paramString;
    }
  }
  
  public void a(String paramString, boolean paramBoolean, QQRecorder.RecorderParam paramRecorderParam)
  {
    Object localObject2 = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    Object localObject1 = ((SmartDeviceProxyMgr)localObject2).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    if (localObject1 != null)
    {
      localObject2 = ((SmartDeviceProxyMgr)localObject2).a(productId);
      if ((localObject2 == null) || (!((ProductInfo)localObject2).isSupportMainMsgType(2))) {}
    }
    for (boolean bool = true;; bool = false)
    {
      long l = 0L;
      int i = 0;
      if (localObject1 != null)
      {
        l = din;
        i = productId;
      }
      SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l, "Usr_AIO_SendMsg", 1, 0, i);
      G = bool;
      if (!bool)
      {
        paramString = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
        SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l, "Usr_AIO_SendMsg", 7, 0, i);
        return;
      }
      if (QLog.isColorLevel()) {
        QLog.d(ae, 2, "onRecorderPerpare path = " + paramString);
      }
      localObject1 = RecordParams.a(c, jdField_a_of_type_Int);
      if (jdField_a_of_type_JavaLangObject == null)
      {
        i = 1;
        label205:
        if (i != 0) {
          break label276;
        }
        StreamDataManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, c, paramString, 0, (int)(System.currentTimeMillis() / 1000L));
        StreamDataManager.a(paramString, (byte[])localObject1, localObject1.length, (short)0);
        label243:
        if (paramString == null) {
          break label292;
        }
        if (paramBoolean) {
          break label294;
        }
        jdField_c_of_type_Long = 0L;
        g(2131165197);
      }
      for (;;)
      {
        a(true, false);
        return;
        i = 0;
        break label205;
        label276:
        PttBuffer.a(paramString);
        PttBuffer.a(paramString, (byte[])localObject1, localObject1.length);
        break label243;
        label292:
        break;
        label294:
        paramString = DevAudioMsgProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b, -2L);
        if (i == 0) {
          paramString.setPttStreamFlag(10001);
        }
        if (paramString != null) {
          jdField_c_of_type_Long = uniseq;
        }
        g(2131165188);
      }
    }
  }
  
  /* Error */
  public void a(ArrayList paramArrayList, String paramString)
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore 6
    //   3: new 342	org/json/JSONObject
    //   6: dup
    //   7: aload_2
    //   8: invokespecial 353	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   11: astore_2
    //   12: aload_2
    //   13: ldc_w 963
    //   16: iconst_1
    //   17: invokevirtual 967	org/json/JSONObject:optInt	(Ljava/lang/String;I)I
    //   20: istore_3
    //   21: aload_2
    //   22: ldc_w 969
    //   25: iconst_1
    //   26: invokevirtual 967	org/json/JSONObject:optInt	(Ljava/lang/String;I)I
    //   29: istore 5
    //   31: aload_0
    //   32: getfield 291	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   35: bipush 49
    //   37: invokevirtual 296	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   40: checkcast 557	com/tencent/device/msg/data/DeviceMsgHandle
    //   43: invokevirtual 972	com/tencent/device/msg/data/DeviceMsgHandle:a	()Lcom/tencent/device/msg/data/DeviceComnFileMsgProcessor;
    //   46: getstatic 974	com/tencent/device/msg/data/DeviceMsgHandle:c	Ljava/lang/String;
    //   49: aload_0
    //   50: getfield 301	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo	Lcom/tencent/mobileqq/activity/aio/SessionInfo;
    //   53: getfield 305	com/tencent/mobileqq/activity/aio/SessionInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   56: aload_1
    //   57: iload_3
    //   58: iload 5
    //   60: invokevirtual 979	com/tencent/device/msg/data/DeviceComnFileMsgProcessor:a	(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;II)V
    //   63: return
    //   64: astore_2
    //   65: iconst_1
    //   66: istore 4
    //   68: iload 4
    //   70: istore_3
    //   71: iload 6
    //   73: istore 5
    //   75: invokestatic 383	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   78: ifeq -47 -> 31
    //   81: aload_0
    //   82: getfield 108	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ae	Ljava/lang/String;
    //   85: iconst_2
    //   86: new 385	java/lang/StringBuilder
    //   89: dup
    //   90: invokespecial 386	java/lang/StringBuilder:<init>	()V
    //   93: ldc_w 388
    //   96: invokevirtual 392	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   99: aload_2
    //   100: invokevirtual 395	org/json/JSONException:getMessage	()Ljava/lang/String;
    //   103: invokevirtual 392	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   106: invokevirtual 398	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   109: invokestatic 402	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   112: iload 4
    //   114: istore_3
    //   115: iload 6
    //   117: istore 5
    //   119: goto -88 -> 31
    //   122: astore_2
    //   123: iconst_1
    //   124: istore 4
    //   126: iload 4
    //   128: istore_3
    //   129: iload 6
    //   131: istore 5
    //   133: invokestatic 383	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   136: ifeq -105 -> 31
    //   139: aload_0
    //   140: getfield 108	com/tencent/mobileqq/activity/aio/rebuild/DeviceMsgChatPie:ae	Ljava/lang/String;
    //   143: iconst_2
    //   144: new 385	java/lang/StringBuilder
    //   147: dup
    //   148: invokespecial 386	java/lang/StringBuilder:<init>	()V
    //   151: ldc_w 407
    //   154: invokevirtual 392	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   157: aload_2
    //   158: invokevirtual 408	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   161: invokevirtual 392	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   164: invokevirtual 398	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   167: invokestatic 402	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   170: iload 4
    //   172: istore_3
    //   173: iload 6
    //   175: istore 5
    //   177: goto -146 -> 31
    //   180: astore_2
    //   181: iload_3
    //   182: istore 4
    //   184: goto -58 -> 126
    //   187: astore_2
    //   188: iload_3
    //   189: istore 4
    //   191: goto -123 -> 68
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	194	0	this	DeviceMsgChatPie
    //   0	194	1	paramArrayList	ArrayList
    //   0	194	2	paramString	String
    //   20	169	3	i	int
    //   66	124	4	j	int
    //   29	147	5	k	int
    //   1	173	6	m	int
    // Exception table:
    //   from	to	target	type
    //   3	21	64	org/json/JSONException
    //   3	21	122	java/lang/Exception
    //   21	31	180	java/lang/Exception
    //   21	31	187	org/json/JSONException
  }
  
  protected boolean a(boolean paramBoolean)
  {
    C = false;
    at();
    super.a(paramBoolean);
    if (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing())
    {
      localObject1 = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
      ((DeviceMsgHandle)localObject1).a().a();
      ((DeviceMsgHandle)localObject1).a().a();
      jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllEnable(false);
      if (VersionUtils.e()) {
        jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllAlpha(0.6F);
      }
      ar();
      localObject1 = new IntentFilter();
      ((IntentFilter)localObject1).addAction("SmartDevice_DeviceUnBindRst");
      ((IntentFilter)localObject1).addAction("SmartDevice_ProductFetchRst");
      ((IntentFilter)localObject1).addAction("SmartDevice_receiveVasFlagResult");
      ((IntentFilter)localObject1).addAction("SmartDevice_OnDataPointFileMsgProgress");
      ((IntentFilter)localObject1).addAction("SmartDevice_OnDataPointFileMsgSendRet");
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, (IntentFilter)localObject1);
      H = true;
      localObject1 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getExtras();
      if (localObject1 != null)
      {
        jdField_a_of_type_JavaLangBoolean = Boolean.valueOf(((Bundle)localObject1).getBoolean("bFromLightApp", false));
        dE = ((Bundle)localObject1).getInt("operType", 0);
        dF = ((Bundle)localObject1).getInt("jumpTab", 0);
      }
      localObject1 = (ImageView)d.findViewById(2131297324);
      if (localObject1 == null) {
        break label984;
      }
      ((ImageView)localObject1).setImageResource(2130838308);
    }
    label387:
    label979:
    label982:
    label984:
    for (Object localObject1 = (RelativeLayout)((ImageView)localObject1).getParent();; localObject1 = null)
    {
      Object localObject2 = (ImageView)d.findViewById(2131297337);
      if (localObject2 != null)
      {
        ((ImageView)localObject2).setVisibility(0);
        ((ImageView)localObject2).setImageResource(2130838307);
        ((ImageView)localObject2).setOnClickListener(new lgb(this));
      }
      long l = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      localObject2 = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
      if ((((SmartDeviceProxyMgr)localObject2).d(l)) && (((SmartDeviceProxyMgr)localObject2).a(l, 17)))
      {
        paramBoolean = true;
        M = paramBoolean;
        if ((!M) || (((SmartDeviceProxyMgr)localObject2).g(l))) {
          break label387;
        }
        QQToast.a(jdField_a_of_type_AndroidContentContext, "打印机离线，无法打印", 2000).a();
      }
      for (;;)
      {
        return true;
        paramBoolean = false;
        break;
        Object localObject3;
        if ((dE == 1) || (dE == 3) || (dE == 9)) {
          if ((PanelIconLinearLayout)d.findViewById(2131297341) != null)
          {
            a(Integer.valueOf(4));
            paramBoolean = BaseApplication.getContext().getSharedPreferences("qsmart_preference", 0).getBoolean("ota_showupdatereddot", true);
            localObject3 = BaseApplication.getContext().getSharedPreferences("lock_red_dot_show", 0);
            if ((EquipmentLockImpl.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplicationImpl.a()) == 0) || (((SharedPreferences)localObject3).getBoolean(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "_" + "lock_red_dot_show" + "_" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), false))) {
              break label979;
            }
          }
        }
        for (int i = 1;; i = 0)
        {
          if (((!paramBoolean) || (!((SmartDeviceProxyMgr)localObject2).f(l))) && (i == 0)) {
            break label982;
          }
          g = new ImageView(jdField_a_of_type_AndroidContentContext);
          localObject2 = new RelativeLayout.LayoutParams(-2, -2);
          ((RelativeLayout.LayoutParams)localObject2).addRule(6, 2131297324);
          ((RelativeLayout.LayoutParams)localObject2).addRule(7, 2131297324);
          if (localObject1 != null)
          {
            ((RelativeLayout)localObject1).addView(g, (ViewGroup.LayoutParams)localObject2);
            g.setImageResource(2130842772);
          }
          g.setVisibility(0);
          return true;
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d(ae, 2, "DeviceMsgChatPie, OPER_TYPE_SEND_PICTURE[" + dE + "], find view panelicons failed!!");
          break;
          if ((dE == 2) || (dE == 4))
          {
            if ((PanelIconLinearLayout)d.findViewById(2131297341) != null)
            {
              a(Integer.valueOf(5));
              break;
            }
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.d(ae, 2, "DeviceMsgChatPie, OPER_TYPE_SEND_PICTURE[" + dE + "], find view panelicons failed!!");
            break;
          }
          if (dE == 5) {
            break;
          }
          if (dE == 6)
          {
            AIOPanelUtiles.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
            break;
          }
          if (dE == 7)
          {
            localObject3 = new FileManagerReporter.fileAssistantReportData();
            b = "send_file";
            jdField_a_of_type_Int = 1;
            FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), (FileManagerReporter.fileAssistantReportData)localObject3);
            PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, dF);
            break;
          }
          if (dE == 8)
          {
            jdField_a_of_type_ComTencentWidgetXPanelContainer.a(2);
            break;
          }
          if (dE == 10)
          {
            localObject3 = new FileManagerReporter.fileAssistantReportData();
            b = "send_file";
            jdField_a_of_type_Int = 1;
            FileManagerReporter.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), (FileManagerReporter.fileAssistantReportData)localObject3);
            PlusPanelUtils.d(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
            break;
          }
          if (dE != 11) {
            break;
          }
          a(Integer.valueOf(13));
          break;
        }
      }
    }
  }
  
  public void ar()
  {
    int i = (int)(6.0F * jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDisplayMetrics().density);
    Object localObject2 = (LinearLayout.LayoutParams)jdField_a_of_type_ComTencentWidgetXEditTextEx.getLayoutParams();
    leftMargin = i;
    jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams((ViewGroup.LayoutParams)localObject2);
    Object localObject1 = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    DeviceInfo localDeviceInfo = ((SmartDeviceProxyMgr)localObject1).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    ProductInfo localProductInfo;
    if (localDeviceInfo != null)
    {
      localProductInfo = ((SmartDeviceProxyMgr)localObject1).a(productId);
      if ((localProductInfo != null) && (localProductInfo.isSupportMainMsgType(4)))
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllEnable(true);
        if (VersionUtils.e()) {
          jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllAlpha(1.0F);
        }
        leftMargin = 0;
        jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams((ViewGroup.LayoutParams)localObject2);
      }
      ds = productId;
    }
    for (;;)
    {
      K = ((SmartDeviceProxyMgr)localObject1).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)).booleanValue();
      boolean bool1 = SettingCloneUtil.readValue(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, null, "devicemsg_showsupporttips_first", true);
      boolean bool2 = SettingCloneUtil.readValue(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, null, "devicemsg_openchat_firsttrue", false);
      if (localProductInfo != null)
      {
        if ((supportMainMsgType & 0xF) != 0) {
          I = true;
        }
        if ((!bool2) && ((SSOBid_Platform == 1027) || ((!StringUtil.b(SSOBid_Version)) && (Double.valueOf(SSOBid_Version).doubleValue() >= 1.1D))))
        {
          J = true;
          SettingCloneUtil.writeValue(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, null, "devicemsg_openchat_firsttrue", true);
        }
      }
      else
      {
        if ((I) && (J) && (localDeviceInfo != null)) {
          SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, din, "Usr_AIO_SupportGroupChat", 0, 0, productId);
        }
        if ((localProductInfo != null) && (bool1))
        {
          if ((supportMainMsgType & 0xF) != 0) {
            break label561;
          }
          localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371584);
          label377:
          if (!TextUtils.isEmpty((CharSequence)localObject1))
          {
            localObject1 = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
            if ((I) && (isAdmin == 1) && (J) && (!K))
            {
              localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371606);
              ((DeviceMsgHandle)localObject1).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, (String)localObject2, MessageCache.a(), true, false, true);
            }
            SettingCloneUtil.writeValue(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, null, "devicemsg_showsupporttips_first", false);
          }
        }
        if (QLog.isColorLevel())
        {
          if (localProductInfo == null) {
            break label903;
          }
          QLog.d(ae, 2, "support msg type maintype" + supportMainMsgType + ", FuncMsgType:" + supportFuncMsgType);
        }
      }
      for (;;)
      {
        as();
        return;
        if ((!bool2) && (!K)) {
          break;
        }
        J = true;
        break;
        label561:
        localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371585);
        localObject1 = localObject2;
        if (localProductInfo.isSupportMainMsgType(1)) {
          localObject1 = (String)localObject2 + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371578) + "、";
        }
        localObject2 = localObject1;
        if (localProductInfo.isSupportMainMsgType(2)) {
          localObject2 = (String)localObject1 + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371579) + "、";
        }
        localObject1 = localObject2;
        if (localProductInfo.isSupportMainMsgType(8)) {
          localObject1 = (String)localObject2 + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371582) + "、";
        }
        localObject2 = localObject1;
        if (localProductInfo.isSupportFuncMsgType(1)) {
          localObject2 = (String)localObject1 + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371580) + "、";
        }
        localObject1 = localObject2;
        if (localProductInfo.isSupportFuncMsgType(2)) {
          localObject1 = (String)localObject2 + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371581) + "、";
        }
        localObject2 = localObject1;
        if (((String)localObject1).endsWith("、")) {
          localObject2 = ((String)localObject1).substring(0, ((String)localObject1).length() - 1);
        }
        localObject1 = (String)localObject2 + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371586);
        break label377;
        label903:
        QLog.d(ae, 2, "product is null");
      }
      localProductInfo = null;
    }
  }
  
  void as()
  {
    int i = (int)(6.0F * jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDisplayMetrics().density);
    LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)jdField_a_of_type_ComTencentWidgetXEditTextEx.getLayoutParams();
    Object localObject = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    DeviceInfo localDeviceInfo = ((SmartDeviceProxyMgr)localObject).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    if (localDeviceInfo != null) {}
    for (localObject = ((SmartDeviceProxyMgr)localObject).a(productId);; localObject = null)
    {
      if (localObject != null)
      {
        if ((supportMainMsgType & 0xF) != 0) {
          break label124;
        }
        jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setVisibility(8);
      }
      for (;;)
      {
        if (!((ProductInfo)localObject).isSupportMainMsgType(1)) {
          jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
        }
        return;
        label124:
        if (((ProductInfo)localObject).isSupportMainMsgType(15))
        {
          if ((((ProductInfo)localObject).isSupportFuncMsgType(3)) || (((ProductInfo)localObject).isSupportFuncMsgType(1)) || (!((ProductInfo)localObject).isSupportFuncMsgType(2))) {}
        }
        else if (((ProductInfo)localObject).isSupportMainMsgType(8))
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllEnable(true);
          if (VersionUtils.e()) {
            jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllAlpha(0.6F);
          }
          leftMargin = i;
          jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
        }
        else if ((supportMainMsgType & 0xF) == 3)
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllEnable(true);
          if (VersionUtils.e()) {
            jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllAlpha(0.6F);
          }
          leftMargin = i;
          jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
        }
        else if (((ProductInfo)localObject).isSupportMainMsgType(1))
        {
          if (((ProductInfo)localObject).isSupportFuncMsgType(3))
          {
            rightMargin = i;
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
          }
          else if (((ProductInfo)localObject).isSupportFuncMsgType(1))
          {
            rightMargin = i;
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
          }
          else if (((ProductInfo)localObject).isSupportFuncMsgType(2))
          {
            rightMargin = i;
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
          }
          else
          {
            jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllEnable(false);
            if (VersionUtils.e()) {
              jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllAlpha(0.6F);
            }
            leftMargin = i;
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
          }
        }
        else if (((ProductInfo)localObject).isSupportMainMsgType(2))
        {
          if (((ProductInfo)localObject).isSupportFuncMsgType(3))
          {
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHint(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131370852));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHintTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427351));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setGravity(17);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusable(false);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusableInTouchMode(false);
            jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
          }
          else if (((ProductInfo)localObject).isSupportFuncMsgType(1))
          {
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHint(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131370852));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHintTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427351));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setGravity(17);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusable(false);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusableInTouchMode(false);
            jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
          }
          else if (((ProductInfo)localObject).isSupportFuncMsgType(2))
          {
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHint(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131370852));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHintTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427351));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setGravity(17);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusable(false);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusableInTouchMode(false);
            jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
          }
          else
          {
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setVisibility(8);
            jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
            jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllEnable(true);
            if (VersionUtils.e()) {
              jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllAlpha(0.6F);
            }
            jdField_a_of_type_ComTencentWidgetPatchedButton.setVisibility(8);
          }
        }
        else
        {
          jdField_a_of_type_ComTencentWidgetXEditTextEx.setVisibility(0);
          jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllEnable(true);
          if (VersionUtils.e()) {
            jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout.setAllAlpha(1.0F);
          }
          if (((ProductInfo)localObject).isSupportFuncMsgType(3))
          {
            rightMargin = i;
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHint(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131370852));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHintTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427351));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setGravity(17);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusable(false);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusableInTouchMode(false);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
            jdField_a_of_type_ComTencentWidgetPatchedButton.setVisibility(8);
            jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
          }
          else if (((ProductInfo)localObject).isSupportFuncMsgType(1))
          {
            rightMargin = i;
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHint(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131370852));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHintTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427351));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setGravity(17);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusable(false);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusableInTouchMode(false);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
            jdField_a_of_type_ComTencentWidgetPatchedButton.setVisibility(8);
            jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
          }
          else if (((ProductInfo)localObject).isSupportFuncMsgType(2))
          {
            rightMargin = i;
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHint(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getString(2131370852));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setHintTextColor(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getColor(2131427351));
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setGravity(17);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusable(false);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setFocusableInTouchMode(false);
            jdField_a_of_type_ComTencentWidgetXEditTextEx.setLayoutParams(localLayoutParams);
            jdField_a_of_type_ComTencentWidgetPatchedButton.setVisibility(8);
            jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
          }
        }
      }
    }
  }
  
  void at()
  {
    if (jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getExtras() == null) {
      super.v();
    }
  }
  
  public void b(List paramList)
  {
    DeviceMsgHandle localDeviceMsgHandle = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
    if ((K) && (J))
    {
      localDeviceMsgHandle.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, paramList);
      paramList = ((SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51)).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
      SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, din, "Usr_AIO_SendGroupMsg", 3, 0, productId);
      return;
    }
    localDeviceMsgHandle.a().a(DeviceMsgHandle.d, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, paramList);
  }
  
  protected boolean b()
  {
    Object localObject = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    DeviceInfo localDeviceInfo = ((SmartDeviceProxyMgr)localObject).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    if (localDeviceInfo != null)
    {
      localObject = ((SmartDeviceProxyMgr)localObject).a(productId);
      if ((localObject != null) && ((supportMainMsgType & 0xF) == 6)) {
        return true;
      }
    }
    return false;
  }
  
  public boolean b(int paramInt)
  {
    SmartDeviceProxyMgr localSmartDeviceProxyMgr = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    if (localSmartDeviceProxyMgr != null)
    {
      long l1 = 0L;
      try
      {
        long l2 = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        l1 = l2;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          localException.printStackTrace();
        }
      }
      if (localSmartDeviceProxyMgr.a(l1, paramInt)) {
        return true;
      }
    }
    return false;
  }
  
  public void c()
  {
    boolean bool = true;
    Object localObject1;
    if (jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().length() > 0)
    {
      localObject1 = jdField_a_of_type_ComTencentWidgetXEditTextEx.getText().toString();
      PicPreDownloadUtils.a((String)localObject1);
      if ((localObject1 != null) && (((String)localObject1).length() > 3478))
      {
        ChatActivityUtils.a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2131367352, 1);
        return;
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentWidgetXEditTextEx.setText("");
      Object localObject3 = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
      Object localObject2 = ((SmartDeviceProxyMgr)localObject3).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
      if (localObject2 != null)
      {
        localObject3 = ((SmartDeviceProxyMgr)localObject3).a(productId);
        if ((localObject3 == null) || (!((ProductInfo)localObject3).isSupportMainMsgType(1))) {}
      }
      for (int i = 1;; i = 0)
      {
        long l = 0L;
        if (localObject2 != null) {
          l = din;
        }
        for (int j = productId;; j = 0)
        {
          if (i == 0)
          {
            localObject1 = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
            SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l, "Usr_AIO_SendMsg", 7, 0, j);
            return;
          }
          localObject2 = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
          SessionInfo localSessionInfo;
          if (!TextUtils.isEmpty((CharSequence)localObject1))
          {
            localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
            localSessionInfo = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
            if ((!K) || (!J)) {
              break label267;
            }
          }
          for (;;)
          {
            ((DeviceMsgHandle)localObject2).a((QQAppInterface)localObject3, localSessionInfo, (String)localObject1, bool);
            SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l, "Usr_AIO_SendMsg", 6, 0, j);
            return;
            label267:
            bool = false;
          }
        }
      }
      localObject1 = null;
    }
  }
  
  public void c(List paramList)
  {
    Intent localIntent = new Intent();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      String str = (String)paramList.next();
      if ((str != null) && (!"".equals(str)))
      {
        localIntent.putExtra("PhotoConst.PHOTO_SEND_PATH", str);
        localIntent.putExtra("PhotoConst.SEND_BUSINESS_TYPE", 1007);
        localIntent.putExtra("uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
        localIntent.putExtra("uintype", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
        localIntent.putExtra("troop_uin", jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
        localIntent.putExtra("PhotoConst.SEND_SIZE_SPEC", 0);
        localIntent.putExtra("PhotoConst.HANDLE_DEST_RESULT", true);
        PicReq localPicReq1 = PicBusiManager.a(2, 1007);
        PicBusiManager.a(1007, localIntent);
        PicReq localPicReq2 = PicBusiManager.a(1, 1007);
        localPicReq2.a(jdField_a_of_type_JavaLangString);
        if (localPicReq2.a(PicBusiManager.a(1007, localIntent)))
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoICompressionCallBack = new lgh(this);
          PicBusiManager.a(localPicReq2, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        }
        else
        {
          d(str);
        }
      }
    }
  }
  
  protected boolean c()
  {
    Object localObject = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    DeviceInfo localDeviceInfo = ((SmartDeviceProxyMgr)localObject).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    if (localDeviceInfo != null)
    {
      localObject = ((SmartDeviceProxyMgr)localObject).a(productId);
      if (localObject != null)
      {
        if ((supportMainMsgType & 0xF) == 1) {
          return true;
        }
        if (((supportMainMsgType & 0xF) == 5) && (supportFuncMsgType == 1)) {
          return true;
        }
        if (((supportMainMsgType & 0xF) == 5) && (supportFuncMsgType == 2)) {
          return true;
        }
        if (((supportMainMsgType & 0xF) == 5) && (supportFuncMsgType == 3)) {
          return true;
        }
        if ((supportMainMsgType & 0xF) == 9) {
          return true;
        }
      }
    }
    return false;
  }
  
  public void d(String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramString);
    b(localArrayList);
  }
  
  public void e(String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramString);
    c(localArrayList);
  }
  
  protected void f(Intent paramIntent)
  {
    int i = paramIntent.getIntExtra("forward_type", Integer.MAX_VALUE);
    if (i == Integer.MAX_VALUE) {}
    DeviceMsgHandle localDeviceMsgHandle;
    do
    {
      return;
      paramIntent.removeExtra("forward_type");
      if (i != -1) {
        break;
      }
      paramIntent = paramIntent.getStringExtra("forward_text");
      localDeviceMsgHandle = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
    } while (TextUtils.isEmpty(paramIntent));
    QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    SessionInfo localSessionInfo = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
    if ((K) && (J)) {}
    for (boolean bool = true;; bool = false)
    {
      localDeviceMsgHandle.a(localQQAppInterface, localSessionInfo, paramIntent, bool);
      return;
    }
    super.f(paramIntent);
  }
  
  protected void g(Intent paramIntent)
  {
    at();
    super.g(paramIntent);
    if (!jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isFinishing()) {
      k(paramIntent);
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return super.handleMessage(paramMessage);
      jdField_a_of_type_MqqOsMqqHandler.removeMessages(20);
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(20, 10000L);
      continue;
      jdField_a_of_type_MqqOsMqqHandler.removeMessages(20);
    }
  }
  
  void k(Intent paramIntent)
  {
    int k = paramIntent.getIntExtra(AlbumConstants.i, -1);
    ArrayList localArrayList;
    int m;
    Object localObject1;
    Object localObject2;
    if ((80 == k) || (82 == k))
    {
      jdField_a_of_type_ComTencentWidgetXPanelContainer.a();
      localArrayList = paramIntent.getExtras().getStringArrayList("PhotoConst.PHOTO_PATHS");
      m = paramIntent.getExtras().getInt("PhotoConst.SEND_SIZE_SPEC", 0);
      paramIntent = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
      localObject1 = paramIntent.a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
      if (localObject1 == null) {
        break label589;
      }
      localObject2 = paramIntent.a(productId);
      if ((localObject2 == null) || (!((ProductInfo)localObject2).isSupportFuncMsgType(1))) {
        break label589;
      }
    }
    label589:
    for (int i = 1;; i = 0)
    {
      long l = 0L;
      int j = 0;
      if (localObject1 != null)
      {
        l = din;
        j = productId;
      }
      if ((i == 0) && (dE != 4) && (dE != 3))
      {
        paramIntent = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
        SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l, "Usr_AIO_SendMsg", 7, 0, j);
      }
      do
      {
        do
        {
          return;
          localObject1 = new ArrayList();
          localObject2 = localArrayList.iterator();
          while (((Iterator)localObject2).hasNext())
          {
            String str = (String)((Iterator)localObject2).next();
            try
            {
              ((ArrayList)localObject1).add(new FileInfo(str));
            }
            catch (FileNotFoundException localFileNotFoundException) {}
          }
          if ((dE == 4) || (dE == 3))
          {
            localObject1 = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
            localObject1 = localArrayList.iterator();
            while (((Iterator)localObject1).hasNext()) {
              paramIntent.a((String)((Iterator)localObject1).next(), 2154);
            }
            if (QLog.isColorLevel()) {
              QLog.d(ae, 2, "prcessExtraData: send:" + localArrayList.size());
            }
            v();
            return;
          }
          if (dE != 9) {
            break;
          }
        } while (((ArrayList)localObject1).size() <= 0);
        paramIntent = new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, PrinterOptionActivity.class);
        paramIntent.putParcelableArrayListExtra("sFilesSelected", (ArrayList)localObject1);
        paramIntent.putExtra(AlbumConstants.i, k);
        paramIntent.putExtra("sIsCloudPrinter", true);
        jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(paramIntent, 102);
        return;
        paramIntent = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
        if ((K) && (J))
        {
          paramIntent.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, localArrayList);
          SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l, "Usr_AIO_SendGroupMsg", 3, 0, j);
          return;
        }
        if (!M) {
          break;
        }
      } while (((ArrayList)localObject1).size() <= 0);
      paramIntent = new Intent(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, PrinterOptionActivity.class);
      paramIntent.putParcelableArrayListExtra("sFilesSelected", (ArrayList)localObject1);
      paramIntent.putExtra(AlbumConstants.i, k);
      paramIntent.putExtra("sIsCloudPrinter", true);
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.startActivityForResult(paramIntent, 102);
      return;
      if (m == 2)
      {
        b(localArrayList);
        return;
      }
      c(localArrayList);
      return;
    }
  }
  
  protected void l()
  {
    if (jdField_c_of_type_AndroidWidgetImageView != null) {
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
    }
  }
  
  public void m()
  {
    Object localObject = ((SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51)).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    long l = 0L;
    int i;
    if (localObject != null)
    {
      i = productId;
      l = din;
    }
    for (;;)
    {
      SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l, "Usr_AIO_Menu", 1, 0, i);
      if (localObject == null) {
        return;
      }
      Intent localIntent = new Intent();
      localIntent.putExtra("device_info", (Parcelable)localObject);
      localIntent.putExtra("isPublicDevice", true);
      localObject = new LightAppUtil(jdField_a_of_type_AndroidSupportV4AppFragmentActivity).a((DeviceInfo)localObject);
      if (localObject != null) {
        localIntent.putExtra("lightapp_setting", (Parcelable)localObject);
      }
      SmartDevicePluginLoader.a().a(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), localIntent, "com.tencent.device.activities.DeviceSettingActivity", dJ, null, SmartDevicePluginProxyActivity.class);
      if (g != null) {
        g.setVisibility(8);
      }
      BaseApplication.getContext().getSharedPreferences("lock_red_dot_show", 0).edit().putBoolean(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString + "_" + "lock_red_dot_show" + "_" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), true).commit();
      BaseApplication.getContext().getSharedPreferences("qsmart_preference", 0).edit().putBoolean("ota_showupdatereddot", false).commit();
      return;
      i = 0;
    }
  }
  
  protected void o()
  {
    if (jdField_a_of_type_AndroidWidgetImageView != null)
    {
      jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130838308);
      jdField_a_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getText(2131364407));
    }
  }
  
  public boolean s()
  {
    Object localObject = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    DeviceInfo localDeviceInfo = ((SmartDeviceProxyMgr)localObject).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    if (localDeviceInfo != null)
    {
      localObject = ((SmartDeviceProxyMgr)localObject).a(productId);
      if ((localObject != null) && (((ProductInfo)localObject).isSupportFuncMsgType(2))) {
        return true;
      }
    }
    return false;
  }
  
  public boolean t()
  {
    Object localObject = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    DeviceInfo localDeviceInfo = ((SmartDeviceProxyMgr)localObject).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    if (localDeviceInfo != null)
    {
      localObject = ((SmartDeviceProxyMgr)localObject).a(productId);
      if ((localObject != null) && (((ProductInfo)localObject).isSupportMainMsgType(8))) {
        return true;
      }
    }
    return false;
  }
  
  protected void u()
  {
    if (C) {
      if (QLog.isColorLevel()) {
        QLog.d(ae, 2, "hasDestory = true return");
      }
    }
    do
    {
      return;
      super.u();
      try
      {
        jdField_a_of_type_AndroidSupportV4AppFragmentActivity.unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
        return;
      }
      catch (IllegalArgumentException localIllegalArgumentException) {}
    } while (!QLog.isColorLevel());
    QLog.w(ae, 2, " already unregisterReceiver" + localIllegalArgumentException);
  }
  
  public boolean u()
  {
    if (t()) {
      return true;
    }
    try
    {
      l = Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
      SmartDeviceProxyMgr localSmartDeviceProxyMgr = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
      if ((localSmartDeviceProxyMgr != null) && (localSmartDeviceProxyMgr.d(l)) && (localSmartDeviceProxyMgr.a(l, 17))) {
        return true;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
        long l = 0L;
      }
    }
    return false;
  }
  
  public boolean v()
  {
    Object localObject = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    DeviceInfo localDeviceInfo = ((SmartDeviceProxyMgr)localObject).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    if (localDeviceInfo != null)
    {
      localObject = ((SmartDeviceProxyMgr)localObject).a(productId);
      if ((localObject != null) && (((ProductInfo)localObject).isSupportFuncMsgType(1))) {
        return true;
      }
    }
    return false;
  }
  
  public boolean w()
  {
    Object localObject = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    DeviceInfo localDeviceInfo = ((SmartDeviceProxyMgr)localObject).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    if (localDeviceInfo != null)
    {
      localObject = ((SmartDeviceProxyMgr)localObject).a(productId);
      if ((localObject != null) && (((ProductInfo)localObject).isSupportMainMsgType(2))) {
        return true;
      }
    }
    return false;
  }
  
  boolean x()
  {
    Object localObject2 = (SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    Object localObject1 = ((SmartDeviceProxyMgr)localObject2).a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString));
    if (localObject1 != null)
    {
      localObject2 = ((SmartDeviceProxyMgr)localObject2).a(productId);
      if ((localObject2 == null) || (!((ProductInfo)localObject2).isSupportFuncMsgType(1))) {}
    }
    for (int i = 1;; i = 0)
    {
      long l = 0L;
      if (localObject1 != null) {
        l = din;
      }
      for (int j = productId;; j = 0)
      {
        if ((i == 0) && (dE != 4) && (dE != 3))
        {
          localObject1 = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
          SmartDeviceReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l, "Usr_AIO_SendMsg", 7, 0, j);
          return false;
        }
        return true;
      }
    }
  }
}
