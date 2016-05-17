import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.item.ArkContainerWrapper;
import com.tencent.mobileqq.activity.aio.item.ArkUIView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class kvc
  implements View.OnClickListener
{
  public kvc(ArkUIView paramArkUIView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((a.a != null) && (a.a.get() != null) && (!((ArkContainerWrapper)a.a.get()).a())) {
      a.b();
    }
  }
}
