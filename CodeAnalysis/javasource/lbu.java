import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder;
import com.tencent.mobileqq.activity.aio.item.ThumbItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vip.DownloadListener;
import com.tencent.mobileqq.vip.DownloadTask;
import com.tencent.qphone.base.util.QLog;

public class lbu
  extends DownloadListener
{
  public lbu(ThumbItemBuilder paramThumbItemBuilder, String paramString1, String paramString2)
  {
    super(paramString1, paramString2);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onCancel(DownloadTask paramDownloadTask)
  {
    if (QLog.isColorLevel()) {
      QLog.d(ChatItemBuilder.a, 2, "coverDownloadListener.onCancel| task:" + paramDownloadTask);
    }
  }
  
  public void onDone(DownloadTask paramDownloadTask)
  {
    if (QLog.isColorLevel()) {
      QLog.d(ChatItemBuilder.a, 2, "coverDownloadListener.onDone| task:" + paramDownloadTask);
    }
    if (paramDownloadTask.b()) {}
    do
    {
      return;
      paramDownloadTask.a().getInt("type");
    } while (paramDownloadTask.a() == -1);
    paramDownloadTask = new Message();
    what = ThumbItemBuilder.jdField_a_of_type_Int;
    a.jdField_a_of_type_AndroidOsHandler.sendMessage(paramDownloadTask);
  }
  
  public boolean onStart(DownloadTask paramDownloadTask)
  {
    if (QLog.isColorLevel()) {
      QLog.d(ChatItemBuilder.a, 2, "coverDownloadListener.onStart| task:" + paramDownloadTask);
    }
    return true;
  }
}
