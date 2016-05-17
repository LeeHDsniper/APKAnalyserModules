import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Handler.Callback;
import android.os.Message;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.widget.RedDotRadioButton;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;

public class mgq
  implements Handler.Callback
{
  public mgq(RecentCallHelper paramRecentCallHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return false;
      if ((obj != null) && ((obj instanceof Boolean)))
      {
        RecentCallHelper.a(a).a(((Boolean)obj).booleanValue());
        continue;
        if ((obj != null) && ((obj instanceof Integer)))
        {
          a.a(BaseApplication.getContext());
          SharedPreUtils.a(a.a.a()).edit().putInt("show_tab_lightalk_tips", ((Integer)obj).intValue() + 1).commit();
          continue;
          a.h();
          if (QLog.isColorLevel()) {
            QLog.d("RecentCallHelper", 2, "dismiss lightalk tips");
          }
        }
      }
    }
  }
}
