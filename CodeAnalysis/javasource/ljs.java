import android.widget.ImageView;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ljs
  extends FriendListObserver
{
  public ljs(PublicAccountChatPie paramPublicAccountChatPie, ImageView paramImageView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if ((paramBoolean) && (paramString.equals(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.a().a))) {
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(jdField_a_of_type_ComTencentMobileqqActivityAioRebuildPublicAccountChatPie.a.b(paramString));
    }
  }
}
