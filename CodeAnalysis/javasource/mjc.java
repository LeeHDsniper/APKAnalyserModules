import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.hwcodec.SVHwEncoder;
import com.tencent.qphone.base.util.QLog;

public class mjc
  implements Runnable
{
  private SVHwEncoder jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder;
  
  public mjc(FlowCameraActivity2 paramFlowCameraActivity2, SVHwEncoder paramSVHwEncoder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder = null;
    jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder = paramSVHwEncoder;
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "handleQQVideo(): onSendVideoClick mEncoderCache=" + jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder);
    }
    if (jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder != null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoHwcodecSVHwEncoder.b();
    }
  }
}
