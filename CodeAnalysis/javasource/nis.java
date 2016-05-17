import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.step.UpdateTroop;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class nis
  extends TroopObserver
{
  private nis(UpdateTroop paramUpdateTroop)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "updateTroopList:" + paramBoolean);
    }
    if (!paramBoolean)
    {
      a.a(6);
      return;
    }
    aa).a.edit().putBoolean("isTrooplistok", true).commit();
    UpdateTroop.b(a).a(3, true, Integer.valueOf(2));
    a.a(7);
  }
}
