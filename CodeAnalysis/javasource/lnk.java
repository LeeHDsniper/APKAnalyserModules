import android.content.Context;
import android.content.Intent;
import com.tencent.av.utils.GVideoUpdateUtil.OnGVideoUpdateListener;
import com.tencent.mobileqq.activity.aio.tips.VideoStatusTipsBar;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lnk
  implements GVideoUpdateUtil.OnGVideoUpdateListener
{
  public lnk(VideoStatusTipsBar paramVideoStatusTipsBar, Intent paramIntent)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(Context paramContext, String paramString)
  {
    paramContext.startActivity(jdField_a_of_type_AndroidContentIntent);
  }
}
