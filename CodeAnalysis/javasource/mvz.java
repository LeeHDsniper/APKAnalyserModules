import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

public class mvz
  extends DefaultHandler
{
  private int jdField_a_of_type_Int;
  public String a;
  private StringBuffer jdField_a_of_type_JavaLangStringBuffer;
  public HashMap a;
  private Pattern jdField_a_of_type_JavaUtilRegexPattern;
  private boolean jdField_a_of_type_Boolean;
  private String b;
  
  public mvz(HashMap paramHashMap)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangStringBuffer = new StringBuffer();
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Int = 0;
    b = "0";
    jdField_a_of_type_JavaLangString = "";
    jdField_a_of_type_JavaUtilRegexPattern = Pattern.compile("^([0-9]{1,5}|\\{([\\s\\S]*)\\})$");
    jdField_a_of_type_JavaUtilHashMap = paramHashMap;
  }
  
  private boolean a(String paramString)
  {
    if ((paramString == null) || (paramString.length() == 0)) {
      return false;
    }
    return jdField_a_of_type_JavaUtilRegexPattern.matcher(paramString).matches();
  }
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_Boolean) {
      jdField_a_of_type_JavaLangStringBuffer.append(paramArrayOfChar, paramInt1, paramInt2);
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
  {
    if (jdField_a_of_type_Boolean)
    {
      if (!a(jdField_a_of_type_JavaLangStringBuffer.toString()))
      {
        if (QLog.isColorLevel()) {
          QLog.e(DeviceProfileManager.jdField_a_of_type_JavaLangString, 2, "DPCXmlHandler format is error: " + paramString2 + "-" + jdField_a_of_type_JavaLangStringBuffer.toString());
        }
        return;
      }
      if (!jdField_a_of_type_JavaUtilHashMap.containsKey(paramString2)) {
        break label232;
      }
      paramString1 = (mwa)jdField_a_of_type_JavaUtilHashMap.get(paramString2);
      if (QLog.isColorLevel()) {
        QLog.d(DeviceProfileManager.jdField_a_of_type_JavaLangString, 2, "DPCXmlHandler parse to TEMPMAP update oldInfo: " + paramString2 + "-" + paramString1.toString());
      }
      if (jdField_a_of_type_Int < jdField_a_of_type_Int)
      {
        jdField_a_of_type_Int = jdField_a_of_type_Int;
        b = jdField_a_of_type_JavaLangStringBuffer.toString();
        c = b;
        d = jdField_a_of_type_JavaLangString;
      }
      if (QLog.isColorLevel()) {
        QLog.d(DeviceProfileManager.jdField_a_of_type_JavaLangString, 2, "DPCXmlHandler parse to TEMPMAP update newInfo: " + paramString2 + "-" + paramString1.toString());
      }
    }
    for (;;)
    {
      jdField_a_of_type_Boolean = false;
      return;
      label232:
      paramString1 = new mwa();
      jdField_a_of_type_JavaLangString = paramString2;
      b = jdField_a_of_type_JavaLangStringBuffer.toString();
      c = b;
      jdField_a_of_type_Int = jdField_a_of_type_Int;
      d = jdField_a_of_type_JavaLangString;
      jdField_a_of_type_JavaUtilHashMap.put(paramString2, paramString1);
      if (QLog.isColorLevel()) {
        QLog.d(DeviceProfileManager.jdField_a_of_type_JavaLangString, 2, "DPCXmlHandler parse to TEMPMAP add: " + paramString2 + "-" + paramString1.toString());
      }
    }
  }
  
  public void startDocument()
  {
    super.startDocument();
    if (jdField_a_of_type_JavaUtilHashMap == null) {
      jdField_a_of_type_JavaUtilHashMap = new HashMap();
    }
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
  {
    int i = 0;
    if (paramString2.equals("features"))
    {
      if (i < paramAttributes.getLength())
      {
        if (paramAttributes.getLocalName(i).equals("weight")) {
          jdField_a_of_type_Int = Integer.parseInt(paramAttributes.getValue(i));
        }
        for (;;)
        {
          i += 1;
          break;
          if (paramAttributes.getLocalName(i).equals("taskId")) {
            b = paramAttributes.getValue(i);
          } else if (paramAttributes.getLocalName(i).equals("testType")) {
            jdField_a_of_type_JavaLangString = paramAttributes.getValue(i);
          }
        }
      }
    }
    else
    {
      jdField_a_of_type_Boolean = true;
      jdField_a_of_type_JavaLangStringBuffer.delete(0, jdField_a_of_type_JavaLangStringBuffer.length());
    }
  }
}
