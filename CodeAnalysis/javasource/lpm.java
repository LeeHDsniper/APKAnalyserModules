import android.app.Activity;
import android.view.View;
import android.view.animation.TranslateAnimation;
import android.widget.LinearLayout;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsActivity;
import com.tencent.mobileqq.activity.contact.addcontact.ContactBaseView;
import com.tencent.mobileqq.activity.contact.addcontact.ContactBaseView.IAddContactContext;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.ThreadPriorityManager;
import com.tencent.mobileqq.widget.TabBarView;

public class lpm
  implements ContactBaseView.IAddContactContext
{
  public lpm(AddContactsActivity paramAddContactsActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public Activity a()
  {
    return a;
  }
  
  public QQAppInterface a()
  {
    return a.app;
  }
  
  public void a()
  {
    if (a.jdField_a_of_type_Boolean) {
      return;
    }
    AddContactsActivity.a(a, 2130837739);
    TranslateAnimation localTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, 0.0F, -(a.getTitleBarHeight() + AddContactsActivity.a(a).getHeight() + AddContactsActivity.a(a).a()));
    localTranslateAnimation.setDuration(250L);
    localTranslateAnimation.setFillAfter(true);
    localTranslateAnimation.setAnimationListener(new lpn(this));
    a.jdField_a_of_type_AndroidWidgetLinearLayout.startAnimation(localTranslateAnimation);
    ThreadPriorityManager.a(true);
  }
  
  public void b()
  {
    a.findViewById(2131297591).setVisibility(0);
    TranslateAnimation localTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, -(a.getTitleBarHeight() + AddContactsActivity.a(a).getHeight() + AddContactsActivity.a(a).a()), 0.0F);
    localTranslateAnimation.setDuration(250L);
    localTranslateAnimation.setFillAfter(true);
    localTranslateAnimation.setAnimationListener(new lpo(this));
    a.jdField_a_of_type_AndroidWidgetLinearLayout.startAnimation(localTranslateAnimation);
  }
}
