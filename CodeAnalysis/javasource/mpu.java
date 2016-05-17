import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.specialcare.QQSpecialCareSettingActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.FormSwitchItem;
import com.tencent.qphone.base.util.QLog;
import java.util.List;

public class mpu
  extends FriendListObserver
{
  public mpu(QQSpecialCareSettingActivity paramQQSpecialCareSettingActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "onUpdateDelFriend isSuccess: " + paramBoolean + ", uin: " + paramObject);
    }
    QQSpecialCareSettingActivity.b(a);
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, List paramList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "onUpdateSpecialCareList isSuccess: " + paramBoolean1 + ", isComplete: " + paramBoolean2);
    }
    QQSpecialCareSettingActivity.b(a);
  }
  
  protected void a(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    int i = 1;
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "onSetSpecialCareSwith_global isSuccess: " + paramBoolean);
    }
    Object localObject;
    boolean bool;
    if (!paramBoolean)
    {
      localObject = QQSpecialCareSettingActivity.a(a);
      if (!QQSpecialCareSettingActivity.a(a).a())
      {
        bool = true;
        ((FormSwitchItem)localObject).setChecked(bool);
      }
    }
    else
    {
      a.a.sendEmptyMessage(8194);
      localObject = a.a.obtainMessage(8195);
      if (paramBoolean) {
        i = 2;
      }
      arg1 = i;
      if (!paramBoolean) {
        break label176;
      }
      if (!Boolean.valueOf(((boolean[])(boolean[])paramArrayOfObject[2])[0]).booleanValue()) {
        break label170;
      }
      i = 2131370695;
    }
    for (;;)
    {
      arg2 = i;
      a.a.sendMessage((Message)localObject);
      QQSpecialCareSettingActivity.b(a);
      return;
      bool = false;
      break;
      label170:
      i = 2131370698;
      continue;
      label176:
      if (((boolean[])(boolean[])paramArrayOfObject[2])[0] != 0) {
        i = 2131370700;
      } else {
        i = 2131370701;
      }
    }
  }
  
  protected void b(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "onSetSpecialCareSwith_specialRing isSuccess: " + paramBoolean);
    }
    QQSpecialCareSettingActivity.b(a);
  }
  
  protected void c(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "onSetSpecialCareSwith_qzone isSuccess: " + paramBoolean);
    }
    if (!paramBoolean)
    {
      paramArrayOfObject = QQSpecialCareSettingActivity.b(a);
      if (QQSpecialCareSettingActivity.b(a).a()) {
        break label64;
      }
    }
    label64:
    for (paramBoolean = true;; paramBoolean = false)
    {
      paramArrayOfObject.setChecked(paramBoolean);
      return;
    }
  }
}
