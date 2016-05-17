import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.av.core.VcSystemInfo;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder.BaseHolder;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.VideoItemBuilder;
import com.tencent.mobileqq.data.MessageForVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lcl
  implements View.OnClickListener
{
  public lcl(VideoItemBuilder paramVideoItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (!VideoItemBuilder.a(a)) {}
    do
    {
      do
      {
        return;
        AIOUtils.l = true;
      } while ((!VcSystemInfo.e()) || (!VcSystemInfo.f()));
      paramView = (ChatItemBuilder.BaseHolder)AIOUtils.a(paramView);
    } while (paramView == null);
    paramView = (MessageForVideo)a;
    int i = istroop;
    boolean bool2;
    boolean bool1;
    if (type == 13)
    {
      bool2 = true;
      if (i == 3000)
      {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Multi_call", "Multi_call_disobj", 0, 0, "", "", "", "");
        bool1 = bool2;
      }
    }
    for (;;)
    {
      if ((type == 2) || (type == 24)) {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004009", "", 0, 0, "1", "", "", "");
      }
      if (type == 0) {
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800400A", "", 0, 0, "1", "", "", "");
      }
      VideoItemBuilder.a(a, paramView, bool1, i);
      return;
      bool1 = bool2;
      if (i == 1)
      {
        Long.valueOf(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a).longValue();
        if (extInt == 10)
        {
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005924", "0X8005924", 0, 0, "", "", "", "");
          bool1 = bool2;
        }
        else
        {
          ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80046CA", "0X80046CA", 0, 0, "", "", "", "");
          bool1 = bool2;
          continue;
          bool1 = false;
        }
      }
    }
  }
}
