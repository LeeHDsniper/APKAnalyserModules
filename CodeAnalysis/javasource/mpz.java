import android.content.Intent;
import android.os.Handler;
import com.tencent.mobileqq.activity.specialcare.QQSpecialFriendSettingActivity;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.FormSwitchItem;
import com.tencent.qphone.base.util.QLog;
import java.util.List;

public class mpz
  extends FriendListObserver
{
  public mpz(QQSpecialFriendSettingActivity paramQQSpecialFriendSettingActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "onUpdateDelFriend isSuccess: " + paramBoolean + ", uin: " + paramObject);
    }
    if ((paramBoolean) && (QQSpecialFriendSettingActivity.a(a).equals(String.valueOf(paramObject)))) {
      a.finish();
    }
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, List paramList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "onUpdateSpecialCareList isSuccess: " + paramBoolean1 + ", isComplete: " + paramBoolean2);
    }
    QQSpecialFriendSettingActivity.b(a);
  }
  
  protected void a(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    int i = 2;
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "onSetSpecialCareSwith_global isSuccess: " + paramBoolean + ",isFromForwardFriendActivity=" + QQSpecialFriendSettingActivity.a(a));
    }
    if (QQSpecialFriendSettingActivity.a(a)) {
      return;
    }
    a.a.sendEmptyMessage(8194);
    paramArrayOfObject = a.a.obtainMessage(8195);
    if (paramBoolean)
    {
      label91:
      arg1 = i;
      if (!paramBoolean) {
        break label137;
      }
    }
    label137:
    for (i = 2131369198;; i = 2131370701)
    {
      arg2 = i;
      a.a.sendMessage(paramArrayOfObject);
      if (!paramBoolean) {
        break;
      }
      a.finish();
      return;
      i = 1;
      break label91;
    }
  }
  
  protected void b(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "onSetSpecialCareSwith_specialRing isSuccess: " + paramBoolean);
    }
    if (QQSpecialFriendSettingActivity.a(a)) {
      return;
    }
    QQSpecialFriendSettingActivity.b(a);
  }
  
  protected void c(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "onSetSpecialCareSwith_qzone isSuccess: " + paramBoolean);
    }
    if (QQSpecialFriendSettingActivity.a(a)) {}
    while (paramBoolean) {
      return;
    }
    paramArrayOfObject = QQSpecialFriendSettingActivity.b(a);
    if (!QQSpecialFriendSettingActivity.b(a).a()) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      paramArrayOfObject.setChecked(paramBoolean);
      return;
    }
  }
  
  protected void d(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    int j = ((Integer)paramArrayOfObject[0]).intValue();
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "onSetSpecialCareSwitchesOfAPerson isSuccess: " + paramBoolean + ",isFromForwardFriendActivity=" + QQSpecialFriendSettingActivity.a(a) + ",result=" + j);
    }
    if (!QQSpecialFriendSettingActivity.a(a)) {
      return;
    }
    a.a.sendEmptyMessage(8194);
    paramArrayOfObject = a.a.obtainMessage(8195);
    if ((paramBoolean) && (j == 0))
    {
      i = 2;
      label117:
      arg1 = i;
      if ((!paramBoolean) || (j != 0)) {
        break label223;
      }
    }
    label223:
    for (int i = 2131369198;; i = 2131370699)
    {
      arg2 = i;
      a.a.sendMessage(paramArrayOfObject);
      if ((!paramBoolean) || (j != 0)) {
        break;
      }
      paramArrayOfObject = new Intent();
      paramArrayOfObject.setClass(a, SpecailCareListActivity.class);
      paramArrayOfObject.addFlags(67108864);
      paramArrayOfObject.putExtra("selfSet_leftViewText", a.getString(2131371540));
      a.startActivity(paramArrayOfObject);
      a.finish();
      return;
      i = 1;
      break label117;
    }
  }
}
