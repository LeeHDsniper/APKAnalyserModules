import android.content.res.Resources;
import android.view.View;
import com.tencent.biz.TroopMemberLbs.TroopMemberLbsHelper;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.PlusPanel;
import com.tencent.mobileqq.activity.aio.PlusPanelUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class kqt
  implements ActionSheet.OnButtonClickListener
{
  public kqt(PlusPanel paramPlusPanel, boolean paramBoolean, ActionSheet paramActionSheet)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    switch (paramInt)
    {
    default: 
    case 0: 
      for (;;)
      {
        jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
        return;
        PlusPanelUtils.a(PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel), PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel).a());
        if (PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel) != null) {
          PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel).a().setCanLock(false);
        }
      }
    }
    if (!NetworkUtil.e(BaseApplicationImpl.getContext()))
    {
      QQToast.a(BaseApplicationImpl.getContext(), 2131366990, 0).b(BaseApplicationImpl.getContext().getResources().getDimensionPixelSize(2131492908));
      return;
    }
    paramView = ((TroopManager)PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel).getManager(51)).d(ajdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel).a);
    if (!jdField_a_of_type_Boolean) {}
    for (boolean bool = true;; bool = false)
    {
      TroopMemberLbsHelper.a(paramView, bool, PlusPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel), jdField_a_of_type_ComTencentMobileqqActivityAioPlusPanel.getContext());
      break;
    }
  }
}
