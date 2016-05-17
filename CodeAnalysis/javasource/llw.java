import android.text.TextUtils;
import com.tencent.biz.anonymous.AnonymousChatHelper.AnonymousStatusListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqHandler;

public class llw
  implements AnonymousChatHelper.AnonymousStatusListener
{
  public llw(TroopChatPie paramTroopChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString1, String paramString2)
  {
    if ((!TextUtils.isEmpty(paramString1)) && (paramString1.equals(a.a.a))) {
      TroopChatPie.i(a).post(new llx(this, paramString2));
    }
  }
}
