package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.WindowManager;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.msg.data.DevSingleStructMsgProcessor;
import com.tencent.device.msg.data.DeviceMsgHandle;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForDeviceSingleStruct;
import com.tencent.mobileqq.data.MessageForDeviceSingleStruct.DeviceSingleStructItemCallback;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.DeviceMsgThumbDownloader;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.open.adapter.CommonDataAdapter;
import com.tencent.qphone.base.util.QLog;
import kvj;
import kvk;
import org.json.JSONObject;

public class DeviceSingleStructBuilder
  extends AbstractChatItemBuilder
  implements MessageForDeviceSingleStruct.DeviceSingleStructItemCallback
{
  private static final String b = DeviceSingleStructBuilder.class.getSimpleName();
  protected final float a;
  View.OnClickListener a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public DeviceSingleStructBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    jdField_a_of_type_AndroidViewView$OnClickListener = new kvj(this);
    jdField_a_of_type_Float = getResourcesgetDisplayMetricsdensity;
  }
  
  private boolean a(String paramString)
  {
    boolean bool = true;
    if (TextUtils.isEmpty(paramString)) {
      return false;
    }
    try
    {
      int i = new JSONObject(paramString).optInt("reg");
      if (i == 1) {}
      for (;;)
      {
        return bool;
        bool = false;
      }
      return false;
    }
    catch (Exception paramString) {}
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramLinearLayout.setPadding(0, AIOUtils.a(11.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, 0);
    paramLinearLayout = (kvk)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903161, null);
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramViewHolder.findViewById(2131297382));
      c = ((TextView)paramViewHolder.findViewById(2131297383));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewHolder.findViewById(2131297385));
      jdField_b_of_type_AndroidWidgetImageView = ((ImageView)paramViewHolder.findViewById(2131297386));
      d = ((TextView)paramViewHolder.findViewById(2131297387));
      e = ((TextView)paramViewHolder.findViewById(2131297389));
    }
    if ((jdField_a_of_type_ComTencentMobileqqDataChatMessage instanceof MessageForDeviceSingleStruct)) {}
    for (paramMessageRecord = (MessageForDeviceSingleStruct)paramMessageRecord;; paramMessageRecord = null)
    {
      if (paramMessageRecord == null) {
        return paramViewHolder;
      }
      long l;
      if ((strTitle != null) && (!TextUtils.isEmpty(strTitle)))
      {
        jdField_b_of_type_AndroidWidgetTextView.setText(strTitle);
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
        if (nAppearTime == 0L) {
          break label415;
        }
        l = nAppearTime;
        label205:
        if (l == 0L) {
          break label424;
        }
        c.setText(TimeFormatterUtils.a(jdField_a_of_type_AndroidContentContext, l * 1000L));
        c.setVisibility(0);
        label242:
        if ((strDigest == null) || (TextUtils.isEmpty(strDigest))) {
          break label437;
        }
        d.setText(strDigest);
        d.setVisibility(0);
        label280:
        if ((strGuideWords == null) || (TextUtils.isEmpty(strGuideWords))) {
          break label450;
        }
        e.setText(strGuideWords);
        e.setVisibility(0);
        label318:
        if (nDataType != 2) {
          break label463;
        }
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
        label335:
        a(paramMessageRecord, paramLinearLayout);
        if (FileUtils.b(strCoverPath)) {
          break label476;
        }
        ((DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramMessageRecord, paramViewHolder, this);
      }
      for (;;)
      {
        paramViewHolder.setTag(paramLinearLayout);
        paramViewHolder.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
        paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
        return paramViewHolder;
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
        break;
        label415:
        l = time;
        break label205;
        label424:
        c.setVisibility(8);
        break label242;
        label437:
        d.setVisibility(8);
        break label280;
        label450:
        e.setVisibility(8);
        break label318;
        label463:
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
        break label335;
        label476:
        if ((!TextUtils.isEmpty(faceRect)) && (!FileUtils.b(strMediaPath)))
        {
          paramView = (DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
          if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51)).a(Long.parseLong(senderuin)).isAdmin == 1) {
            paramView.a().a(paramMessageRecord);
          }
        }
      }
    }
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new kvk(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    }
    do
    {
      return;
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
      return;
      paramContext = ((FragmentActivity)jdField_a_of_type_AndroidContentContext).getChatFragment().a();
      paramContext.e(paramChatMessage);
      paramContext.e(true);
    } while (paramChatMessage == null);
    if (istroop == 0) {
      paramInt = 1;
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800465F", "0X800465F", 0, 0, "" + paramInt, "", "", "");
      return;
      if (istroop == 3000) {
        paramInt = 2;
      } else if (istroop == 1) {
        paramInt = 3;
      } else {
        paramInt = 4;
      }
    }
  }
  
  public void a(View paramView, MessageForDeviceSingleStruct paramMessageForDeviceSingleStruct)
  {
    kvk localKvk = (kvk)AIOUtils.a(paramView);
    if (localKvk == null) {
      if (QLog.isColorLevel()) {
        QLog.d(b, 2, "error get holder in updateview");
      }
    }
    do
    {
      return;
      paramView = null;
      if ((jdField_a_of_type_ComTencentMobileqqDataChatMessage instanceof MessageForDeviceSingleStruct)) {
        paramView = (MessageForDeviceSingleStruct)jdField_a_of_type_ComTencentMobileqqDataChatMessage;
      }
    } while ((paramView == null) || (uniseq != uniseq) || (nCoverSessionID != nCoverSessionID));
    strCoverPath = strCoverPath;
    a(paramView, localKvk);
  }
  
  protected void a(MessageForDeviceSingleStruct paramMessageForDeviceSingleStruct, kvk paramKvk)
  {
    if (FileUtils.b(strCoverPath)) {
      try
      {
        int k = ((WindowManager)CommonDataAdapter.a().a().getSystemService("window")).getDefaultDisplay().getWidth() - 156;
        int j = (int)(150.0F * jdField_a_of_type_Float);
        int i = k;
        if (k <= 0) {
          i = j;
        }
        paramMessageForDeviceSingleStruct = DeviceMsgThumbDownloader.a(strCoverPath, i, j, strCoverMD5);
        if (paramMessageForDeviceSingleStruct != null)
        {
          paramMessageForDeviceSingleStruct = URLDrawable.getDrawable(paramMessageForDeviceSingleStruct);
          jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramMessageForDeviceSingleStruct);
        }
        return;
      }
      catch (Exception paramMessageForDeviceSingleStruct)
      {
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130837563);
        return;
      }
    }
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130837563);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    paramView.a(2131304463, jdField_a_of_type_AndroidContentContext.getString(2131367614));
    int i = 0;
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 0) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 3000))
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int == 1)
      {
        HotChatManager localHotChatManager = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
        if ((localHotChatManager == null) || (!localHotChatManager.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString))) {}
      }
      i = 1;
    }
    if ((i != 0) && (MultiMsgManager.a().a())) {
      paramView.a(2131304473, jdField_a_of_type_AndroidContentContext.getString(2131367758));
    }
    return paramView.a();
  }
}
