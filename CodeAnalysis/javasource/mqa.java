import com.tencent.mobileqq.activity.specialcare.QQSpecialFriendSettingActivity;
import com.tencent.mobileqq.app.QvipSpecialCareObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mqa
  extends QvipSpecialCareObserver
{
  public mqa(QQSpecialFriendSettingActivity paramQQSpecialFriendSettingActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onSpecialSoundEvent(Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "onSpecialSoundEvent data: " + paramObject);
    }
    if (paramObject != null) {
      a.stopTitleProgress();
    }
    switch (((Integer)paramObject).intValue())
    {
    default: 
      return;
    }
    QQSpecialFriendSettingActivity.a(a);
  }
}
