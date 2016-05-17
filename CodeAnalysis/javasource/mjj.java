import com.tencent.mobileqq.activity.richmedia.state.RMVideoState;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMViewSTInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mjj
  extends RMVideoState
{
  private static final String a = "RMVideoIdleState";
  
  public mjj()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    aa.f();
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoIdleState", 2, "[@] initState end");
    }
  }
  
  public boolean a()
  {
    RMVideoStateMgr.a().a("RMVideoIdleState");
    return true;
  }
  
  public void b()
  {
    RMVideoStateMgr localRMVideoStateMgr = RMVideoStateMgr.a();
    if (QLog.isColorLevel()) {
      QLog.d("RMVideoIdleState", 2, "[@] realDeleteVideoSegment ...");
    }
    a.a(100);
    localRMVideoStateMgr.a(3);
  }
}
