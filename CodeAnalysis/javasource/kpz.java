import android.content.res.Resources;
import android.graphics.PointF;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ChatHistoryForC2C;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.ChatHistoryAdapterForC2C;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder.BaseHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.BubbleContextMenu;
import com.tencent.mobileqq.utils.VipUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.widget.BubblePopupWindow;
import com.tencent.widget.BubblePopupWindow.OnDismissListener;

public class kpz
  implements View.OnClickListener, OnLongClickAndTouchListener, BubblePopupWindow.OnDismissListener
{
  private PointF jdField_a_of_type_AndroidGraphicsPointF;
  ChatMessage jdField_a_of_type_ComTencentMobileqqDataChatMessage;
  BubblePopupWindow jdField_a_of_type_ComTencentWidgetBubblePopupWindow;
  
  private kpz(ChatHistoryAdapterForC2C paramChatHistoryAdapterForC2C)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsPointF = new PointF();
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentWidgetBubblePopupWindow = null;
  }
  
  void a(View paramView)
  {
    MotionEvent localMotionEvent = MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), 3, 0.0F, 0.0F, 0);
    paramView.dispatchTouchEvent(localMotionEvent);
    localMotionEvent.recycle();
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == 2131304463)
    {
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioChatHistoryAdapterForC2C.jdField_a_of_type_AndroidContentContext instanceof ChatHistoryForC2C)) {
        ((ChatHistoryForC2C)jdField_a_of_type_ComTencentMobileqqActivityAioChatHistoryAdapterForC2C.jdField_a_of_type_AndroidContentContext).a(jdField_a_of_type_ComTencentMobileqqDataChatMessage);
      }
      VipUtils.a(jdField_a_of_type_ComTencentMobileqqActivityAioChatHistoryAdapterForC2C.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "chat_history", "ChatHistory", "Clk_delete", 1, 0, new String[0]);
    }
    jdField_a_of_type_ComTencentMobileqqDataChatMessage = null;
  }
  
  public boolean onLongClick(View paramView)
  {
    if ((jdField_a_of_type_ComTencentWidgetBubblePopupWindow != null) && (jdField_a_of_type_ComTencentWidgetBubblePopupWindow.g()))
    {
      a(paramView);
      return false;
    }
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    localQQCustomMenu.a(2131304463, jdField_a_of_type_ComTencentMobileqqActivityAioChatHistoryAdapterForC2C.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getString(2131367614));
    if (localQQCustomMenu.a() > 0)
    {
      jdField_a_of_type_ComTencentMobileqqDataChatMessage = ajdField_a_of_type_ComTencentMobileqqDataChatMessage;
      jdField_a_of_type_ComTencentWidgetBubblePopupWindow = BubbleContextMenu.a(paramView, (int)jdField_a_of_type_AndroidGraphicsPointF.x, (int)jdField_a_of_type_AndroidGraphicsPointF.y, localQQCustomMenu, this);
      jdField_a_of_type_ComTencentWidgetBubblePopupWindow.a(this);
      a(paramView);
      return true;
    }
    a(paramView);
    return false;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getAction() == 0)
    {
      jdField_a_of_type_AndroidGraphicsPointF.x = paramMotionEvent.getRawX();
      jdField_a_of_type_AndroidGraphicsPointF.y = paramMotionEvent.getRawY();
    }
    return false;
  }
}
