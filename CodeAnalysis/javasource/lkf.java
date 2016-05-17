import android.widget.ImageView;
import com.tencent.biz.pubaccount.ecshopassit.EcShopObserver;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lkf
  extends EcShopObserver
{
  public lkf(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void f(boolean paramBoolean, Object paramObject)
  {
    if ((paramBoolean) && (PublicAccountChatPie.a(a).getVisibility() == 8))
    {
      PublicAccountChatPie.b(a).setVisibility(0);
      PublicAccountChatPie.c(a).setOnClickListener(a);
      PublicAccountChatPie.d(a).setImageResource(2130841102);
    }
  }
}
