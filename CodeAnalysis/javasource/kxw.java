import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.PoiMapActivity;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.item.LocationItemBuilder;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kxw
  implements View.OnClickListener
{
  public kxw(LocationItemBuilder paramLocationItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    AIOUtils.l = true;
    if (LocationItemBuilder.a(a)) {}
    do
    {
      return;
      MessageForText localMessageForText = (MessageForText)AIOUtils.a(paramView);
      try
      {
        ((FragmentActivity)a.jdField_a_of_type_AndroidContentContext).getChatFragment().a().ai();
        paramView = new Intent(paramView.getContext(), PoiMapActivity.class).putExtra("lat", latitude).putExtra("lon", longitude).putExtra("url", url).putExtra("loc", location).putExtra("uin", a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
        ((BaseActivity)a.jdField_a_of_type_AndroidContentContext).startActivityForResult(paramView, 18);
        i = 1;
      }
      catch (Exception paramView)
      {
        for (;;)
        {
          try
          {
            ((Activity)a.jdField_a_of_type_AndroidContentContext).startActivityForResult(new Intent("android.intent.action.VIEW", Uri.parse(url)), 0);
            i = 1;
          }
          catch (Exception paramView)
          {
            int i = 0;
          }
        }
      }
    } while ((i == 0) || ((!(a.jdField_a_of_type_AndroidContentContext instanceof SplashActivity)) && (!(a.jdField_a_of_type_AndroidContentContext instanceof ChatActivity))));
    ((BaseActivity)a.jdField_a_of_type_AndroidContentContext).setCanLock(false);
  }
}
