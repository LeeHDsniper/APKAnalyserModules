import android.app.Activity;
import android.os.AsyncTask;
import com.dataline.util.file.FileUtil;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.io.File;

public final class ldt
  extends AsyncTask
{
  public ldt(File paramFile1, File paramFile2, Activity paramActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected String a(Void... paramVarArgs)
  {
    paramVarArgs = jdField_a_of_type_JavaIoFile.getAbsolutePath();
    try
    {
      if (FileUtil.a(b, jdField_a_of_type_JavaIoFile))
      {
        ImageUtil.a(jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_JavaIoFile.getAbsolutePath());
        return jdField_a_of_type_AndroidAppActivity.getString(2131368490) + " " + paramVarArgs;
      }
      paramVarArgs = jdField_a_of_type_AndroidAppActivity.getString(2131368491);
      return paramVarArgs;
    }
    catch (OutOfMemoryError paramVarArgs)
    {
      paramVarArgs = jdField_a_of_type_AndroidAppActivity.getString(2131368491);
      if (QLog.isColorLevel()) {
        QLog.e("AIOGalleryUtils", 2, "savePhoto  OOM ");
      }
    }
    return paramVarArgs;
  }
  
  protected void a(String paramString)
  {
    if ((jdField_a_of_type_AndroidAppActivity instanceof BaseActivity)) {}
    for (int i = ((BaseActivity)jdField_a_of_type_AndroidAppActivity).getTitleBarHeight();; i = 0)
    {
      QQToast.a(jdField_a_of_type_AndroidAppActivity, 2, paramString, 0).b(i);
      return;
    }
  }
}
