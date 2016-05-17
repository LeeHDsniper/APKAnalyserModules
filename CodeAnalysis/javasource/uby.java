import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class uby
{
  private int a;
  private int b;
  
  private uby()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a()
  {
    return a;
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    a = paramInt1;
    b = paramInt2;
  }
  
  public int b()
  {
    return b;
  }
}
