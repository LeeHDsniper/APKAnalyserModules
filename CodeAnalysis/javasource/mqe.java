import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.VipUtils;

public class mqe
  implements DialogInterface.OnClickListener
{
  public mqe(QvipSpecialSoundActivity paramQvipSpecialSoundActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface.dismiss();
    VipUtils.b(a, 3, "mvip.gongneng.mobileqq.tiexintixing.ringandroid");
  }
}
