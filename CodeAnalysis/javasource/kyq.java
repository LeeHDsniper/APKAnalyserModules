import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.MixedImageOnclickListener;
import com.tencent.mobileqq.activity.aio.item.MixedMsgItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kyq
  implements View.OnClickListener
{
  public kyq(MixedMsgItemBuilder paramMixedMsgItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    if (MixedMsgItemBuilder.a(a)) {
      return;
    }
    MixedMsgItemBuilder.a(a).onClick(paramView);
  }
}
