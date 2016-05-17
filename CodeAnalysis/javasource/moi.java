import android.content.Intent;
import com.tencent.device.file.DevLittleVideoOperator;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.AioShortVideoOperator;
import com.tencent.mobileqq.shortvideo.ShortVideoBusiManager;
import com.tencent.mobileqq.shortvideo.ShortVideoReq;
import com.tencent.mobileqq.shortvideo.ShortVideoUploadInfo;
import com.tencent.qphone.base.util.QLog;

class moi
  implements Runnable
{
  moi(moh paramMoh)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject;
    ShortVideoUploadInfo localShortVideoUploadInfo;
    if (a.jdField_a_of_type_AndroidContentIntent != null)
    {
      int i = a.jdField_a_of_type_AndroidContentIntent.getIntExtra("file_send_business_type", 2);
      if (QLog.isColorLevel()) {
        QLog.d("SendVideoActivity", 2, "#SendTask# run(), busiType = " + i + ",VideoFileDir = " + a.jdField_a_of_type_AndroidContentIntent.getStringExtra("file_video_source_dir"));
      }
      int j = a.jdField_a_of_type_AndroidContentIntent.getIntExtra("uintype", -1);
      if (j == 9501) {
        i = 4;
      }
      localObject = ShortVideoBusiManager.a(0, i);
      localShortVideoUploadInfo = ShortVideoBusiManager.a(a.jdField_a_of_type_AndroidContentIntent, (ShortVideoReq)localObject);
      ((ShortVideoReq)localObject).a(localShortVideoUploadInfo);
      if (j != 9501) {
        break label214;
      }
      localObject = new DevLittleVideoOperator(a.jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app);
      ((DevLittleVideoOperator)localObject).a(((DevLittleVideoOperator)localObject).a(localShortVideoUploadInfo));
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("SendVideoActivity", 2, "#SendTask# run(): success");
      }
      if (!a.jdField_a_of_type_Boolean)
      {
        a.jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setResult(-1, a.jdField_a_of_type_AndroidContentIntent);
        a.jdField_a_of_type_ComTencentMobileqqAppBaseActivity.finish();
      }
      return;
      label214:
      localObject = new AioShortVideoOperator(a.jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app);
      ((AioShortVideoOperator)localObject).a(((AioShortVideoOperator)localObject).a(localShortVideoUploadInfo));
    }
  }
}
