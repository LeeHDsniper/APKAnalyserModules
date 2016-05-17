import android.content.Intent;
import android.content.res.Resources;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.av.utils.PstnUtils;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.activity.selectmember.ResultRecord;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import java.util.ArrayList;
import java.util.Iterator;
import mqq.app.MobileQQ;

public class mlg
  implements View.OnClickListener
{
  public mlg(PhoneContactSelectActivity paramPhoneContactSelectActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (!NetworkUtil.e(a))
    {
      QQToast.a(a, a.getString(2131366990), 0).b(a.b.getHeight());
      return;
    }
    PstnManager localPstnManager = (PstnManager)a.app.getManager(142);
    Object localObject;
    if ((a.J == 0) && (a.jdField_a_of_type_AndroidContentIntent.getBooleanExtra("sendToVideo", false)) && (localPstnManager.e() == 1) && (PstnUtils.a(a.app, 2)) && (!localPstnManager.b()))
    {
      paramView = a.j.iterator();
      do
      {
        if (!paramView.hasNext()) {
          break;
        }
        localObject = (ResultRecord)paramView.next();
      } while ((jdField_a_of_type_Int != 0) || (!ChatActivityUtils.a(a.app, 0, jdField_a_of_type_JavaLangString)));
    }
    for (int i = 1;; i = 0)
    {
      if ((i == 0) && (a.jdField_a_of_type_JavaUtilArrayList != null))
      {
        paramView = a.jdField_a_of_type_JavaUtilArrayList.iterator();
        while (paramView.hasNext())
        {
          localObject = (String)paramView.next();
          if (ChatActivityUtils.a(a.app, 0, (String)localObject)) {
            i = 1;
          }
        }
      }
      for (;;)
      {
        if ((i != 0) || (NetworkUtil.b(a) == 2))
        {
          paramView = a.app.getApplication().getResources().getString(2131372074);
          localObject = a.app.getApplication().getResources().getString(2131372075);
          String str2 = localPstnManager.a("pstn_multi_trans_wording");
          String str1 = localPstnManager.a("pstn_multi_trans_check_wording");
          if (TextUtils.isEmpty(str2)) {
            if (!TextUtils.isEmpty(str1)) {
              break label369;
            }
          }
          for (;;)
          {
            DialogUtil.a(a, 230, "确认呼叫方式", paramView, (String)localObject, "取消", "呼叫", null, new mlh(this, localPstnManager), new mli(this)).show();
            return;
            paramView = str2;
            break;
            label369:
            localObject = str1;
          }
        }
        if (PhoneContactSelectActivity.a(a)) {
          break;
        }
        a.h();
        return;
        if (PhoneContactSelectActivity.a(a)) {
          break;
        }
        if (a.K == 1005)
        {
          DialogUtil.a(a, 230, a.getResources().getString(2131363891), a.getResources().getString(2131363892), a.getResources().getString(2131363893), a.getResources().getString(2131363894), new mlj(this), new mlk(this)).show();
          return;
        }
        a.h();
        return;
      }
    }
  }
}
