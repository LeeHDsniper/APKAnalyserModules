import android.os.Message;
import com.tencent.biz.pubaccount.readinjoy.common.ReadInJoyUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.ChatHistory;
import com.tencent.mobileqq.activity.ChatHistoryForC2C;
import com.tencent.mobileqq.activity.Conversation;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QQHeadDownloadHandler;
import com.tencent.mobileqq.earlydownload.EarlyDownloadManager;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.highway.HwEngine;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.log.ReportLog;
import com.tencent.mobileqq.msf.sdk.handler.INetInfoHandler;
import com.tencent.mobileqq.pic.PresendPicMgrService;
import com.tencent.mobileqq.transfile.FMTSrvAddrProvider;
import com.tencent.mobileqq.transfile.NetworkCenter;
import com.tencent.mobileqq.transfile.SosoSrvAddrProvider;
import com.tencent.mobileqq.utils.httputils.HttpCommunicator;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class ndu
  implements INetInfoHandler
{
  private ndu(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void a()
  {
    NetworkCenter.a().b();
  }
  
  private void a(int paramInt, String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("raw_photo", 2, "type:" + paramInt + ",logmsg:" + paramString);
    }
    if (1 == paramInt) {
      a.I();
    }
    while (2 != paramInt) {
      return;
    }
    a.J();
  }
  
  public void onNetMobile2None()
  {
    a(3, "onNetMobile2None");
    ReportLog.a("Network", "onNetMobile2None()");
    MqqHandler localMqqHandler = a.a(FileManagerNotifyCenter.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(10001, null).sendToTarget();
    }
    localMqqHandler = a.a(Conversation.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(10001, QQAppInterface.a(a).getString(2131366990)).sendToTarget();
    }
    localMqqHandler = a.a(ChatHistoryForC2C.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(27, null).sendToTarget();
    }
    FMTSrvAddrProvider.a().a();
    SosoSrvAddrProvider.a().b();
    a.a().a(1);
    a();
    QQHeadDownloadHandler.b();
    if (QQAppInterface.i(a) != null) {
      QQAppInterface.j(a).onNetMobile2None();
    }
  }
  
  public void onNetMobile2Wifi(String paramString)
  {
    a(2, "onNetMobile2Wifi");
    ReportLog.a("Network", "onNetMobile2Wifi()");
    MqqHandler localMqqHandler = a.a(FileManagerNotifyCenter.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(10001, null).sendToTarget();
    }
    localMqqHandler = a.a(Conversation.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(10001, null).sendToTarget();
    }
    FMTSrvAddrProvider.a().a();
    SosoSrvAddrProvider.a().b();
    a.a().a(1);
    a();
    QQHeadDownloadHandler.b();
    if (QQAppInterface.g(a) != null) {
      QQAppInterface.h(a).onNetMobile2Wifi(paramString);
    }
    a.a();
    paramString = (EarlyDownloadManager)a.getManager(76);
    if (paramString != null) {
      paramString.a();
    }
    ReadInJoyUtils.a(a);
  }
  
  public void onNetNone2Mobile(String paramString)
  {
    a(1, "onNetNone2Mobile");
    ReportLog.a("Network", "onNetNone2Mobile()");
    MqqHandler localMqqHandler = a.a(Conversation.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(10001, null).sendToTarget();
    }
    localMqqHandler = a.a(ChatHistory.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(6, null).sendToTarget();
    }
    localMqqHandler = a.a(ChatHistoryForC2C.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(26).sendToTarget();
    }
    FMTSrvAddrProvider.a().a();
    SosoSrvAddrProvider.a().b();
    a.a().a(2);
    a();
    QQHeadDownloadHandler.b();
    if (QQAppInterface.a(a) != null) {
      QQAppInterface.b(a).onNetNone2Mobile(paramString);
    }
    paramString = (EarlyDownloadManager)a.getManager(76);
    if (paramString != null) {
      paramString.a();
    }
    paramString = a.a(ShortVideoPlayActivity.class);
    if (paramString != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "onNetNone2Mobile");
      }
      paramString.obtainMessage(4).sendToTarget();
    }
  }
  
  public void onNetNone2Wifi(String paramString)
  {
    a(2, "onNetNone2Wifi");
    ReportLog.a("Network", "onNetNone2Wifi()");
    MqqHandler localMqqHandler = a.a(Conversation.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(10001, null).sendToTarget();
    }
    localMqqHandler = a.a(ChatHistory.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(6, null).sendToTarget();
    }
    localMqqHandler = a.a(ChatHistoryForC2C.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(26).sendToTarget();
    }
    FMTSrvAddrProvider.a().a();
    SosoSrvAddrProvider.a().b();
    a.a().a(1);
    a();
    QQHeadDownloadHandler.b();
    if (QQAppInterface.e(a) != null) {
      QQAppInterface.f(a).onNetNone2Wifi(paramString);
    }
    a.a();
    paramString = (EarlyDownloadManager)a.getManager(76);
    if (paramString != null) {
      paramString.a();
    }
    ReadInJoyUtils.a(a);
  }
  
  public void onNetWifi2Mobile(String paramString)
  {
    a(1, "onNetWifi2Mobile");
    Object localObject = PresendPicMgrService.a();
    if (localObject != null) {
      ((PresendPicMgrService)localObject).b();
    }
    ReportLog.a("Network", "onNetWifi2Mobile()");
    localObject = a.a(FileManagerNotifyCenter.class);
    if (localObject != null) {
      ((MqqHandler)localObject).obtainMessage(10001, null).sendToTarget();
    }
    localObject = a.a(Conversation.class);
    if (localObject != null) {
      ((MqqHandler)localObject).obtainMessage(10001, null).sendToTarget();
    }
    FMTSrvAddrProvider.a().a();
    SosoSrvAddrProvider.a().b();
    a.a().a(2);
    a();
    QQHeadDownloadHandler.b();
    if (QQAppInterface.c(a) != null) {
      QQAppInterface.d(a).onNetWifi2Mobile(paramString);
    }
    paramString = (EarlyDownloadManager)a.getManager(76);
    if (paramString != null) {
      paramString.a();
    }
    paramString = a.a(ShortVideoPlayActivity.class);
    if (paramString != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "onNetWifi2Mobile");
      }
      paramString.obtainMessage(4).sendToTarget();
    }
  }
  
  public void onNetWifi2None()
  {
    a(3, "onNetWifi2None");
    ReportLog.a("Network", "onNetWifi2None()");
    MqqHandler localMqqHandler = a.a(FileManagerNotifyCenter.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(10001, null).sendToTarget();
    }
    localMqqHandler = a.a(Conversation.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(10001, QQAppInterface.b(a).getString(2131366990)).sendToTarget();
    }
    localMqqHandler = a.a(ChatHistoryForC2C.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(27, null).sendToTarget();
    }
    FMTSrvAddrProvider.a().a();
    SosoSrvAddrProvider.a().b();
    a.a().a(1);
    a();
    QQHeadDownloadHandler.b();
    if (QQAppInterface.k(a) != null) {
      QQAppInterface.l(a).onNetWifi2None();
    }
  }
}
