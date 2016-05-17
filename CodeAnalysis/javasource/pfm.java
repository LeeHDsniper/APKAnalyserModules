import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class pfm
  implements DialogInterface.OnClickListener
{
  public pfm(ForwardBaseOption paramForwardBaseOption)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return;
    case -2: 
      a.i();
      return;
    }
    a.j();
  }
}
