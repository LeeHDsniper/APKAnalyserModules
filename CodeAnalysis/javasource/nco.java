import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.concurrent.ThreadFactory;

public class nco
  implements ThreadFactory
{
  public int a;
  public String a;
  
  public nco(String paramString, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_JavaLangString = paramString;
  }
  
  public Thread newThread(Runnable paramRunnable)
  {
    paramRunnable = new Thread(paramRunnable, jdField_a_of_type_JavaLangString);
    paramRunnable.setPriority(jdField_a_of_type_Int);
    return paramRunnable;
  }
}
