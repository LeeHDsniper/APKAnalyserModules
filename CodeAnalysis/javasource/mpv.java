import com.tencent.mobileqq.activity.specialcare.QQSpecialCareSettingActivity;
import com.tencent.mobileqq.app.QvipSpecialCareObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mpv
  extends QvipSpecialCareObserver
{
  public mpv(QQSpecialCareSettingActivity paramQQSpecialCareSettingActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onSpecialSoundEvent(Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "onSpecialSoundEvent data: " + paramObject);
    }
    if (paramObject != null) {
      a.stopTitleProgress();
    }
    switch (((Integer)paramObject).intValue())
    {
    default: 
      return;
    }
    QQSpecialCareSettingActivity.a(a);
  }
}
