import android.content.Context;
import android.graphics.PointF;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.ChatItemBuilder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.item.ArkUIView;
import com.tencent.mobileqq.activity.aio.item.ItemBuilderFactory;
import com.tencent.mobileqq.activity.aio.item.PicItemBuilder;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder;
import com.tencent.mobileqq.activity.aio.item.StructingMsgItemBuilder.StructingMsgViewHolder;
import com.tencent.mobileqq.activity.aio.item.TextItemBuilder;
import com.tencent.mobileqq.bubble.BubbleInfo;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsgItem;
import com.tencent.mobileqq.utils.BubbleContextMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.BubblePopupWindow;
import com.tencent.widget.BubblePopupWindow.OnDismissListener;

public class kpx
  implements View.OnClickListener, OnLongClickAndTouchListener, BubblePopupWindow.OnDismissListener
{
  private PointF jdField_a_of_type_AndroidGraphicsPointF;
  View jdField_a_of_type_AndroidViewView;
  ChatMessage jdField_a_of_type_ComTencentMobileqqDataChatMessage;
  public BubblePopupWindow a;
  boolean jdField_a_of_type_Boolean;
  View b;
  
  private kpx(ChatAdapter1 paramChatAdapter1)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsPointF = new PointF();
    jdField_a_of_type_Boolean = false;
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentWidgetBubblePopupWindow = null;
    Object localObject;
    if (jdField_a_of_type_ComTencentMobileqqDataChatMessage != null)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.jdField_a_of_type_ComTencentMobileqqActivityAioItemItemBuilderFactory.a(jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1);
      if ((localObject instanceof BaseBubbleBuilder)) {
        ((BaseBubbleBuilder)localObject).c();
      }
    }
    BubbleContextMenu.jdField_a_of_type_Boolean = false;
    if (jdField_a_of_type_AndroidViewView != null)
    {
      jdField_a_of_type_AndroidViewView.setPressed(false);
      localObject = jdField_a_of_type_AndroidViewView.getTag();
      if ((localObject == null) || (!(localObject instanceof AbsStructMsgItem))) {
        break label107;
      }
      ((AbsStructMsgItem)localObject).b(jdField_a_of_type_AndroidViewView);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidViewView = null;
      return;
      label107:
      if (((localObject instanceof StructingMsgItemBuilder.StructingMsgViewHolder)) && (b != null))
      {
        localObject = (StructingMsgItemBuilder.StructingMsgViewHolder)localObject;
        ViewGroup.LayoutParams localLayoutParams = b.getLayoutParams();
        int i = b.getPaddingLeft();
        int j = b.getPaddingTop();
        int k = b.getPaddingRight();
        int m = b.getPaddingBottom();
        if (jdField_a_of_type_Boolean)
        {
          if (jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo != null) {
            jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo.a(jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataChatMessage.isSend(), jdField_a_of_type_ComTencentMobileqqDataChatMessage.needVipBubble(), true, jdField_a_of_type_AndroidViewView, false);
          }
        }
        else
        {
          b.setBackgroundResource(2130837642);
          b.setLayoutParams(localLayoutParams);
          b.setPadding(i, j, k, m);
          b = null;
        }
      }
    }
  }
  
  void a(View paramView)
  {
    MotionEvent localMotionEvent = MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), 3, 0.0F, 0.0F, 0);
    paramView.dispatchTouchEvent(localMotionEvent);
    localMotionEvent.recycle();
  }
  
  public void onClick(View paramView)
  {
    if (jdField_a_of_type_ComTencentMobileqqDataChatMessage != null)
    {
      localChatItemBuilder = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.jdField_a_of_type_ComTencentMobileqqActivityAioItemItemBuilderFactory.a(jdField_a_of_type_ComTencentMobileqqDataChatMessage, jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1);
      localContext = paramView.getContext();
      localChatItemBuilder.a(paramView.getId(), localContext, jdField_a_of_type_ComTencentMobileqqDataChatMessage);
      jdField_a_of_type_ComTencentMobileqqDataChatMessage = null;
    }
    while (!QLog.isColorLevel())
    {
      ChatItemBuilder localChatItemBuilder;
      Context localContext;
      return;
    }
    QLog.d(ChatItemBuilder.a, 2, "bubble onClick() is called while the chatMessage is null.");
  }
  
  public boolean onLongClick(View paramView)
  {
    if (!jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.jdField_a_of_type_JavaLangBoolean.booleanValue()) {
      return true;
    }
    AIOUtils.l = true;
    if (QLog.isColorLevel()) {
      QLog.d(ChatItemBuilder.a, 2, "bubble onLongClick() is called");
    }
    if ((jdField_a_of_type_ComTencentWidgetBubblePopupWindow != null) && (jdField_a_of_type_ComTencentWidgetBubblePopupWindow.g()))
    {
      a(paramView);
      return false;
    }
    Object localObject = new QQCustomMenu();
    ChatItemBuilder localChatItemBuilder = jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.jdField_a_of_type_ComTencentMobileqqActivityAioItemItemBuilderFactory.a(AIOUtils.a(paramView), jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1);
    QQCustomMenuItem[] arrayOfQQCustomMenuItem = localChatItemBuilder.a(paramView);
    int j;
    if ((arrayOfQQCustomMenuItem != null) && (arrayOfQQCustomMenuItem.length > 0))
    {
      j = arrayOfQQCustomMenuItem.length;
      i = 0;
      while (i < j)
      {
        ((QQCustomMenu)localObject).a(arrayOfQQCustomMenuItem[i]);
        i += 1;
      }
      jdField_a_of_type_ComTencentMobileqqDataChatMessage = AIOUtils.a(paramView);
      if ((jdField_a_of_type_ComTencentMobileqqDataChatMessage == null) || (!(jdField_a_of_type_ComTencentMobileqqDataChatMessage instanceof MessageForStructing))) {
        break label536;
      }
    }
    label359:
    label475:
    label477:
    label490:
    label503:
    label536:
    for (int i = 1;; i = 0)
    {
      jdField_a_of_type_ComTencentWidgetBubblePopupWindow = BubbleContextMenu.a(paramView, (int)jdField_a_of_type_AndroidGraphicsPointF.x, (int)jdField_a_of_type_AndroidGraphicsPointF.y, (QQCustomMenu)localObject, this);
      jdField_a_of_type_ComTencentWidgetBubblePopupWindow.a(this);
      a(paramView);
      if (i != 0)
      {
        paramView.setPressed(true);
        jdField_a_of_type_AndroidViewView = paramView;
        paramView = jdField_a_of_type_AndroidViewView.getTag();
        if ((paramView instanceof AbsStructMsgItem)) {
          ((AbsStructMsgItem)paramView).c(jdField_a_of_type_AndroidViewView);
        }
      }
      else
      {
        if (!(localChatItemBuilder instanceof TextItemBuilder)) {
          break label503;
        }
        paramView = Integer.toString(0);
      }
      for (;;)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityAioChatAdapter1.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004044", "0X8004404", 0, 0, paramView, "", "", "");
        BubbleContextMenu.jdField_a_of_type_Boolean = true;
        return true;
        if (!(paramView instanceof StructingMsgItemBuilder.StructingMsgViewHolder)) {
          break;
        }
        paramView = (StructingMsgItemBuilder.StructingMsgViewHolder)paramView;
        int k;
        int m;
        if ((localChatItemBuilder instanceof StructingMsgItemBuilder))
        {
          if (((StructingMsgItemBuilder)localChatItemBuilder).a(jdField_a_of_type_ComTencentMobileqqDataChatMessage) == 0)
          {
            if ((jdField_a_of_type_AndroidWidgetRelativeLayout != null) && (jdField_a_of_type_AndroidWidgetRelativeLayout.getChildCount() > 0)) {
              b = jdField_a_of_type_AndroidWidgetRelativeLayout.getChildAt(0);
            }
            jdField_a_of_type_Boolean = false;
          }
        }
        else
        {
          if (b == null) {
            break label475;
          }
          localObject = b.getLayoutParams();
          i = b.getPaddingLeft();
          j = b.getPaddingTop();
          k = b.getPaddingRight();
          m = b.getPaddingBottom();
          if (!jdField_a_of_type_Boolean) {
            break label490;
          }
          if (!jdField_a_of_type_ComTencentMobileqqDataChatMessage.isSend()) {
            break label477;
          }
          jdField_a_of_type_AndroidViewView.setBackgroundResource(2130842536);
        }
        for (;;)
        {
          b.setLayoutParams((ViewGroup.LayoutParams)localObject);
          b.setPadding(i, j, k, m);
          break;
          b = jdField_a_of_type_AndroidWidgetRelativeLayout;
          jdField_a_of_type_Boolean = true;
          break label359;
          break;
          jdField_a_of_type_AndroidViewView.setBackgroundResource(2130842475);
          continue;
          b.setBackgroundResource(2130837654);
        }
        if ((localChatItemBuilder instanceof PicItemBuilder)) {
          paramView = Integer.toString(1);
        } else {
          paramView = Integer.toString(999);
        }
      }
      a(paramView);
      return false;
    }
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if (QLog.isColorLevel()) {
      QLog.d(ChatItemBuilder.a, 2, "bubble onTouch() is called,action is:" + paramMotionEvent.getAction());
    }
    if (paramMotionEvent.getAction() == 0)
    {
      jdField_a_of_type_AndroidGraphicsPointF.x = paramMotionEvent.getRawX();
      jdField_a_of_type_AndroidGraphicsPointF.y = paramMotionEvent.getRawY();
    }
    if ((paramView instanceof ArkUIView)) {
      ((ArkUIView)paramView).a(paramView, paramMotionEvent);
    }
    return false;
  }
}
