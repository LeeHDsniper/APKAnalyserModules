import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewParent;
import com.tencent.mobileqq.activity.contact.newfriend.BaseNewFriendView.INewFriendContext;
import com.tencent.mobileqq.activity.contact.newfriend.ContactRecommendActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;

public class lrn
  implements BaseNewFriendView.INewFriendContext
{
  public lrn(ContactRecommendActivity paramContactRecommendActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View a()
  {
    return (View)a.findViewById(2131297322).getParent().getParent();
  }
  
  public QQAppInterface a()
  {
    return a.app;
  }
  
  public void a()
  {
    a.startTitleProgress();
  }
  
  public void a(int paramInt, View.OnClickListener paramOnClickListener) {}
  
  public void a(int paramInt, boolean paramBoolean) {}
  
  public void a(String paramString, int paramInt)
  {
    if (a.isResume()) {
      QQToast.a(getActivity(), paramString, 0).b(a.getTitleBarHeight());
    }
  }
  
  public void a(boolean paramBoolean) {}
  
  public boolean a()
  {
    return false;
  }
  
  public View b()
  {
    return (View)a.findViewById(2131297322).getParent();
  }
  
  public void b()
  {
    a.stopTitleProgress();
  }
  
  public View c()
  {
    return null;
  }
  
  public void c() {}
  
  public Activity getActivity()
  {
    return a;
  }
}
