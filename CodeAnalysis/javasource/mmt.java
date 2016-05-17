import com.tencent.av.service.QavWrapper;
import com.tencent.av.service.QavWrapper.OnReadyListener;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mmt
  implements QavWrapper.OnReadyListener
{
  public mmt(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QavWrapper paramQavWrapper) {}
}
