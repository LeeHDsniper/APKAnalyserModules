import android.content.pm.ApplicationInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.util.FileUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mqsafeedit.MD5;
import com.tencent.mobileqq.utils.HttpDownloadUtil;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import mqq.app.MobileQQ;

public class ffn
  extends AsyncTask
{
  public ffn(AVNotifyCenter paramAVNotifyCenter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected Bitmap a(String... paramVarArgs)
  {
    paramVarArgs = paramVarArgs[0];
    if (a.jdField_a_of_type_AndroidGraphicsBitmap != null) {
      return a.jdField_a_of_type_AndroidGraphicsBitmap;
    }
    for (;;)
    {
      try
      {
        String str = a(paramVarArgs);
        FileUtil.c(str);
        if (FileUtil.a(str))
        {
          if (QLog.isColorLevel()) {
            QLog.e("AVNotifyCenter", 2, "headurl file eixst!");
          }
          try
          {
            paramVarArgs = BitmapFactory.decodeFile(str);
            if (paramVarArgs == null) {
              break label132;
            }
            a.jdField_a_of_type_AndroidGraphicsBitmap = paramVarArgs;
            return paramVarArgs;
          }
          catch (OutOfMemoryError paramVarArgs)
          {
            paramVarArgs = null;
            continue;
          }
        }
        else
        {
          File localFile = new File(str);
          boolean bool = HttpDownloadUtil.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramVarArgs, localFile);
          if (!bool) {
            break label142;
          }
          try
          {
            paramVarArgs = BitmapFactory.decodeFile(str);
          }
          catch (OutOfMemoryError paramVarArgs)
          {
            paramVarArgs = null;
          }
          continue;
        }
        a.jdField_a_of_type_AndroidGraphicsBitmap = null;
      }
      catch (Exception paramVarArgs)
      {
        a.jdField_a_of_type_AndroidGraphicsBitmap = null;
        return null;
      }
      label132:
      return null;
      label142:
      paramVarArgs = null;
    }
  }
  
  public String a(String paramString)
  {
    String str = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getApplicationInfo().dataDir + "/" + MD5.toMD5(paramString) + ".png";
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "Gen Head Path : Url = " + paramString + "Path : " + str);
    }
    return str;
  }
  
  protected void a(Bitmap paramBitmap)
  {
    super.onPostExecute(paramBitmap);
  }
}
