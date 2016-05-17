import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Iterator;

public final class hcv
  implements Iterable
{
  public hcv(Iterable paramIterable, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public Iterator iterator()
  {
    return new hcw(this);
  }
}
