import android.text.TextUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.NearbyAssistantChatPie;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.SendMessageHandler;
import com.tencent.qphone.base.util.QLog;

public class lib
  extends MessageObserver
{
  public lib(NearbyAssistantChatPie paramNearbyAssistantChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString1, int paramInt1, int paramInt2, SendMessageHandler paramSendMessageHandler, long paramLong1, long paramLong2, String paramString2)
  {
    if ((paramString1 == null) || (!paramString1.equals(a.a.jdField_a_of_type_JavaLangString)) || (paramInt1 != a.a.jdField_a_of_type_Int))
    {
      if (QLog.isColorLevel()) {
        QLog.d("NearbyAssistantChatPie", 2, "onUpdateSendMsgError exception uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2);
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("NearbyAssistantChatPie", 2, "onUpdateSendMsgError uin " + paramString1 + " type " + paramInt1 + " uniseq " + paramLong2 + " errorCode " + paramInt2);
    }
    a.a(196608);
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    while (!paramString.equals(a.a.jdField_a_of_type_JavaLangString)) {
      return;
    }
    a.p = true;
    a.a(131072);
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, String paramString)
  {
    if (paramBoolean1) {
      a.E();
    }
  }
  
  protected void d(boolean paramBoolean, String paramString)
  {
    a.a(65536);
  }
}
