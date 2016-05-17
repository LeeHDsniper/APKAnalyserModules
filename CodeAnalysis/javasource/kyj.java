import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class kyj
  implements Runnable
{
  kyj(kyg paramKyg)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((a.a.b != null) && ((a.a.b instanceof FragmentActivity)))
    {
      FragmentActivity localFragmentActivity = (FragmentActivity)a.a.b;
      if ((localFragmentActivity.getChatFragment() != null) && (localFragmentActivity.getChatFragment().a() != null)) {
        localFragmentActivity.getChatFragment().a().L();
      }
    }
  }
}
