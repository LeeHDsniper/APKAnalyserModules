import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.DiscussionObserver;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.step.UpdateDiscuss;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class nio
  extends DiscussionObserver
{
  private nio(UpdateDiscuss paramUpdateDiscuss)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "updateDiscussionList: " + paramBoolean);
    }
    if (!paramBoolean)
    {
      a.a(6);
      return;
    }
    aa).a.edit().putBoolean("isDiscussionlistok", true).commit();
    UpdateDiscuss.b(a).a(3, true, Integer.valueOf(3));
    a.a(7);
  }
}
