import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.activity.selectmember.ResultRecord;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import java.util.ArrayList;
import java.util.Iterator;

public class mmy
  implements View.OnClickListener
{
  public mmy(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (a.L == 11) {
      if (a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 0) {
        ReportController.b(a.app, "CliOper", "", "", "0X8005527", "0X8005527", 0, 0, "", "", "", "");
      }
    }
    while (!NetworkUtil.e(a))
    {
      QQToast.a(a, a.getString(2131366990), 0).b(a.b.getHeight());
      return;
      if (a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 2)
      {
        ReportController.b(a.app, "CliOper", "", "", "0X8005526", "0X8005526", 0, 0, "", "", "", "");
        continue;
        if (a.L == 10) {
          if (a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 0) {
            ReportController.b(a.app, "CliOper", "", "", "0X8005522", "0X8005522", 0, 0, "", "", "", "");
          } else if (a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 2) {
            ReportController.b(a.app, "CliOper", "", "", "0X8005521", "0X8005521", 0, 0, "", "", "", "");
          }
        }
      }
    }
    paramView = a.j.iterator();
    do
    {
      if (!paramView.hasNext()) {
        break;
      }
    } while (nextjdField_a_of_type_Int == 5);
    for (int i = 1;; i = 0)
    {
      if ((a.jdField_a_of_type_AndroidContentIntent != null) && (a.jdField_a_of_type_AndroidContentIntent.getBooleanExtra("ShowJoinDiscTips", false)) && (i != 0))
      {
        DialogUtil.a(a, 230, a.getString(2131363425), a.getString(2131367976), 2131363432, 2131363433, new mmz(this), new mna(this)).show();
        ReportController.b(null, "CliOper", "", "", "0X8004CED", "0X8004CED", 0, 0, "", "", "", "");
        return;
      }
      ResultRecord localResultRecord;
      Intent localIntent;
      if (a.L == 12) {
        if (a.j.size() == 1)
        {
          localResultRecord = (ResultRecord)a.j.get(0);
          localIntent = new Intent();
          localIntent.putExtra("select_memeber_single_friend", true);
          localIntent.putExtra("select_memeber_single_friend_type", jdField_a_of_type_Int);
          if ((jdField_a_of_type_Int == 0) && (jdField_a_of_type_Int != 1)) {
            break label723;
          }
          i = 1000;
        }
      }
      for (paramView = a.a(c);; paramView = null)
      {
        if (jdField_a_of_type_Int == 2)
        {
          paramView = c;
          i = 1004;
        }
        for (;;)
        {
          if (jdField_a_of_type_Int == 3) {
            i = 1021;
          }
          label717:
          for (;;)
          {
            Object localObject = ((FriendsManager)a.app.getManager(50)).c(jdField_a_of_type_JavaLangString);
            int j = i;
            if (localObject != null)
            {
              j = i;
              if (((Friends)localObject).isFriend()) {
                j = 0;
              }
            }
            localObject = new Bundle();
            ((Bundle)localObject).putString("uin", jdField_a_of_type_JavaLangString);
            ((Bundle)localObject).putInt("uintype", j);
            ((Bundle)localObject).putString("uinname", b);
            ((Bundle)localObject).putString("troop_uin", paramView);
            localIntent.putExtras((Bundle)localObject);
            a.setResult(-1, localIntent);
            a.finish();
            for (;;)
            {
              ReportController.b(a.app, "CliOper", "", "", "0X8005446", "0X8005446", 0, 0, "", "", "", "");
              return;
              if (jdField_a_of_type_Int != 4) {
                break label717;
              }
              i = 1006;
              break;
              a.h();
              continue;
              a.h();
            }
          }
        }
        label723:
        i = 0;
      }
    }
  }
}
