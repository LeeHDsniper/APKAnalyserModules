import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopFileError.TroopFileErrorFilter;

public class lmn
  implements TroopFileError.TroopFileErrorFilter
{
  public String a;
  
  public lmn(String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramString;
  }
  
  public long a()
  {
    try
    {
      long l = Long.parseLong(a);
      return l;
    }
    catch (Exception localException) {}
    return 0L;
  }
}
