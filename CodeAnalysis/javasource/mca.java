import android.content.Intent;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity.sendPhotoTask;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.compress.Utils;
import com.tencent.mobileqq.utils.AlbumConstants;
import com.tencent.qphone.base.util.BaseApplication;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public class mca
  implements Runnable
{
  public mca(SendPhotoActivity.sendPhotoTask paramSendPhotoTask)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      a.a();
      a.jdField_a_of_type_AndroidContentIntent.putExtra(AlbumConstants.i, 2);
      if (!a.jdField_a_of_type_AndroidContentIntent.hasExtra("extra_image_sender_tag")) {
        a.jdField_a_of_type_AndroidContentIntent.putExtra("extra_image_sender_tag", "SendPhotoActivity.handlePhoto");
      }
      a.jdField_a_of_type_AndroidContentIntent.putExtra("open_chatfragment_fromphoto", true);
      a.jdField_a_of_type_AndroidContentIntent.putExtra("param_selNum", a.jdField_b_of_type_JavaUtilArrayList.size());
      if (!a.jdField_c_of_type_Boolean)
      {
        ((BaseActivity)a.jdField_a_of_type_JavaLangRefWeakReference.get()).setResult(-1, a.jdField_a_of_type_AndroidContentIntent);
        ((BaseActivity)a.jdField_a_of_type_JavaLangRefWeakReference.get()).finish();
        ((BaseActivity)a.jdField_a_of_type_JavaLangRefWeakReference.get()).overridePendingTransition(0, 2130968586);
        if (!a.jdField_b_of_type_Boolean)
        {
          String str1 = a.jdField_a_of_type_AndroidContentIntent.getStringExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME");
          String str2 = a.jdField_a_of_type_AndroidContentIntent.getStringExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME");
          a.jdField_a_of_type_AndroidContentIntent.setClassName(str2, str1);
          a.jdField_a_of_type_AndroidContentIntent.addFlags(603979776);
          ((BaseActivity)a.jdField_a_of_type_JavaLangRefWeakReference.get()).startActivity(a.jdField_a_of_type_AndroidContentIntent);
        }
      }
      Utils.a(BaseApplication.getContext(), a.jdField_c_of_type_JavaUtilArrayList);
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
}
