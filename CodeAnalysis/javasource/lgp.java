import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lgp
  implements DialogInterface.OnClickListener
{
  lgp(lgo paramLgo, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    ((DiscussionManager)jdField_a_of_type_Lgo.a.a.getManager(52)).a(jdField_a_of_type_JavaLangString);
    paramDialogInterface = jdField_a_of_type_Lgo.a.a.a().a();
    RecentUser localRecentUser = paramDialogInterface.b(jdField_a_of_type_JavaLangString, 3000);
    if (localRecentUser != null) {
      paramDialogInterface.b(localRecentUser);
    }
    jdField_a_of_type_Lgo.a.v();
  }
}
