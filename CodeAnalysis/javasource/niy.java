import com.tencent.mobileqq.app.message.AccostMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public class niy
{
  public int a;
  public long a;
  public String a;
  public ArrayList a;
  public byte[] a;
  public long b;
  public String b;
  public long c;
  public long d;
  public long e;
  
  public niy(AccostMessageProcessor paramAccostMessageProcessor, long paramLong1, int paramInt, long paramLong2, long paramLong3, ArrayList paramArrayList, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = paramLong1;
    jdField_a_of_type_Int = paramInt;
    b = paramLong2;
    c = paramLong3;
    jdField_a_of_type_JavaUtilArrayList = paramArrayList;
    jdField_a_of_type_JavaLangString = paramString;
  }
  
  public niy(AccostMessageProcessor paramAccostMessageProcessor, long paramLong, ArrayList paramArrayList)
  {
    jdField_a_of_type_Long = paramLong;
    jdField_a_of_type_JavaUtilArrayList = paramArrayList;
  }
}
