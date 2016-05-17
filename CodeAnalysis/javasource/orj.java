import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.app.FileManagerEngine;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.FileManagerRSCenter;
import com.tencent.mobileqq.filemanager.settings.FMSettings;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class orj
  extends BroadcastReceiver
{
  private orj(FileManagerEngine paramFileManagerEngine)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    QLog.i("FileManagerEngine<FileAssistant>", 1, "!!!extCard changed[" + paramIntent.getAction() + "]!!!");
    paramContext = paramIntent.getAction();
    if ((paramContext.equalsIgnoreCase("android.intent.action.MEDIA_UNMOUNTED")) || (paramContext.equalsIgnoreCase("android.intent.action.MEDIA_UNMOUNTABLE")) || (paramContext.equalsIgnoreCase("android.intent.action.MEDIA_EJECT")) || (paramContext.equalsIgnoreCase("android.intent.action.MEDIA_REMOVED"))) {
      FMSettings.a().a("externalSdCard");
    }
    try
    {
      a.a.a().a(true);
      if ((paramContext.equalsIgnoreCase("android.intent.action.MEDIA_MOUNTED")) || (paramContext.equalsIgnoreCase("android.intent.action.MEDIA_SCANNER_STARTED"))) {
        FMSettings.a().a();
      }
      a.a.a().a(true, 3, null);
      return;
    }
    catch (Exception paramIntent)
    {
      for (;;) {}
    }
  }
}
