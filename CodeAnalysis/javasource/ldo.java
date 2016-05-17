import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.content.res.Resources;
import android.os.IBinder;
import android.text.TextUtils;
import android.view.View;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.activity.aio.photo.AIOShortVideoData;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProvider;
import com.tencent.mobileqq.activity.aio.photo.PeakActivity;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richmedia.dc.DCShortVideo;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils.VideoFileSaveRunnable;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import java.io.File;
import java.util.Locale;
import mqq.app.AppRuntime;
import mqq.os.MqqHandler;

public class ldo
  implements ActionSheet.OnButtonClickListener
{
  public ldo(AIOGalleryScene paramAIOGalleryScene, ActionSheet paramActionSheet, AIOShortVideoData paramAIOShortVideoData, File paramFile)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    if (paramView == null)
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
    }
    paramView = jdField_a_of_type_ComTencentWidgetActionSheet.a(paramInt);
    if (TextUtils.isEmpty(paramView))
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
    }
    Object localObject = AIOGalleryScene.F(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getResources();
    if (paramView.equals(((Resources)localObject).getString(2131369768))) {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.asBinder().pingBinder())
      {
        paramView = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOShortVideoData.e, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOShortVideoData.i, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.l);
        if (paramView != null) {
          paramView.putExtra("NeedReportForwardShortVideo", true);
        }
        ForwardBaseOption.a(AIOGalleryScene.G(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), paramView);
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
      if (paramView.equals(((Resources)localObject).getString(2131369779)))
      {
        ReportController.b(null, "CliOper", "", "", "0X8005623", "0X8005623", 0, 0, "", "", "", "");
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.r();
      }
      else if (paramView.equals(((Resources)localObject).getString(2131369774)))
      {
        paramView = jdField_a_of_type_JavaIoFile.getParentFile().getName().toLowerCase(Locale.US) + ".mp4";
        ThreadManager.a().post(new ShortVideoUtils.VideoFileSaveRunnable(jdField_a_of_type_JavaIoFile.getAbsolutePath(), jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.jdField_a_of_type_MqqOsMqqHandler, paramView, false));
        ReportController.b(null, "CliOper", "", "", "0X800610F", "0X800610F", 0, 0, "", "", "", "");
        try
        {
          paramView = (PeakActivity)AIOGalleryScene.H(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene);
          localObject = AIOGalleryScene.I(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getIntent();
          if (localObject == null) {
            continue;
          }
          paramInt = ((Intent)localObject).getIntExtra("forward_source_uin_type", -1);
          localObject = ((Intent)localObject).getStringExtra("uin");
          new DCShortVideo(AIOGalleryScene.J(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getApplication().getBaseContext()).a(a, 2001, paramInt, (String)localObject);
        }
        catch (ClassCastException paramView) {}
      }
      else if (paramView.equals(((Resources)localObject).getString(2131369775)))
      {
        ShortVideoUtils.a(AIOGalleryScene.K(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), jdField_a_of_type_JavaIoFile);
      }
      else if ((paramView.equals(((Resources)localObject).getString(2131369772))) && (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.asBinder().pingBinder()))
      {
        QfavBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOShortVideoData.e, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOShortVideoData.i, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.l)).a(AIOGalleryScene.L(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), BaseApplicationImpl.a().a().getAccount());
        QfavReport.a(BaseApplicationImpl.a().a(), 6, 5);
      }
    }
  }
}
