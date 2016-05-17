import android.content.Intent;
import android.os.Looper;
import android.os.Message;
import com.tencent.arrange.op.MeetingInfo;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.concurrent.ConcurrentHashMap;
import mqq.os.MqqHandler;

public class ffo
  extends MqqHandler
{
  public ffo(AVNotifyCenter paramAVNotifyCenter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ffo(AVNotifyCenter paramAVNotifyCenter, Looper paramLooper)
  {
    super(paramLooper);
  }
  
  public void handleMessage(Message paramMessage)
  {
    if (!a.h()) {}
    do
    {
      do
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.d("AVNotifyCenter", 2, "handleMessage-->opType=" + what);
        }
        if ((what >= 10003) && (what <= 10009))
        {
          localIntent = new Intent("tencent.video.q2v.MultiVideo");
          localIntent.putExtra("type", 35);
          localIntent.setPackage(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getPackageName());
          a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(localIntent);
        }
        switch (what)
        {
        case 10006: 
        case 10007: 
        case 10008: 
        case 10009: 
        default: 
          return;
        case 10002: 
          a.a();
          return;
        case 10003: 
          localIntent = new Intent("tencent.video.q2v.MultiVideo");
          localIntent.putExtra("type", 26);
          localIntent.putExtra("discussId", ((Long)obj).longValue());
          localIntent.putExtra("memberUin", a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
          localIntent.setPackage(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getPackageName());
          a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(localIntent);
          return;
        case 10004: 
          paramMessage = (Object[])obj;
          localIntent = new Intent("tencent.video.q2v.MultiVideo");
          localIntent.putExtra("type", 24);
          localIntent.putExtra("discussId", ((Long)paramMessage[0]).longValue());
          localIntent.putExtra("cmdUin", (String)paramMessage[1]);
          localIntent.putExtra("uins", (String[])paramMessage[2]);
          localIntent.setPackage(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getPackageName());
          a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(localIntent);
          return;
        case 10005: 
          paramMessage = (Object[])obj;
          localIntent = new Intent("tencent.video.q2v.MultiVideo");
          localIntent.putExtra("type", 31);
          localIntent.putExtra("discussId", ((Long)paramMessage[0]).longValue());
          localIntent.putExtra("cmdUin", (String)paramMessage[1]);
          localIntent.putExtra("uins", (String[])paramMessage[2]);
          localIntent.setPackage(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getPackageName());
          a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(localIntent);
          return;
        case 10010: 
          boolean bool = ((Boolean)obj).booleanValue();
          a.c(bool);
          return;
        case 10011: 
          localIntent = new Intent("tencent.video.q2v.MultiVideo");
          localIntent.putExtra("type", 34);
          localIntent.putExtra("relationId", ((Long)obj).longValue());
          localIntent.setPackage(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getPackageName());
          a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(localIntent);
          return;
        case 10012: 
          paramMessage = (MeetingInfo)obj;
        }
      } while (paramMessage == null);
      a.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramMessage.getDiscuss_uin(), paramMessage);
      a.a(2, paramMessage.getDiscuss_uin());
      return;
      paramMessage = (MeetingInfo)obj;
    } while ((paramMessage == null) || (!a.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramMessage.getDiscuss_uin())));
    a.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramMessage.getDiscuss_uin());
    a.b(2, paramMessage.getDiscuss_uin());
    return;
    paramMessage = (String[])obj;
    Intent localIntent = new Intent("tencent.video.q2v.ACTION_RECV_C2B_PUSH_MSG");
    localIntent.putExtra("uin", paramMessage[0]);
    localIntent.putExtra("context", paramMessage[1]);
    localIntent.setPackage(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getPackageName());
    a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(localIntent);
  }
}
