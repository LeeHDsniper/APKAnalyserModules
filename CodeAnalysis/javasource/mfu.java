import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.filemanager.data.ForwardFileInfo;
import com.tencent.mobileqq.filemanager.fileviewer.FileBrowserActivity;
import com.tencent.mobileqq.filemanager.fileviewer.FileViewMusicService;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mfu
  implements View.OnClickListener
{
  public mfu(BannerManager paramBannerManager, View paramView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (!FileUtil.a(FileViewMusicService.a().b()))
    {
      FileViewMusicService.a().c();
      jdField_a_of_type_AndroidViewView.findViewById(2131298410).setVisibility(8);
      return;
    }
    paramView = new ForwardFileInfo();
    paramView.b(10008);
    Intent localIntent = new Intent(BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager), FileBrowserActivity.class);
    localIntent.putExtra("fileinfo", paramView);
    BannerManager.a(jdField_a_of_type_ComTencentMobileqqActivityRecentBannerManager).startActivity(localIntent);
    FileManagerReporter.a("0X8004BFE");
  }
}
