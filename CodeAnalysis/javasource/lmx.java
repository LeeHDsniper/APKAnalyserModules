import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.tips.HongbaoKeywordGrayTips;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.List;

public class lmx
  implements Runnable
{
  public lmx(HongbaoKeywordGrayTips paramHongbaoKeywordGrayTips)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = HongbaoKeywordGrayTips.a(a).a().a(aa).jdField_a_of_type_JavaLangString, aa).jdField_a_of_type_Int);
    int i = ((List)localObject).size();
    if (i > 0)
    {
      localObject = (ChatMessage)((List)localObject).get(i - 1);
      if (aa).jdField_a_of_type_Int != 0) {
        break label130;
      }
      HongbaoKeywordGrayTips.a(a, time);
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("HongbaoKeywordGrayTips", 2, "size : " + i + ", mLastMsgIdOrTime:" + HongbaoKeywordGrayTips.a(a));
      }
      return;
      label130:
      if ((aa).jdField_a_of_type_Int == 3000) || (aa).jdField_a_of_type_Int == 1)) {
        HongbaoKeywordGrayTips.a(a, shmsgseq);
      }
    }
  }
}
