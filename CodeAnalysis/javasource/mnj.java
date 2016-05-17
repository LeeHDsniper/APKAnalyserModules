import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.GroupManagerActivity;
import com.tencent.mobileqq.activity.selectmember.SelectMemberBuddyListAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class mnj
  implements View.OnClickListener
{
  public mnj(SelectMemberBuddyListAdapter paramSelectMemberBuddyListAdapter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    GroupManagerActivity.a((Activity)SelectMemberBuddyListAdapter.a(a));
    ReportController.b(SelectMemberBuddyListAdapter.a(a), "CliOper", "", "", "category", "Edit_category", 0, 0, "", "", "", "");
  }
}
