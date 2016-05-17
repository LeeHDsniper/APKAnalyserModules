import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.audiopanel.CommonRecordSoundPanel;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.AudioUtil;
import com.tencent.mobileqq.utils.QQRecorder;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;

public class ksr
  extends Handler
{
  public ksr(CommonRecordSoundPanel paramCommonRecordSoundPanel, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    case 16711687: 
      a.b(102);
      return;
    case 16711686: 
      if (QLog.isColorLevel()) {
        QLog.d("QQRecorder", 2, "QQRecorder stop() is called,time is:" + System.currentTimeMillis());
      }
      CommonRecordSoundPanel.a(a).c();
      AudioUtil.b(2131165196, false);
      a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(16711686);
      AudioUtil.a(a.jdField_a_of_type_ComTencentMobileqqAppBaseActivity, false);
      return;
    }
    a.b(1);
    a.d();
    QQToast.a(a.jdField_a_of_type_ComTencentMobileqqAppBaseActivity, a.jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367360), 1).a();
  }
}
