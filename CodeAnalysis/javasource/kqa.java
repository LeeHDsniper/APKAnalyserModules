import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.OnCustomizeListener;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.RedPacketInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class kqa
  extends Handler
{
  public kqa(CustomizeStrategyFactory paramCustomizeStrategyFactory, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    if (what == 1)
    {
      paramMessage = (CustomizeStrategyFactory.RedPacketInfo)obj;
      if ((CustomizeStrategyFactory.a(a).containsKey(c)) && (!((ArrayList)CustomizeStrategyFactory.a(a).get(c)).isEmpty())) {
        break label57;
      }
    }
    label57:
    do
    {
      do
      {
        do
        {
          return;
          if (QLog.isColorLevel()) {
            QLog.d("CustomizeStrategyFactory", 2, "info =" + jdField_a_of_type_Int + "|" + jdField_a_of_type_JavaLangString + "|" + jdField_b_of_type_JavaLangString + "|" + System.currentTimeMillis());
          }
          Iterator localIterator = ((ArrayList)CustomizeStrategyFactory.a(a).get(c)).iterator();
          while (localIterator.hasNext())
          {
            CustomizeStrategyFactory.OnCustomizeListener localOnCustomizeListener = (CustomizeStrategyFactory.OnCustomizeListener)localIterator.next();
            if (localOnCustomizeListener != null) {
              localOnCustomizeListener.a(jdField_a_of_type_Int, paramMessage);
            }
          }
          ((ArrayList)CustomizeStrategyFactory.a(a).get(c)).clear();
          CustomizeStrategyFactory.a(a).remove(c);
        } while (CustomizeStrategyFactory.b(a).containsKey(c));
        if (jdField_a_of_type_Int != 2) {
          break;
        }
      } while (jdField_b_of_type_AndroidGraphicsBitmap == null);
      if (QLog.isColorLevel()) {
        QLog.i("CustomizeStrategyFactory", 2, "onLoadFinish: customizeBg is prepared");
      }
      CustomizeStrategyFactory.b(a).put(c, paramMessage);
      return;
    } while ((jdField_a_of_type_Int != 1) || (jdField_a_of_type_AndroidGraphicsBitmap == null));
    if (QLog.isColorLevel()) {
      QLog.i("CustomizeStrategyFactory", 2, "onLoadFinish: customizeBg is prepared");
    }
    CustomizeStrategyFactory.b(a).put(c, paramMessage);
  }
}
