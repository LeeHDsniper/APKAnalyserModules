import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class hcx
{
  private long jdField_a_of_type_Long;
  private String jdField_a_of_type_JavaLangString;
  private Throwable jdField_a_of_type_JavaLangThrowable;
  private long b;
  private long c;
  
  public hcx(long paramLong1, String paramString, long paramLong2, Throwable paramThrowable)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    c = -1L;
    jdField_a_of_type_Long = paramLong1;
    jdField_a_of_type_JavaLangString = paramString;
    b = paramLong2;
    jdField_a_of_type_JavaLangThrowable = paramThrowable;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(jdField_a_of_type_Long);
    localStringBuilder.append(",");
    localStringBuilder.append(jdField_a_of_type_JavaLangString);
    localStringBuilder.append(",");
    localStringBuilder.append(b);
    localStringBuilder.append(",");
    localStringBuilder.append(c);
    return localStringBuilder.toString();
  }
}
