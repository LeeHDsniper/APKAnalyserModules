package com.tencent.mobileqq.activity.aio;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.text.method.LinkMovementMethod;
import android.text.style.ImageSpan;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.CheckBox;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForTroopFile;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.troop.utils.TroopUtils;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import kpv;

public class BaseChatItemLayout
  extends RelativeLayout
{
  public static int A = 0;
  public static final int B;
  public static int C = 0;
  public static int D = 0;
  public static int E = 0;
  static final int H = -1;
  static final int I = 0;
  static final int J = 1;
  public static final float a;
  public static final int a = 0;
  public static CompoundButton.OnCheckedChangeListener a;
  public static final float b;
  public static final int b = 1;
  public static boolean b = false;
  public static final float c;
  public static final int c = 2131296325;
  @Deprecated
  public static final float d;
  public static final int d = 98;
  public static final int e;
  public static final int f;
  public static int g;
  public static int h;
  public static int i;
  public static int j;
  public static final int k;
  public static final int l;
  public static final int m;
  public static final int n;
  public static final int o;
  public static final int p;
  public static final int q;
  public static final int r;
  public static final int s;
  public static final int t;
  public static final int u;
  public static final int v;
  public static final int w;
  public static final int x;
  public static final int y;
  public static final int z;
  int F = 0;
  int G;
  View jdField_a_of_type_AndroidViewView;
  public CheckBox a;
  public ImageView a;
  LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  ProgressBar jdField_a_of_type_AndroidWidgetProgressBar;
  public TextView a;
  public URLImageView a;
  public boolean a;
  public ImageView b;
  TextView b;
  public ImageView c;
  TextView c;
  TextView d;
  TextView e;
  private TextView f;
  private TextView g;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    BaseApplication localBaseApplication = BaseApplicationImpl.getContext();
    DisplayMetrics localDisplayMetrics = localBaseApplication.getResources().getDisplayMetrics();
    jdField_d_of_type_Float = density;
    jdField_a_of_type_Float = localBaseApplication.getResources().getDimensionPixelSize(2131492883);
    jdField_b_of_type_Float = localBaseApplication.getResources().getDimensionPixelSize(2131492868);
    jdField_c_of_type_Float = localBaseApplication.getResources().getDimensionPixelSize(2131492883);
    k = localBaseApplication.getResources().getDimensionPixelSize(2131493037);
    l = localBaseApplication.getResources().getDimensionPixelSize(2131493038);
    m = localBaseApplication.getResources().getDimensionPixelSize(2131493039);
    n = localBaseApplication.getResources().getDimensionPixelSize(2131493040);
    o = localBaseApplication.getResources().getDimensionPixelSize(2131493041);
    p = localBaseApplication.getResources().getDimensionPixelSize(2131493044);
    q = localBaseApplication.getResources().getDimensionPixelSize(2131493045);
    r = localBaseApplication.getResources().getDimensionPixelSize(2131493046);
    s = localBaseApplication.getResources().getDimensionPixelSize(2131493047);
    v = localBaseApplication.getResources().getDimensionPixelSize(2131493056);
    u = localBaseApplication.getResources().getDimensionPixelSize(2131493055);
    t = localBaseApplication.getResources().getDimensionPixelSize(2131493043);
    jdField_e_of_type_Int = widthPixels;
    jdField_f_of_type_Int = heightPixels;
    jdField_g_of_type_Int = Math.min(widthPixels, heightPixels);
    h = (int)(jdField_g_of_type_Int - 98.0F * jdField_d_of_type_Float);
    i = h - m - n;
    j = i - v * 2;
    w = localBaseApplication.getResources().getDimensionPixelSize(2131493051);
    x = localBaseApplication.getResources().getDimensionPixelSize(2131493052);
    y = localBaseApplication.getResources().getDimensionPixelSize(2131493050);
    z = localBaseApplication.getResources().getDimensionPixelSize(2131493059);
    A = localBaseApplication.getResources().getDimensionPixelSize(2131493063);
    B = jdField_e_of_type_Int - w - x - localBaseApplication.getResources().getDimensionPixelSize(2131493082) * 2;
    C = localBaseApplication.getResources().getDimensionPixelSize(2131493060);
    D = localBaseApplication.getResources().getDimensionPixelSize(2131493061);
    E = localBaseApplication.getResources().getDimensionPixelSize(2131493062);
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_AndroidWidgetCompoundButton$OnCheckedChangeListener = new kpv();
  }
  
  public BaseChatItemLayout(Context paramContext)
  {
    super(paramContext);
    jdField_a_of_type_Boolean = false;
  }
  
  public BaseChatItemLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_Boolean = false;
  }
  
  public BaseChatItemLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_Boolean = false;
  }
  
  private SpannableStringBuilder a(CharSequence paramCharSequence, TextView paramTextView, int paramInt)
  {
    if (TextUtils.isEmpty(paramCharSequence)) {
      return null;
    }
    Object localObject = paramTextView.getEllipsize();
    if (localObject != null) {}
    for (paramCharSequence = new SpannableStringBuilder(TextUtils.ellipsize(paramCharSequence, paramTextView.getPaint(), (float)(paramInt - Math.ceil(jdField_d_of_type_Float * 13.0F)), (TextUtils.TruncateAt)localObject));; paramCharSequence = new SpannableStringBuilder(paramCharSequence))
    {
      paramTextView = getResources().getDrawable(2130841273);
      paramTextView.setBounds(0, 0, (int)(jdField_d_of_type_Float * 13.0F), (int)(jdField_d_of_type_Float * 13.0F));
      paramTextView = new ImageSpan(paramTextView, 0);
      localObject = new SpannableString(" ");
      ((SpannableString)localObject).setSpan(paramTextView, 0, 1, 33);
      if ((paramCharSequence.length() <= 1) || (paramCharSequence.charAt(paramCharSequence.length() - 1) != ':')) {
        break;
      }
      paramCharSequence.insert(paramCharSequence.length() - 1, (CharSequence)localObject);
      return paramCharSequence;
    }
    paramCharSequence.append((CharSequence)localObject);
    return paramCharSequence;
  }
  
  private void a(int paramInt)
  {
    if (G != paramInt)
    {
      G = paramInt;
      if (jdField_a_of_type_AndroidWidgetImageView != null) {
        ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetImageView.getLayoutParams()).addRule(3, G);
      }
      if (jdField_a_of_type_ComTencentImageURLImageView != null) {
        ((RelativeLayout.LayoutParams)jdField_a_of_type_ComTencentImageURLImageView.getLayoutParams()).addRule(3, G);
      }
      if (jdField_c_of_type_AndroidWidgetTextView != null) {
        ((RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams()).addRule(3, G);
      }
      if (jdField_f_of_type_AndroidWidgetTextView != null) {
        ((RelativeLayout.LayoutParams)jdField_f_of_type_AndroidWidgetTextView.getLayoutParams()).addRule(3, G);
      }
      if (jdField_e_of_type_AndroidWidgetTextView != null) {
        ((RelativeLayout.LayoutParams)jdField_e_of_type_AndroidWidgetTextView.getLayoutParams()).addRule(3, G);
      }
      if (jdField_a_of_type_AndroidWidgetLinearLayout != null) {
        ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetLinearLayout.getLayoutParams()).addRule(3, G);
      }
      if ((jdField_a_of_type_AndroidViewView != null) && ((jdField_e_of_type_AndroidWidgetTextView == null) || (jdField_e_of_type_AndroidWidgetTextView.getVisibility() != 0)))
      {
        ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams()).addRule(3, G);
        if (QLog.isColorLevel()) {
          QLog.d("BubbleView", 2, " setTopId mTopId = " + G);
        }
      }
    }
  }
  
  public static void a(int paramInt1, int paramInt2)
  {
    A = BaseApplicationImpl.getContext().getResources().getDimensionPixelSize(2131493063);
    if (paramInt1 == 2)
    {
      paramInt1 = Math.max(jdField_e_of_type_Int, jdField_f_of_type_Int) - paramInt2;
      A += paramInt2;
    }
    for (;;)
    {
      if (paramInt1 != jdField_g_of_type_Int)
      {
        jdField_g_of_type_Int = paramInt1;
        h = (int)(jdField_g_of_type_Int - 98.0F * jdField_d_of_type_Float);
        i = h - m - n;
        j = i - v * 2;
      }
      return;
      paramInt1 = Math.min(jdField_e_of_type_Int, jdField_f_of_type_Int);
    }
  }
  
  private void a(TextView paramTextView, CharSequence paramCharSequence, ColorStateList paramColorStateList)
  {
    if ((paramCharSequence == null) || (paramCharSequence.length() == 0)) {
      paramTextView.setVisibility(8);
    }
    do
    {
      return;
      paramTextView.setVisibility(0);
      paramTextView.setTextSize(2, 12.0F);
      paramTextView.setIncludeFontPadding(false);
      paramTextView.setEllipsize(TextUtils.TruncateAt.END);
      paramTextView.setSingleLine();
      paramTextView.setText(paramCharSequence);
      paramTextView.setTag(paramCharSequence);
    } while (paramColorStateList == null);
    paramTextView.setTextColor(paramColorStateList);
  }
  
  public View a()
  {
    return jdField_a_of_type_AndroidViewView;
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidWidgetTextView != null)
    {
      jdField_a_of_type_AndroidWidgetTextView.setTextColor(Color.parseColor("#777777"));
      jdField_a_of_type_AndroidWidgetTextView.setTextSize(2, 12.0F);
      RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams();
      topMargin = AIOUtils.a(12.5F, getResources());
      bottomMargin = AIOUtils.a(10.5F, getResources());
    }
  }
  
  public void a(Resources paramResources)
  {
    if (jdField_b_of_type_AndroidWidgetImageView != null)
    {
      int i1 = AIOUtils.a(18.0F, paramResources);
      paramResources = new RelativeLayout.LayoutParams(i1, i1);
      paramResources.addRule(13, -1);
      if (jdField_b_of_type_AndroidWidgetImageView.getParent() != this) {
        break label74;
      }
      removeView(jdField_b_of_type_AndroidWidgetImageView);
      ((ViewGroup)jdField_a_of_type_AndroidViewView).addView(jdField_b_of_type_AndroidWidgetImageView, paramResources);
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetImageView.bringToFront();
      return;
      label74:
      jdField_b_of_type_AndroidWidgetImageView.setLayoutParams(paramResources);
    }
  }
  
  void a(View paramView)
  {
    RelativeLayout.LayoutParams localLayoutParams;
    if (jdField_a_of_type_AndroidViewView != paramView)
    {
      removeView(jdField_a_of_type_AndroidViewView);
      addView(paramView);
      jdField_a_of_type_AndroidViewView = paramView;
      jdField_a_of_type_AndroidViewView.setId(2131296325);
      localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams();
      int i1 = paramView.getContext().getResources().getDimensionPixelSize(2131493057);
      leftMargin = i1;
      rightMargin = i1;
      if (F == 1)
      {
        localLayoutParams.addRule(0, 2131296317);
        localLayoutParams.addRule(1, 0);
      }
    }
    else
    {
      paramView = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams();
      if ((jdField_e_of_type_AndroidWidgetTextView == null) || (jdField_e_of_type_AndroidWidgetTextView.getVisibility() != 0)) {
        break label167;
      }
      paramView.addRule(3, 2131296320);
      topMargin = 0;
      if (QLog.isColorLevel()) {
        QLog.d("BubbleView", 2, " setBubbleView mTopId = R.id.chat_item_nick_name");
      }
    }
    label167:
    do
    {
      return;
      localLayoutParams.addRule(1, 2131296317);
      localLayoutParams.addRule(0, 0);
      break;
      paramView.addRule(3, G);
      topMargin = o;
    } while (!QLog.isColorLevel());
    QLog.d("BubbleView", 2, " setBubbleView mTopId  = " + G);
  }
  
  void a(QQAppInterface paramQQAppInterface, boolean paramBoolean1, String paramString, boolean paramBoolean2, int paramInt1, int paramInt2)
  {
    if (paramBoolean1)
    {
      if (jdField_c_of_type_AndroidWidgetTextView == null)
      {
        jdField_c_of_type_AndroidWidgetTextView = new TextView(getContext());
        jdField_c_of_type_AndroidWidgetTextView.setId(2131296319);
        jdField_c_of_type_AndroidWidgetTextView.setTextSize(2, 12.0F);
        jdField_c_of_type_AndroidWidgetTextView.setIncludeFontPadding(false);
        jdField_c_of_type_AndroidWidgetTextView.setPadding(AIOUtils.a(5.0F, getContext().getResources()), 0, AIOUtils.a(5.0F, getContext().getResources()), 0);
        jdField_c_of_type_AndroidWidgetTextView.setEllipsize(TextUtils.TruncateAt.END);
        jdField_c_of_type_AndroidWidgetTextView.setSingleLine();
        jdField_c_of_type_AndroidWidgetTextView.setGravity(17);
        localObject = new RelativeLayout.LayoutParams(-2, -2);
        topMargin = C;
        bottomMargin = D;
        ((RelativeLayout.LayoutParams)localObject).addRule(3, G);
        if (jdField_a_of_type_AndroidViewView != null)
        {
          ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams()).addRule(3, 2131296320);
          if (QLog.isColorLevel()) {
            QLog.d("BubbleView", 2, " setTroopMemberLevel mTopId = R.id.chat_item_nick_name");
          }
        }
        addView(jdField_c_of_type_AndroidWidgetTextView, (ViewGroup.LayoutParams)localObject);
      }
      localObject = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetTextView.getLayoutParams();
      if (paramBoolean2)
      {
        rightMargin = AIOUtils.a(2.0F, getContext().getResources());
        leftMargin = 0;
        ((RelativeLayout.LayoutParams)localObject).addRule(0, 2131296320);
        ((RelativeLayout.LayoutParams)localObject).addRule(1, 0);
        jdField_c_of_type_AndroidWidgetTextView.setTextColor(paramInt2);
        if (paramInt1 != -1)
        {
          localTroopManager = (TroopManager)paramQQAppInterface.getManager(51);
          paramQQAppInterface = null;
          if (localTroopManager != null) {
            paramQQAppInterface = localTroopManager.a(paramInt1, paramString);
          }
          localObject = paramQQAppInterface;
          if (paramQQAppInterface == null)
          {
            paramQQAppInterface = TroopUtils.a(getResources(), paramInt1);
            localObject = paramQQAppInterface;
            if (localTroopManager != null)
            {
              localTroopManager.a(paramInt1, paramString, paramQQAppInterface);
              localObject = paramQQAppInterface;
            }
          }
          jdField_c_of_type_AndroidWidgetTextView.setBackgroundDrawable((Drawable)localObject);
        }
        jdField_c_of_type_AndroidWidgetTextView.setPadding(AIOUtils.a(5.0F, getContext().getResources()), 0, AIOUtils.a(5.0F, getContext().getResources()), 0);
        if (jdField_c_of_type_AndroidWidgetTextView.getVisibility() != 0) {
          jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        }
        jdField_c_of_type_AndroidWidgetTextView.setText(paramString);
        jdField_c_of_type_AndroidWidgetTextView.setContentDescription("等级" + paramString);
      }
    }
    while ((jdField_c_of_type_AndroidWidgetTextView == null) || (jdField_c_of_type_AndroidWidgetTextView.getVisibility() == 8)) {
      for (;;)
      {
        Object localObject;
        TroopManager localTroopManager;
        return;
        leftMargin = E;
        rightMargin = 0;
        ((RelativeLayout.LayoutParams)localObject).addRule(1, 2131296317);
        ((RelativeLayout.LayoutParams)localObject).addRule(0, 0);
      }
    }
    jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
  }
  
  void a(String paramString, int paramInt)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      if (jdField_f_of_type_AndroidWidgetTextView == null)
      {
        jdField_f_of_type_AndroidWidgetTextView = new TextView(getContext());
        jdField_f_of_type_AndroidWidgetTextView.setId(2131296318);
        jdField_f_of_type_AndroidWidgetTextView.setTextSize(2, 12.0F);
        jdField_f_of_type_AndroidWidgetTextView.setIncludeFontPadding(false);
        jdField_f_of_type_AndroidWidgetTextView.setPadding(AIOUtils.a(5.0F, getContext().getResources()), 0, AIOUtils.a(5.0F, getContext().getResources()), 0);
        jdField_f_of_type_AndroidWidgetTextView.setEllipsize(TextUtils.TruncateAt.END);
        jdField_f_of_type_AndroidWidgetTextView.setSingleLine();
        jdField_f_of_type_AndroidWidgetTextView.setGravity(17);
        localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
        topMargin = jdField_f_of_type_AndroidWidgetTextView.getContext().getResources().getDimensionPixelSize(2131493060);
        bottomMargin = jdField_f_of_type_AndroidWidgetTextView.getContext().getResources().getDimensionPixelSize(2131493061);
        localLayoutParams.addRule(3, G);
        if (jdField_a_of_type_AndroidViewView != null) {
          ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams()).addRule(3, 2131296320);
        }
        addView(jdField_f_of_type_AndroidWidgetTextView, localLayoutParams);
      }
      localLayoutParams = (RelativeLayout.LayoutParams)jdField_f_of_type_AndroidWidgetTextView.getLayoutParams();
      leftMargin = jdField_f_of_type_AndroidWidgetTextView.getContext().getResources().getDimensionPixelSize(2131493062);
      rightMargin = 0;
      localLayoutParams.addRule(1, 2131296317);
      localLayoutParams.addRule(0, 0);
      jdField_f_of_type_AndroidWidgetTextView.setTextColor(-1);
      jdField_f_of_type_AndroidWidgetTextView.setBackgroundResource(paramInt);
      jdField_f_of_type_AndroidWidgetTextView.setPadding(AIOUtils.a(5.0F, getContext().getResources()), 0, AIOUtils.a(5.0F, getContext().getResources()), 0);
      if (jdField_f_of_type_AndroidWidgetTextView.getVisibility() != 0) {
        jdField_f_of_type_AndroidWidgetTextView.setVisibility(0);
      }
      jdField_f_of_type_AndroidWidgetTextView.setText(paramString);
      jdField_f_of_type_AndroidWidgetTextView.setContentDescription(paramString);
    }
    while ((jdField_f_of_type_AndroidWidgetTextView == null) || (jdField_f_of_type_AndroidWidgetTextView.getVisibility() == 8))
    {
      RelativeLayout.LayoutParams localLayoutParams;
      return;
    }
    jdField_f_of_type_AndroidWidgetTextView.setVisibility(8);
  }
  
  void a(boolean paramBoolean, CharSequence paramCharSequence, ColorStateList paramColorStateList)
  {
    if (paramBoolean)
    {
      if (jdField_d_of_type_AndroidWidgetTextView == null)
      {
        jdField_a_of_type_AndroidWidgetLinearLayout = new LinearLayout(getContext());
        jdField_a_of_type_AndroidWidgetLinearLayout.setId(2131296321);
        jdField_a_of_type_AndroidWidgetLinearLayout.setOrientation(0);
        localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
        topMargin = getContext().getResources().getDimensionPixelSize(2131493060);
        bottomMargin = getContext().getResources().getDimensionPixelSize(2131493061);
        leftMargin = AIOUtils.a(12.0F, getContext().getResources());
        localLayoutParams.addRule(3, G);
        localLayoutParams.addRule(1, 2131296320);
        addView(jdField_a_of_type_AndroidWidgetLinearLayout, localLayoutParams);
      }
      if (jdField_a_of_type_AndroidWidgetLinearLayout.getVisibility() != 0) {
        jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      }
      if (jdField_d_of_type_AndroidWidgetTextView == null)
      {
        jdField_d_of_type_AndroidWidgetTextView = new TextView(getContext());
        jdField_d_of_type_AndroidWidgetTextView.setTextSize(2, 12.0F);
        jdField_d_of_type_AndroidWidgetTextView.setIncludeFontPadding(false);
        jdField_d_of_type_AndroidWidgetTextView.setEllipsize(TextUtils.TruncateAt.END);
        jdField_d_of_type_AndroidWidgetTextView.setSingleLine();
        jdField_d_of_type_AndroidWidgetTextView.setMaxWidth(i);
        localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
        jdField_a_of_type_AndroidWidgetLinearLayout.addView(jdField_d_of_type_AndroidWidgetTextView, localLayoutParams);
      }
      if (jdField_d_of_type_AndroidWidgetTextView.getVisibility() != 0) {
        jdField_d_of_type_AndroidWidgetTextView.setVisibility(0);
      }
      jdField_d_of_type_AndroidWidgetTextView.setText(paramCharSequence);
      if (paramColorStateList != null) {
        jdField_d_of_type_AndroidWidgetTextView.setTextColor(paramColorStateList);
      }
      if (jdField_e_of_type_AndroidWidgetTextView != null)
      {
        i1 = AIOUtils.a(136.0F, getContext().getResources());
        jdField_e_of_type_AndroidWidgetTextView.setMaxWidth(i1);
        jdField_e_of_type_AndroidWidgetTextView.setEllipsize(TextUtils.TruncateAt.END);
      }
    }
    while ((jdField_a_of_type_AndroidWidgetLinearLayout == null) || (jdField_a_of_type_AndroidWidgetLinearLayout.getVisibility() == 8))
    {
      RelativeLayout.LayoutParams localLayoutParams;
      int i1;
      return;
    }
    jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
  }
  
  void a(boolean paramBoolean1, CharSequence paramCharSequence, ColorStateList paramColorStateList, boolean paramBoolean2, boolean paramBoolean3)
  {
    Object localObject;
    if (paramBoolean1)
    {
      if (jdField_e_of_type_AndroidWidgetTextView == null)
      {
        jdField_e_of_type_AndroidWidgetTextView = new TextView(getContext());
        jdField_e_of_type_AndroidWidgetTextView.setId(2131296320);
        jdField_e_of_type_AndroidWidgetTextView.setTextSize(2, 12.0F);
        jdField_e_of_type_AndroidWidgetTextView.setIncludeFontPadding(false);
        jdField_e_of_type_AndroidWidgetTextView.setEllipsize(TextUtils.TruncateAt.END);
        jdField_e_of_type_AndroidWidgetTextView.setSingleLine();
        jdField_e_of_type_AndroidWidgetTextView.setMaxWidth(i);
        localObject = new RelativeLayout.LayoutParams(-2, -2);
        topMargin = jdField_e_of_type_AndroidWidgetTextView.getContext().getResources().getDimensionPixelSize(2131493060);
        bottomMargin = jdField_e_of_type_AndroidWidgetTextView.getContext().getResources().getDimensionPixelSize(2131493061);
        ((RelativeLayout.LayoutParams)localObject).addRule(3, G);
        if (jdField_a_of_type_AndroidViewView != null)
        {
          ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams()).addRule(3, 2131296320);
          if (QLog.isColorLevel()) {
            QLog.d("BubbleView", 2, " setNick mTopId = R.id.chat_item_nick_name");
          }
        }
        addView(jdField_e_of_type_AndroidWidgetTextView, (ViewGroup.LayoutParams)localObject);
      }
      localObject = (RelativeLayout.LayoutParams)jdField_e_of_type_AndroidWidgetTextView.getLayoutParams();
      if (paramBoolean2)
      {
        rightMargin = jdField_e_of_type_AndroidWidgetTextView.getContext().getResources().getDimensionPixelSize(2131493062);
        leftMargin = 0;
        ((RelativeLayout.LayoutParams)localObject).addRule(0, 2131296317);
        ((RelativeLayout.LayoutParams)localObject).addRule(1, 0);
        if (jdField_e_of_type_AndroidWidgetTextView.getVisibility() != 0)
        {
          jdField_e_of_type_AndroidWidgetTextView.setVisibility(0);
          if (jdField_a_of_type_AndroidViewView != null)
          {
            ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams()).addRule(3, 2131296320);
            if (QLog.isColorLevel()) {
              QLog.d("BubbleView", 2, " setNick mTopId = R.id.chat_item_nick_name");
            }
          }
        }
        if (!paramBoolean3) {
          break label501;
        }
        localObject = a(paramCharSequence, jdField_e_of_type_AndroidWidgetTextView, i);
        label331:
        if (localObject == null) {
          break label507;
        }
        jdField_e_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
        label345:
        jdField_e_of_type_AndroidWidgetTextView.setTag(paramCharSequence);
        if (paramColorStateList != null) {
          jdField_e_of_type_AndroidWidgetTextView.setTextColor(paramColorStateList);
        }
      }
    }
    label501:
    label507:
    do
    {
      do
      {
        do
        {
          return;
          if ((jdField_c_of_type_AndroidWidgetTextView != null) && (jdField_c_of_type_AndroidWidgetTextView.getVisibility() == 0))
          {
            leftMargin = AIOUtils.a(2.0F, getContext().getResources());
            ((RelativeLayout.LayoutParams)localObject).addRule(1, 2131296319);
          }
          for (;;)
          {
            rightMargin = 0;
            ((RelativeLayout.LayoutParams)localObject).addRule(0, 0);
            break;
            if ((jdField_f_of_type_AndroidWidgetTextView != null) && (jdField_f_of_type_AndroidWidgetTextView.getVisibility() == 0))
            {
              leftMargin = AIOUtils.a(2.0F, getContext().getResources());
              ((RelativeLayout.LayoutParams)localObject).addRule(1, 2131296318);
            }
            else
            {
              leftMargin = jdField_e_of_type_AndroidWidgetTextView.getContext().getResources().getDimensionPixelSize(2131493062);
              ((RelativeLayout.LayoutParams)localObject).addRule(1, 2131296317);
            }
          }
          localObject = null;
          break label331;
          jdField_e_of_type_AndroidWidgetTextView.setText(paramCharSequence);
          break label345;
        } while ((jdField_e_of_type_AndroidWidgetTextView == null) || (jdField_e_of_type_AndroidWidgetTextView.getVisibility() == 8));
        jdField_e_of_type_AndroidWidgetTextView.setVisibility(8);
      } while (jdField_a_of_type_AndroidViewView == null);
      ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams()).addRule(3, G);
    } while (!QLog.isColorLevel());
    QLog.d("BubbleView", 2, " setNick mTopId = " + G);
  }
  
  public boolean a()
  {
    return F == 1;
  }
  
  public void addChildrenForAccessibility(ArrayList paramArrayList)
  {
    int i2;
    int i1;
    do
    {
      try
      {
        super.addChildrenForAccessibility(paramArrayList);
        return;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        i2 = getChildCount();
        i1 = 0;
      }
    } while (i1 >= i2);
    View localView = getChildAt(i1);
    if (localView.getVisibility() == 0)
    {
      if (!localView.includeForAccessibility()) {
        break label57;
      }
      paramArrayList.add(localView);
    }
    for (;;)
    {
      i1 += 1;
      break;
      label57:
      localView.addChildrenForAccessibility(paramArrayList);
    }
  }
  
  public void b()
  {
    RelativeLayout.LayoutParams localLayoutParams;
    if (jdField_a_of_type_AndroidWidgetProgressBar != null)
    {
      int i1 = AIOUtils.a(16.0F, getContext().getResources());
      localLayoutParams = new RelativeLayout.LayoutParams(i1, i1);
      localLayoutParams.addRule(13, -1);
      if (jdField_a_of_type_AndroidWidgetProgressBar.getParent() != this) {
        break label80;
      }
      removeView(jdField_a_of_type_AndroidWidgetProgressBar);
      ((ViewGroup)jdField_a_of_type_AndroidViewView).addView(jdField_a_of_type_AndroidWidgetProgressBar, localLayoutParams);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetProgressBar.bringToFront();
      return;
      label80:
      jdField_a_of_type_AndroidWidgetProgressBar.setLayoutParams(localLayoutParams);
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((jdField_b_of_type_Boolean) && (paramMotionEvent.getAction() == 0))
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MultiMsg", 4, "BaseChatItemLayout onInterceptTouchEvent...down ");
      }
      return true;
    }
    return super.onInterceptTouchEvent(paramMotionEvent);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (jdField_b_of_type_Boolean)
    {
      if (paramMotionEvent.getAction() == 0) {
        if (QLog.isDevelopLevel()) {
          QLog.d("MultiMsg", 4, "BaseChatItemLayout onTouchEvent...down ");
        }
      }
      do
      {
        do
        {
          return true;
        } while (paramMotionEvent.getAction() != 1);
        paramMotionEvent = findViewById(2131296329);
      } while ((paramMotionEvent == null) || (!(paramMotionEvent instanceof CheckBox)) || (paramMotionEvent.getVisibility() != 0));
      paramMotionEvent = (CheckBox)paramMotionEvent;
      if (!paramMotionEvent.isChecked()) {}
      for (boolean bool = true;; bool = false)
      {
        paramMotionEvent.setChecked(bool);
        return true;
      }
    }
    return super.onTouchEvent(paramMotionEvent);
  }
  
  public void setCheckBox(ChatMessage paramChatMessage, BaseChatItemLayout paramBaseChatItemLayout, QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo)
  {
    boolean bool = jdField_b_of_type_Boolean;
    if (jdField_b_of_type_Boolean) {
      if (jdField_a_of_type_AndroidWidgetCheckBox == null)
      {
        jdField_a_of_type_AndroidWidgetCheckBox = new CheckBox(getContext());
        jdField_a_of_type_AndroidWidgetCheckBox.setButtonDrawable(2130838044);
        jdField_a_of_type_AndroidWidgetCheckBox.setId(2131296329);
        jdField_a_of_type_AndroidWidgetCheckBox.setOnCheckedChangeListener(jdField_a_of_type_AndroidWidgetCompoundButton$OnCheckedChangeListener);
        paramBaseChatItemLayout = new RelativeLayout.LayoutParams(-2, -2);
        topMargin = z;
        paramBaseChatItemLayout.addRule(9);
        paramBaseChatItemLayout.addRule(3, G);
        addView(jdField_a_of_type_AndroidWidgetCheckBox, paramBaseChatItemLayout);
        jdField_a_of_type_AndroidWidgetCheckBox.setTag(paramChatMessage);
        if ((paramChatMessage instanceof MessageForTroopFile)) {
          bool = false;
        }
        if (!bool) {
          break label210;
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(0);
        if (!MultiMsgManager.a().a(paramChatMessage)) {
          break label201;
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
      }
    }
    label201:
    label210:
    while (jdField_a_of_type_AndroidWidgetCheckBox == null)
    {
      for (;;)
      {
        return;
        paramBaseChatItemLayout = new RelativeLayout.LayoutParams(-2, -2);
        topMargin = z;
        paramBaseChatItemLayout.addRule(9);
        paramBaseChatItemLayout.addRule(3, G);
        jdField_a_of_type_AndroidWidgetCheckBox.setLayoutParams(paramBaseChatItemLayout);
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      return;
      jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(4);
      return;
    }
    jdField_a_of_type_AndroidWidgetCheckBox.setVisibility(8);
  }
  
  public void setFailedIconResource(int paramInt, View.OnClickListener paramOnClickListener)
  {
    setFailedIconResource(paramInt, paramOnClickListener, null);
  }
  
  public void setFailedIconResource(int paramInt, View.OnClickListener paramOnClickListener, Object paramObject)
  {
    RelativeLayout.LayoutParams localLayoutParams;
    if (jdField_b_of_type_AndroidWidgetImageView == null)
    {
      jdField_b_of_type_AndroidWidgetImageView = new ImageView(getContext());
      jdField_b_of_type_AndroidWidgetImageView.setId(2131296324);
      jdField_b_of_type_AndroidWidgetImageView.setContentDescription(getContext().getString(2131370850));
      localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      bottomMargin = AIOUtils.a(16.0F, getContext().getResources());
      localLayoutParams.addRule(8, 2131296325);
      if (F != 1) {
        break label155;
      }
      localLayoutParams.addRule(0, 2131296325);
      localLayoutParams.addRule(1, 0);
    }
    for (;;)
    {
      addView(jdField_b_of_type_AndroidWidgetImageView, localLayoutParams);
      jdField_b_of_type_AndroidWidgetImageView.setImageResource(paramInt);
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetImageView.setOnClickListener(paramOnClickListener);
      jdField_b_of_type_AndroidWidgetImageView.setTag(paramObject);
      return;
      label155:
      localLayoutParams.addRule(1, 2131296325);
      localLayoutParams.addRule(0, 0);
    }
  }
  
  public void setFailedIconVisable(boolean paramBoolean, View.OnClickListener paramOnClickListener)
  {
    if (paramBoolean) {
      setFailedIconResource(2130837629, paramOnClickListener);
    }
    for (;;)
    {
      if ((jdField_b_of_type_Boolean) && (jdField_b_of_type_AndroidWidgetImageView != null)) {
        jdField_b_of_type_AndroidWidgetImageView.setOnClickListener(null);
      }
      return;
      if (jdField_b_of_type_AndroidWidgetImageView != null)
      {
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
        jdField_b_of_type_AndroidWidgetImageView.setOnClickListener(null);
      }
    }
  }
  
  public void setGrayTipsText(boolean paramBoolean, CharSequence paramCharSequence, ColorStateList paramColorStateList)
  {
    int i2 = 0;
    int i1;
    if (paramBoolean)
    {
      if (jdField_b_of_type_AndroidWidgetTextView == null)
      {
        jdField_b_of_type_AndroidWidgetTextView = new TextView(getContext());
        jdField_b_of_type_AndroidWidgetTextView.setId(2131296316);
        i1 = AIOUtils.a(12.0F, getContext().getResources());
        i2 = AIOUtils.a(5.0F, getContext().getResources());
        jdField_b_of_type_AndroidWidgetTextView.setBackgroundResource(2130840217);
        jdField_b_of_type_AndroidWidgetTextView.setTextSize(2, 13.0F);
        if (paramColorStateList != null) {
          jdField_b_of_type_AndroidWidgetTextView.setTextColor(paramColorStateList);
        }
        jdField_b_of_type_AndroidWidgetTextView.setPadding(i1, i2, i1, i2);
        jdField_b_of_type_AndroidWidgetTextView.setGravity(17);
        jdField_b_of_type_AndroidWidgetTextView.setMovementMethod(new LinkMovementMethod());
        paramColorStateList = new RelativeLayout.LayoutParams(AIOUtils.a(235.0F, getContext().getResources()), -2);
        bottomMargin = getContext().getResources().getDimensionPixelOffset(2131493049);
        i1 = AIOUtils.a(45.0F, getContext().getResources());
        leftMargin = i1;
        rightMargin = i1;
        paramColorStateList.addRule(14);
        paramColorStateList.addRule(3, 2131296315);
        addView(jdField_b_of_type_AndroidWidgetTextView, paramColorStateList);
      }
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
      if ((paramCharSequence != null) && (!paramCharSequence.equals(jdField_b_of_type_AndroidWidgetTextView.getTag())))
      {
        jdField_b_of_type_AndroidWidgetTextView.setText(paramCharSequence);
        jdField_b_of_type_AndroidWidgetTextView.setTag(paramCharSequence);
      }
      a(2131296316);
    }
    do
    {
      while ((G == 2131296315) && (jdField_a_of_type_AndroidWidgetTextView != null))
      {
        paramCharSequence = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams();
        topMargin = getContext().getResources().getDimensionPixelSize(2131493048);
        jdField_a_of_type_AndroidWidgetTextView.setLayoutParams(paramCharSequence);
        return;
        if (jdField_b_of_type_AndroidWidgetTextView != null)
        {
          jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
          i1 = i2;
          if (jdField_a_of_type_AndroidWidgetTextView != null)
          {
            i1 = i2;
            if (jdField_a_of_type_AndroidWidgetTextView.getVisibility() == 0) {
              i1 = 2131296315;
            }
          }
          a(i1);
        }
      }
    } while ((G != 2131296316) || (jdField_b_of_type_AndroidWidgetTextView == null));
    paramCharSequence = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidWidgetTextView.getLayoutParams();
    topMargin = AIOUtils.a(10.0F, getContext().getResources());
    jdField_b_of_type_AndroidWidgetTextView.setLayoutParams(paramCharSequence);
  }
  
  public void setHeadIconVisible(boolean paramBoolean)
  {
    if (jdField_a_of_type_AndroidWidgetImageView != null)
    {
      if (paramBoolean) {
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
      }
    }
    else if (jdField_e_of_type_AndroidWidgetTextView != null)
    {
      if (!paramBoolean) {
        break label56;
      }
      jdField_e_of_type_AndroidWidgetTextView.setVisibility(0);
    }
    for (;;)
    {
      setPendantImageVisible(paramBoolean);
      return;
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
      break;
      label56:
      jdField_e_of_type_AndroidWidgetTextView.setVisibility(8);
    }
  }
  
  public void setHeaderIcon(Drawable paramDrawable)
  {
    int i1 = getContext().getResources().getDimensionPixelSize(2131493059);
    int i2 = AIOUtils.a(5.0F, getContext().getResources());
    RelativeLayout.LayoutParams localLayoutParams;
    if (jdField_a_of_type_AndroidWidgetImageView == null)
    {
      jdField_a_of_type_AndroidWidgetImageView = new ImageView(getContext());
      jdField_a_of_type_AndroidWidgetImageView.setId(2131296317);
      jdField_a_of_type_AndroidWidgetImageView.setScaleType(ImageView.ScaleType.FIT_XY);
      int i3 = AIOUtils.a(40.0F, getContext().getResources());
      localLayoutParams = new RelativeLayout.LayoutParams(i3, i3);
      topMargin = i1;
      localLayoutParams.addRule(3, 2131296316);
      if (F == 1)
      {
        localLayoutParams.addRule(11);
        localLayoutParams.addRule(9, 0);
        rightMargin = i2;
        leftMargin = 0;
        localLayoutParams.addRule(3, G);
        addView(jdField_a_of_type_AndroidWidgetImageView, localLayoutParams);
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramDrawable);
      return;
      localLayoutParams.addRule(9);
      localLayoutParams.addRule(11, 0);
      if ((jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_AndroidWidgetCheckBox.getVisibility() != 8)) {}
      for (leftMargin = AIOUtils.a(30.0F, getContext().getResources());; leftMargin = i2)
      {
        rightMargin = 0;
        break;
      }
      localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetImageView.getLayoutParams();
      topMargin = i1;
      localLayoutParams.addRule(3, 2131296316);
      if (F != 1) {
        break label321;
      }
      localLayoutParams.addRule(11);
      localLayoutParams.addRule(9, 0);
      rightMargin = i2;
      leftMargin = 0;
      localLayoutParams.addRule(3, G);
    }
    label321:
    localLayoutParams.addRule(9);
    localLayoutParams.addRule(11, 0);
    if ((jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_AndroidWidgetCheckBox.getVisibility() != 8)) {}
    for (leftMargin = AIOUtils.a(30.0F, getContext().getResources());; leftMargin = i2)
    {
      rightMargin = 0;
      break;
    }
  }
  
  public void setHearIconPosition(int paramInt)
  {
    int i1;
    if (F != paramInt)
    {
      F = paramInt;
      if (paramInt != 1) {
        break label435;
      }
      i1 = 1;
      if ((jdField_a_of_type_AndroidWidgetTextView == null) || (jdField_a_of_type_AndroidWidgetTextView.getVisibility() != 0)) {
        break label630;
      }
    }
    label225:
    label318:
    label435:
    label510:
    label574:
    label593:
    label611:
    label630:
    for (paramInt = jdField_a_of_type_AndroidWidgetTextView.getId();; paramInt = 0)
    {
      if ((jdField_b_of_type_AndroidWidgetTextView != null) && (jdField_b_of_type_AndroidWidgetTextView.getVisibility() == 0)) {
        paramInt = jdField_b_of_type_AndroidWidgetTextView.getId();
      }
      for (;;)
      {
        if (jdField_a_of_type_AndroidWidgetCheckBox != null) {
          ((RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetCheckBox.getLayoutParams()).addRule(9);
        }
        RelativeLayout.LayoutParams localLayoutParams;
        int i2;
        if ((jdField_a_of_type_AndroidWidgetImageView != null) && (jdField_a_of_type_AndroidWidgetImageView.getVisibility() == 0))
        {
          localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetImageView.getLayoutParams();
          i2 = AIOUtils.a(5.0F, getContext().getResources());
          if (i1 != 0)
          {
            localLayoutParams.addRule(11);
            localLayoutParams.addRule(9, 0);
            rightMargin = i2;
            leftMargin = 0;
            localLayoutParams.addRule(3, paramInt);
          }
        }
        else
        {
          if ((jdField_a_of_type_ComTencentImageURLImageView != null) && (jdField_a_of_type_ComTencentImageURLImageView.getVisibility() == 0))
          {
            localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_ComTencentImageURLImageView.getLayoutParams();
            if (F != 1) {
              break label510;
            }
            localLayoutParams.addRule(11);
            localLayoutParams.addRule(9, 0);
            localLayoutParams.addRule(3, G);
          }
          i2 = paramInt;
          if (jdField_e_of_type_AndroidWidgetTextView != null)
          {
            i2 = paramInt;
            if (jdField_e_of_type_AndroidWidgetTextView.getVisibility() == 0)
            {
              ((RelativeLayout.LayoutParams)jdField_e_of_type_AndroidWidgetTextView.getLayoutParams()).addRule(3, paramInt);
              i2 = jdField_e_of_type_AndroidWidgetTextView.getId();
            }
          }
          if (jdField_a_of_type_AndroidViewView != null)
          {
            localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewView.getLayoutParams();
            if (i1 == 0) {
              break label574;
            }
            localLayoutParams.addRule(0, 2131296317);
            localLayoutParams.addRule(1, 0);
            localLayoutParams.addRule(3, i2);
            if (QLog.isColorLevel()) {
              QLog.d("BubbleView", 2, " setHearIconPosition mTopId = " + i2);
            }
          }
          if (jdField_a_of_type_AndroidWidgetProgressBar != null)
          {
            localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetProgressBar.getLayoutParams();
            if (i1 == 0) {
              break label593;
            }
            localLayoutParams.addRule(0, 2131296325);
            localLayoutParams.addRule(1, 0);
          }
        }
        for (;;)
        {
          if (jdField_b_of_type_AndroidWidgetImageView != null)
          {
            localLayoutParams = (RelativeLayout.LayoutParams)jdField_b_of_type_AndroidWidgetImageView.getLayoutParams();
            if (i1 == 0) {
              break label611;
            }
            localLayoutParams.addRule(0, 2131296325);
            localLayoutParams.addRule(1, 0);
          }
          return;
          i1 = 0;
          break;
          localLayoutParams.addRule(9);
          localLayoutParams.addRule(11, 0);
          if ((jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_AndroidWidgetCheckBox.getVisibility() != 8)) {}
          for (leftMargin = AIOUtils.a(30.0F, getContext().getResources());; leftMargin = i2)
          {
            rightMargin = 0;
            break;
          }
          localLayoutParams.addRule(9);
          localLayoutParams.addRule(11, 0);
          if ((jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_AndroidWidgetCheckBox.getVisibility() != 8))
          {
            leftMargin = AIOUtils.a(25.0F, getContext().getResources());
            break label225;
          }
          leftMargin = 0;
          break label225;
          localLayoutParams.addRule(1, 2131296317);
          localLayoutParams.addRule(0, 0);
          break label318;
          localLayoutParams.addRule(1, 2131296325);
          localLayoutParams.addRule(0, 0);
        }
        localLayoutParams.addRule(1, 2131296325);
        localLayoutParams.addRule(0, 0);
        return;
      }
    }
  }
  
  public void setPendantImage(Drawable paramDrawable)
  {
    if (jdField_a_of_type_ComTencentImageURLImageView == null)
    {
      jdField_a_of_type_ComTencentImageURLImageView = new URLImageView(getContext());
      jdField_a_of_type_ComTencentImageURLImageView.setId(2131296327);
      jdField_a_of_type_ComTencentImageURLImageView.setScaleType(ImageView.ScaleType.FIT_XY);
      localLayoutParams = new RelativeLayout.LayoutParams(AIOUtils.a(50.0F, getContext().getResources()), AIOUtils.a(59.0F, getContext().getResources()));
      localLayoutParams.addRule(3, 2131296316);
      if (F == 1)
      {
        localLayoutParams.addRule(11);
        localLayoutParams.addRule(9, 0);
        rightMargin = 0;
        leftMargin = 0;
      }
      for (;;)
      {
        localLayoutParams.addRule(3, G);
        addView(jdField_a_of_type_ComTencentImageURLImageView, localLayoutParams);
        jdField_a_of_type_ComTencentImageURLImageView.setVisibility(0);
        jdField_a_of_type_ComTencentImageURLImageView.setImageDrawable(paramDrawable);
        return;
        localLayoutParams.addRule(9);
        localLayoutParams.addRule(11, 0);
        if ((jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_AndroidWidgetCheckBox.getVisibility() != 8)) {
          leftMargin = AIOUtils.a(25.0F, getContext().getResources());
        } else {
          leftMargin = 0;
        }
      }
    }
    RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)jdField_a_of_type_ComTencentImageURLImageView.getLayoutParams();
    localLayoutParams.addRule(3, 2131296316);
    if (F == 1)
    {
      localLayoutParams.addRule(11);
      localLayoutParams.addRule(9, 0);
      rightMargin = 0;
      leftMargin = 0;
    }
    for (;;)
    {
      localLayoutParams.addRule(3, G);
      break;
      localLayoutParams.addRule(9);
      localLayoutParams.addRule(11, 0);
      if ((jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_AndroidWidgetCheckBox.getVisibility() != 8)) {
        leftMargin = AIOUtils.a(25.0F, getContext().getResources());
      } else {
        leftMargin = 0;
      }
    }
  }
  
  public void setPendantImageVisible(boolean paramBoolean)
  {
    URLImageView localURLImageView;
    if (jdField_a_of_type_ComTencentImageURLImageView != null)
    {
      localURLImageView = jdField_a_of_type_ComTencentImageURLImageView;
      if (!paramBoolean) {
        break label24;
      }
    }
    label24:
    for (int i1 = 0;; i1 = 8)
    {
      localURLImageView.setVisibility(i1);
      return;
    }
  }
  
  public void setProgressVisable(boolean paramBoolean)
  {
    if (paramBoolean) {
      if (jdField_a_of_type_AndroidWidgetProgressBar == null)
      {
        jdField_a_of_type_AndroidWidgetProgressBar = new ProgressBar(getContext(), null, 0);
        jdField_a_of_type_AndroidWidgetProgressBar.setId(2131296323);
        jdField_a_of_type_AndroidWidgetProgressBar.setIndeterminate(true);
        jdField_a_of_type_AndroidWidgetProgressBar.setIndeterminateDrawable(getResources().getDrawable(2130838189));
        i1 = AIOUtils.a(16.0F, getContext().getResources());
        localLayoutParams = new RelativeLayout.LayoutParams(i1, i1);
        bottomMargin = AIOUtils.a(18.0F, getContext().getResources());
        localLayoutParams.addRule(8, 2131296325);
        if (F == 1)
        {
          rightMargin = AIOUtils.a(4.0F, getContext().getResources());
          localLayoutParams.addRule(0, 2131296325);
          localLayoutParams.addRule(1, 0);
          addView(jdField_a_of_type_AndroidWidgetProgressBar, localLayoutParams);
        }
      }
      else
      {
        jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
      }
    }
    while (jdField_a_of_type_AndroidWidgetProgressBar == null) {
      for (;;)
      {
        int i1;
        RelativeLayout.LayoutParams localLayoutParams;
        return;
        leftMargin = AIOUtils.a(4.0F, getContext().getResources());
        localLayoutParams.addRule(1, 2131296325);
        localLayoutParams.addRule(0, 0);
      }
    }
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
  }
  
  public void setTailMessage(boolean paramBoolean, CharSequence paramCharSequence, View.OnClickListener paramOnClickListener)
  {
    if (paramBoolean)
    {
      if (jdField_g_of_type_AndroidWidgetTextView == null)
      {
        jdField_g_of_type_AndroidWidgetTextView = new TextView(getContext());
        jdField_g_of_type_AndroidWidgetTextView.setId(2131296326);
        jdField_g_of_type_AndroidWidgetTextView.setBackgroundResource(2130838589);
        jdField_g_of_type_AndroidWidgetTextView.setTextSize(2, 13.0F);
        jdField_g_of_type_AndroidWidgetTextView.setTextColor(-1);
        jdField_g_of_type_AndroidWidgetTextView.setGravity(17);
        localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
        localLayoutParams.addRule(3, 2131296325);
        localLayoutParams.addRule(5, 2131296325);
        localLayoutParams.addRule(7, 0);
        addView(jdField_g_of_type_AndroidWidgetTextView, localLayoutParams);
      }
      jdField_g_of_type_AndroidWidgetTextView.setVisibility(0);
      if (paramCharSequence != jdField_g_of_type_AndroidWidgetTextView.getTag()) {
        jdField_g_of_type_AndroidWidgetTextView.setText(paramCharSequence);
      }
      paramCharSequence = (RelativeLayout.LayoutParams)jdField_g_of_type_AndroidWidgetTextView.getLayoutParams();
      if (F == 1)
      {
        leftMargin = n;
        jdField_g_of_type_AndroidWidgetTextView.setOnClickListener(paramOnClickListener);
      }
    }
    while (jdField_g_of_type_AndroidWidgetTextView == null) {
      for (;;)
      {
        RelativeLayout.LayoutParams localLayoutParams;
        return;
        leftMargin = m;
      }
    }
    jdField_g_of_type_AndroidWidgetTextView.setVisibility(8);
  }
  
  public void setTimeStamp(boolean paramBoolean, long paramLong, ColorStateList paramColorStateList, CharSequence paramCharSequence)
  {
    int i1 = 2131296316;
    if ((paramBoolean) && (paramLong > 0L))
    {
      if (jdField_a_of_type_AndroidWidgetTextView == null)
      {
        jdField_a_of_type_AndroidWidgetTextView = new TextView(getContext());
        jdField_a_of_type_AndroidWidgetTextView.setId(2131296315);
        i1 = AIOUtils.a(14.0F, getContext().getResources());
        jdField_a_of_type_AndroidWidgetTextView.setTextSize(2, 11.0F);
        jdField_a_of_type_AndroidWidgetTextView.setPadding(i1, 0, i1, 0);
        jdField_a_of_type_AndroidWidgetTextView.setGravity(17);
        localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
        topMargin = getContext().getResources().getDimensionPixelOffset(2131493048);
        bottomMargin = getContext().getResources().getDimensionPixelOffset(2131493049);
        localLayoutParams.addRule(14);
        addView(jdField_a_of_type_AndroidWidgetTextView, localLayoutParams);
        jdField_a_of_type_AndroidWidgetTextView.setTag(Long.valueOf(0L));
      }
      if (paramColorStateList != null) {
        jdField_a_of_type_AndroidWidgetTextView.setTextColor(paramColorStateList);
      }
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      if (((Long)jdField_a_of_type_AndroidWidgetTextView.getTag()).longValue() != paramLong)
      {
        if (paramCharSequence != null) {
          jdField_a_of_type_AndroidWidgetTextView.setText(paramCharSequence);
        }
      }
      else
      {
        if ((jdField_b_of_type_AndroidWidgetTextView == null) || (jdField_b_of_type_AndroidWidgetTextView.getVisibility() != 0)) {
          break label282;
        }
        i1 = 2131296316;
        a(i1);
      }
    }
    label282:
    while (jdField_a_of_type_AndroidWidgetTextView == null) {
      for (;;)
      {
        RelativeLayout.LayoutParams localLayoutParams;
        return;
        paramColorStateList = TimeFormatterUtils.a(getContext(), 3, 1000L * paramLong);
        jdField_a_of_type_AndroidWidgetTextView.setText(paramColorStateList);
        continue;
        i1 = 2131296315;
      }
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    if ((jdField_b_of_type_AndroidWidgetTextView != null) && (jdField_b_of_type_AndroidWidgetTextView.getVisibility() == 0)) {}
    for (;;)
    {
      a(i1);
      return;
      i1 = 0;
    }
  }
  
  public void setUnread(boolean paramBoolean, View.OnClickListener paramOnClickListener, Object paramObject)
  {
    if (paramBoolean)
    {
      jdField_c_of_type_AndroidWidgetImageView = new ImageView(getContext());
      paramOnClickListener = new RelativeLayout.LayoutParams(-2, -2);
      topMargin = AIOUtils.a(8.0F, getContext().getResources());
      leftMargin = AIOUtils.a(-3.0F, getContext().getResources());
      paramOnClickListener.addRule(6, 2131296325);
      paramOnClickListener.addRule(1, 2131296325);
      addView(jdField_c_of_type_AndroidWidgetImageView, paramOnClickListener);
      jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130842772);
    }
    while (jdField_c_of_type_AndroidWidgetImageView == null) {
      return;
    }
    jdField_c_of_type_AndroidWidgetImageView.setOnClickListener(null);
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
  }
}
