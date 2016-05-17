import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.filemanager.activity.FMActivity;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil.TipsClickedInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kxj
  implements FileManagerUtil.TipsClickedInterface
{
  public kxj(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(View paramView)
  {
    paramView = new Intent((Activity)a.jdField_a_of_type_AndroidContentContext, FMActivity.class);
    paramView.putExtra("tab_tab_type", 0);
    paramView.putExtra("uin", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    a.jdField_a_of_type_AndroidContentContext.startActivity(paramView);
    FileManagerReporter.a("0X800506C");
  }
}
