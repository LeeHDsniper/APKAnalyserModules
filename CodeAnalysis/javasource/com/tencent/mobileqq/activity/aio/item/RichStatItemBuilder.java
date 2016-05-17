package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.Layout;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.WindowManager;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.ChatBackground;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SignatureManager;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForRichState;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.IIconListener;
import com.tencent.mobileqq.richstatus.IImageListener;
import com.tencent.mobileqq.richstatus.RichStatus;
import com.tencent.mobileqq.richstatus.StatusManager;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.mobileqq.vas.SignatureTemplateInfo;
import com.tencent.mobileqq.vas.SignatureTemplateInfo.DynamicItem;
import com.tencent.mobileqq.widget.ClickableColorSpanTextView;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import kzw;
import kzx;
import kzy;
import kzz;
import laa;
import mqq.app.MobileQQ;
import org.json.JSONArray;

public class RichStatItemBuilder
  extends AbstractChatItemBuilder
  implements IIconListener, IImageListener
{
  public static final int a = 1;
  public static long a;
  private static RichStatus jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus;
  protected Handler a;
  DisplayMetrics jdField_a_of_type_AndroidUtilDisplayMetrics = new DisplayMetrics();
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener = new kzx(this);
  private AIOAnimationConatiner jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner = null;
  private SignatureManager jdField_a_of_type_ComTencentMobileqqAppSignatureManager;
  private MessageForRichState jdField_a_of_type_ComTencentMobileqqDataMessageForRichState = null;
  private StatusManager jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager;
  private StringBuilder jdField_a_of_type_JavaLangStringBuilder = new StringBuilder();
  private int jdField_b_of_type_Int;
  View.OnClickListener jdField_b_of_type_AndroidViewView$OnClickListener = new kzy(this);
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = 0L;
  }
  
  RichStatItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager = ((StatusManager)paramQQAppInterface.getManager(14));
    jdField_a_of_type_ComTencentMobileqqAppSignatureManager = ((SignatureManager)paramQQAppInterface.getManager(57));
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner = paramAIOAnimationConatiner;
    paramQQAppInterface = BaseApplicationImpl.a();
    BaseApplication.getContext();
    ((WindowManager)paramQQAppInterface.getSystemService("window")).getDefaultDisplay().getMetrics(jdField_a_of_type_AndroidUtilDisplayMetrics);
  }
  
  private CharSequence a(String paramString1, String paramString2, String paramString3, String paramString4, JSONArray paramJSONArray, int paramInt)
  {
    paramString3 = jdField_a_of_type_JavaLangStringBuilder;
    paramString3.setLength(0);
    if ((paramString1 != null) && (paramString1.length() > 0)) {
      paramString3.append(paramString1);
    }
    if ((paramString2 != null) && (paramString2.length() > 0)) {
      paramString3.append(paramString2);
    }
    int j = Integer.parseInt(paramString4);
    int i;
    if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
    {
      i = 0;
      while (i < j)
      {
        paramString4 = paramJSONArray.optString(i);
        if ((paramString4 != null) && (paramString4.length() > 0)) {
          paramString3.append(paramString4);
        }
        i += 1;
      }
    }
    if ((paramJSONArray != null) && (paramJSONArray.length() > 0))
    {
      int k = paramJSONArray.length();
      i = j;
      while (i < k)
      {
        paramString4 = paramJSONArray.optString(i);
        if ((paramString4 != null) && (paramString4.length() > 0)) {
          paramString3.append(paramString4);
        }
        i += 1;
      }
    }
    paramString4 = new SpannableString(paramString3.toString());
    if ((paramString2 != null) && (paramString2.length() > 0)) {
      if ((paramString1 != null) && (paramString1.length() > 0))
      {
        paramInt = paramString1.length() + paramString2.length();
        paramString4.setSpan(new ForegroundColorSpan(-16754769), 0, paramInt, 33);
      }
    }
    for (;;)
    {
      paramString3.setLength(0);
      return paramString4;
      paramInt = paramString2.length();
      break;
      if ((paramString1 != null) && (paramString1.length() > 0)) {
        paramString4.setSpan(new ForegroundColorSpan(paramInt), 0, paramString1.length(), 33);
      }
    }
  }
  
  public static String a(String paramString, int paramInt)
  {
    return paramString + "icon" + paramInt;
  }
  
  public static String a(String paramString1, String paramString2)
  {
    return paramString1 + "cover" + paramString2;
  }
  
  private void a(View paramView, RichStatItemBuilder.Holder paramHolder, MessageForRichState paramMessageForRichState)
  {
    if (jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus == null) {
      jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus = new RichStatus(null);
    }
    jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_f_of_type_JavaLangString = feedId;
    jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_f_of_type_Int = tplId;
    paramView = jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus;
    if (TextUtils.isEmpty(actionId))
    {
      i = jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_d_of_type_Int;
      jdField_d_of_type_Int = i;
      jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_c_of_type_JavaLangString = actionText;
      paramView = jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus;
      if (!TextUtils.isEmpty(dataId)) {
        break label260;
      }
      i = jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_e_of_type_Int;
      label97:
      jdField_e_of_type_Int = i;
      jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_d_of_type_JavaLangString = dataText;
      jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_e_of_type_JavaLangString = locText;
      paramView = jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus;
      if (!TextUtils.isEmpty(locPos)) {
        break label272;
      }
    }
    label260:
    label272:
    for (int i = jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusi;; i = Integer.parseInt(locPos))
    {
      i = i;
      jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_a_of_type_Long = time;
      jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_a_of_type_JavaUtilArrayList = null;
      if ((plainText == null) || (plainText.length() <= 0)) {
        break label284;
      }
      jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_a_of_type_JavaUtilArrayList = new ArrayList(plainText.length());
      i = 0;
      while (i < plainText.length())
      {
        jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_a_of_type_JavaUtilArrayList.add(plainText.optString(i));
        i += 1;
      }
      i = Integer.parseInt(actionId);
      break;
      i = Integer.parseInt(dataId);
      break label97;
    }
    label284:
    jdField_c_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_f_of_type_JavaLangString;
    jdField_c_of_type_Int = jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_f_of_type_Int;
    jdField_e_of_type_Int = count;
    jdField_d_of_type_Int = zanFlag;
    jdField_c_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus.a(jdField_c_of_type_AndroidWidgetTextView, TimeFormatterUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getApplicationContext(), 3, jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_a_of_type_Long * 1000L) + "    "));
    a(paramHolder);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().e(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_a_of_type_Long);
    if (!TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_f_of_type_JavaLangString))
    {
      jdField_d_of_type_AndroidWidgetTextView.setClickable(true);
      jdField_d_of_type_AndroidWidgetTextView.setText(String.valueOf(count));
      i = 8;
      if (zanFlag == 0) {
        i = 7;
      }
      paramView = jdField_a_of_type_ComTencentMobileqqAppSignatureManager.a(jdField_c_of_type_Int, i, DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 14.0F), DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 19.0F));
      if (paramView != null) {
        jdField_d_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(paramView, null, null, null);
      }
      jdField_d_of_type_AndroidWidgetTextView.setVisibility(0);
    }
    for (;;)
    {
      ThreadManager.a(new kzw(this, paramMessageForRichState), 8, null, true);
      return;
      jdField_d_of_type_AndroidWidgetTextView.setText("0");
      jdField_d_of_type_AndroidWidgetTextView.setClickable(false);
    }
  }
  
  private void a(RichStatItemBuilder.Holder paramHolder)
  {
    SignatureManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources(), jdField_a_of_type_ComTencentMobileqqWidgetClickableColorSpanTextView, jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager, jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true);
    jdField_c_of_type_AndroidWidgetTextView.setTextColor(Color.parseColor("#ffa8a8a8"));
    Object localObject2 = SignatureManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources(), jdField_a_of_type_ComTencentMobileqqWidgetClickableColorSpanTextView, jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager, jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true);
    if (localObject2 != null) {}
    for (int i = ((Layout)localObject2).getLineCount();; i = 1)
    {
      float f;
      Object localObject3;
      Object localObject1;
      if (i < 3)
      {
        i = 2;
        f = 0.35F;
        localObject3 = jdField_a_of_type_AndroidWidgetImageView.getLayoutParams();
        SignatureManager localSignatureManager = (SignatureManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(57);
        if (localSignatureManager != null)
        {
          localObject1 = localSignatureManager.a(Integer.toString(jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_f_of_type_Int));
          if ((localObject2 != null) && (!TextUtils.isEmpty(s))) {
            break label418;
          }
          height = ((int)(f * jdField_b_of_type_Int));
          label168:
          if (jdField_a_of_type_JavaLangString.equals("0")) {
            height = (((Layout)localObject2).getHeight() + DisplayUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getApplicationContext(), 75.0F));
          }
          jdField_a_of_type_AndroidWidgetImageView.setLayoutParams((ViewGroup.LayoutParams)localObject3);
          localObject2 = localSignatureManager.a(jdField_a_of_type_ComTencentMobileqqRichstatusRichStatusjdField_f_of_type_Int, i, jdField_b_of_type_Int, height);
          if (localObject2 != null)
          {
            if (!(localObject2 instanceof URLDrawable)) {
              break label448;
            }
            localObject3 = (URLDrawable)localObject2;
            if (((URLDrawable)localObject3).getStatus() == 1)
            {
              SignatureManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources(), jdField_a_of_type_ComTencentMobileqqWidgetClickableColorSpanTextView, jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager, jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false);
              if (!TextUtils.isEmpty(p)) {
                jdField_c_of_type_AndroidWidgetTextView.setTextColor(Color.parseColor(p));
              }
            }
            ((URLDrawable)localObject3).setURLDrawableListener(new kzz(this, paramHolder));
          }
        }
      }
      for (;;)
      {
        jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable((Drawable)localObject2);
        if ((SignatureManager.z != null) && (SignatureManager.a != null))
        {
          localObject1 = SignatureManager.z;
          localObject2 = SignatureManager.a;
          jdField_a_of_type_AndroidOsHandler.postDelayed(new laa(this, paramHolder, (String)localObject1, (SignatureTemplateInfo.DynamicItem)localObject2), 500L);
        }
        return;
        if (i < 5)
        {
          f = 0.46F;
          i = 3;
          break;
        }
        i = 4;
        f = 0.577F;
        break;
        label418:
        height = (((Layout)localObject2).getHeight() + DisplayUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getApplicationContext(), 75.0F));
        break label168;
        label448:
        SignatureManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources(), jdField_a_of_type_ComTencentMobileqqWidgetClickableColorSpanTextView, jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager, jdField_a_of_type_ComTencentMobileqqRichstatusRichStatus, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false);
        if (!TextUtils.isEmpty(p)) {
          jdField_c_of_type_AndroidWidgetTextView.setTextColor(Color.parseColor(p));
        }
      }
    }
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    if (AIOUtils.j) {
      return null;
    }
    b();
    jdField_a_of_type_ComTencentMobileqqDataMessageForRichState = ((MessageForRichState)paramMessageRecord);
    jdField_a_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.uniseq;
    paramOnLongClickAndTouchListener = (RichStatItemBuilder.Holder)paramViewHolder;
    paramMessageRecord = paramView;
    int i;
    int j;
    int k;
    if (paramView == null)
    {
      i = jdField_a_of_type_AndroidUtilDisplayMetrics.widthPixels;
      j = Math.min(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getDisplayMetrics().widthPixels, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getDisplayMetrics().heightPixels);
      k = DisplayUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getApplicationContext(), 38.0F);
      int m = DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 260.0F);
      paramViewHolder = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903173, paramLinearLayout, false);
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramViewHolder.findViewById(2131297463));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramViewHolder.findViewById(2131297468));
      jdField_d_of_type_AndroidWidgetTextView = ((TextView)paramViewHolder.findViewById(2131297469));
      jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)paramViewHolder.findViewById(2131297464));
      paramMessageRecord = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewViewGroup.getLayoutParams();
      if (i < m) {
        break label880;
      }
      jdField_b_of_type_Int = m;
      width = jdField_b_of_type_Int;
      jdField_a_of_type_AndroidViewViewGroup.setLayoutParams(paramMessageRecord);
      jdField_a_of_type_ComTencentMobileqqWidgetClickableColorSpanTextView = ((ClickableColorSpanTextView)paramViewHolder.findViewById(2131297466));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewHolder.findViewById(2131297465));
      paramMessageRecord = paramViewHolder;
      if (jdField_b_of_type_Boolean)
      {
        jdField_b_of_type_JavaLangStringBuilder = new StringBuilder();
        paramMessageRecord = paramViewHolder;
      }
    }
    if (jdField_b_of_type_Boolean)
    {
      paramMessageRecord.setContentDescription(null);
      jdField_b_of_type_JavaLangStringBuilder.replace(0, jdField_b_of_type_JavaLangStringBuilder.length(), "");
    }
    jdField_a_of_type_AndroidViewViewGroup.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    jdField_a_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.uniseq;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a != null) {
      jdField_b_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.a);
    }
    jdField_a_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.frienduin;
    jdField_b_of_type_Int = jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.istroop;
    jdField_b_of_type_JavaLangString = null;
    paramViewHolder = jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.ver;
    if ((paramViewHolder != null) && (paramViewHolder.equals("1.0"))) {
      if (jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.time <= 0L) {
        break label1054;
      }
    }
    label501:
    label519:
    label880:
    label906:
    label917:
    label1054:
    for (paramViewHolder = TimeFormatterUtils.a(jdField_a_of_type_AndroidContentContext, 3, jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.time * 1000L);; paramViewHolder = null)
    {
      if ((jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.feedNum != null) && (jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.feedNum.trim().length() > 0))
      {
        jdField_d_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.feedNum);
        if (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString == null) {
          break label906;
        }
        paramView = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_d_of_type_JavaLangString;
        paramView = Utils.b(paramView, 10);
        jdField_b_of_type_AndroidWidgetTextView.setText(paramView + "更新了签名");
        i = Color.parseColor(jdField_a_of_type_ComTencentMobileqqAppSignatureManager.a(Integer.toString(jdField_c_of_type_Int)).jdField_e_of_type_JavaLangString);
        paramLinearLayout = a(jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.actionText, jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.dataText, jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.locText, jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.locPos, jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.plainText, i);
        if (jdField_b_of_type_Boolean)
        {
          jdField_b_of_type_JavaLangStringBuilder.append(paramView);
          if (jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.time > 0L) {
            jdField_b_of_type_JavaLangStringBuilder.append("于").append(paramViewHolder);
          }
          jdField_b_of_type_JavaLangStringBuilder.append("更新了签名，内容是：").append(paramLinearLayout);
          paramMessageRecord.setContentDescription(jdField_b_of_type_JavaLangStringBuilder.toString());
        }
        if ((jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.dataText == null) || (jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.dataText.length() <= 0)) {
          break label917;
        }
        if ((jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.actionId == null) || (jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.actionId.trim().length() == 0)) {
          jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.actionId = "0";
        }
        if ((jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.dataId == null) || (jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.dataId.trim().length() == 0)) {
          jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.dataId = "0";
        }
        paramViewHolder = a(jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.actionId, jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.dataId);
        if (QLog.isColorLevel()) {
          QLog.d("AIOSign", 2, "taskKey is:" + paramViewHolder);
        }
        jdField_b_of_type_JavaLangString = paramViewHolder;
      }
      for (;;)
      {
        a(paramMessageRecord, paramOnLongClickAndTouchListener, jdField_a_of_type_ComTencentMobileqqDataMessageForRichState);
        jdField_d_of_type_AndroidWidgetTextView.setTag(paramOnLongClickAndTouchListener);
        jdField_d_of_type_AndroidWidgetTextView.setOnClickListener(jdField_b_of_type_AndroidViewView$OnClickListener);
        return paramMessageRecord;
        jdField_b_of_type_Int = (j - k);
        break;
        jdField_d_of_type_AndroidWidgetTextView.setText("0");
        break label501;
        paramView = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
        break label519;
        if ((jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.actionText != null) && (jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.actionText.length() > 0))
        {
          paramViewHolder = a(jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.actionId, 201);
          if (QLog.isColorLevel()) {
            QLog.d("AIOSign", 2, "taskKey is:" + paramViewHolder);
          }
          jdField_b_of_type_JavaLangString = paramViewHolder;
        }
        else if (QLog.isColorLevel())
        {
          QLog.e("AIOSign", 2, "bindViewForRichSignature(),dataText is:" + jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.dataText + ",actionText is:" + jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.actionText);
        }
      }
    }
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new RichStatItemBuilder.Holder(this);
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager != null) {
      jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager.b(this);
    }
    jdField_a_of_type_ComTencentMobileqqRichstatusStatusManager = null;
    jdField_a_of_type_ComTencentMobileqqAppSignatureManager = null;
  }
  
  public void a(int paramInt1, int paramInt2, Bitmap paramBitmap)
  {
    if (paramBitmap != null) {
      jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
    }
  }
  
  public void a(int paramInt1, int paramInt2, Bitmap paramBitmap, int paramInt3)
  {
    if (paramBitmap != null) {
      jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
    }
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage) {}
  
  public void a(MessageRecord paramMessageRecord, int paramInt, String paramString, SignatureTemplateInfo.DynamicItem paramDynamicItem, View paramView)
  {
    if ((paramString == null) || (SignatureManager.a == null)) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.a(0, 100, new Object[] { Integer.valueOf(4), Long.valueOf(uniseq), Integer.valueOf(paramInt), paramString, Boolean.valueOf(true), paramView, paramDynamicItem });
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    return null;
  }
  
  protected void b()
  {
    jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.a(0);
  }
}
