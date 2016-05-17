import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lgm
  implements DialogInterface.OnClickListener
{
  lgm(lgl paramLgl, Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = AIOUtils.a(new Intent(jdField_a_of_type_AndroidContentContext, SplashActivity.class), null);
    paramDialogInterface.putExtra("uin", jdField_a_of_type_Lgl.a.a.a);
    paramDialogInterface.putExtra("uintype", 3000);
    jdField_a_of_type_AndroidContentContext.startActivity(paramDialogInterface);
  }
}
