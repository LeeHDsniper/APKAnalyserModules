import android.view.View;
import com.tencent.mobileqq.activity.selectmember.FriendTeamListInnerFrame;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.PinnedFooterExpandableListView;
import com.tencent.widget.PinnedFooterExpandableListView.FooterExpandListViewListener;

public class mlb
  implements PinnedFooterExpandableListView.FooterExpandListViewListener
{
  public mlb(FriendTeamListInnerFrame paramFriendTeamListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    a.a = true;
    FriendTeamListInnerFrame.a(a).setFooterEnable(false);
  }
  
  public void a(PinnedFooterExpandableListView paramPinnedFooterExpandableListView, View paramView, int paramInt)
  {
    if (!a.a)
    {
      if (paramInt - 1 >= 0) {
        paramPinnedFooterExpandableListView.b(paramInt - 1);
      }
      for (;;)
      {
        a.a = true;
        FriendTeamListInnerFrame.a(a).setFooterEnable(false);
        return;
        if (QLog.isColorLevel()) {
          QLog.d("FriendTeamListInnerFrameNew", 2, "header group unusal: " + paramInt);
        }
      }
    }
    if (paramPinnedFooterExpandableListView.e(paramInt))
    {
      paramPinnedFooterExpandableListView.b(paramInt);
      return;
    }
    paramPinnedFooterExpandableListView.a(paramInt);
  }
}
