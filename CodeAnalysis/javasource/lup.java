import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.observer.GameCenterObserver;
import com.tencent.qphone.base.util.QLog;

public class lup
  extends GameCenterObserver
{
  public lup(MainAssistObserver paramMainAssistObserver)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    if ((paramBoolean1) && (paramBoolean2) && (paramInt != 2)) {
      if (QLog.isColorLevel()) {
        QLog.d("MainActivity", 2, "inform onGameCenterMsgReceive.type=" + paramInt);
      }
    }
    switch (paramInt)
    {
    case 2: 
    case 3: 
    default: 
      return;
    case 0: 
      a.h();
      return;
    case 1: 
      a.h();
      return;
    case 4: 
      a.h();
      return;
    }
    a.h();
    a.f();
    a.g();
  }
}
