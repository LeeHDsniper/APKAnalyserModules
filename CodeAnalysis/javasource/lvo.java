import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.readinjoy.ReadInJoyObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class lvo
  extends ReadInJoyObserver
{
  public lvo(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    if (QLog.isDevelopLevel()) {
      QLog.i("SplashActivity", 4, "mainobserver onReadInJoyNotifyRedTouchUpdate, isSuccess=" + paramBoolean1 + ",isUpdate=" + paramBoolean2 + ", type=" + paramInt);
    }
    if ((paramBoolean1) && (paramBoolean2) && ((paramInt & 0x2) != 0)) {
      a.h();
    }
  }
}
