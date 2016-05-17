import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import com.tencent.mobileqq.activity.selectmember.CreateFaceToFaceDiscussionActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;

public class mkd
  extends BroadcastReceiver
{
  public mkd(CreateFaceToFaceDiscussionActivity paramCreateFaceToFaceDiscussionActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if ((NetworkUtil.e(a.jdField_a_of_type_AndroidContentContext)) && (a.b) && (a.isResume()))
    {
      if (a.jdField_a_of_type_AndroidOsHandler.hasMessages(0)) {
        a.jdField_a_of_type_AndroidOsHandler.removeMessages(0);
      }
      a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(0);
    }
  }
}
