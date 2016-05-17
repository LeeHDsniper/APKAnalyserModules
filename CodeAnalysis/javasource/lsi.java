import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ProfileActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.ProfileActivity.CardContactInfo;
import com.tencent.mobileqq.activity.contact.newfriend.RecommendListView;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.RecommendContactMsg;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public class lsi
  implements View.OnClickListener
{
  lsi(RecommendListView paramRecommendListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    RecommendContactMsg localRecommendContactMsg = getTaga;
    if ((source != null) && (source.length() > 0))
    {
      paramView = (FriendsManager)a.a.getManager(50);
      if (paramView != null)
      {
        Friends localFriends = paramView.c(uin);
        if ((localFriends != null) && (localFriends.isFriend()))
        {
          paramView = new ProfileActivity.AllInOne(uin, 1);
          h = name;
          i = remark;
          l = nickName;
          g = 66;
        }
      }
    }
    for (;;)
    {
      ProfileActivity.a((Activity)a.getContext(), paramView, 2);
      return;
      paramView = new ProfileActivity.AllInOne(uin, 52);
      l = nickName;
      g = 66;
      continue;
      paramView = new ProfileActivity.AllInOne(uin, 52);
      l = nickName;
      g = 66;
      continue;
      if (groupId < 0) {
        break;
      }
      paramView = new ProfileActivity.AllInOne(uin, 30);
      a = new ArrayList();
      h = nickName;
      k = contactName;
      a.add(new ProfileActivity.CardContactInfo(contactName, mobileCode, nationCode));
      g = 67;
    }
    paramView = mobileNo;
    if (originBinder == 3L) {}
    for (int i = 51;; i = 50)
    {
      paramView = new ProfileActivity.AllInOne(paramView, i);
      h = nickName;
      k = contactName;
      a = new ArrayList();
      a.add(new ProfileActivity.CardContactInfo(contactName, mobileCode, nationCode));
      g = 67;
      break;
    }
  }
}
