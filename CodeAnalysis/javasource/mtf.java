import android.view.View.OnSystemUiVisibilityChangeListener;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.immersive.SystemBarCompact;

public class mtf
  implements View.OnSystemUiVisibilityChangeListener
{
  public mtf(BaseActivity paramBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onSystemUiVisibilityChange(int paramInt)
  {
    boolean bool2 = true;
    SystemBarCompact localSystemBarCompact;
    if (paramInt == 0)
    {
      bool1 = false;
      BaseActivity.mIsInMultiScreen = bool1;
      if (a.mSystemBarComp != null)
      {
        localSystemBarCompact = a.mSystemBarComp;
        if (BaseActivity.mIsInMultiScreen) {
          break label98;
        }
      }
    }
    label98:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      localSystemBarCompact.a(bool1, 0);
      if (QLog.isDevelopLevel()) {
        QLog.d("qqBaseActivity", 4, "onSystemUiVisibilityChange:" + paramInt + ",Activity name:" + getClass().getName());
      }
      return;
      bool1 = true;
      break;
    }
  }
}
