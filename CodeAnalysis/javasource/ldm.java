import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.RemoteException;
import android.text.TextUtils;
import android.view.View;
import com.dataline.activities.PrinterActivity;
import com.tencent.image.Utils;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.activity.aio.photo.AIOImageData;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaData;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaInfo;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProvider;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.AlbumConstants;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import cooperation.qzone.LocalMultiProcConfig;
import cooperation.qzone.QZoneClickReport;
import java.io.File;
import java.util.ArrayList;

public class ldm
  implements ActionSheet.OnButtonClickListener
{
  public ldm(AIOGalleryScene paramAIOGalleryScene, ActionSheet paramActionSheet, AIOImageData paramAIOImageData, File paramFile, AIORichMediaInfo paramAIORichMediaInfo)
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
    if (paramView == null)
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
    }
    if (TextUtils.isEmpty(paramView))
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a(paramView, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageData, jdField_a_of_type_JavaIoFile)) {}
    for (;;)
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
      if (paramView.equals(AIOGalleryScene.j(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getResources().getString(2131369768)))
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a("Pic_Forward_Contacts", 0);
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo);
      }
      else if (paramView.equals(AIOGalleryScene.k(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getResources().getString(2131369778)))
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a("Pic_Forward_Qzone", 0);
        AIOGalleryUtils.a(AIOGalleryScene.l(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.c, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.e, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.k, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.jdField_d_of_type_Boolean, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.jdField_d_of_type_JavaLangString);
      }
      else if (paramView.equals(AIOGalleryScene.m(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getResources().getString(2131369786)))
      {
        if (LocalMultiProcConfig.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.c + "__qzone_pic_permission__" + jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.jdField_d_of_type_JavaLangString, -1, Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.c).longValue()) == 0)
        {
          paramView = new QQCustomDialog(AIOGalleryScene.n(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), 2131558942);
          paramView.setContentView(2130903232);
          paramView.setTitle(AIOGalleryScene.o(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getString(2131364202));
          paramView.setMessage(AIOGalleryScene.p(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getString(2131364204));
          paramView.setNegativeButton(AIOGalleryScene.q(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getString(2131364205), new ldn(this));
          paramView.setCanceledOnTouchOutside(false);
          paramView.setCancelable(false);
          paramView.show();
          QZoneClickReport.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.c, "40", "1");
        }
        else
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a("Pic_Forward_Grpalbum", 0);
          AIOGalleryUtils.a(AIOGalleryScene.s(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.c, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.jdField_d_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.e, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageData.a, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageData.e, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageData.c, -1);
        }
      }
      else if (paramView.equals(AIOGalleryScene.t(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getResources().getString(2131369774)))
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a("Pic_save", 0);
        AIOGalleryUtils.a(AIOGalleryScene.u(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), jdField_a_of_type_JavaIoFile, Utils.Crc64String(jdField_a_of_type_JavaIoFile.getAbsolutePath()));
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a(jdField_a_of_type_JavaIoFile.getAbsolutePath(), 55);
      }
      else if (paramView.equals(AIOGalleryScene.v(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getResources().getString(2131369771)))
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.f);
        ReportController.b(null, "P_CliOper", "qrcode", "", "0X80059A4", "0X80059A4", 0, 0, "", "", "", "");
      }
      else
      {
        if (paramView.equals(AIOGalleryScene.w(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getResources().getString(2131369772))) {
          for (;;)
          {
            try
            {
              paramView = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.a.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.a.e, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.a.i);
              if (paramView != null) {
                break label758;
              }
              QfavBuilder.b(jdField_a_of_type_JavaIoFile.getAbsolutePath()).a(AIOGalleryScene.x(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.c);
              QfavReport.a(null, 40, 3);
            }
            catch (RemoteException paramView)
            {
              if (QLog.isColorLevel()) {
                QLog.e("AIOGalleryScene", 2, "", paramView);
              }
              QQToast.a(AIOGalleryScene.z(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getApplicationContext(), AIOGalleryScene.A(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getString(2131368405), 0).a();
            }
            break;
            label758:
            new QfavBuilder(paramView).a(AIOGalleryScene.y(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.c);
          }
        }
        if (paramView.equals(AIOGalleryScene.B(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getResources().getString(2131369779)))
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene.r();
        }
        else if (paramView.equals(AIOGalleryScene.C(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).getResources().getString(2131362292)))
        {
          paramView = new Intent(AIOGalleryScene.D(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene), PrinterActivity.class);
          ArrayList localArrayList = new ArrayList();
          localArrayList.add(jdField_a_of_type_JavaIoFile.getPath());
          paramView.putStringArrayListExtra("PhotoConst.PHOTO_PATHS", localArrayList);
          paramView.putExtra(AlbumConstants.i, 55);
          AIOGalleryScene.E(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene).startActivityForResult(paramView, 55);
        }
      }
    }
  }
}
