import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class kpl
  extends ThreadLocal
{
  private static final int a = 1024;
  
  public kpl()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected char[] a()
  {
    return new char['Ѐ'];
  }
}
