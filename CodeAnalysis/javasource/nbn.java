import android.content.SharedPreferences;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mybusiness.MyBusinessManager;

class nbn
  implements Runnable
{
  nbn(nbm paramNbm)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    ((MyBusinessManager)PhoneContactManagerImp.a(a.a).getManager(48)).a(a.a.a.getString("contact_bind_info_mobile", ""), a.a.a.getInt("contact_bind_type", 0), "");
  }
}
