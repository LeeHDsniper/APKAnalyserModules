import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qzone.LocalMultiProcConfig;

public final class uqp
  implements Runnable
{
  public uqp(String paramString1, String paramString2, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    LocalMultiProcConfig.b(jdField_a_of_type_JavaLangString, b, jdField_a_of_type_Boolean);
  }
}
