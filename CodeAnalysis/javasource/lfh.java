import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import com.tencent.biz.ui.CustomMenuBar;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lfh
  implements View.OnClickListener
{
  public lfh(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    BusinessCmrTmpChatPie.a(a).setVisibility(8);
    BusinessCmrTmpChatPie.a(a).setVisibility(0);
  }
}
