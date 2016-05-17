import android.content.ContentValues;
import com.tencent.mobileqq.app.proxy.DataLineMsgProxy;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nlg
  implements Runnable
{
  public nlg(DataLineMsgProxy paramDataLineMsgProxy, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    DataLineMsgRecord localDataLineMsgRecord = jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.a(jdField_a_of_type_Long);
    if (localDataLineMsgRecord != null)
    {
      issuc = false;
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("issuc", Boolean.valueOf(false));
      jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.a(jdField_a_of_type_ComTencentMobileqqAppProxyDataLineMsgProxy.a, localContentValues, "msgId=?", new String[] { String.valueOf(msgId) }, null);
    }
  }
}
