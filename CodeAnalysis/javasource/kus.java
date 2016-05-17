import android.content.Context;
import android.widget.RadioButton;
import com.tencent.mobileqq.activity.aio.audiopanel.ViewPagerRadioGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kus
  extends RadioButton
{
  public kus(ViewPagerRadioGroup paramViewPagerRadioGroup, Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean performClick()
  {
    return true;
  }
}
