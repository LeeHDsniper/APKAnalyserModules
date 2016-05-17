import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendGrid;
import com.tencent.mobileqq.activity.activateFriend.BirthdayActivatePage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.BaseApplication;
import common.config.service.QzoneConfig;
import mqq.util.WeakReference;

public class koz
  implements View.OnClickListener
{
  public koz(BirthdayActivatePage paramBirthdayActivatePage)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((BirthdayActivatePage.a(a) != null) && (BirthdayActivatePage.a(a).get() != null))
    {
      String str = QzoneConfig.a().a("H5Url", "SendBirthdayGift", "http://h5.qzone.qq.com/friendtalk/sendgift?_wv=2097155&_bid=2045&uin={uin}&clicktime={clicktime}&friends={uin_uin}");
      long[] arrayOfLong = a.a.a();
      String[] arrayOfString = a.a.a();
      if (arrayOfLong.length > 0)
      {
        paramView = "";
        int i = 0;
        while (i < arrayOfLong.length)
        {
          paramView = paramView + arrayOfLong[i];
          paramView = paramView + "_";
          localObject = paramView + arrayOfString[i];
          int j = i + 1;
          i = j;
          paramView = (View)localObject;
          if (j < arrayOfLong.length)
          {
            paramView = (String)localObject + "|";
            i = j;
          }
        }
        paramView = str.replace("{uin_uin}", Uri.encode(paramView)).replace("{clicktime}", String.valueOf(System.currentTimeMillis()));
        Object localObject = new Intent(BaseApplication.getContext(), QQBrowserActivity.class);
        ((Intent)localObject).putExtra("url", paramView);
        ((Intent)localObject).putExtra("injectrecommend", true);
        ((Intent)localObject).setData(Uri.parse(paramView));
        ((ActivateFriendActivity)BirthdayActivatePage.a(a).get()).startActivityForResult((Intent)localObject, 1000);
        ReportController.b(aa).get()).app, "CliOper", "", "", "0X8004E08", "0X8004E08", 0, 0, String.valueOf(arrayOfLong.length), "", "", "");
      }
    }
  }
}
