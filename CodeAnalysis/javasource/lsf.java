import android.graphics.drawable.Drawable;
import com.tencent.mobileqq.activity.contact.newfriend.RecommendListView;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lsf
  extends FriendListObserver
{
  public lsf(RecommendListView paramRecommendListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Object paramObject)
  {
    if (!RecommendListView.a(a)) {}
    while (!paramBoolean) {
      return;
    }
    RecommendListView.a(a);
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if (!RecommendListView.a(a)) {}
    while (!paramBoolean) {
      return;
    }
    a.jdField_a_of_type_Lsj.notifyDataSetChanged();
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (!RecommendListView.a(a)) {}
    while (!paramBoolean1) {
      return;
    }
    RecommendListView.a(a);
  }
  
  protected void b(boolean paramBoolean, String paramString)
  {
    if (!RecommendListView.a(a)) {}
    while ((!paramBoolean) || (paramString == null)) {
      return;
    }
    Drawable localDrawable = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramString, (byte)3);
    a.jdField_a_of_type_Lsj.a(paramString, localDrawable);
  }
}
