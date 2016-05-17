package com.tencent.mobileqq.activity.messagesearch;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.anonymous.AnonymousChatHelper.AnonymousExtInfo;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopBusinessUtil;
import com.tencent.mobileqq.troop.utils.TroopBusinessUtil.TroopBusinessMessage;
import com.tencent.mobileqq.urldrawable.URLDrawableDecodeHandler;
import com.tencent.mobileqq.util.FaceDrawable;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.util.MqqWeakReferenceHandler;

public class MessageResultAdapter
  extends BaseMessageResultAdapter
{
  public MessageResultAdapter(Context paramContext, MqqWeakReferenceHandler paramMqqWeakReferenceHandler, SessionInfo paramSessionInfo, QQAppInterface paramQQAppInterface)
  {
    super(paramContext, paramMqqWeakReferenceHandler, paramSessionInfo, paramQQAppInterface);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    MessageItem localMessageItem = (MessageItem)getItem(paramInt);
    View localView;
    MessageRecord localMessageRecord;
    if (paramView == null)
    {
      localView = View.inflate(jdField_a_of_type_AndroidContentContext, 2130903400, null);
      paramViewGroup = new BaseMessageResultAdapter.MessageHolder();
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297636));
      b = ((TextView)localView.findViewById(2131297640));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)localView.findViewById(2131296683));
      c = ((TextView)localView.findViewById(2131298321));
      localView.setTag(paramViewGroup);
      localMessageRecord = a;
      b.setText(localMessageItem.a(msg));
      localObject = senderuin;
      paramView = (View)localObject;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 1)
      {
        paramView = (View)localObject;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 3000) {
          if (!localMessageRecord.isSend()) {
            break label277;
          }
        }
      }
    }
    label277:
    for (paramView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();; paramView = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)
    {
      if (!AnonymousChatHelper.a(localMessageRecord)) {
        break label288;
      }
      paramView = AnonymousChatHelper.a(localMessageRecord);
      jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_AndroidContentContext.getResources().getString(2131364597) + jdField_b_of_type_JavaLangString);
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(URLDrawable.getDrawable(AnonymousChatHelper.a(jdField_b_of_type_Int)));
      c.setText(localMessageItem.a(time));
      return localView;
      paramViewGroup = (BaseMessageResultAdapter.MessageHolder)paramView.getTag();
      localView = paramView;
      break;
    }
    label288:
    Object localObject = TroopBusinessUtil.a(localMessageRecord);
    if (localObject != null)
    {
      paramView = c;
      Drawable localDrawable = jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130838435);
      localObject = URLDrawable.getDrawable(jdField_a_of_type_JavaLangString, localDrawable, localDrawable);
      ((URLDrawable)localObject).setTag(URLDrawableDecodeHandler.a(100, 100, 6));
      ((URLDrawable)localObject).setDecodeHandler(URLDrawableDecodeHandler.a);
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable((Drawable)localObject);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(localMessageItem.a(paramView));
      break;
      localObject = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, localMessageRecord.isSend(), senderuin);
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(FaceDrawable.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 1, paramView));
      paramView = (View)localObject;
    }
  }
}
