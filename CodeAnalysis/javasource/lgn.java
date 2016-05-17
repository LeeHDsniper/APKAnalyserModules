import android.text.Editable;
import android.text.SpannableString;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.text.AtTroopMemberSpan;
import com.tencent.widget.XEditTextEx;
import com.tencent.widget.XPanelContainer;

public class lgn
  implements Runnable
{
  public lgn(DiscussChatPie paramDiscussChatPie, boolean paramBoolean, String paramString1, String paramString2)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = 0;
    if (jdField_a_of_type_Boolean)
    {
      j = DiscussChatPie.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie).getSelectionStart();
      DiscussChatPie.b(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie).getEditableText().delete(j - 1, j);
    }
    SpannableString localSpannableString = AtTroopMemberSpan.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_JavaLangString, b, false, DiscussChatPie.c(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie), false);
    if ((localSpannableString == null) || (localSpannableString.length() == 0)) {
      return;
    }
    int j = DiscussChatPie.d(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie).getSelectionStart();
    if (j < 0) {}
    for (;;)
    {
      DiscussChatPie.e(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie).getEditableText().insert(i, localSpannableString);
      DiscussChatPie.a(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDiscussChatPie).a(1);
      return;
      i = j;
    }
  }
}
