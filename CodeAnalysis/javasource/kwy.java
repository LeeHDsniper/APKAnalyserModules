import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.activity.specialcare.QQSpecialCareSettingActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.VipUtils;

public class kwy
  implements View.OnClickListener
{
  public kwy(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent(a.jdField_a_of_type_AndroidContentContext, QQSpecialCareSettingActivity.class);
    paramView.putExtra("key_friend_uin", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    a.jdField_a_of_type_AndroidContentContext.startActivity(paramView);
    VipUtils.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "Vip_SpecialRemind", "0X8005057", "0X8005057", 0, 1, new String[0]);
  }
}
