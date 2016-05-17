import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.pubaccount.util.PADetailReportUtil;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseActivity;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseActivity.JumpSrcConstants;
import com.tencent.mobileqq.activity.contact.addcontact.SearchContactsFragment;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.search.util.SearchUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.pb.addcontacts.AccountSearchPb.record;
import java.util.Map;

public class lrb
  implements View.OnClickListener
{
  lrb(SearchContactsFragment paramSearchContactsFragment)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = paramView.getTag();
    lrc localLrc;
    int i;
    boolean bool;
    if ((paramView != null) && ((paramView instanceof lrc)))
    {
      localLrc = (lrc)paramView;
      paramView = a;
      i = b;
      if (c != 2) {
        break label269;
      }
      bool = true;
      paramView.a(i, bool);
      Integer localInteger = (Integer)SearchContactsFragment.a(a).get(Integer.valueOf(b));
      Object localObject = null;
      paramView = (View)localObject;
      if (a != null)
      {
        paramView = (View)localObject;
        if (a.uin != null) {
          paramView = String.valueOf(a.uin.get());
        }
      }
      int j = b;
      if (localInteger == null) {
        break label275;
      }
      i = localInteger.intValue();
      label137:
      SearchUtils.a(j, i, 0, true, paramView, a.d, SearchContactsFragment.c());
      if (b != 80000002) {
        break label326;
      }
      localObject = a.getActivity();
      if ((localObject != null) && ((localObject instanceof SearchBaseActivity)))
      {
        i = ((SearchBaseActivity)localObject).a();
        if (SearchContactsFragment.c() != 12) {
          break label280;
        }
        ReportController.b(a.a, "CliOper", "", "", "0X8006571", "0X8006571", 0, 1, 0, "0", SearchBaseActivity.JumpSrcConstants.a(i), paramView, a.d);
        localObject = PADetailReportUtil.a();
        if (localInteger == null) {
          break label321;
        }
        i = localInteger.intValue();
        ((PADetailReportUtil)localObject).a(2, paramView, i, SearchContactsFragment.c());
      }
    }
    label269:
    label275:
    label280:
    label321:
    label326:
    while (b != 80000003) {
      for (;;)
      {
        return;
        bool = false;
        break;
        i = 0;
        break label137;
        ReportController.b(a.a, "P_CliOper", "Pb_account_lifeservice", "0", "0X8005D20", "0X8005D20", 0, 1, 0, "0", SearchBaseActivity.JumpSrcConstants.a(i), a.d, "");
        continue;
        i = 0;
      }
    }
    if (SearchContactsFragment.c() == 12)
    {
      ReportController.b(a.a, "CliOper", "", "", "0X800658A", "0X800658A", 0, 0, "0", "", a.d, "0");
      return;
    }
    ReportController.b(a.a, "P_CliOper", "Pb_account_lifeservice", "0", "0X8005D95", "0X8005D95", 0, 0, "0", "", a.d, "0");
  }
}
