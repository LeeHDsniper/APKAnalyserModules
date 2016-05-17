import com.tencent.mobileqq.activity.activateFriend.ActivateFriendGrid;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendGridItem;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.data.ActivateFriendItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import java.util.ArrayList;

public class koy
  extends FriendListObserver
{
  public koy(ActivateFriendGrid paramActivateFriendGrid)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString, boolean paramBoolean)
  {
    int i = 0;
    for (;;)
    {
      if (i < ActivateFriendGrid.a(a).size())
      {
        String str = String.valueOf(aa).get(i)).uin);
        if (paramString.equals(str))
        {
          paramString = ContactUtils.b(ActivateFriendGrid.a(a), str, false);
          ((ActivateFriendGridItem)ActivateFriendGrid.b(a).get(i)).setNickName(paramString);
        }
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = 0;
    while (i < ActivateFriendGrid.a(a).size())
    {
      String str = ContactUtils.k(ActivateFriendGrid.a(a), String.valueOf(aa).get(i)).uin));
      ((ActivateFriendGridItem)ActivateFriendGrid.b(a).get(i)).setNickName(str);
      i += 1;
    }
  }
}
