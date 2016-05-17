import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mmu
  implements View.OnClickListener
{
  public mmu(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    a.onBackEvent();
    if (AppSetting.i) {
      a.b.post(new mmv(this));
    }
  }
}
