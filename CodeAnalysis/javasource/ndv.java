import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.HashMap;
import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

public class ndv
  extends DefaultHandler
{
  private String jdField_a_of_type_JavaLangString;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  
  public ndv(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
  }
  
  public HashMap a()
  {
    return jdField_a_of_type_JavaUtilHashMap;
  }
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    paramArrayOfChar = new String(paramArrayOfChar, paramInt1, paramInt2);
    if (jdField_a_of_type_JavaLangString != null) {
      jdField_a_of_type_JavaUtilHashMap.put(jdField_a_of_type_JavaLangString, paramArrayOfChar);
    }
  }
  
  public void endDocument()
  {
    super.endDocument();
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
  {
    jdField_a_of_type_JavaLangString = null;
  }
  
  public void startDocument()
  {
    super.startDocument();
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
  {
    jdField_a_of_type_JavaLangString = paramString2;
  }
}
