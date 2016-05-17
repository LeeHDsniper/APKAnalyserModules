import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Map;

class meb
  implements Runnable
{
  meb(mea paramMea)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    synchronized (mea.a(a))
    {
      Map localMap = mea.a(a).a();
      if ((localMap != null) && (!localMap.isEmpty())) {
        mea.a(a).putAll(localMap);
      }
      return;
    }
  }
}
