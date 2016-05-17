import android.content.Context;
import android.support.v4.app.FragmentActivity;
import com.tencent.mobileqq.activity.aio.rebuild.DiscussChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.BizTroopObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;

public class lgl
  extends BizTroopObserver
{
  public lgl(DiscussChatPie paramDiscussChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, int paramInt, String paramString1, String paramString2, Boolean paramBoolean1)
  {
    if (paramBoolean)
    {
      if ((a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity != null) && (a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity.isResume())) {
        DiscussChatPie.a(a);
      }
      do
      {
        do
        {
          return;
        } while (paramBoolean1.booleanValue());
        paramString1 = BaseActivity.sTopActivity;
      } while (paramString1 == null);
      DialogUtil.a(paramString1, 230, paramString1.getString(2131367743), null, null, paramString1.getString(2131369181), new lgm(this, paramString1), null).show();
      return;
    }
    QQToast.a(a.jdField_a_of_type_AndroidContentContext, paramInt, 0).b(a.a());
  }
}
