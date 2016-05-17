import android.view.View;
import android.widget.LinearLayout.LayoutParams;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawableDownListener;
import com.tencent.mobileqq.activity.qqcard.QQCardHeader;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.widget.ADView;

public class mcl
  implements URLDrawableDownListener
{
  public mcl(QQCardHeader paramQQCardHeader)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onLoadCancelled(View paramView, URLDrawable paramURLDrawable) {}
  
  public void onLoadFailed(View paramView, URLDrawable paramURLDrawable, Throwable paramThrowable) {}
  
  public void onLoadInterrupted(View paramView, URLDrawable paramURLDrawable, InterruptedException paramInterruptedException) {}
  
  public void onLoadProgressed(View paramView, URLDrawable paramURLDrawable, int paramInt) {}
  
  public void onLoadSuccessed(View paramView, URLDrawable paramURLDrawable)
  {
    int i = (int)(paramURLDrawable.getIntrinsicHeight() / paramURLDrawable.getIntrinsicWidth() * (float)DeviceInfoUtil.f() + 0.5F);
    a.a.getLayoutParams()).height = i;
  }
}
