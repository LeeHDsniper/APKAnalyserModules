import android.content.Context;
import android.os.AsyncTask;
import android.os.Message;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.activity.photo.ImageInfo;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.structmsg.StructMsgForImageShare;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.SecUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.net.URL;
import mqq.os.MqqHandler;

public final class ldu
  extends AsyncTask
{
  public ldu(Context paramContext, int paramInt, QQAppInterface paramQQAppInterface, URLDrawable paramURLDrawable, StructMsgForImageShare paramStructMsgForImageShare, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected Integer a(Void... paramVarArgs)
  {
    if (jdField_a_of_type_ComTencentImageURLDrawable.getStatus() != 1) {
      jdField_a_of_type_ComTencentImageURLDrawable.downloadImediatly(false);
    }
    URLDrawable.removeMemoryCacheByUrl(jdField_a_of_type_ComTencentImageURLDrawable.getURL().toString());
    paramVarArgs = jdField_a_of_type_ComTencentImageURLDrawable.getTag()).path;
    paramVarArgs = AIOGalleryUtils.a(jdField_a_of_type_AndroidContentContext, paramVarArgs);
    if (paramVarArgs != null)
    {
      AIOGalleryUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgForImageShare, paramVarArgs);
      return Integer.valueOf(2);
    }
    paramVarArgs = jdField_a_of_type_ComTencentImageURLDrawable.getURL().toString();
    if (!AbsDownloader.a(paramVarArgs)) {
      return Integer.valueOf(1);
    }
    paramVarArgs = SecUtil.getFileMd5(AbsDownloader.a(paramVarArgs).getAbsolutePath());
    if (("".equals(paramVarArgs)) || (paramVarArgs == null)) {
      return Integer.valueOf(1);
    }
    FileUtils.b(AppConstants.bm + ".nomedia");
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    paramVarArgs = AppConstants.bm + (String)localObject1 + paramVarArgs + ".jpg";
    localObject1 = paramVarArgs + ".tmp";
    Object localObject2 = new File((String)localObject1);
    if (((File)localObject2).exists()) {
      ((File)localObject2).delete();
    }
    if (!((File)localObject2).exists()) {}
    try
    {
      ImageUtil.a((String)localObject1);
      if (jdField_a_of_type_ComTencentImageURLDrawable.saveTo((String)localObject1) == null) {
        break label366;
      }
      localObject2 = new ImageInfo();
      c = jdField_a_of_type_JavaLangString;
      if (ImageUtil.a(jdField_a_of_type_AndroidContentContext, (String)localObject1, paramVarArgs, (ImageInfo)localObject2, 1))
      {
        localObject2 = new File(paramVarArgs);
        localObject1 = new File((String)localObject1);
        if (((File)localObject2).exists())
        {
          ((File)localObject1).delete();
          return Integer.valueOf(AIOGalleryUtils.a(jdField_a_of_type_AndroidContentContext, paramVarArgs, jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgForImageShare));
        }
        throw new Exception("compressPic file fail");
      }
    }
    catch (Exception paramVarArgs)
    {
      if (QLog.isColorLevel()) {
        QLog.e("AIOGalleryUtils", 2, "", paramVarArgs);
      }
      return Integer.valueOf(1);
    }
    return Integer.valueOf(1);
    label366:
    throw new Exception("save file fail");
  }
  
  protected void a(Integer paramInteger)
  {
    if (paramInteger.intValue() == 0)
    {
      QQToast.a(jdField_a_of_type_AndroidContentContext.getApplicationContext(), jdField_a_of_type_AndroidContentContext.getString(2131368403), 0).b(jdField_a_of_type_Int);
      paramInteger = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(ChatActivity.class);
      if (paramInteger != null) {
        paramInteger.obtainMessage(10).sendToTarget();
      }
    }
    do
    {
      return;
      if (paramInteger.intValue() == 1)
      {
        QQToast.a(jdField_a_of_type_AndroidContentContext.getApplicationContext(), jdField_a_of_type_AndroidContentContext.getString(2131368492), 0).b(jdField_a_of_type_Int);
        return;
      }
      if (paramInteger.intValue() == 2)
      {
        QQToast.a(jdField_a_of_type_AndroidContentContext.getApplicationContext(), jdField_a_of_type_AndroidContentContext.getString(2131368407), 0).b(jdField_a_of_type_Int);
        return;
      }
    } while (paramInteger.intValue() != 3);
    QQToast.a(jdField_a_of_type_AndroidContentContext.getApplicationContext(), jdField_a_of_type_AndroidContentContext.getString(2131368408), 0).b(jdField_a_of_type_Int);
  }
}
