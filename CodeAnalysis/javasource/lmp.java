import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.tips.ComicTipsBar;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.comic.VipComicJumpActivity;
import cooperation.comic.VipComicReportUtils;
import org.json.JSONObject;

public class lmp
  implements View.OnClickListener
{
  public lmp(ComicTipsBar paramComicTipsBar, View paramView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (ComicTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsComicTipsBar)) {
      paramView = new JSONObject();
    }
    try
    {
      paramView.put("from", "19");
      Intent localIntent = new Intent(ComicTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsComicTipsBar), VipComicJumpActivity.class);
      localIntent.putExtra("options", paramView.toString());
      ComicTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsComicTipsBar).startActivity(localIntent);
      for (;;)
      {
        jdField_a_of_type_AndroidViewView.postDelayed(new lmq(this), 2500L);
        if (!ComicTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsComicTipsBar)) {
          break;
        }
        VipComicReportUtils.a(ComicTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsComicTipsBar), "3009", "2", "40039", ComicTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsComicTipsBar), new String[0]);
        return;
        ComicTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsComicTipsBar).finish();
      }
      VipComicReportUtils.a(ComicTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsComicTipsBar), "3006", "2", "40025", ComicTipsBar.a(jdField_a_of_type_ComTencentMobileqqActivityAioTipsComicTipsBar), new String[] { "2" });
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
}
