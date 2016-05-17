import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.photo.AIOGallerySceneWithBusiness;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.structmsg.StructMsgForImageShare;

public class ldq
  implements View.OnClickListener
{
  public ldq(AIOGallerySceneWithBusiness paramAIOGallerySceneWithBusiness)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (paramView == a.b)
    {
      paramView = paramView.getTag();
      if ((paramView instanceof StructMsgForImageShare)) {}
    }
    do
    {
      do
      {
        return;
        a.b((StructMsgForImageShare)paramView, "5");
        return;
        if (paramView != a.c) {
          break;
        }
        paramView = paramView.getTag();
      } while (!(paramView instanceof StructMsgForImageShare));
      a.c((StructMsgForImageShare)paramView, "5");
      return;
    } while (paramView != a.d);
    paramView = paramView.getTag();
    if ((paramView instanceof StructMsgForImageShare)) {
      paramView = (StructMsgForImageShare)paramView;
    }
    a.p();
  }
}
