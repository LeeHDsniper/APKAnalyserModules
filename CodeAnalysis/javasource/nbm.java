import SecurityAccountServer.RespondQueryQQBindingStat;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.os.Message;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.Conversation;
import com.tencent.mobileqq.activity.ThemeNoviceGuideActivity;
import com.tencent.mobileqq.activity.UserguideActivity;
import com.tencent.mobileqq.activity.phone.PhoneLaunchActivity;
import com.tencent.mobileqq.activity.phone.PhoneMatchActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mybusiness.MyBusinessManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.phonelogin.PhoneNumLoginImpl;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import mqq.app.AppActivity;
import mqq.os.MqqHandler;

public class nbm
  extends ContactBindObserver
{
  public nbm(PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  void a()
  {
    Object localObject1 = new nbn(this);
    PhoneContactManagerImp.a(a).a((Runnable)localObject1);
    if (PhoneContactManagerImp.f) {}
    label199:
    label451:
    label456:
    label547:
    label555:
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            if (!UserguideActivity.a(PhoneContactManagerImp.a(a).a(), PhoneContactManagerImp.a(a).a())) {
              break;
            }
          } while (!QLog.isColorLevel());
          QLog.d("ThemeDownloadTrace", 2, "UserguideActivity.showUserGuideThisTime = ture");
          return;
        } while (PhoneNumLoginImpl.a().a());
        int i = a.d();
        if (PhoneContactManagerImp.a(a, true))
        {
          PhoneContactManagerImp.a(a).i();
          return;
        }
        if (!a.b()) {
          break label555;
        }
        Object localObject2 = null;
        StringBuilder localStringBuilder = null;
        if (PhoneContactManagerImp.a(a).isLogin()) {
          if (QLog.isColorLevel()) {
            QLog.d("ThemeDownloadTrace", 2, "bindState = " + i);
          }
        }
        switch (i)
        {
        default: 
          localObject1 = localStringBuilder;
          localObject2 = localObject1;
          if (i != 1)
          {
            localObject2 = localObject1;
            if (i != 2)
            {
              ContactUtils.a(PhoneContactManagerImp.a(a), 1);
              localObject2 = localObject1;
            }
          }
          localObject1 = BaseActivity.sTopActivity;
          if (QLog.isColorLevel())
          {
            localStringBuilder = new StringBuilder().append("topActivity is:").append(localObject1).append(",isFinishing is:");
            if (localObject1 == null) {
              break label451;
            }
          }
          break;
        }
        for (boolean bool = ((AppActivity)localObject1).isFinishing();; bool = false)
        {
          QLog.d("ThemeDownloadTrace", 2, bool + ",i is:" + localObject2);
          if ((localObject1 == null) || (((AppActivity)localObject1).isFinishing()) || (((AppActivity)localObject1).getAppRuntime() != PhoneContactManagerImp.a(a))) {
            break label547;
          }
          if ((localObject1 instanceof UserguideActivity)) {
            break;
          }
          if (localObject2 == null) {
            break label456;
          }
          ((AppActivity)localObject1).startActivity(localObject2);
          ((AppActivity)localObject1).overridePendingTransition(2130968765, 2130968589);
          return;
          localObject1 = new Intent(PhoneContactManagerImp.a(a).a().getApplicationContext(), PhoneLaunchActivity.class);
          ((Intent)localObject1).putExtra("needAlert", true);
          ContactUtils.a(PhoneContactManagerImp.a(a));
          break label199;
          localObject1 = localStringBuilder;
          if (a.a() == null) {
            break label199;
          }
          localObject1 = localStringBuilder;
          if (a.a().lastUsedFlag != 3L) {
            break label199;
          }
          localObject1 = new Intent(PhoneContactManagerImp.a(a).a().getApplicationContext(), PhoneMatchActivity.class);
          break label199;
        }
        a.i();
        localObject1 = PhoneContactManagerImp.a(a).getPreferences();
      } while ((localObject1 == null) || (((SharedPreferences)localObject1).getBoolean("THEME_NOVICE_GUIDE_RUNED", false)) || (!BaseApplicationImpl.jdField_a_of_type_Boolean));
      ((SharedPreferences)localObject1).edit().putBoolean("THEME_NOVICE_GUIDE_RUNED", true).commit();
      localObject1 = new Intent(BaseActivity.sTopActivity, ThemeNoviceGuideActivity.class);
      BaseActivity.sTopActivity.startActivity((Intent)localObject1);
      BaseActivity.sTopActivity.overridePendingTransition(2130968585, 2130968586);
      return;
      a.i();
      return;
      if (QLog.isColorLevel()) {
        QLog.d("ThemeDownloadTrace", 2, "mgr.isPhoneContactFirstRun() result is false");
      }
    } while ((!PhoneContactManagerImp.a(a).isLogin()) || (!ContactUtils.a(a, PhoneContactManagerImp.a(a))) || (BaseActivity.sTopActivity == null));
    localObject1 = new Intent(PhoneContactManagerImp.a(a).a().getApplicationContext(), PhoneLaunchActivity.class);
    ((Intent)localObject1).putExtra("needAlert", true);
    BaseActivity.sTopActivity.startActivity((Intent)localObject1);
    BaseActivity.sTopActivity.overridePendingTransition(2130968765, 2130968589);
  }
  
  protected void a(int paramInt1, int paramInt2)
  {
    if (PhoneContactManagerImp.a(a) == null) {
      PhoneContactManagerImp.a(a, new ncb(a, null));
    }
    PhoneContactManagerImp.a(a).a(paramInt1, paramInt2);
  }
  
  protected void a(boolean paramBoolean)
  {
    if (paramBoolean) {
      PhoneContactManagerImp.a(a, 2);
    }
  }
  
  protected void a(boolean paramBoolean, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "onUploadContact, isSuc = " + paramBoolean + ", reason = " + paramInt);
    }
    BaseApplication localBaseApplication = BaseApplicationImpl.getContext();
    if ((localBaseApplication != null) && (a.e))
    {
      PhoneContactManagerImp.h = false;
      if (paramBoolean)
      {
        QQToast.a(localBaseApplication, 0, "手机通讯录匹配完成。", 0).b(localBaseApplication.getResources().getDimensionPixelSize(2131492908));
        a.e = false;
      }
    }
    else
    {
      if (PhoneContactManagerImp.a(a) != null)
      {
        PhoneContactManagerImp.a(a).b();
        PhoneContactManagerImp.a(a, null);
      }
      if (!paramBoolean) {
        break label199;
      }
      a.jdField_a_of_type_Int = 6;
      PhoneContactManagerImp.a(a, 0L, 0L);
      PhoneContactManagerImp.a(a, 15);
    }
    for (;;)
    {
      PhoneContactManagerImp.b(a);
      a.a(true, true);
      return;
      QQToast.a(localBaseApplication, 0, "手机通讯录匹配失败。", 0).b(localBaseApplication.getResources().getDimensionPixelSize(2131492908));
      break;
      label199:
      a.jdField_c_of_type_Long = System.currentTimeMillis();
      if (paramInt == 2)
      {
        a.jdField_a_of_type_Int = 4;
      }
      else if (paramInt == 3)
      {
        a.jdField_a_of_type_Int = 6;
        a.g = true;
      }
      else if (paramInt == 1)
      {
        a.jdField_a_of_type_Int = 1;
        a.jdField_c_of_type_Long = 0L;
      }
    }
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramBoolean1) && (paramBoolean2))
    {
      MqqHandler localMqqHandler = PhoneContactManagerImp.a(a).a(Conversation.class);
      if (localMqqHandler != null)
      {
        Message localMessage = Message.obtain();
        what = 1041;
        localMqqHandler.sendMessage(localMessage);
      }
    }
    a.jdField_b_of_type_Boolean = false;
    a.jdField_b_of_type_Long = System.currentTimeMillis();
    if (paramBoolean1)
    {
      PhoneContactManagerImp.a(a, a.jdField_a_of_type_Boolean);
      if (a.jdField_a_of_type_Boolean) {
        a();
      }
      a.jdField_a_of_type_Boolean = false;
    }
  }
  
  protected void b(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      ((MyBusinessManager)PhoneContactManagerImp.a(a).getManager(48)).a("", 0, "");
      a.a(true, true);
      a.jdField_a_of_type_Int = 1;
      PhoneContactManagerImp.b(a);
    }
  }
  
  protected void b(boolean paramBoolean, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "onQueryContactList, isSuc = " + paramBoolean + ", updateFlag = " + paramInt);
    }
    if (paramBoolean) {
      PhoneContactManagerImp.a(a, paramInt);
    }
    if (a.e() >= 4) {
      ThreadManager.b().postDelayed(PhoneContactManagerImp.a(a), PhoneContactManagerImp.jdField_a_of_type_Long);
    }
    PhoneContactManagerImp.c(a);
  }
  
  protected void c(boolean paramBoolean, int paramInt)
  {
    if ((paramBoolean) && (paramInt == 0)) {
      a.a(true, true);
    }
  }
  
  protected void d(boolean paramBoolean)
  {
    PhoneContactManagerImp.b(a, false);
    if (paramBoolean) {
      PhoneContactManagerImp.a(a, 2);
    }
  }
  
  protected void d(boolean paramBoolean, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "onUpdateContact, isSuc = " + paramBoolean + ", reason = " + paramInt);
    }
    a.jdField_c_of_type_Boolean = false;
    if (paramBoolean)
    {
      PhoneContactManagerImp.a(a, 1);
      PhoneContactManagerImp.a(a, 0L, 0L);
    }
    for (;;)
    {
      a.a(true, true);
      return;
      if ((paramInt == 2) || (paramInt == 3)) {
        a.g = true;
      }
      a.d = System.currentTimeMillis();
    }
  }
}
