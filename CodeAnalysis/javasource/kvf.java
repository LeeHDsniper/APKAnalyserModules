import android.view.View;
import com.tencent.mobileqq.activity.aio.item.DeviceFileItemBuilder;
import com.tencent.mobileqq.data.MessageForDeviceFile;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class kvf
  implements ActionSheet.OnButtonClickListener
{
  public kvf(DeviceFileItemBuilder paramDeviceFileItemBuilder, MessageForDeviceFile paramMessageForDeviceFile, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceFileItemBuilder.b(jdField_a_of_type_ComTencentMobileqqDataMessageForDeviceFile);
    jdField_a_of_type_ComTencentMobileqqActivityAioItemDeviceFileItemBuilder.a();
    jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
  }
}
