import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richmedia.dc.DCShortVideo;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils.VideoFileSaveRunnable;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;
import mqq.os.MqqHandler;

public class mou
  implements ActionSheet.OnButtonClickListener
{
  public mou(ShortVideoPlayActivity paramShortVideoPlayActivity, ActionSheet paramActionSheet, String paramString1, String paramString2, boolean paramBoolean, String paramString3, String paramString4)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
    paramView = jdField_a_of_type_ComTencentWidgetActionSheet.a(paramInt);
    if (paramView.equals(jdField_a_of_type_JavaLangString))
    {
      if (QLog.isColorLevel()) {
        QLog.d("ShortVideoPlayActivity", 2, "click menu to forward shortVideo......");
      }
      paramView = jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity;
      Bundle localBundle = ShortVideoPlayActivity.a(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity).getExtras();
      localBundle.putInt("forward_type", 21);
      localBundle.putString("forward_thumb", ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_h_of_type_JavaLangString, "jpg"));
      Intent localIntent = new Intent();
      localIntent.putExtras(localBundle);
      ForwardBaseOption.a(paramView, localIntent);
      ShortVideoPlayActivity.a(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, "CliOper", "", "", "0X80052CC", "0X80052CC", 0, 0, "", "2", "", "");
    }
    do
    {
      return;
      if (paramView.equals(b))
      {
        if (!jdField_a_of_type_Boolean)
        {
          QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_AndroidContentContext, 0, 2131371181, 0).b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
          return;
        }
        ThreadManager.a().post(new ShortVideoUtils.VideoFileSaveRunnable(c, jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_MqqOsMqqHandler, jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.g + ".mp4", false));
        if (jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_h_of_type_Int == 0)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, "CliOper", "", "", "0X8004675", "0X8004675", 0, 0, "", "1", "", "");
          jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_Boolean = true;
        }
        for (;;)
        {
          new DCShortVideo(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, 2002, jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.q, jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.k);
          return;
          if (jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_h_of_type_Int == 3000)
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, "CliOper", "", "", "0X8004675", "0X8004675", 0, 0, "", "2", "", "");
            jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_Boolean = true;
          }
          else if (jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_h_of_type_Int == 1)
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, "CliOper", "", "", "0X8004675", "0X8004675", 0, 0, "", "3", "", "");
            jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_Boolean = true;
          }
          else
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, "CliOper", "", "", "0X8004675", "0X8004675", 0, 0, "", "4", "", "");
            jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_Boolean = true;
          }
        }
      }
    } while (!paramView.equals(d));
    if (!jdField_a_of_type_Boolean)
    {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_AndroidContentContext, 0, 2131371181, 0).b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
      return;
    }
    paramView = new Intent("android.intent.action.VIEW");
    paramView.setDataAndType(Uri.parse("file://" + c), "video/*");
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.startActivity(paramView);
    if (jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_h_of_type_Int == 0)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, "CliOper", "", "", "0X8004676", "0X8004676", 0, 0, "", "1", "", "");
      jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_Boolean = true;
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_h_of_type_Int == 3000)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, "CliOper", "", "", "0X8004676", "0X8004676", 0, 0, "", "2", "", "");
      jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_Boolean = true;
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_h_of_type_Int == 1)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, "CliOper", "", "", "0X8004676", "0X8004676", 0, 0, "", "3", "", "");
      jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_Boolean = true;
      return;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.app, "CliOper", "", "", "0X8004676", "0X8004676", 0, 0, "", "4", "", "");
    jdField_a_of_type_ComTencentMobileqqActivityShortvideoShortVideoPlayActivity.jdField_a_of_type_Boolean = true;
  }
}
