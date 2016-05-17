package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.text.method.LinkMovementMethod;
import android.text.style.ForegroundColorSpan;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.av.widget.EllipseTextView;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.activity.JumpActivity;
import com.tencent.mobileqq.activity.PayBridgeActivity;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory;
import com.tencent.mobileqq.activity.aio.CustomizeStrategyFactory.RedPacketInfo;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagInfo;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagManager;
import com.tencent.mobileqq.activity.qwallet.QQWalletTransferBubbleView;
import com.tencent.mobileqq.activity.qwallet.report.VACDReportUtil;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.IndividualRedPacketManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.data.QQWalletRedPacketMsg;
import com.tencent.mobileqq.data.QQWalletTransferMsg;
import com.tencent.mobileqq.data.QQWalletTransferMsgElem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.QLog;
import cooperation.qwallet.plugin.QWalletHelper;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import kzj;
import kzk;
import kzl;
import kzm;
import kzn;
import kzo;
import org.json.JSONObject;

public class QQWalletMsgItemBuilder
  extends BaseBubbleBuilder
{
  private static int R;
  private static int S;
  private static int T;
  protected int A;
  protected int B;
  protected int C;
  protected int D;
  protected int E;
  protected int F;
  protected int G;
  protected int H;
  protected int I;
  protected int J;
  protected int K;
  protected int L;
  protected int M;
  protected int N;
  protected int O;
  protected int P;
  protected int Q;
  public long a;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  public RelativeLayout a;
  public BaseChatPie a;
  private IndividualRedPacketManager jdField_a_of_type_ComTencentMobileqqAppIndividualRedPacketManager;
  private View.OnClickListener b;
  protected final String b;
  private View.OnClickListener c;
  protected final String c;
  protected final String d;
  protected String e;
  protected final int h;
  protected final int i;
  protected final int j;
  protected final int k;
  protected final int l;
  protected final int m;
  protected final int n;
  protected final int o;
  protected final int p;
  protected final int q;
  protected final int r;
  protected final int s;
  protected final int t;
  protected final int u;
  protected final int v;
  protected final int w;
  protected final int x;
  protected final int y;
  protected int z;
  
  public QQWalletMsgItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    h = 2131302662;
    i = 2131302664;
    j = 2131302647;
    k = 2131302651;
    l = 2131302652;
    m = 2131302649;
    n = 2131302646;
    o = 2131302557;
    p = 2131302556;
    q = 2131302561;
    r = 2131302558;
    s = 2131302563;
    t = 2131302560;
    u = 2131302562;
    v = 2131302644;
    w = 2131302554;
    x = 2131302553;
    y = 2131302552;
    jdField_b_of_type_JavaLangString = "TRANSFER";
    jdField_c_of_type_JavaLangString = "REDPACKET";
    d = "PASSWORD";
    e = "";
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = null;
    jdField_a_of_type_AndroidViewView$OnClickListener = new kzj(this);
    jdField_b_of_type_AndroidViewView$OnClickListener = new kzm(this);
    jdField_c_of_type_AndroidViewView$OnClickListener = new kzn(this);
    e = paramContext.getString(2131366332);
    float f = getResourcesgetDisplayMetricsdensity;
    A = ((int)(42.0F * f + 0.5F));
    B = ((int)(21.0F * f + 0.5F));
    C = ((int)(15.0F * f + 0.5F));
    D = ((int)(10.0F * f + 0.5F));
    E = ((int)(9.0F * f + 0.5F));
    F = ((int)(6.0F * f + 0.5F));
    G = ((int)(4.0F * f + 0.5F));
    H = ((int)(1.0F * f + 0.5F));
    z = (D * 23);
    I = ((int)(157.0F * f + 0.5F));
    J = ((int)(65.0F * f + 0.5F));
    K = ((int)(7.0F * f + 0.5F));
    L = ((int)(152.0F * f + 0.5F));
    M = ((int)(5.0F * f + 0.5F));
    N = ((int)(61.0F * f + 0.5F));
    O = ((int)(19.0F * f + 0.5F));
    P = ((int)(8.0F * f + 0.5F));
    Q = ((int)(f * 3.0F + 0.5F));
    R = H * 2;
    S = H * 2;
    T = K;
    paramBaseAdapter = (FragmentActivity)paramContext;
    if (paramBaseAdapter.getChatFragment() != null) {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseAdapter.getChatFragment().a();
    }
    jdField_a_of_type_ComTencentMobileqqAppIndividualRedPacketManager = ((IndividualRedPacketManager)paramQQAppInterface.getManager(130));
  }
  
  public static Bundle a(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo)
  {
    int i1 = -1;
    Object localObject = "";
    switch (jdField_a_of_type_Int)
    {
    default: 
      paramSessionInfo = (SessionInfo)localObject;
    }
    for (;;)
    {
      paramQQAppInterface = new Bundle();
      paramQQAppInterface.putInt("groupType", i1);
      paramQQAppInterface.putString("name", paramSessionInfo);
      return paramQQAppInterface;
      i1 = 0;
      paramSessionInfo = a(paramQQAppInterface);
      continue;
      i1 = 2;
      paramSessionInfo = a(paramQQAppInterface);
      continue;
      localObject = (HotChatManager)paramQQAppInterface.getManager(59);
      int i2;
      if ((localObject != null) && (((HotChatManager)localObject).b(jdField_a_of_type_JavaLangString)))
      {
        i2 = 5;
        localObject = ContactUtils.o(paramQQAppInterface, paramQQAppInterface.a());
        paramSessionInfo = (SessionInfo)localObject;
        i1 = i2;
        if (TextUtils.isEmpty((CharSequence)localObject))
        {
          paramSessionInfo = a(paramQQAppInterface);
          i1 = i2;
        }
      }
      else
      {
        i1 = 1;
        paramSessionInfo = a(paramQQAppInterface);
        continue;
        i1 = 3;
        paramSessionInfo = a(paramQQAppInterface);
        continue;
        i1 = 4;
        paramSessionInfo = a(paramQQAppInterface);
        continue;
        i2 = 6;
        localObject = ContactUtils.o(paramQQAppInterface, paramQQAppInterface.a());
        paramSessionInfo = (SessionInfo)localObject;
        i1 = i2;
        if (TextUtils.isEmpty((CharSequence)localObject))
        {
          paramSessionInfo = a(paramQQAppInterface);
          i1 = i2;
        }
      }
    }
  }
  
  public static Bundle a(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, MessageForQQWalletMsg paramMessageForQQWalletMsg)
  {
    int i1 = -1;
    String str = "";
    switch (istroop)
    {
    default: 
      paramSessionInfo = str;
    }
    for (;;)
    {
      paramQQAppInterface = new Bundle();
      paramQQAppInterface.putInt("groupType", i1);
      paramQQAppInterface.putString("name", paramSessionInfo);
      return paramQQAppInterface;
      i1 = 0;
      paramSessionInfo = a(paramQQAppInterface);
      continue;
      i1 = 2;
      paramSessionInfo = a(paramQQAppInterface);
      continue;
      paramMessageForQQWalletMsg = (HotChatManager)paramQQAppInterface.getManager(59);
      int i2;
      if ((paramMessageForQQWalletMsg != null) && (paramMessageForQQWalletMsg.b(jdField_a_of_type_JavaLangString)))
      {
        i2 = 5;
        paramMessageForQQWalletMsg = ContactUtils.o(paramQQAppInterface, paramQQAppInterface.a());
        paramSessionInfo = paramMessageForQQWalletMsg;
        i1 = i2;
        if (TextUtils.isEmpty(paramMessageForQQWalletMsg))
        {
          paramSessionInfo = a(paramQQAppInterface);
          i1 = i2;
        }
      }
      else
      {
        i1 = 1;
        paramSessionInfo = a(paramQQAppInterface);
        continue;
        i1 = 3;
        paramSessionInfo = a(paramQQAppInterface);
        continue;
        i1 = 4;
        paramSessionInfo = a(paramQQAppInterface);
        continue;
        i2 = 6;
        paramMessageForQQWalletMsg = ContactUtils.o(paramQQAppInterface, paramQQAppInterface.a());
        paramSessionInfo = paramMessageForQQWalletMsg;
        i1 = i2;
        if (TextUtils.isEmpty(paramMessageForQQWalletMsg))
        {
          paramSessionInfo = a(paramQQAppInterface);
          i1 = i2;
        }
      }
    }
  }
  
  private RelativeLayout.LayoutParams a()
  {
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    topMargin = K;
    bottomMargin = C;
    rightMargin = K;
    localLayoutParams.addRule(3, 2131302563);
    localLayoutParams.addRule(7, 2131302563);
    return localLayoutParams;
  }
  
  private RelativeLayout a(Context paramContext)
  {
    RelativeLayout localRelativeLayout = new RelativeLayout(paramContext);
    localRelativeLayout.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
    QQWalletTransferBubbleView localQQWalletTransferBubbleView = new QQWalletTransferBubbleView(paramContext);
    localQQWalletTransferBubbleView.setLayoutParams(new RelativeLayout.LayoutParams(z, C * 5));
    localQQWalletTransferBubbleView.setId(2131302662);
    Object localObject1 = new ImageView(paramContext);
    Object localObject2 = new RelativeLayout.LayoutParams(A, A);
    rightMargin = B;
    ((RelativeLayout.LayoutParams)localObject2).addRule(15);
    ((RelativeLayout.LayoutParams)localObject2).addRule(11);
    ((ImageView)localObject1).setLayoutParams((ViewGroup.LayoutParams)localObject2);
    ((ImageView)localObject1).setScaleType(ImageView.ScaleType.FIT_CENTER);
    ((ImageView)localObject1).setId(2131302664);
    localQQWalletTransferBubbleView.addView((View)localObject1);
    localObject1 = new LinearLayout(paramContext);
    localObject2 = new RelativeLayout.LayoutParams(-2, -2);
    ((RelativeLayout.LayoutParams)localObject2).addRule(0, 2131302664);
    ((RelativeLayout.LayoutParams)localObject2).addRule(9);
    leftMargin = B;
    rightMargin = F;
    ((RelativeLayout.LayoutParams)localObject2).addRule(15);
    ((LinearLayout)localObject1).setLayoutParams((ViewGroup.LayoutParams)localObject2);
    ((LinearLayout)localObject1).setOrientation(1);
    localObject2 = new TextView(paramContext);
    ((TextView)localObject2).setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
    ((TextView)localObject2).setSingleLine();
    ((TextView)localObject2).setEllipsize(TextUtils.TruncateAt.END);
    ((TextView)localObject2).setTextSize(24.0F);
    ((TextView)localObject2).setId(2131302647);
    ((LinearLayout)localObject1).addView((View)localObject2);
    localObject2 = new TextView(paramContext);
    LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
    topMargin = H;
    ((TextView)localObject2).setLayoutParams(localLayoutParams);
    ((TextView)localObject2).setSingleLine();
    ((TextView)localObject2).setEllipsize(TextUtils.TruncateAt.END);
    ((TextView)localObject2).setTextSize(13.0F);
    ((TextView)localObject2).setId(2131302651);
    ((LinearLayout)localObject1).addView((View)localObject2);
    localQQWalletTransferBubbleView.addView((View)localObject1);
    localRelativeLayout.addView(localQQWalletTransferBubbleView);
    localQQWalletTransferBubbleView = new QQWalletTransferBubbleView(paramContext);
    localObject1 = new RelativeLayout.LayoutParams(z, -2);
    ((RelativeLayout.LayoutParams)localObject1).addRule(3, 2131302662);
    localQQWalletTransferBubbleView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
    localQQWalletTransferBubbleView.setBackgroundResource(2130841202);
    localQQWalletTransferBubbleView.setId(2131302652);
    paramContext = new TextView(paramContext);
    localObject1 = new RelativeLayout.LayoutParams(-2, -2);
    leftMargin = B;
    rightMargin = B;
    topMargin = C;
    bottomMargin = C;
    ((RelativeLayout.LayoutParams)localObject1).addRule(15);
    paramContext.setLayoutParams((ViewGroup.LayoutParams)localObject1);
    paramContext.setSingleLine();
    paramContext.setEllipsize(TextUtils.TruncateAt.END);
    paramContext.setTextColor(-7500403);
    paramContext.setTextSize(12.0F);
    paramContext.setIncludeFontPadding(false);
    paramContext.setId(2131302649);
    localQQWalletTransferBubbleView.addView(paramContext);
    localRelativeLayout.addView(localQQWalletTransferBubbleView);
    return localRelativeLayout;
  }
  
  private TextView a(Context paramContext)
  {
    paramContext = new TextView(paramContext);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    topMargin = D;
    bottomMargin = F;
    leftMargin = (A + G);
    rightMargin = (A + G);
    localLayoutParams.addRule(3, 2131296325);
    localLayoutParams.addRule(14);
    paramContext.setLayoutParams(localLayoutParams);
    paramContext.setTextColor(-1);
    paramContext.setBackgroundResource(2130840217);
    paramContext.setPadding(E, G, E, 0);
    paramContext.setClickable(false);
    paramContext.setVisibility(8);
    paramContext.setGravity(16);
    paramContext.setIncludeFontPadding(false);
    paramContext.setLineSpacing(G, 1.0F);
    paramContext.setTextSize(12.0F);
    paramContext.setId(2131302646);
    return paramContext;
  }
  
  private static String a(QQAppInterface paramQQAppInterface)
  {
    String str = paramQQAppInterface.a();
    paramQQAppInterface = ((FriendsManager)paramQQAppInterface.getManager(50)).c(str);
    if (paramQQAppInterface != null)
    {
      if ((name != null) && (name.length() > 0)) {
        return name;
      }
      return uin;
    }
    return str;
  }
  
  public static JSONObject a(QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7)
  {
    paramString1 = a(paramString2, paramString1, paramInt, paramString3, paramString4, paramString7, jdField_b_of_type_JavaLangString);
    if (jdField_a_of_type_Int == 1008) {
      paramSessionInfo = new JSONObject();
    }
    try
    {
      paramSessionInfo.put("channel", 2);
      paramString1.put("detailinfo", paramSessionInfo);
      paramSessionInfo = new JSONObject();
    }
    catch (Exception paramSessionInfo)
    {
      try
      {
        do
        {
          paramSessionInfo.put("userId", paramQQAppInterface.a());
          paramSessionInfo.put("viewTag", paramString6);
          paramSessionInfo.put("app_info", paramString5);
          paramSessionInfo.put("come_from", 2);
          paramSessionInfo.put("extra_data", paramString1);
          return paramSessionInfo;
          paramSessionInfo = paramSessionInfo;
        } while (!QLog.isDevelopLevel());
        paramSessionInfo.printStackTrace();
      }
      catch (Exception paramQQAppInterface)
      {
        while (!QLog.isDevelopLevel()) {}
        paramQQAppInterface.printStackTrace();
      }
    }
    return paramSessionInfo;
  }
  
  public static JSONObject a(QQAppInterface paramQQAppInterface, MessageForQQWalletMsg paramMessageForQQWalletMsg, SessionInfo paramSessionInfo, int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7)
  {
    paramMessageForQQWalletMsg = a(paramString2, paramString1, paramInt, paramString3, paramString4, paramString7, senderuin);
    if (jdField_a_of_type_Int == 1008) {
      paramSessionInfo = new JSONObject();
    }
    try
    {
      paramSessionInfo.put("channel", 2);
      paramMessageForQQWalletMsg.put("detailinfo", paramSessionInfo);
      paramSessionInfo = new JSONObject();
    }
    catch (Exception paramSessionInfo)
    {
      try
      {
        do
        {
          paramSessionInfo.put("userId", paramQQAppInterface.a());
          paramSessionInfo.put("viewTag", paramString6);
          paramSessionInfo.put("app_info", paramString5);
          paramSessionInfo.put("come_from", 2);
          paramSessionInfo.put("extra_data", paramMessageForQQWalletMsg);
          return paramSessionInfo;
          paramSessionInfo = paramSessionInfo;
        } while (!QLog.isDevelopLevel());
        paramSessionInfo.printStackTrace();
      }
      catch (Exception paramQQAppInterface)
      {
        while (!QLog.isDevelopLevel()) {}
        paramQQAppInterface.printStackTrace();
      }
    }
    return paramSessionInfo;
  }
  
  public static JSONObject a(String paramString1, String paramString2, int paramInt, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("listid", paramString1);
      localJSONObject.put("name", paramString2);
      localJSONObject.put("grouptype", paramInt + "");
      localJSONObject.put("groupid", paramString4);
      if (paramString6 != null) {
        localJSONObject.put("groupuin", paramString6);
      }
      if (paramString3 != null) {
        localJSONObject.put("authkey", paramString3);
      }
      if (paramString5 != null) {
        localJSONObject.put("cftImageUrl", paramString5);
      }
    }
    catch (Exception paramString1)
    {
      while (!QLog.isDevelopLevel()) {}
      paramString1.printStackTrace();
    }
    return localJSONObject;
    return localJSONObject;
  }
  
  private void a(kzo paramKzo, MessageForQQWalletMsg paramMessageForQQWalletMsg, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    Object localObject1 = (ImageView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302553);
    TextView localTextView1 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302556);
    TextView localTextView2 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302561);
    TextView localTextView3 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302558);
    Object localObject2 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302560);
    RelativeLayout localRelativeLayout = (RelativeLayout)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302563);
    ImageView localImageView = (ImageView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302562);
    QQWalletRedPacketMsg localQQWalletRedPacketMsg = mQQWalletRedPacketMsg;
    boolean bool2 = paramMessageForQQWalletMsg.isSend();
    int i2;
    int i1;
    label130:
    label159:
    int i4;
    boolean bool1;
    label224:
    int i3;
    label242:
    label339:
    label354:
    label374:
    Object localObject3;
    if (messageType == 6)
    {
      i2 = 1;
      if (i2 == 0) {
        break label694;
      }
      i1 = 0;
      ((ImageView)localObject1).setVisibility(i1);
      float f = localTextView1.getPaint().measureText("测");
      if (i2 == 0) {
        break label701;
      }
      i1 = 6;
      localTextView1.setMaxWidth((int)(i1 * f + 0.5F));
      localTextView1.setText(elem.title);
      localTextView1.setTextColor(Color.parseColor("#f2b668"));
      i4 = 1;
      i1 = 1;
      if ((jdField_a_of_type_ComTencentMobileqqAppIndividualRedPacketManager == null) || (!jdField_a_of_type_ComTencentMobileqqAppIndividualRedPacketManager.c())) {
        break label708;
      }
      bool1 = true;
      if ((!bool1) || (messageType != 2001)) {
        break label714;
      }
      i3 = 1;
      if (i3 == 0) {
        customizeBg = null;
      }
      if (bool2) {
        break label745;
      }
      if (customizeBg == null) {
        break label720;
      }
      localObject1 = new SpannableStringBuilder("QQ红包个性版");
      ((SpannableStringBuilder)localObject1).setSpan(new ForegroundColorSpan(Color.parseColor("#FFFFFF")), 0, 4, 34);
      ((SpannableStringBuilder)localObject1).setSpan(new ForegroundColorSpan(Color.parseColor("#D13D4B")), 4, ((SpannableStringBuilder)localObject1).length(), 34);
      ((TextView)localObject2).setText((CharSequence)localObject1);
      ((TextView)localObject2).setMovementMethod(LinkMovementMethod.getInstance());
      ((TextView)localObject2).setLayoutParams(b());
      ((TextView)localObject2).setVisibility(0);
      ((TextView)localObject2).setTag(paramMessageForQQWalletMsg);
      if (i1 == 0) {
        break label821;
      }
      ((TextView)localObject2).setOnClickListener(jdField_c_of_type_AndroidViewView$OnClickListener);
      if (i2 == 0) {
        break label854;
      }
      localObject3 = (PasswdRedBagManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(124);
      localObject2 = ((PasswdRedBagManager)localObject3).a(redPacketId);
      localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = new PasswdRedBagInfo(redPacketId, senderuin, time + 90000L, elem.title, false, false, false);
        ((PasswdRedBagManager)localObject3).a(redPacketId, elem.title, senderuin, time + 90000L, String.valueOf(((PasswdRedBagManager)localObject3).a(istroop)), frienduin, authkey, false, false);
      }
      if (jdField_a_of_type_Boolean) {
        break label830;
      }
      localTextView3.setVisibility(8);
      localTextView2.setText("口令红包");
      localTextView2.setVisibility(0);
      label533:
      localImageView.setVisibility(8);
      localTextView1.setVisibility(0);
      label546:
      if (background == null) {
        break label1263;
      }
      localRelativeLayout.setBackgroundDrawable(new BitmapDrawable(localRelativeLayout.getResources(), background));
      if ((messageType != 4) && (messageType != 5) && (messageType != 2001)) {
        break label1254;
      }
      localTextView1.setVisibility(8);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnTouchListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setTag(paramMessageForQQWalletMsg);
      if (i2 == 0) {
        break label1464;
      }
      jdField_a_of_type_AndroidWidgetRelativeLayout.setContentDescription("口令:" + elem.title + ",点击领取口令");
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(jdField_b_of_type_AndroidViewView$OnClickListener);
      return;
      i2 = 0;
      break;
      label694:
      i1 = 8;
      break label130;
      label701:
      i1 = 7;
      break label159;
      label708:
      bool1 = false;
      break label224;
      label714:
      i3 = 0;
      break label242;
      label720:
      i1 = 0;
      ((TextView)localObject2).setTextColor(Color.parseColor("#FFFFFF"));
      ((TextView)localObject2).setText("QQ红包");
      break label339;
      label745:
      if ((redtype == 1) || (i2 != 0) || (customizeBg != null))
      {
        ((TextView)localObject2).setTextColor(Color.parseColor("#00A5E0"));
        ((TextView)localObject2).setText("查看领取详情");
        ((TextView)localObject2).setLayoutParams(a());
        ((TextView)localObject2).setVisibility(0);
        i1 = i4;
        break label354;
      }
      ((TextView)localObject2).setVisibility(8);
      i1 = i4;
      break label354;
      label821:
      ((TextView)localObject2).setOnClickListener(null);
      break label374;
      label830:
      localTextView2.setVisibility(8);
      localTextView3.setText("口令红包已拆开");
      localTextView3.setVisibility(0);
      break label533;
      label854:
      if (customizeBg != null)
      {
        localTextView2.setVisibility(8);
        localTextView3.setVisibility(8);
        localTextView1.setVisibility(8);
        localImageView.setBackgroundDrawable(new BitmapDrawable(localImageView.getResources(), customizeBg));
        localImageView.setVisibility(0);
        break label546;
      }
      localTextView1.setVisibility(0);
      localImageView.setVisibility(8);
      customizeBg = null;
      if ((bool2) && (redtype == 2))
      {
        localTextView3.setVisibility(8);
        localTextView2.setText("查看详情");
        localTextView2.setVisibility(0);
        label965:
        if (i3 == 0) {
          break label1244;
        }
        localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        if (!bool1) {
          break label1246;
        }
      }
      label1244:
      label1246:
      for (localObject1 = "1";; localObject1 = "0")
      {
        ReportController.b((QQAppInterface)localObject3, "CliOper", "", "", "0X8006133", "0X8006133", 0, 0, (String)localObject1, "0", "", "");
        localObject1 = new CustomizeStrategyFactory.RedPacketInfo();
        jdField_a_of_type_Boolean = bool2;
        jdField_a_of_type_Int = 2;
        jdField_a_of_type_JavaLangString = (envelopeid + "");
        jdField_b_of_type_JavaLangString = envelopeName;
        jdField_b_of_type_Int = conftype;
        if (QLog.isColorLevel()) {
          QLog.d("CustomizeStrategyFactory", 2, "info =" + jdField_a_of_type_Int + "|" + jdField_a_of_type_JavaLangString + "|" + jdField_b_of_type_JavaLangString + "|" + System.currentTimeMillis());
        }
        CustomizeStrategyFactory.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (CustomizeStrategyFactory.RedPacketInfo)localObject1, new kzk(this, localTextView2, localTextView3, localTextView1, localImageView, paramMessageForQQWalletMsg, (TextView)localObject2, bool1));
        break;
        if (!isOpened)
        {
          localTextView3.setVisibility(8);
          localTextView2.setText("点击拆开");
          localTextView2.setVisibility(0);
          break label965;
        }
        localTextView2.setVisibility(8);
        localTextView3.setVisibility(0);
        break label965;
        break;
      }
      label1254:
      localTextView1.setVisibility(0);
    }
    label1263:
    if (i2 != 0) {
      if (bool2)
      {
        i1 = 2130841195;
        label1278:
        localRelativeLayout.setBackgroundResource(i1);
        if (elem == null) {
          break label1445;
        }
        if (!bool2) {
          break label1432;
        }
        localObject1 = elem.aioImageRight;
        label1308:
        if (TextUtils.isEmpty((CharSequence)localObject1)) {
          break label1445;
        }
        i1 = 1;
        label1319:
        if (i1 == 0) {
          break label1449;
        }
        localObject2 = new CustomizeStrategyFactory.RedPacketInfo();
        jdField_a_of_type_Boolean = bool2;
        jdField_a_of_type_Int = 1;
        if (!bool2) {
          break label1451;
        }
      }
    }
    label1432:
    label1445:
    label1449:
    label1451:
    for (localObject1 = elem.aioImageRight;; localObject1 = elem.aioImageLeft)
    {
      jdField_a_of_type_JavaLangString = ((String)localObject1);
      CustomizeStrategyFactory.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (CustomizeStrategyFactory.RedPacketInfo)localObject2, new kzl(this, localRelativeLayout, paramMessageForQQWalletMsg, localTextView1));
      break;
      i1 = 2130841193;
      break label1278;
      if (bool2) {}
      for (i1 = 2130841199;; i1 = 2130841198)
      {
        localRelativeLayout.setBackgroundResource(i1);
        break;
      }
      localObject1 = elem.aioImageLeft;
      break label1308;
      i1 = 0;
      break label1319;
      break;
    }
    label1464:
    jdField_a_of_type_AndroidWidgetRelativeLayout.setContentDescription(elem.title + e);
    jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
  }
  
  private void a(kzo paramKzo, QQWalletTransferMsgElem paramQQWalletTransferMsgElem, MessageForQQWalletMsg paramMessageForQQWalletMsg, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    ImageView localImageView1 = (ImageView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302553);
    TextView localTextView1 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302556);
    TextView localTextView2 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302561);
    TextView localTextView3 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302558);
    TextView localTextView4 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302560);
    RelativeLayout localRelativeLayout = (RelativeLayout)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302563);
    ImageView localImageView2 = (ImageView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302562);
    background = null;
    customizeBg = null;
    localImageView2.setVisibility(8);
    localImageView1.setVisibility(8);
    localTextView1.setMaxWidth((int)(localTextView1.getPaint().measureText("测") * 7.0F + 0.5F));
    localTextView1.setText(title);
    localTextView1.setTextColor(Color.parseColor("#f2b668"));
    localTextView1.setVisibility(0);
    localTextView4.setVisibility(8);
    localTextView4.setOnClickListener(null);
    localTextView2.setVisibility(0);
    localTextView2.setText("点击拆开");
    localTextView3.setVisibility(8);
    if (paramMessageForQQWalletMsg.isSend()) {
      localRelativeLayout.setBackgroundResource(2130841199);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetRelativeLayout.setTag(paramMessageForQQWalletMsg);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setContentDescription(title + e);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnTouchListener(paramOnLongClickAndTouchListener);
      return;
      localRelativeLayout.setBackgroundResource(2130841198);
    }
  }
  
  private void a(kzo paramKzo, QQWalletTransferMsgElem paramQQWalletTransferMsgElem, boolean paramBoolean, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    Object localObject = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302647);
    TextView localTextView2 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302651);
    ImageView localImageView = (ImageView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302664);
    TextView localTextView1 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302649);
    QQWalletTransferBubbleView localQQWalletTransferBubbleView1 = (QQWalletTransferBubbleView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302652);
    QQWalletTransferBubbleView localQQWalletTransferBubbleView2 = (QQWalletTransferBubbleView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131302662);
    float f;
    if (title != null)
    {
      ((TextView)localObject).setTextSize(24.0F);
      TextPaint localTextPaint = ((TextView)localObject).getPaint();
      if (localTextPaint != null)
      {
        f = localTextPaint.measureText(title);
        if (z <= BaseChatItemLayout.h) {
          break label394;
        }
        if (f > BaseChatItemLayout.h - D * 9) {
          ((TextView)localObject).setTextSize(14.0F);
        }
      }
    }
    for (;;)
    {
      ((TextView)localObject).setText(title);
      ((TextView)localObject).setTextColor(titleColor);
      localTextView2.setText(subTitle);
      localTextView2.setTextColor(subtitleColor);
      localTextView1.setText(content);
      localObject = jdField_a_of_type_AndroidContentContext.getResources().getDrawable(a(icon));
      if (!TextUtils.isEmpty(iconUrl)) {
        localObject = URLDrawableHelper.a(iconUrl, (int)DisplayUtils.a(jdField_a_of_type_AndroidContentContext, A), (int)DisplayUtils.a(jdField_a_of_type_AndroidContentContext, A), null, null);
      }
      localImageView.setImageDrawable((Drawable)localObject);
      if (contentBgColor != 0) {
        localQQWalletTransferBubbleView1.setBubbleBackground(2130841202, contentBgColor, paramBoolean);
      }
      if (contentColor != 0) {
        localTextView1.setTextColor(contentColor);
      }
      localQQWalletTransferBubbleView2.setBubbleBackground(2130841201, background, paramBoolean);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setContentDescription(title + subTitle + e);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnTouchListener(paramOnLongClickAndTouchListener);
      return;
      label394:
      if (f > D * 14) {
        ((TextView)localObject).setTextSize(14.0F);
      }
    }
  }
  
  private boolean a(Context paramContext, String paramString)
  {
    if ((paramContext == null) || (TextUtils.isEmpty(paramString))) {
      return false;
    }
    Intent localIntent = new Intent(paramContext, JumpActivity.class);
    localIntent.setData(Uri.parse(paramString));
    paramContext.startActivity(localIntent);
    return true;
  }
  
  private boolean a(Context paramContext, String paramString1, String paramString2, String paramString3, MessageForQQWalletMsg paramMessageForQQWalletMsg, SessionInfo paramSessionInfo)
  {
    if ((paramContext == null) || (TextUtils.isEmpty(paramString1))) {
      return false;
    }
    String[] arrayOfString = paramString1.split("\\?");
    if (TextUtils.isEmpty(arrayOfString[0])) {
      return false;
    }
    Object localObject1 = new HashMap();
    int i1;
    Object localObject2;
    if ((arrayOfString.length > 1) && (!TextUtils.isEmpty(arrayOfString[1])))
    {
      paramString1 = arrayOfString[1].split("&");
      i1 = 0;
      if (i1 < paramString1.length)
      {
        if (TextUtils.isEmpty(paramString1[i1])) {}
        for (;;)
        {
          i1 += 1;
          break;
          localObject2 = paramString1[i1].split("=");
          if (localObject2.length == 2)
          {
            try
            {
              localObject2[1] = URLDecoder.decode(localObject2[1], "UTF-8");
              ((HashMap)localObject1).put(localObject2[0], localObject2[1]);
            }
            catch (Exception localException)
            {
              if (QLog.isDevelopLevel()) {
                localException.printStackTrace();
              }
            }
            if (QLog.isColorLevel()) {
              QLog.d(jdField_a_of_type_JavaLangString, 2, "QQWalletMsgItemBuilder failed to URLDecoder.decode WalletAction value,tmps[1] is:" + localObject2[0] + ",tmps[1] is:" + localObject2[1], localException);
            }
          }
        }
      }
    }
    if (arrayOfString[0].equals("pay"))
    {
      paramString1 = (String)((HashMap)localObject1).get("payData");
      paramString2 = (String)((HashMap)localObject1).get("reqCode");
      if ((TextUtils.isEmpty(paramString2)) || (TextUtils.isEmpty(paramString1))) {
        return false;
      }
      paramString3 = new Bundle();
      paramString3.putString("json", paramString1);
      paramString3.putString("callbackSn", "0");
      paramString1 = new Intent(paramContext, PayBridgeActivity.class);
      paramString1.putExtras(paramString3);
      paramString1.putExtra("pay_requestcode", Integer.valueOf(paramString2).intValue());
    }
    label949:
    for (;;)
    {
      try
      {
        paramContext.startActivity(paramString1);
        return true;
      }
      catch (Exception paramContext)
      {
        if (!QLog.isDevelopLevel()) {
          continue;
        }
        paramContext.printStackTrace();
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d(jdField_a_of_type_JavaLangString, 2, "QQWalletMsgItemBuilder failed to startActivity : " + arrayOfString[0], paramContext);
        return false;
      }
      if (arrayOfString[0].equals("red"))
      {
        localObject1 = (String)((HashMap)localObject1).get("id");
        if (TextUtils.isEmpty((CharSequence)localObject1)) {
          return false;
        }
        paramString1 = mQQWalletRedPacketMsg.elem.cftImage;
        localObject2 = a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramSessionInfo, paramMessageForQQWalletMsg);
        i1 = ((Bundle)localObject2).getInt("groupType");
        localObject2 = ((Bundle)localObject2).getString("name");
        paramString2 = a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramMessageForQQWalletMsg, paramSessionInfo, i1, (String)localObject2, (String)localObject1, paramString2, paramString3, "appid#1344242394|bargainor_id#1000030201|channel#msg", "graphb", paramString1);
        paramSessionInfo = (IndividualRedPacketManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(130);
        if ((paramSessionInfo == null) || (mQQWalletRedPacketMsg.envelopeid <= 0)) {}
      }
      try
      {
        paramString3 = paramString2.getJSONObject("extra_data");
        paramString3.put("channel", "8");
        paramSessionInfo = paramSessionInfo.a(String.valueOf(mQQWalletRedPacketMsg.envelopeid), mQQWalletRedPacketMsg.envelopeName, 7);
        if (QLog.isColorLevel()) {
          QLog.d("vipBgImage", 2, paramSessionInfo);
        }
        paramString3.put("vipBgImage", paramSessionInfo);
      }
      catch (Exception paramString3)
      {
        continue;
      }
      paramString3 = new Bundle();
      paramString3.putString("json", paramString2.toString());
      paramString3.putString("callbackSn", "0");
      if (paramString1 != null) {
        paramString3.putString("cftImageUrl", paramString1);
      }
      paramString1 = (String)localObject1;
      if (localObject1 != null)
      {
        paramString1 = (String)localObject1;
        if (((String)localObject1).length() > 4) {
          paramString1 = "****" + ((String)localObject1).substring(4);
        }
      }
      paramString3.putLong("vacreport_key_seq", VACDReportUtil.a(null, "qqwallet", "graphb", "open", "groupType=" + i1 + "&msgType=" + messageType + "&redId=" + paramString1, 0, null));
      paramString1 = new Intent(paramContext, PayBridgeActivity.class);
      paramString1.putExtras(paramString3);
      paramString1.putExtra("pay_requestcode", 5);
      continue;
      try
      {
        paramString1 = QQWalletMsgItemBuilder.class.getClassLoader();
        if (paramString1 == null) {
          return false;
        }
        paramString1 = paramString1.loadClass(arrayOfString[0]);
      }
      catch (Exception paramString1)
      {
        if (!QLog.isDevelopLevel()) {
          continue;
        }
        paramString1.printStackTrace();
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d(jdField_a_of_type_JavaLangString, 2, "QQWalletMsgItemBuilder failed to find Class : " + arrayOfString[0], paramString1);
        paramString1 = null;
        continue;
        paramString1 = new Intent(paramContext, paramString1);
        paramString2 = ((HashMap)localObject1).entrySet().iterator();
        if (!paramString2.hasNext()) {
          break label949;
        }
      }
      if (paramString1 == null) {
        return false;
      }
      paramString3 = (Map.Entry)paramString2.next();
      paramString1.putExtra((String)paramString3.getKey(), (String)paramString3.getValue());
    }
  }
  
  private boolean a(MessageForQQWalletMsg paramMessageForQQWalletMsg)
  {
    boolean bool = true;
    QQWalletTransferMsgElem localQQWalletTransferMsgElem = null;
    if (paramMessageForQQWalletMsg == null) {
      break label25;
    }
    label25:
    do
    {
      do
      {
        return false;
        if (mQQWalletTransferMsg == null) {
          break;
        }
        localQQWalletTransferMsgElem = mQQWalletTransferMsg.elem;
      } while (localQQWalletTransferMsgElem == null);
      paramMessageForQQWalletMsg = nativeAndroid;
    } while (TextUtils.isEmpty(paramMessageForQQWalletMsg));
    paramMessageForQQWalletMsg = paramMessageForQQWalletMsg.split("\\?");
    if ((!TextUtils.isEmpty(paramMessageForQQWalletMsg[0])) && (paramMessageForQQWalletMsg[0].equals("red"))) {}
    for (;;)
    {
      return bool;
      if (mQQWalletRedPacketMsg == null) {
        break;
      }
      return true;
      bool = false;
    }
  }
  
  private RelativeLayout.LayoutParams b()
  {
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    topMargin = K;
    bottomMargin = C;
    leftMargin = K;
    localLayoutParams.addRule(3, 2131302563);
    localLayoutParams.addRule(5, 2131302563);
    return localLayoutParams;
  }
  
  private RelativeLayout b(Context paramContext)
  {
    RelativeLayout localRelativeLayout1 = new RelativeLayout(paramContext);
    localRelativeLayout1.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
    Object localObject1 = new RelativeLayout(paramContext);
    RelativeLayout.LayoutParams localLayoutParams1 = new RelativeLayout.LayoutParams(L, I);
    ((RelativeLayout)localObject1).setId(2131302563);
    RelativeLayout localRelativeLayout2 = new RelativeLayout(paramContext);
    localRelativeLayout2.setId(2131302554);
    localRelativeLayout2.setPadding(0, DisplayUtil.a(paramContext, 10.0F), 0, 0);
    Object localObject2 = new RelativeLayout.LayoutParams(-2, -2);
    ((RelativeLayout.LayoutParams)localObject2).addRule(13);
    localRelativeLayout2.setLayoutParams((ViewGroup.LayoutParams)localObject2);
    localObject2 = new ImageView(paramContext);
    RelativeLayout.LayoutParams localLayoutParams2 = new RelativeLayout.LayoutParams(M * 2, F * 3);
    rightMargin = M;
    topMargin = G;
    ((ImageView)localObject2).setScaleType(ImageView.ScaleType.FIT_CENTER);
    ((ImageView)localObject2).setVisibility(8);
    ((ImageView)localObject2).setBackgroundResource(2130841194);
    ((ImageView)localObject2).setId(2131302553);
    Object localObject3 = new EllipseTextView(paramContext);
    RelativeLayout.LayoutParams localLayoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
    localLayoutParams3.addRule(1, 2131302553);
    ((TextView)localObject3).setTextSize(16.0F);
    ((TextView)localObject3).setTextColor(Color.parseColor("#f2b668"));
    ((TextView)localObject3).setId(2131302556);
    localRelativeLayout2.addView((View)localObject2, localLayoutParams2);
    localRelativeLayout2.addView((View)localObject3, localLayoutParams3);
    localObject2 = new TextView(paramContext);
    localLayoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
    localLayoutParams2.addRule(14);
    localLayoutParams2.addRule(12);
    bottomMargin = (E * 2);
    ((TextView)localObject2).setTextSize(13.0F);
    ((TextView)localObject2).setTextColor(Color.parseColor("#edc1c4"));
    ((TextView)localObject2).setId(2131302561);
    ((TextView)localObject2).setVisibility(8);
    localObject3 = new TextView(paramContext);
    localLayoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
    localLayoutParams3.addRule(14);
    localLayoutParams3.addRule(12);
    bottomMargin = (E * 2);
    ((TextView)localObject3).setText("已拆开");
    ((TextView)localObject3).setTextSize(13.0F);
    ((TextView)localObject3).setTextColor(Color.parseColor("#e8866b"));
    ((TextView)localObject3).setId(2131302558);
    ((TextView)localObject3).setVisibility(8);
    ImageView localImageView = new ImageView(paramContext);
    localImageView.setId(2131302562);
    localImageView.setVisibility(8);
    RelativeLayout.LayoutParams localLayoutParams4 = new RelativeLayout.LayoutParams(DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 138.0F), DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 115.0F));
    localImageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
    leftMargin = K;
    localLayoutParams4.addRule(5, 2131302563);
    localLayoutParams4.addRule(8, 2131302563);
    ((RelativeLayout)localObject1).addView(localRelativeLayout2);
    ((RelativeLayout)localObject1).addView((View)localObject2, localLayoutParams2);
    ((RelativeLayout)localObject1).addView((View)localObject3, localLayoutParams3);
    localRelativeLayout1.addView((View)localObject1, localLayoutParams1);
    localRelativeLayout1.addView(localImageView, localLayoutParams4);
    paramContext = new TextView(paramContext);
    localObject1 = a();
    paramContext.setLayoutParams((ViewGroup.LayoutParams)localObject1);
    paramContext.setTextColor(-16734752);
    paramContext.setBackgroundResource(2130840217);
    paramContext.setPadding(E, 0, E, 0);
    paramContext.setClickable(false);
    paramContext.setVisibility(8);
    paramContext.setGravity(16);
    paramContext.setIncludeFontPadding(false);
    paramContext.setSingleLine();
    paramContext.setTextSize(12.0F);
    paramContext.setId(2131302560);
    localRelativeLayout1.addView(paramContext, (ViewGroup.LayoutParams)localObject1);
    return localRelativeLayout1;
  }
  
  private boolean b(Context paramContext, String paramString)
  {
    if ((paramContext == null) || (TextUtils.isEmpty(paramString))) {
      return false;
    }
    Intent localIntent = new Intent(paramContext, QQBrowserActivity.class);
    localIntent.putExtra("url", paramString);
    paramContext.startActivity(localIntent);
    return true;
  }
  
  protected int a(int paramInt)
  {
    switch (paramInt)
    {
    case 2: 
    default: 
      return 2130841200;
    case 1: 
      return 2130841203;
    case 3: 
      return 2130841204;
    }
    return 2130841197;
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 0;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    kzo localKzo = (kzo)paramViewHolder;
    if ((paramChatMessage instanceof MessageForQQWalletMsg)) {}
    for (paramViewHolder = (MessageForQQWalletMsg)paramChatMessage;; paramViewHolder = null)
    {
      if (paramViewHolder == null) {
        return null;
      }
      if ((mQQWalletTransferMsg == null) && (mQQWalletRedPacketMsg == null)) {
        return null;
      }
      boolean bool = a(paramViewHolder);
      if ((bool) && (QWalletHelper.jdField_a_of_type_Boolean) && (!QWalletHelper.a(jdField_a_of_type_AndroidContentContext)))
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "preload qwallet process by qqWalletMsg isTroop=" + istroop);
        }
        QWalletHelper.a(0, "qwallet_red");
      }
      if ((jdField_a_of_type_AndroidWidgetRelativeLayout != null) && (jdField_a_of_type_Long != uniseq))
      {
        if (!bool) {
          break label268;
        }
        if (jdField_a_of_type_JavaLangString.equals("TRANSFER"))
        {
          jdField_a_of_type_AndroidWidgetRelativeLayout = b(jdField_a_of_type_AndroidContentContext);
          jdField_a_of_type_JavaLangString = "REDPACKET";
          paramBaseChatItemLayout.addView(a(jdField_a_of_type_AndroidContentContext));
        }
      }
      if (jdField_a_of_type_AndroidWidgetRelativeLayout == null)
      {
        if (!bool) {
          break label324;
        }
        jdField_a_of_type_AndroidWidgetRelativeLayout = b(jdField_a_of_type_AndroidContentContext);
        jdField_a_of_type_JavaLangString = "REDPACKET";
        paramBaseChatItemLayout.addView(a(jdField_a_of_type_AndroidContentContext));
      }
      for (;;)
      {
        jdField_a_of_type_Long = uniseq;
        if ((bool) || (mQQWalletTransferMsg == null)) {
          break label498;
        }
        paramView = mQQWalletTransferMsg.elem;
        if (paramView != null) {
          break label367;
        }
        return jdField_a_of_type_AndroidWidgetRelativeLayout;
        label268:
        if ((mQQWalletTransferMsg == null) || (!jdField_a_of_type_JavaLangString.equals("REDPACKET"))) {
          break;
        }
        jdField_a_of_type_AndroidWidgetRelativeLayout = a(jdField_a_of_type_AndroidContentContext);
        jdField_a_of_type_JavaLangString = "TRANSFER";
        paramBaseChatItemLayout.addView(a(jdField_a_of_type_AndroidContentContext));
        break;
        label324:
        if (mQQWalletTransferMsg != null)
        {
          jdField_a_of_type_AndroidWidgetRelativeLayout = a(jdField_a_of_type_AndroidContentContext);
          paramBaseChatItemLayout.addView(a(jdField_a_of_type_AndroidContentContext));
          jdField_a_of_type_JavaLangString = "TRANSFER";
        }
      }
      label367:
      if (!paramChatMessage.isSend())
      {
        bool = true;
        a(localKzo, paramView, bool, paramOnLongClickAndTouchListener);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Vip_pay_mywallet", "", "transferaccountmsg", "show", 0, 0, "" + mQQWalletTransferMsg.templateId, "", "", "");
        paramChatMessage = paramView;
      }
      for (;;)
      {
        label444:
        paramViewHolder = (TextView)paramBaseChatItemLayout.findViewById(2131302646);
        if (paramViewHolder != null)
        {
          if ((paramChatMessage == null) || (TextUtils.isEmpty(blackStripe))) {
            break label583;
          }
          paramViewHolder.setText(blackStripe);
          paramViewHolder.setVisibility(0);
        }
        for (;;)
        {
          return jdField_a_of_type_AndroidWidgetRelativeLayout;
          bool = false;
          break;
          label498:
          if ((bool) && (mQQWalletRedPacketMsg != null))
          {
            paramChatMessage = mQQWalletRedPacketMsg.elem;
            if (paramChatMessage == null) {
              return jdField_a_of_type_AndroidWidgetRelativeLayout;
            }
            a(localKzo, paramViewHolder, paramOnLongClickAndTouchListener);
            break label444;
          }
          if ((!bool) || (mQQWalletTransferMsg == null)) {
            break label592;
          }
          paramChatMessage = mQQWalletTransferMsg.elem;
          if (paramChatMessage == null) {
            return jdField_a_of_type_AndroidWidgetRelativeLayout;
          }
          a(localKzo, paramChatMessage, paramViewHolder, paramOnLongClickAndTouchListener);
          break label444;
          label583:
          paramViewHolder.setVisibility(8);
        }
        label592:
        paramChatMessage = null;
      }
    }
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new kzo(this, null);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    Object localObject = null;
    if ((paramChatMessage instanceof MessageForQQWalletMsg)) {
      localObject = (MessageForQQWalletMsg)paramChatMessage;
    }
    if ((localObject == null) || (mQQWalletTransferMsg == null)) {
      return msg;
    }
    localObject = mQQWalletTransferMsg.elem;
    if (localObject != null)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      if (MsgUtils.a(issend))
      {
        localStringBuilder.append("发出");
        if ((subTitle == null) || (!subTitle.contains("已转入你的"))) {
          break label176;
        }
        if ((content == null) || (!content.contains("QQ转账"))) {
          break label145;
        }
        localStringBuilder.append("QQ转账").append(title).append("按钮");
      }
      for (;;)
      {
        return localStringBuilder.toString();
        localStringBuilder.append("发来");
        break;
        label145:
        localStringBuilder.append("QQ转账").append(title).append(content).append("按钮");
        continue;
        label176:
        localStringBuilder.append(content).append(title).append("按钮");
      }
    }
    return msg;
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      super.a(paramInt, paramContext, paramChatMessage);
      return;
    case 2131304463: 
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
      return;
    }
    super.b(paramChatMessage);
  }
  
  protected void a(View paramView, ChatMessage paramChatMessage)
  {
    if (paramChatMessage.isSend())
    {
      paramView.setPadding(S, T, R, 0);
      return;
    }
    if (istroop == 1008)
    {
      paramView.setPadding(R, T, S, paramView.getResources().getDimensionPixelSize(2131493038));
      return;
    }
    paramView.setPadding(R, T, S, 0);
  }
  
  public boolean a(long paramLong1, long paramLong2)
  {
    return Math.abs(paramLong2 - paramLong1) > 1000L;
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    a(AIOUtils.a(paramView), localQQCustomMenu);
    ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int);
    super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
    return localQQCustomMenu.a();
  }
}
