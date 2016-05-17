import android.app.Activity;
import android.util.Pair;
import android.view.View;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.HbThemeConfigManager.HBThemeConfig;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;
import java.util.List;

public class krg
  implements ActionSheet.OnButtonClickListener
{
  public krg(PlusPanelUtils paramPlusPanelUtils, List paramList1, QQAppInterface paramQQAppInterface, Activity paramActivity, SessionInfo paramSessionInfo, List paramList2, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanelUtils.a();
    if ((paramInt < 0) && (paramInt >= jdField_a_of_type_JavaUtilList.size())) {
      return;
    }
    for (;;)
    {
      try
      {
        if (jdField_a_of_type_JavaUtilList.get(paramInt)).second == null) {
          break;
        }
        long l = System.currentTimeMillis();
        if (Math.abs(l - jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanelUtils.a) < 1000L) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanelUtils.a = l;
        paramInt = ((Integer)jdField_a_of_type_JavaUtilList.get(paramInt)).first).intValue();
        if (paramInt == PlusPanelUtils.l)
        {
          PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, null, 1);
          jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
          return;
        }
      }
      catch (Throwable paramView)
      {
        paramView.printStackTrace();
        return;
      }
      if (paramInt == PlusPanelUtils.m) {
        jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanelUtils.a();
      } else {
        PlusPanelUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, (HbThemeConfigManager.HBThemeConfig)b.get(paramInt), 1);
      }
    }
  }
}
