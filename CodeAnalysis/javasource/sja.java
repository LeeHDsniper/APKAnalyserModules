import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;

public class sja
  extends WeakReference
{
  private final String a;
  
  public sja(String paramString, Object paramObject, ReferenceQueue paramReferenceQueue)
  {
    super(paramObject, paramReferenceQueue);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramString;
  }
}
