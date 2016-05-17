import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.activity.specialcare.VipSpecialCareHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mrh
  extends Handler
{
  public mrh(VipSpecialCareHandler paramVipSpecialCareHandler, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    }
    VipSpecialCareHandler.access$000(a, "-->request timeout");
    VipSpecialCareHandler.access$100(a, -2);
  }
}
