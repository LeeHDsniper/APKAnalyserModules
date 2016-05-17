import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.BusinessCmrTmpChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lga
  implements View.OnClickListener
{
  public lga(BusinessCmrTmpChatPie paramBusinessCmrTmpChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView.setVisibility(8);
  }
}
