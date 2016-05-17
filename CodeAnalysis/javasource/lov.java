import android.view.View;
import com.tencent.mobileqq.activity.contact.CircleMemberListActivity;
import com.tencent.mobileqq.data.CircleBuddy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.circle.IFriendObserver;
import com.tencent.widget.XListView;

public class lov
  implements IFriendObserver
{
  public lov(CircleMemberListActivity paramCircleMemberListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString)
  {
    int j;
    int i;
    if (a.jdField_a_of_type_Int == 0)
    {
      j = CircleMemberListActivity.a(a).getChildCount();
      i = 0;
    }
    for (;;)
    {
      if (i < j)
      {
        Object localObject = CircleMemberListActivity.a(a).getChildAt(i).getTag();
        if ((localObject != null) && ((localObject instanceof lpa)))
        {
          localObject = (lpa)localObject;
          if (a.uin.equals(paramString)) {
            a.a(CircleMemberListActivity.a(a).getChildAt(i), a);
          }
        }
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
  
  public void a(boolean paramBoolean, String[] paramArrayOfString)
  {
    if ((paramBoolean) && (a.jdField_a_of_type_Int == 0)) {
      a.jdField_a_of_type_Loz.notifyDataSetChanged();
    }
  }
}
