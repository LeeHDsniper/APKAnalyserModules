import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.activity.selectmember.ResultRecord;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.activity.selectmember.SelectMemberInnerFrame;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mmx
  implements AdapterView.OnItemClickListener
{
  public mmx(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onItemClick(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = getTaga;
    if (a.a(paramAdapterView))
    {
      a.a(paramAdapterView);
      a.i();
      paramInt = a.a.a();
      if ((paramInt == 8) || (paramInt == 9) || (paramInt == 6) || (paramInt == 5) || (paramInt == 7) || (paramInt == 2) || (paramInt == 0)) {
        ((SelectMemberInnerFrame)a.a.getCurrentView()).f();
      }
      a.a(false);
    }
  }
}
