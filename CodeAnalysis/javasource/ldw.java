import android.app.Activity;
import android.content.res.Resources;
import android.os.IBinder;
import android.text.TextUtils;
import android.view.View;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListScene;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaInfo;
import com.tencent.mobileqq.activity.aio.photo.AIOShortVideoData;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProvider;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;
import cooperation.qzone.LocalMultiProcConfig;
import cooperation.qzone.QZoneClickReport;
import java.util.ArrayList;

public class ldw
  implements ActionSheet.OnButtonClickListener
{
  public ldw(AIOImageListScene paramAIOImageListScene, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    if (paramView != null)
    {
      paramView = jdField_a_of_type_ComTencentWidgetActionSheet.a(paramInt);
      if (paramView == null) {
        return;
      }
      if (!TextUtils.isEmpty(paramView))
      {
        if (!paramView.equals(AIOImageListScene.b(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene).getResources().getString(2131370486))) {
          break label195;
        }
        paramInt = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a();
        if (paramInt != 1) {
          break label94;
        }
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.p();
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a("Multi_Forward_Contacts", jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.jdField_a_of_type_JavaUtilArrayList.size());
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
      label94:
      if ((paramInt == 2) && (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.jdField_a_of_type_JavaUtilArrayList.isEmpty()) && (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.asBinder().pingBinder()))
      {
        paramView = (AIOShortVideoData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.jdField_a_of_type_JavaUtilArrayList.get(0)).a;
        paramView = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(e, i, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.x);
        ForwardBaseOption.a(AIOImageListScene.c(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene), paramView);
        continue;
        label195:
        if (paramView.equals(AIOImageListScene.d(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene).getResources().getString(2131369786)))
        {
          if (LocalMultiProcConfig.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.b + "__qzone_pic_permission__" + jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.c, -1, Long.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.b).longValue()) == 0)
          {
            paramView = new QQCustomDialog(AIOImageListScene.e(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene), 2131558942);
            paramView.setContentView(2130903232);
            paramView.setTitle(AIOImageListScene.f(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene).getString(2131364202));
            paramView.setMessage(AIOImageListScene.g(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene).getString(2131364204));
            paramView.setNegativeButton(AIOImageListScene.h(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene).getString(2131364205), new ldx(this));
            paramView.setCanceledOnTouchOutside(false);
            paramView.setCancelable(false);
            paramView.show();
            QZoneClickReport.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.b, "40", "1");
          }
          else if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.jdField_a_of_type_JavaUtilArrayList.size() > 20)
          {
            QQToast.a(AIOImageListScene.j(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene), 2131369787, 0).a();
          }
          else
          {
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.q();
          }
        }
        else if (paramView.equals(AIOImageListScene.k(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene).getResources().getString(2131369777))) {
          if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.jdField_a_of_type_JavaUtilArrayList.size() > 20) {
            QQToast.a(AIOImageListScene.l(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene), 2131369787, 0).a();
          } else {
            jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.r();
          }
        }
      }
    }
  }
}
