import android.os.Handler.Callback;
import android.os.Message;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.recent.RecentT9SearchActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.t9search.T9KeyBoard;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.qphone.base.util.QLog;

public class mhc
  implements Handler.Callback
{
  public mhc(RecentT9SearchActivity paramRecentT9SearchActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if (paramMessage != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("RecentT9SearchActivity", 2, "mCallback|handleMessage msg.arg1=" + arg1);
      }
      if (arg1 == 1)
      {
        RecentT9SearchActivity.a(a).a();
        if (!TextUtils.isEmpty(RecentT9SearchActivity.a(a))) {
          SharedPreUtils.c(a, a.app.a(), RecentT9SearchActivity.a(a));
        }
      }
    }
    return false;
  }
}
