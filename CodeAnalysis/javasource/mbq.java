import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.activity.photo.ProGallery;
import com.tencent.mobileqq.filemanager.util.FMDialogUtil;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;
import java.util.ArrayList;
import java.util.Iterator;

public class mbq
  implements View.OnClickListener
{
  public mbq(PhotoPreviewActivity paramPhotoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    a.jdField_b_of_type_AndroidWidgetButton.setClickable(false);
    if (a.getIntent().getBooleanExtra("PhotoConst.IS_SEND_FILESIZE_LIMIT", false))
    {
      paramView = a.jdField_b_of_type_JavaUtilArrayList.iterator();
      for (long l1 = 0L; paramView.hasNext(); l1 += FileUtils.a((String)paramView.next())) {}
      long l2 = l1;
      if (a.jdField_b_of_type_JavaUtilArrayList.size() == 0)
      {
        i = a.jdField_a_of_type_ComTencentMobileqqActivityPhotoProGallery.s();
        l2 = l1;
        if (i < a.jdField_a_of_type_JavaUtilArrayList.size()) {
          l2 = l1 + FileUtils.a((String)a.jdField_a_of_type_JavaUtilArrayList.get(i));
        }
      }
      if (l2 > 3145728L) {}
      for (int i = 1; (FileManagerUtil.a()) && (i != 0); i = 0)
      {
        FMDialogUtil.a(a, 2131362794, 2131362790, new mbr(this));
        return;
      }
      a.g();
      return;
    }
    a.g();
  }
}
