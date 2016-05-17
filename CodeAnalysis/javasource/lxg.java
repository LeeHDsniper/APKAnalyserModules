import android.widget.BaseAdapter;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity.AnimationScrollListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lxg
  implements Runnable
{
  public lxg(AvatarPendantActivity.AnimationScrollListener paramAnimationScrollListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.b.u == 0)
    {
      URLDrawable.resume();
      a.b.a.a = false;
      a.b.a.notifyDataSetChanged();
    }
  }
}
