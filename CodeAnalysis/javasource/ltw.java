import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.contact.troop.BaseTroopView.ITroopContext;
import com.tencent.mobileqq.activity.contact.troop.TroopActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.RedDotTextView;
import com.tencent.mobileqq.widget.TabBarView;
import com.tencent.util.MqqWeakReferenceHandler;

public class ltw
  implements BaseTroopView.ITroopContext
{
  public ltw(TroopActivity paramTroopActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public Activity a()
  {
    return a;
  }
  
  public View a()
  {
    return a.findViewById(2131296923);
  }
  
  public QQAppInterface a()
  {
    return a.app;
  }
  
  public ForwardBaseOption a()
  {
    return TroopActivity.a(a);
  }
  
  public MqqWeakReferenceHandler a()
  {
    return a.jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler;
  }
  
  public void a(int paramInt, View.OnClickListener paramOnClickListener) {}
  
  public void a(int paramInt, boolean paramBoolean)
  {
    if (a.j != 2) {
      return;
    }
    switch (paramInt)
    {
    default: 
      return;
    case 0: 
      a.jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0).a(paramBoolean);
      return;
    }
    a.jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1).a(paramBoolean);
  }
  
  public void a(Runnable paramRunnable)
  {
    a.runOnUiThread(paramRunnable);
  }
  
  public void a(String paramString)
  {
    if (a.isResume()) {
      QQToast.a(a(), paramString, 0).b(a.getTitleBarHeight());
    }
  }
  
  public boolean a()
  {
    return TroopActivity.a(a);
  }
  
  public View b()
  {
    return a.findViewById(2131297591);
  }
  
  public View c()
  {
    return a.findViewById(2131299387);
  }
  
  public View d()
  {
    return a.jdField_a_of_type_ComTencentMobileqqWidgetTabBarView;
  }
}
