import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.view.View;
import com.tencent.mobileqq.activity.aio.anim.VipPngPlayAnimationDrawable;
import com.tencent.mobileqq.activity.aio.anim.XBubbleAnimation;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ksm
  extends View
{
  public ksm(XBubbleAnimation paramXBubbleAnimation, Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected boolean verifyDrawable(Drawable paramDrawable)
  {
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.a()) || (a.b.a())) {
      a.jdField_a_of_type_AndroidOsHandler.post(new ksn(this));
    }
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable.d) && (a.b.d)) {
      a.jdField_a_of_type_AndroidOsHandler.post(new kso(this));
    }
    return true;
  }
}
