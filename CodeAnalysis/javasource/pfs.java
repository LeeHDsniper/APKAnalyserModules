import android.os.Bundle;
import android.text.TextUtils;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.DiscussionObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.qphone.base.util.QLog;

public class pfs
  extends DiscussionObserver
{
  public pfs(ForwardBaseOption paramForwardBaseOption)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardBaseOption", 2, "updateDiscussionInfo start: isSuccess=" + paramBoolean);
    }
    String str = (String)paramArrayOfObject[0];
    boolean bool = ((Boolean)paramArrayOfObject[1]).booleanValue();
    paramArrayOfObject = a.jdField_a_of_type_AndroidOsBundle.getString("uin");
    if ((paramArrayOfObject.equals(str)) && (paramBoolean) && (bool))
    {
      paramArrayOfObject = ((DiscussionManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52)).a(paramArrayOfObject);
      if ((paramArrayOfObject != null) && (!TextUtils.isEmpty(discussionName)) && (a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null)) {
        a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setTitle("发送到 讨论组" + discussionName);
      }
    }
  }
}
