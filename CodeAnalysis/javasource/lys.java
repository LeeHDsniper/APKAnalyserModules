import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lys
{
  public String a;
  public boolean a;
  public String b;
  public String c;
  public String d;
  
  public lys(String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    String[] arrayOfString = paramString.split(" ");
    if (arrayOfString.length == 1)
    {
      jdField_a_of_type_JavaLangString = arrayOfString[0];
      jdField_a_of_type_Boolean = true;
      return;
    }
    if (arrayOfString.length == 4)
    {
      b = arrayOfString[0];
      c = arrayOfString[1];
      jdField_a_of_type_Boolean = false;
      jdField_a_of_type_JavaLangString = arrayOfString[3];
      return;
    }
    if (arrayOfString.length > 4)
    {
      int j = arrayOfString.length;
      paramString = "";
      int i = 0;
      while (i < j - 4)
      {
        paramString = paramString + arrayOfString[i] + " ";
        i += 1;
      }
      d = paramString;
      b = arrayOfString[(j - 4)];
      c = arrayOfString[(j - 3)];
      jdField_a_of_type_Boolean = false;
      jdField_a_of_type_JavaLangString = arrayOfString[(j - 1)];
      return;
    }
    throw new RuntimeException("format error!");
  }
}
