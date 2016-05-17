import android.view.View;
import com.tencent.mobileqq.activity.phone.SettingActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class lzl
  implements ActionSheet.OnButtonClickListener
{
  public lzl(SettingActivity2 paramSettingActivity2, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentWidgetActionSheet.cancel();
    DialogUtil.a(jdField_a_of_type_ComTencentMobileqqActivityPhoneSettingActivity2, 230, "停用手机通讯录匹配", "停用后，你将无法使用QQ跟手机通讯录中的朋友联系。服务器上属于你的通讯录加密数据也将被删除。", "停用", "取消", new lzm(this), new lzn(this)).show();
  }
}
