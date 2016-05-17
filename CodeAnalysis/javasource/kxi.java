import android.app.Activity;
import android.view.View;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil.TipsClickedInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kxi
  implements FileManagerUtil.TipsClickedInterface
{
  public kxi(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(View paramView)
  {
    FileManagerUtil.b((Activity)a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
  }
}
