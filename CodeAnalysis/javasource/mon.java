import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Message;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoPlayActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.ShortVideoDownloadProcessor;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class mon
  extends MqqHandler
{
  public mon(ShortVideoPlayActivity paramShortVideoPlayActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            QQToast.a(a, 2131371154, 0).a();
            return;
            String str = a.getString(2131371155);
            paramMessage = (String)obj;
            QQToast.a(a.jdField_a_of_type_AndroidContentContext, 2, str + paramMessage, 0).a();
            ImageUtil.a(a, paramMessage);
            return;
            paramMessage = DialogUtil.a(a.jdField_a_of_type_AndroidContentContext, 232, a.jdField_a_of_type_AndroidContentContext.getResources().getString(2131371178), a.jdField_a_of_type_AndroidContentContext.getResources().getString(2131371179), 2131371180, 2131368495, new moo(this), new mop(this));
            try
            {
              paramMessage.show();
              return;
            }
            catch (Throwable paramMessage)
            {
              return;
            }
            if (QLog.isColorLevel()) {
              QLog.d("ShortVideoPlayActivity", 2, "...wifi => mobile...");
            }
            if ((a.g != 1) && (a.g != 2)) {
              break;
            }
          } while (!a.a());
          a.m();
          a.s();
          return;
        } while (a.g != 0);
        paramMessage = a.app.a().a(a.jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.frienduin, a.jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo.uniseq);
      } while ((paramMessage == null) || (!(paramMessage instanceof ShortVideoDownloadProcessor)));
      paramMessage = (ShortVideoDownloadProcessor)paramMessage;
    } while (paramMessage.c());
    paramMessage = DialogUtil.a(a.jdField_a_of_type_AndroidContentContext, 230, null, a.jdField_a_of_type_AndroidContentContext.getString(2131371182), 2131366993, 2131366992, new moq(this), new mor(this, paramMessage));
    if (a.a()) {
      a.m();
    }
    try
    {
      paramMessage.show();
      return;
    }
    catch (Throwable paramMessage) {}
  }
}
