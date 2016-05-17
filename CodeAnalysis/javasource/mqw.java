import android.os.Handler;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.Arrays;
import java.util.List;

public class mqw
  extends FriendListObserver
{
  public mqw(SpecailCareListActivity paramSpecailCareListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Object paramObject)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SpecailCareListActivity", 2, "onUpdateDelFriend isSucess= " + paramBoolean + ", uin=" + (Long)paramObject);
    }
    if (paramBoolean)
    {
      a.a();
      a.jdField_a_of_type_Mrf.notifyDataSetChanged();
    }
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SpecailCareListActivity", 2, "onUpdateFriendList isSuccess=" + paramBoolean1 + ", isComplete=" + paramBoolean2 + " mIsPullRefresh=" + a.jdField_a_of_type_Boolean);
    }
    if ((!paramBoolean1) || (paramBoolean2))
    {
      a.a();
      a.jdField_a_of_type_Mrf.notifyDataSetChanged();
    }
    if (a.jdField_a_of_type_Boolean)
    {
      if ((!paramBoolean1) || (!paramBoolean2)) {
        break label135;
      }
      a.jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(0);
      a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(2001, 1000L);
      a.jdField_a_of_type_Boolean = false;
    }
    label135:
    while (paramBoolean1) {
      return;
    }
    a.jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(1);
    a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(2001, 1000L);
    a.jdField_a_of_type_Boolean = false;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, List paramList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SpecailCareListActivity", 2, "onUpdateSpecialCareList isSucess= " + paramBoolean1 + ",isComplete=" + paramBoolean2);
    }
    if (paramBoolean1)
    {
      a.a();
      a.jdField_a_of_type_Mrf.notifyDataSetChanged();
    }
  }
  
  protected void a(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    int i = ((Integer)paramArrayOfObject[0]).intValue();
    paramArrayOfObject = (String[])paramArrayOfObject[1];
    if (QLog.isColorLevel()) {
      QLog.d("SpecailCareListActivity", 2, "onSetSpecialCareSwitch_global isSucess= " + paramBoolean + ",type=" + i + ",uinSize=" + paramArrayOfObject.length);
    }
    if ((SpecailCareListActivity.a(a) != null) && (paramArrayOfObject != null)) {}
    for (boolean bool = Arrays.equals(SpecailCareListActivity.a(a), paramArrayOfObject);; bool = false)
    {
      if (bool) {
        if (paramArrayOfObject.length >= 1)
        {
          a.h();
          if (paramBoolean) {
            if (a.c != null)
            {
              a.d();
              QQToast.a(BaseApplication.getContext(), 2, 2131369194, 0).b(a.getTitleBarHeight());
              a.a();
              a.jdField_a_of_type_Mrf.notifyDataSetChanged();
            }
          }
        }
      }
      while (!paramBoolean)
      {
        do
        {
          for (;;)
          {
            return;
            QQToast.a(BaseApplication.getContext(), 2, 2131370702, 0).b(a.getTitleBarHeight());
          }
          if (a.c != null)
          {
            QQToast.a(BaseApplication.getContext(), 1, 2131370699, 0).b(a.getTitleBarHeight());
            return;
          }
          QQToast.a(BaseApplication.getContext(), 1, 2131370703, 0).b(a.getTitleBarHeight());
          return;
        } while (!paramBoolean);
        a.a();
        a.jdField_a_of_type_Mrf.notifyDataSetChanged();
        return;
      }
      a.a();
      a.jdField_a_of_type_Mrf.notifyDataSetChanged();
      return;
    }
  }
  
  protected void b(boolean paramBoolean, String[] paramArrayOfString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SpecailCareListActivity", 2, "onUpdateSignature isSucess= " + paramBoolean);
    }
    if (a.j != 0)
    {
      a.b = true;
      return;
    }
    a.jdField_a_of_type_Mrf.notifyDataSetChanged();
  }
}
