import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class mjp
  implements Runnable
{
  mjp(mjk paramMjk)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    RMVideoStateMgr.a().b(0, "麦克风参数初始化失败", false);
  }
}
