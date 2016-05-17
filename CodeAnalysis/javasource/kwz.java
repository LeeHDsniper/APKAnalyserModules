import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.app.AppRuntime;
import mqq.app.MobileQQ;

public class kwz
  implements Runnable
{
  public kwz(GrayTipsItemBuilder paramGrayTipsItemBuilder, String paramString1, int paramInt, long paramLong, String paramString2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = MobileQQ.sMobileQQ.waitAppRuntime(null);
    if (localObject != null)
    {
      localObject = (QQMessageFacade)((AppRuntime)localObject).getManager(19);
      if (localObject != null)
      {
        MessageRecord localMessageRecord = ((QQMessageFacade)localObject).a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int, jdField_a_of_type_Long);
        if ((localMessageRecord != null) && (!TextUtils.equals(localMessageRecord.getExtInfoFromExtStr("sens_msg_original_text"), b)))
        {
          localMessageRecord.saveExtInfoToExtStr("sens_msg_original_text", b);
          ((QQMessageFacade)localObject).a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int, jdField_a_of_type_Long, "extLong", Integer.valueOf(extLong));
          ((QQMessageFacade)localObject).a(jdField_a_of_type_JavaLangString, jdField_a_of_type_Int, jdField_a_of_type_Long, "extStr", extStr);
          ((QQMessageFacade)localObject).a(localMessageRecord);
        }
      }
    }
  }
}
