import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager.IPhoneContactListener;
import mqq.os.MqqHandler;

public class met
  implements PhoneContactManager.IPhoneContactListener
{
  public met(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt)
  {
    BannerManager.a(a).removeMessages(11);
    BannerManager.a(a).sendEmptyMessageDelayed(11, 1000L);
  }
  
  public void a(long paramLong) {}
  
  public void a(boolean paramBoolean, int paramInt) {}
  
  public void b(int paramInt) {}
  
  public void c(int paramInt)
  {
    if ((paramInt & 0x1) != 0)
    {
      BannerManager.a(a).removeMessages(11);
      BannerManager.a(a).sendEmptyMessageDelayed(11, 1000L);
    }
  }
}
