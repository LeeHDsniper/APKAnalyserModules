import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class lau
  extends Handler
{
  public lau(Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ShortVideoRealItemBuilder", 2, "EncodeHandler.handleMessage, msg.what = " + what + ", ret is " + arg1);
    }
    switch (what)
    {
    }
    String str;
    do
    {
      int i;
      do
      {
        return;
        i = arg1;
        paramMessage = paramMessage.getData();
      } while (!QLog.isColorLevel());
      QLog.i("ShortVideoRealItemBuilder", 2, "ret is " + i);
      QLog.i("ShortVideoRealItemBuilder", 2, "data is " + paramMessage);
      return;
      str = paramMessage.getData().getString("maxvideo.file.mp4");
    } while (!QLog.isColorLevel());
    QLog.d("ShortVideoRealItemBuilder", 2, "EncodeHandler.handleMessage MaxVideoConst.MSG_ENDret is " + arg1 + ",targetFile is " + str);
  }
}
