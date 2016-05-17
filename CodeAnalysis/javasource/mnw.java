import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.selectmember.TroopMemberListInnerFrame;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mnw
  implements Runnable
{
  public mnw(TroopMemberListInnerFrame paramTroopMemberListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("TroopMemberListInnerFrame", 2, "read troop members from database before updating data from server");
    }
    Object localObject = TroopMemberListInnerFrame.a(a, a.b);
    localObject = a.a.obtainMessage(1, localObject);
    a.a.sendMessage((Message)localObject);
  }
}
