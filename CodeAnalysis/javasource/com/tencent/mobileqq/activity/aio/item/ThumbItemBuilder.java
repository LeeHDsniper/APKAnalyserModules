package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.vas.ColorRingManager;
import com.tencent.mobileqq.vip.DownloadListener;
import com.tencent.mobileqq.vip.DownloadTask;
import com.tencent.mobileqq.vip.DownloaderFactory;
import com.tencent.mobileqq.vip.DownloaderInterface;
import com.tencent.mobileqq.widget.AnyScaleTypeImageView;
import java.io.File;
import lbs;
import lbt;
import lbu;
import lbv;
import org.json.JSONException;
import org.json.JSONObject;

public class ThumbItemBuilder
  extends AbstractChatItemBuilder
{
  public static int a;
  public Handler a;
  DownloadListener jdField_a_of_type_ComTencentMobileqqVipDownloadListener = new lbu(this, "param_WIFIColorRingDownloadFlow", "param_XGColorRingDownloadFlow");
  private DownloaderFactory jdField_a_of_type_ComTencentMobileqqVipDownloaderFactory = null;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 1;
  }
  
  public ThumbItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    jdField_a_of_type_AndroidOsHandler = new lbs(this, Looper.getMainLooper());
    jdField_a_of_type_ComTencentMobileqqVipDownloaderFactory = ((DownloaderFactory)paramQQAppInterface.getManager(46));
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramLinearLayout = (lbv)paramViewHolder;
    paramViewHolder = paramMessageRecord.getExtInfoFromExtStr("colorRingID");
    if (paramViewHolder.length() > 0) {}
    for (long l = Long.parseLong(paramViewHolder);; l = 0L)
    {
      paramViewHolder = paramView;
      if (paramView == null)
      {
        paramViewHolder = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903160, null);
        jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView = ((AnyScaleTypeImageView)paramViewHolder.findViewById(2131297378));
        b = ((TextView)paramViewHolder.findViewById(2131297380));
        jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)paramViewHolder.findViewById(2131297377));
        jdField_a_of_type_AndroidViewViewGroup.setOnClickListener(new lbt(this));
      }
      paramView = ContactUtils.j(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, frienduin);
      if (l != 0L)
      {
        Object localObject = ColorRingManager.b(l, 1);
        paramOnLongClickAndTouchListener = new File((String)localObject);
        if (FileUtils.a((String)localObject)) {
          jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView.setImageBitmap(ColorRingManager.a(l));
        }
        for (;;)
        {
          String str = ColorRingManager.b(l, 2);
          paramOnLongClickAndTouchListener = new File(str);
          localObject = ColorRingManager.a(l, 2);
          if (FileUtils.a(str))
          {
            paramOnLongClickAndTouchListener = ColorRingManager.a(l);
            if (paramOnLongClickAndTouchListener != null) {}
            try
            {
              paramMessageRecord = paramMessageRecord.getExtInfoFromExtStr("tipsType");
              if (2 == Integer.parseInt(paramMessageRecord)) {
                b.setText(paramView + "设置" + jdField_a_of_type_AndroidContentContext.getString(2131370036, new Object[] { paramOnLongClickAndTouchListener.getString("name") }));
              }
              while (1 != Integer.parseInt(paramMessageRecord))
              {
                return paramViewHolder;
                str = ColorRingManager.a(l, 1);
                localObject = new Bundle();
                ((Bundle)localObject).putInt("type", 1);
                paramOnLongClickAndTouchListener = new DownloadTask(str, paramOnLongClickAndTouchListener);
                jdField_a_of_type_ComTencentMobileqqVipDownloaderFactory.a(1).a(paramOnLongClickAndTouchListener, jdField_a_of_type_ComTencentMobileqqVipDownloadListener, (Bundle)localObject);
                break;
              }
              b.setText(paramView + "更新" + jdField_a_of_type_AndroidContentContext.getString(2131370036, new Object[] { paramOnLongClickAndTouchListener.getString("name") }));
              return paramViewHolder;
            }
            catch (JSONException paramMessageRecord)
            {
              paramMessageRecord.printStackTrace();
              return paramViewHolder;
            }
          }
        }
        paramMessageRecord = new Bundle();
        paramMessageRecord.putInt("type", 2);
        paramView = new DownloadTask((String)localObject, paramOnLongClickAndTouchListener);
        jdField_a_of_type_ComTencentMobileqqVipDownloaderFactory.a(1).a(paramView, jdField_a_of_type_ComTencentMobileqqVipDownloadListener, paramMessageRecord);
        return paramViewHolder;
      }
      jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView.setImageDrawable(jdField_a_of_type_AndroidContentContext.getResources().getDrawable(2130841095));
      b.setText(paramView + jdField_a_of_type_AndroidContentContext.getString(2131370036, new Object[] { jdField_a_of_type_AndroidContentContext.getResources().getString(2131370031) }));
      return paramViewHolder;
    }
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new lbv(this);
  }
  
  public void a()
  {
    jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage) {}
  
  public QQCustomMenuItem[] a(View paramView)
  {
    return new QQCustomMenuItem[0];
  }
}
