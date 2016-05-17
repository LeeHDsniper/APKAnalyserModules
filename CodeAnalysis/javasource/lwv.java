import android.os.Build.VERSION;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity.AnimationScrollListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public class lwv
  extends AvatarPendantActivity.AnimationScrollListener
{
  public lwv(AvatarPendantActivity paramAvatarPendantActivity)
  {
    super(paramAvatarPendantActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if (a.e == AvatarPendantActivity.d) {}
    while (Build.VERSION.SDK_INT < 14) {
      return;
    }
    a.b();
  }
}
