import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.common.app.AppInterface;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.item.ApolloItemBuilder;
import com.tencent.mobileqq.activity.aio.item.ApolloItemBuilder.ApolloGifDownloader;
import com.tencent.mobileqq.activity.aio.item.ApolloItemBuilder.Holder;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.mobileqq.vaswebviewplugin.VasWebviewUtil;
import java.io.File;

public class kuv
  implements View.OnClickListener
{
  public kuv(ApolloItemBuilder paramApolloItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (ApolloItemBuilder.a(a)) {}
    ApolloItemBuilder.Holder localHolder;
    int j;
    do
    {
      do
      {
        do
        {
          return;
          localHolder = (ApolloItemBuilder.Holder)AIOUtils.a(paramView);
        } while ((localHolder == null) || (jdField_a_of_type_ComTencentMobileqqDataChatMessage == null) || (jdField_a_of_type_ComTencentImageURLImageView == null));
        j = d;
        Object localObject2;
        if ((paramView instanceof TextView))
        {
          localObject1 = "http://cmshow.qq.com/apollo/html/intro.html?_wv=1027&_bid=2326&actionId=" + j;
          localObject2 = new Intent(paramView.getContext(), QQBrowserActivity.class);
          VasWebviewUtil.openQQBrowserWithoutAD(paramView.getContext(), (String)localObject1, -1L, (Intent)localObject2, false, -1);
          paramView = a.a;
          if (jdField_a_of_type_ComTencentMobileqqDataChatMessage.istroop == 0) {}
          for (i = 0;; i = 1)
          {
            VipUtils.a(paramView, "cmshow", "Apollo", "clk_gif", i, 0, new String[] { String.valueOf(d), "1", "0" });
            return;
          }
        }
        if (new File(ApolloItemBuilder.ApolloGifDownloader.a(j)).exists())
        {
          localObject1 = new Intent(paramView.getContext(), QQBrowserActivity.class);
          ((Intent)localObject1).putExtra("isFromCustom", true);
          localObject2 = "http://cmshow.qq.com/apollo/html/show_gif.html?_wv=16778243&_bid=2326&actionId=" + j;
          VasWebviewUtil.openQQBrowserWithoutAD(paramView.getContext(), (String)localObject2, -1L, (Intent)localObject1, false, -1);
          paramView = a.a;
          if (jdField_a_of_type_ComTencentMobileqqDataChatMessage.istroop == 0) {}
          for (i = 0;; i = 1)
          {
            VipUtils.a(paramView, "cmshow", "Apollo", "clk_gif", i, 0, new String[] { String.valueOf(j), "0", "0" });
            return;
          }
        }
        localObject1 = jdField_a_of_type_ComTencentImageURLImageView.getDrawable();
      } while ((localObject1 == null) || (!(localObject1 instanceof URLDrawable)));
      localObject1 = (URLDrawable)localObject1;
    } while ((((URLDrawable)localObject1).getStatus() != 3) && (((URLDrawable)localObject1).getStatus() != 2));
    Object localObject1 = a.a;
    if (jdField_a_of_type_ComTencentMobileqqDataChatMessage.istroop == 0) {}
    for (int i = 0;; i = 1)
    {
      VipUtils.a((AppInterface)localObject1, "cmshow", "Apollo", "clk_gif", i, 0, new String[] { String.valueOf(j), "0", "1" });
      if (!NetworkUtil.g(paramView.getContext())) {
        break;
      }
      a.a(localHolder, paramView.getResources(), true);
      return;
    }
  }
}
