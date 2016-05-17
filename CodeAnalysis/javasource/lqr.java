import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqr
  implements View.OnClickListener
{
  public lqr(SearchBaseActivity paramSearchBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    a.setResult(1);
    a.finish();
  }
}
