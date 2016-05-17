import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lep
  implements DialogInterface.OnClickListener
{
  public lep(PhotoListPanel paramPhotoListPanel, LocalMediaInfo paramLocalMediaInfo, boolean paramBoolean, String paramString1, String paramString2, String paramString3)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo, jdField_a_of_type_Boolean);
    }
    ReportController.b(null, "CliOper", "", "", jdField_a_of_type_JavaLangString, jdField_a_of_type_JavaLangString, 0, 0, b, c, "", "");
  }
}
