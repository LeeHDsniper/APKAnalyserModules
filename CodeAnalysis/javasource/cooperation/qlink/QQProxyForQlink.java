package cooperation.qlink;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Message;
import android.widget.Toast;
import com.tencent.biz.widgets.ScannerView;
import com.tencent.mobileqq.activity.Conversation;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.BuddyTransfileProcessor;
import com.tencent.mobileqq.transfile.TransfileUtile;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.Timer;
import mqq.app.AppActivity;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;
import uli;
import ulk;
import ull;
import ulm;
import uln;
import ulo;
import ulp;
import ulq;

public class QQProxyForQlink
  implements QlAndQQInterface.QQ2Ql, QlAndQQInterface.Ql2QQ
{
  private static final String jdField_a_of_type_JavaLangString = "QQProxyForQlink";
  private static final String jdField_b_of_type_JavaLangString = "_QLINK_FILEASSIS_ENTER_NEW_";
  private int jdField_a_of_type_Int;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private QQCustomDialog jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog;
  private QlAndQQInterface.WorkState jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState;
  private Timer jdField_a_of_type_JavaUtilTimer;
  private int jdField_b_of_type_Int;
  private String c;
  
  public QQProxyForQlink(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState = new QlAndQQInterface.WorkState(false, 1, null, null, 0, 0, false);
    jdField_a_of_type_AndroidContentBroadcastReceiver = null;
    b = -1;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    i();
  }
  
  private void a(Activity paramActivity, int paramInt, String paramString, ScannerView paramScannerView)
  {
    if (paramActivity == null) {
      return;
    }
    if (1 == paramInt) {
      paramString = "你当前正在使用面对面快传" + "发送文件给" + paramString + ",请稍候";
    }
    for (;;)
    {
      DialogUtil.a(paramActivity, 230, paramActivity.getString(2131366130), paramString, 2131366090, 2131366090, new ulq(this, paramScannerView), null).show();
      return;
      if (2 == paramInt) {
        paramString = "你当前正在使用面对面快传" + "接收来着" + paramString + "的文件,请稍候";
      } else {
        paramString = "出错误啦";
      }
    }
  }
  
  public static void a(Context paramContext, int paramInt, Bundle paramBundle)
  {
    if (paramContext == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("QQProxyForQlink", 2, "[QLINK] QQ - startQlink failed context=null!");
      }
      Toast.makeText(BaseApplication.getContext(), "加载失败，请重试", 0).show();
      return;
    }
    Intent localIntent = new Intent(paramContext, QlinkBridgeActivity.class);
    localIntent.putExtra("_from_", paramInt);
    if (paramBundle != null) {
      localIntent.putExtra("_param_", paramBundle);
    }
    if ((9 == paramInt) || (10 == paramInt)) {
      localIntent.addFlags(268435456);
    }
    paramContext.startActivity(localIntent);
  }
  
  private boolean b()
  {
    String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    if (str == null) {
      return false;
    }
    if ((-1 == b) || (!str.equalsIgnoreCase(c)))
    {
      c = str;
      b = 1;
    }
    try
    {
      b = BaseApplication.getContext().getSharedPreferences("_QLINK_FILEASSIS_ENTER_NEW_", 0).getInt(str, 0);
      return true;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  private void i()
  {
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)) {
      ThreadManager.b(new uli(this));
    }
  }
  
  /* Error */
  private void j()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 212	cooperation/qlink/QQProxyForQlink:jdField_a_of_type_JavaUtilTimer	Ljava/util/Timer;
    //   6: astore_1
    //   7: aload_1
    //   8: ifnull +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: ldc 12
    //   16: iconst_1
    //   17: ldc -42
    //   19: invokestatic 216	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   22: aload_0
    //   23: new 218	java/util/Timer
    //   26: dup
    //   27: invokespecial 219	java/util/Timer:<init>	()V
    //   30: putfield 212	cooperation/qlink/QQProxyForQlink:jdField_a_of_type_JavaUtilTimer	Ljava/util/Timer;
    //   33: aload_0
    //   34: getfield 212	cooperation/qlink/QQProxyForQlink:jdField_a_of_type_JavaUtilTimer	Ljava/util/Timer;
    //   37: new 221	ulr
    //   40: dup
    //   41: aload_0
    //   42: invokespecial 222	ulr:<init>	(Lcooperation/qlink/QQProxyForQlink;)V
    //   45: lconst_0
    //   46: ldc2_w 223
    //   49: invokevirtual 228	java/util/Timer:schedule	(Ljava/util/TimerTask;JJ)V
    //   52: goto -41 -> 11
    //   55: astore_1
    //   56: aload_0
    //   57: monitorexit
    //   58: aload_1
    //   59: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	60	0	this	QQProxyForQlink
    //   6	2	1	localTimer	Timer
    //   55	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	55	finally
    //   14	52	55	finally
  }
  
  private void k()
  {
    try
    {
      if (jdField_a_of_type_JavaUtilTimer != null)
      {
        QLog.i("QQProxyForQlink", 1, "[QLINK]-QQ cancelQlinkHeartTimer");
        jdField_a_of_type_JavaUtilTimer.cancel();
        jdField_a_of_type_JavaUtilTimer = null;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int a()
  {
    return jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mTransferingCount;
  }
  
  public QlAndQQInterface.WorkState a()
  {
    return jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState;
  }
  
  public void a() {}
  
  public void a(int paramInt)
  {
    int i = jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mTransferingCount;
    jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mTransferingCount = paramInt;
    if (i != jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mTransferingCount)
    {
      if (QLog.isDevelopLevel()) {
        QLog.i("QQProxyForQlink", 4, "[QLINK]-QQ UI_LOG:notifyGoingonTransChanged.count:" + paramInt);
      }
      MqqHandler localMqqHandler = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(Conversation.class);
      if (localMqqHandler != null) {
        localMqqHandler.obtainMessage(1134025, null).sendToTarget();
      }
    }
  }
  
  public void a(Activity paramActivity, DialogInterface.OnClickListener paramOnClickListener1, DialogInterface.OnClickListener paramOnClickListener2, DialogInterface.OnClickListener paramOnClickListener3, String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null) {}
    label194:
    label224:
    label403:
    for (;;)
    {
      return;
      String str2 = ContactUtils.k(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerUin);
      String str1;
      if (str2 != null)
      {
        str1 = str2;
        if (!jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerUin.equalsIgnoreCase(str2)) {}
      }
      else
      {
        if (jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerNick == null) {
          break label224;
        }
        str1 = jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerNick;
      }
      if (jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mMode == 1)
      {
        a("0X8004854", 1);
        paramOnClickListener3 = paramActivity.getResources().getString(2131366176) + str1 + paramActivity.getResources().getString(2131366177);
        if ((paramString != null) && (!paramString.equalsIgnoreCase(jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerUin)))
        {
          jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(paramActivity, 230, paramActivity.getResources().getString(2131366129), paramOnClickListener3, paramActivity.getResources().getString(2131366178), paramActivity.getResources().getString(2131366178), paramOnClickListener2, null);
          jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
        }
      }
      for (;;)
      {
        if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog == null) {
          break label403;
        }
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setOnDismissListener(new uln(this));
        return;
        str1 = jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerUin;
        break;
        jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(paramActivity, 230, paramActivity.getResources().getString(2131366129), paramOnClickListener3, paramActivity.getResources().getString(2131366178), paramActivity.getResources().getString(2131366179), paramOnClickListener1, paramOnClickListener2);
        break label194;
        if (jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mMode == 2)
        {
          a("0X8004856", 1);
          paramOnClickListener1 = str1 + paramActivity.getResources().getString(2131366180);
          jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(paramActivity, 230, paramActivity.getResources().getString(2131366129), paramOnClickListener1, paramActivity.getResources().getString(2131366181), paramActivity.getResources().getString(2131366181), paramOnClickListener3, null);
          jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
        }
        else if (QLog.isColorLevel())
        {
          QLog.e("QQProxyForQlink", 2, "[QLINK] QQ - working but op err");
        }
      }
    }
  }
  
  public void a(Activity paramActivity, ArrayList paramArrayList, int paramInt1, int paramInt2, boolean paramBoolean, String paramString)
  {
    if (paramActivity == null) {}
    label166:
    do
    {
      return;
      switch (paramInt2)
      {
      }
      for (;;)
      {
        if (jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mWorking) {
          break label166;
        }
        Object localObject = null;
        paramString = localObject;
        if (paramArrayList != null)
        {
          paramString = localObject;
          if (paramArrayList.size() > 0)
          {
            paramString = new Bundle();
            paramString.putStringArrayList("string_filepaths", paramArrayList);
          }
        }
        a(paramActivity, paramInt1, paramString);
        if (!paramBoolean) {
          break;
        }
        paramActivity.finish();
        return;
        a("0X800484F", 1);
        continue;
        a("0X800485B", 1);
        continue;
        a("0X800485E", 1);
        continue;
        a("0X8004858", 1);
        continue;
        a("0X800566F", 1);
      }
      if ((15 != paramInt1) || ((paramArrayList != null) && (paramArrayList.size() != 0))) {
        break;
      }
      a(paramActivity, paramInt1, new Bundle());
    } while (!paramBoolean);
    paramActivity.finish();
    return;
    a(paramActivity, new ulk(this, paramArrayList, paramActivity, paramInt1, paramBoolean), new ull(this), new ulm(this), paramString);
  }
  
  public void a(Bundle paramBundle)
  {
    paramBundle = (QlAndQQInterface.WorkState)paramBundle.getSerializable("wstate");
    jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mForIphone = mForIphone;
    jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mMode = mMode;
    jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerNick = mPeerNick;
    jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerUin = mPeerUin;
    jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mState = mState;
    jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mTransferingCount = mTransferingCount;
    jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mWorking = mWorking;
  }
  
  public void a(QlAndQQInterface.DailogClickInfo paramDailogClickInfo)
  {
    Bundle localBundle = new Bundle();
    localBundle.putSerializable(QlAndQQInterface.a, paramDailogClickInfo);
    int i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a("cmd.senddailogclickinfo", localBundle);
    if (QLog.isDevelopLevel()) {
      QLog.d("QQProxyForQlink", 4, "[QLINK]-QQ sendDailogClick:" + i);
    }
  }
  
  public void a(QlAndQQInterface.InsertFMFileInfo paramInsertFMFileInfo)
  {
    if (paramInsertFMFileInfo == null) {
      return;
    }
    String str = FileManagerUtil.a(filePath);
    long l1 = FileManagerUtil.a(filePath);
    long l2 = a64536uniseq;
    FileManagerEntity localFileManagerEntity = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(l2, uin, 0);
    localFileManagerEntity.setCloudType(5);
    nSessionId = sessionId;
    localFileManagerEntity.setFilePath(filePath);
    nFileType = FileManagerUtil.a(filePath);
    strThumbPath = thumbPath;
    fileName = str;
    fileSize = l1;
    srvTime = (MessageCache.a() * 1000L);
    msgSeq = FileManagerUtil.a();
    msgUid = FileManagerUtil.b();
    isReaded = true;
    peerUin = uin;
    nOlSenderProgress = transSeq;
    FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    if (localFriendsManager.c(String.valueOf(peerUin)) != null)
    {
      peerType = 0;
      peerNick = FileManagerUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, uin, null, 0);
      status = 1;
      if ((!localFriendsManager.b(uin)) && (!bSend)) {
        break label356;
      }
      nOpType = 0;
      bSend = true;
      TransfileUtile.a(filePath, 0L, 0, true);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(localFileManagerEntity);
      QLog.d("QQProxyForQlink", 4, "insertFM sessionid:" + sessionId + " transeq:" + nOlSenderProgress + " filePath:" + filePath);
      return;
      peerType = 1003;
      break;
      label356:
      nOpType = 1;
      bSend = false;
      TransfileUtile.a(filePath, l1, 0, false, null);
      BuddyTransfileProcessor.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), str, 0, null);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localFileManagerEntity);
    }
  }
  
  public void a(QlAndQQInterface.UserInfo paramUserInfo)
  {
    Bundle localBundle = new Bundle();
    localBundle.putSerializable(QlAndQQInterface.a, paramUserInfo);
    int i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a("cmd.senduserinfo", localBundle);
    if (QLog.isDevelopLevel()) {
      QLog.d("QQProxyForQlink", 4, "[QLINK]-QQ sendUserInfo:" + i);
    }
  }
  
  public void a(String paramString)
  {
    String str = ContactUtils.j(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString);
    FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
    QlAndQQInterface.UserInfo localUserInfo = new QlAndQQInterface.UserInfo();
    uin = paramString;
    if (str != null) {}
    for (nick = str;; nick = paramString)
    {
      isFriend = localFriendsManager.b(paramString);
      a(localUserInfo);
      return;
    }
  }
  
  public void a(String paramString, int paramInt)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("QQProxyForQlink", 4, "QLINK_CLICK_EVENT: act=" + paramString + " count:" + paramInt);
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", paramString, paramString, 0, paramInt, 0, "", "", "", "");
  }
  
  public void a(String paramString1, String paramString2, boolean paramBoolean, long paramLong1, long paramLong2, HashMap paramHashMap)
  {
    if (QLog.isDevelopLevel())
    {
      Object localObject2 = "";
      Object localObject1 = localObject2;
      if (paramHashMap != null)
      {
        localObject1 = localObject2;
        if (paramHashMap.size() > 0)
        {
          localObject2 = paramHashMap.entrySet().iterator();
          Map.Entry localEntry;
          for (localObject1 = ""; ((Iterator)localObject2).hasNext(); localObject1 = (String)localObject1 + " " + (String)localEntry.getKey() + ":" + (String)localEntry.getValue()) {
            localEntry = (Map.Entry)((Iterator)localObject2).next();
          }
        }
      }
      QLog.d("QQProxyForQlink", 4, "QLINK_PERFORMANCE: tagName=" + paramString2 + " uin:" + paramString1 + " success:" + paramBoolean + (String)localObject1);
    }
    QlinkReliableReport.a(paramString1, paramString2, paramBoolean, paramLong1, paramLong2, paramHashMap);
  }
  
  public void a(AppActivity paramAppActivity, ScannerView paramScannerView)
  {
    if (paramAppActivity == null) {
      return;
    }
    DialogUtil.a(paramAppActivity, 230, paramAppActivity.getString(2131366202), paramAppActivity.getString(2131366134), 2131366090, 2131366090, new ulp(this, paramScannerView), null).show();
  }
  
  public void a(AppActivity paramAppActivity, String paramString, ScannerView paramScannerView)
  {
    if ((paramAppActivity == null) || (paramString == null)) {
      return;
    }
    QlinkHelper.QRScanInfo localQRScanInfo = QlinkHelper.a(paramString);
    if (localQRScanInfo == null)
    {
      DialogUtil.a(paramAppActivity, 230, paramAppActivity.getString(2131366130), paramAppActivity.getString(2131366135), 2131366090, 2131366090, new ulo(this, paramScannerView), null).show();
      return;
    }
    if (jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mWorking)
    {
      a(paramAppActivity, jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mMode, jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerNick, paramScannerView);
      return;
    }
    boolean bool = "qlink".equalsIgnoreCase(paramAppActivity.getIntent().getStringExtra("from"));
    if (bool) {
      c(1);
    }
    paramScannerView = new Bundle();
    paramScannerView.putString("url", paramString);
    paramScannerView.putString("key", a);
    paramScannerView.putString("peerUin", b);
    paramScannerView.putString("peerNick", c);
    paramScannerView.putString("peerOS", d);
    paramScannerView.putString("apSSID", e);
    paramScannerView.putBoolean("fromqlink", bool);
    paramString = paramAppActivity.getIntent().getStringExtra("subfrom");
    if (paramString != null) {
      paramScannerView.putString("subfrom", paramString);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    a(paramAppActivity, 11, paramScannerView);
    paramAppActivity.finish();
  }
  
  public void a(boolean paramBoolean)
  {
    int i = 0;
    if (!b()) {}
    do
    {
      return;
      if (paramBoolean) {
        i = 1;
      }
    } while (b == i);
    b = i;
    String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
    SharedPreferences.Editor localEditor;
    try
    {
      localEditor = BaseApplication.getContext().getSharedPreferences("_QLINK_FILEASSIS_ENTER_NEW_", 0).edit();
      localEditor.putInt(str, b);
      if (Build.VERSION.SDK_INT < 9)
      {
        localEditor.commit();
        return;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return;
    }
    localEditor.apply();
  }
  
  public boolean a()
  {
    if (!b()) {}
    while (b != 0) {
      return false;
    }
    return true;
  }
  
  public boolean a(QlAndQQInterface.SendFileInfos paramSendFileInfos)
  {
    boolean bool = true;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a("0X8004763", 1);
    Bundle localBundle = new Bundle();
    localBundle.putSerializable(QlAndQQInterface.a, paramSendFileInfos);
    int i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a("cmd.sendfilemsgs", localBundle);
    if (QLog.isDevelopLevel()) {
      QLog.d("QQProxyForQlink", 4, "[QLINK]-QQ QQ2QlSendFileMsgs:" + i);
    }
    if (i == -1) {
      bool = false;
    }
    return bool;
  }
  
  public boolean a(String paramString, List paramList)
  {
    if ((paramList == null) || (paramString == null)) {
      if (QLog.isColorLevel()) {
        QLog.e("QQProxyForQlink", 2, "[QLINK]-QQ sendFileMsgs. param error");
      }
    }
    do
    {
      return false;
      if (paramList.size() > 0) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.e("QQProxyForQlink", 2, "[QLINK]-QQ sendFileMsgs. no any file");
    return false;
    QlAndQQInterface.SendFileInfos localSendFileInfos = new QlAndQQInterface.SendFileInfos();
    strUin = paramString;
    paramString = paramList.iterator();
    while (paramString.hasNext())
    {
      paramList = (String)paramString.next();
      QlAndQQInterface.SendFileInfo localSendFileInfo = new QlAndQQInterface.SendFileInfo();
      sessionid = FileManagerUtil.a().longValue();
      filePath = paramList;
      fileSize = FileManagerUtil.a(paramList);
      infos.add(localSendFileInfo);
    }
    return a(localSendFileInfos);
  }
  
  public void b() {}
  
  public void b(int paramInt)
  {
    if (1 == paramInt) {
      FileManagerUtil.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getApplicationContext());
    }
  }
  
  public void b(Bundle paramBundle)
  {
    if (paramBundle != null)
    {
      paramBundle = (QlAndQQInterface.WorkState)paramBundle.getSerializable("wstate");
      if (paramBundle != null)
      {
        jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mForIphone = mForIphone;
        jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mMode = mMode;
        jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerNick = mPeerNick;
        jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mPeerUin = mPeerUin;
        jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mState = mState;
        jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mTransferingCount = mTransferingCount;
        jdField_a_of_type_CooperationQlinkQlAndQQInterface$WorkState.mWorking = mWorking;
      }
    }
    for (;;)
    {
      jdField_a_of_type_Int = 0;
      return;
      QLog.e("QQProxyForQlink", 1, "[QLINK]-QQ respHeart. no wstate error");
      continue;
      QLog.e("QQProxyForQlink", 1, "[QLINK]-QQ respHeart. info = null");
    }
  }
  
  public void c()
  {
    QLog.d("QQProxyForQlink", 4, "[QLINK]-QQ nofityQlinkStart");
    j();
  }
  
  public void c(int paramInt)
  {
    Bundle localBundle = new Bundle();
    localBundle.putInt("cmd", paramInt);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a("cmd.sendsimplecmd", localBundle);
  }
  
  public void c(Bundle paramBundle)
  {
    int i = paramBundle.getInt("Event", 0);
    switch (i)
    {
    default: 
      if (QLog.isColorLevel()) {
        QLog.e("QQProxyForQlink", 2, "[QLINK] QQ - unimplement event[" + i + "]");
      }
    case 18: 
    case 19: 
      do
      {
        return;
        a(paramBundle.getString("action_name"), paramBundle.getInt(QlAndQQInterface.a));
        return;
        paramBundle = (QlAndQQInterface.ReportInfo)paramBundle.getSerializable(QlAndQQInterface.a);
      } while (!(data instanceof QlAndQQInterface.ReportPerformanceInfo));
      paramBundle = (QlAndQQInterface.ReportPerformanceInfo)data;
      a(mUin, mTagName, mSuccess, mDuration, mSize, mParams);
      return;
    case 20: 
      QlinkReliableReport.a();
      return;
    case 21: 
      QlinkReliableReport.b();
      return;
    case 15: 
      a((QlAndQQInterface.InsertFMFileInfo)paramBundle.getSerializable(QlAndQQInterface.a));
      return;
    case 16: 
      a(paramBundle.getInt(QlAndQQInterface.a));
      return;
    case 17: 
      a(paramBundle.getString(QlAndQQInterface.a));
      return;
    case 22: 
      c();
      return;
    case 23: 
      a(paramBundle.getBundle(QlAndQQInterface.a));
      return;
    case 24: 
      b(paramBundle.getBundle(QlAndQQInterface.a));
      return;
    }
    b(paramBundle.getInt(QlAndQQInterface.a));
  }
  
  public void d() {}
  
  public void e()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
    {
      if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) && (jdField_a_of_type_AndroidContentBroadcastReceiver != null)) {
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    }
    k();
  }
  
  public void f()
  {
    Bundle localBundle = new Bundle();
    localBundle.putInt("param", 1);
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a("cmd.sendheart", localBundle);
    }
  }
  
  public void g() {}
  
  public void h()
  {
    if (jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
      jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
    }
  }
}
