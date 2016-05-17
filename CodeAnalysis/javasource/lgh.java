import com.tencent.mobileqq.activity.aio.photo.ICompressionCallBack.Stub;
import com.tencent.mobileqq.activity.aio.rebuild.DeviceMsgChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.CompressInfo;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XPanelContainer;
import java.lang.ref.WeakReference;

public class lgh
  extends ICompressionCallBack.Stub
{
  WeakReference a;
  final String b;
  
  public lgh(DeviceMsgChatPie paramDeviceMsgChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = DeviceMsgChatPie.class.getSimpleName();
    a = new WeakReference(paramDeviceMsgChatPie);
  }
  
  public void a(CompressInfo paramCompressInfo)
  {
    if (QLog.isColorLevel()) {
      QLog.d(b, 2, "DeviceMsgChatPie, compress success, localUUID:" + a);
    }
  }
  
  public void b(CompressInfo paramCompressInfo)
  {
    if (QLog.isColorLevel()) {
      QLog.d(b, 2, "DeviceMsgChatPie, compress fail, localUUID:" + a);
    }
  }
  
  public void c(CompressInfo paramCompressInfo)
  {
    if (QLog.isColorLevel()) {
      QLog.d(b, 2, "DeviceMsgChatPie, compress complete, localUUID:" + a);
    }
    DeviceMsgChatPie localDeviceMsgChatPie = (DeviceMsgChatPie)a.get();
    if (localDeviceMsgChatPie == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e(b, 2, "onCompressComplete, error: activity is null");
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.e(b, 2, "onCompressComplete, new path:" + e);
    }
    localDeviceMsgChatPie.d(e);
    DeviceMsgChatPie.a(localDeviceMsgChatPie).a();
  }
}
