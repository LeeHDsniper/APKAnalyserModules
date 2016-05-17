import android.content.ContentValues;
import com.tencent.mobileqq.app.proxy.DataLineMsgProxy;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nll
  implements Runnable
{
  public nll(DataLineMsgProxy paramDataLineMsgProxy, long paramLong, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    DataLineMsgRecord localDataLineMsgRecord = jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.a(jdField_a_of_type_Long);
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("path", jdField_a_of_type_JavaLangString);
    if (localDataLineMsgRecord != null) {
      jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.a(jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.jdField_a_of_type_JavaLangString, localContentValues, "msgId=?", new String[] { String.valueOf(msgId) }, null);
    }
  }
}
