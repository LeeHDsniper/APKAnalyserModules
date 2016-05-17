import com.tencent.mobileqq.activity.aio.tips.ComicTipsBar;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lmq
  implements Runnable
{
  lmq(lmp paramLmp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (ComicTipsBar.a(a.a) != null) {
      ComicTipsBar.a(a.a).b();
    }
  }
}
