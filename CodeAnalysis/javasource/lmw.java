import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.tips.FriendHotTipsBar;
import com.tencent.mobileqq.activity.aio.tips.TipsManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lmw
  implements View.OnClickListener
{
  public lmw(FriendHotTipsBar paramFriendHotTipsBar)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    ReportController.b(FriendHotTipsBar.a(a), "CliOper", "", "", "Free_call", "Clk_free_call_tips", 0, 0, "", "", "", "");
    FriendHotTipsBar.c(FriendHotTipsBar.a(a), aa).jdField_a_of_type_JavaLangString);
    FriendHotTipsBar.a(a).a();
    paramView = null;
    String str = null;
    if (aa).jdField_a_of_type_Int == 1006) {
      str = aa).jdField_a_of_type_JavaLangString;
    }
    for (;;)
    {
      ChatActivityUtils.a(FriendHotTipsBar.a(a), FriendHotTipsBar.a(a), aa).jdField_a_of_type_Int, paramView, aa).d, str, true, aa).b, true, true, null, "from_internal");
      ReportController.b(FriendHotTipsBar.a(a), "CliOper", "", "", "Two_call", "Two_call_launch", 0, 0, "8", "", "", "");
      return;
      paramView = aa).jdField_a_of_type_JavaLangString;
    }
  }
}
