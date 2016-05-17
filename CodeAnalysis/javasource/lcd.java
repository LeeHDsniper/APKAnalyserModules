import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.item.TroopGiftMsgItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lcd
  implements View.OnTouchListener
{
  public lcd(TroopGiftMsgItemBuilder paramTroopGiftMsgItemBuilder, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioOnLongClickAndTouchListener.onTouch(paramView, paramMotionEvent);
    return false;
  }
}
