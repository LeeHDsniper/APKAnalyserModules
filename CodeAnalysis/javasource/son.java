import android.content.Context;
import android.content.Intent;
import android.content.Intent.ShortcutIconResource;
import android.content.res.Resources;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ShortcutUtils;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public final class son
  implements Runnable
{
  public son(Context paramContext, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    boolean bool = ShortcutUtils.a(jdField_a_of_type_AndroidContentContext, new String[] { jdField_a_of_type_AndroidContentContext.getString(2131366985) });
    if (QLog.isColorLevel()) {
      QLog.d(ShortcutUtils.a(), 2, "createShortcut " + bool + ", " + ShortcutUtils.a());
    }
    if (bool)
    {
      if (ShortcutUtils.b() < 3) {
        ThreadManager.b().postDelayed(this, 1000L);
      }
      return;
    }
    Intent localIntent1 = new Intent("android.intent.action.MAIN");
    localIntent1.setClassName(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_JavaLangString);
    localIntent1.addCategory("android.intent.category.LAUNCHER");
    localIntent1.addFlags(268435456);
    localIntent1.addFlags(2097152);
    Intent localIntent2 = new Intent();
    localIntent2.putExtra("android.intent.extra.shortcut.INTENT", localIntent1);
    localIntent2.putExtra("android.intent.extra.shortcut.NAME", jdField_a_of_type_AndroidContentContext.getResources().getString(2131366985));
    localIntent2.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", Intent.ShortcutIconResource.fromContext(jdField_a_of_type_AndroidContentContext.getApplicationContext(), 2130838445));
    localIntent2.putExtra("duplicate", false);
    localIntent2.setAction("com.android.launcher.action.INSTALL_SHORTCUT");
    jdField_a_of_type_AndroidContentContext.sendOrderedBroadcast(localIntent2, null);
  }
}
