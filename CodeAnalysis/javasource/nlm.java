import android.content.ContentValues;
import android.text.TextUtils;
import com.tencent.mobileqq.app.proxy.DataLineMsgProxy;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nlm
  implements Runnable
{
  public nlm(DataLineMsgProxy paramDataLineMsgProxy, long paramLong, String paramString, byte[] paramArrayOfByte)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    DataLineMsgRecord localDataLineMsgRecord = jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.a(jdField_a_of_type_Long);
    ContentValues localContentValues = new ContentValues();
    if (!TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
      localContentValues.put("serverPath", jdField_a_of_type_JavaLangString);
    }
    if ((jdField_a_of_type_ArrayOfByte != null) && (jdField_a_of_type_ArrayOfByte.length > 0)) {
      localContentValues.put("md5", jdField_a_of_type_ArrayOfByte);
    }
    if (localDataLineMsgRecord != null) {
      jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.a(jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.jdField_a_of_type_JavaLangString, localContentValues, "msgId=?", new String[] { String.valueOf(msgId) }, null);
    }
  }
}
