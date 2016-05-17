import android.app.Dialog;
import android.view.View;
import com.tencent.av.utils.VideoMsgTools;
import com.tencent.mobileqq.activity.aio.PlusPanel;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class kqu
  implements ActionSheet.OnButtonClickListener
{
  public kqu(PlusPanel paramPlusPanel, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.a == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.a.isShowing())) {}
    try
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.a.dismiss();
      jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.a = null;
      if ((paramInt < 0) && (paramInt >= 2)) {
        return;
      }
      if (paramInt == 0)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.c();
        ReportController.b(PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel), "CliOper", "", "", "0X8005DC6", "0X8005DC6", 0, 0, "", "", "", "");
      }
      for (;;)
      {
        try
        {
          jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
          return;
        }
        catch (Exception paramView)
        {
          return;
        }
        if (paramInt == 1)
        {
          VideoMsgTools.a(PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel), ajdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel).a, ajdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel).d);
          ReportController.b(PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel), "CliOper", "", "", "0X8005DC7", "0X8005DC7", 0, 0, "", "", "", "");
        }
      }
    }
    catch (Exception paramView)
    {
      for (;;) {}
    }
  }
}
