package com.tencent.mobileqq.activity.aio.rebuild;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.AbstractGifImage;
import com.tencent.image.ApngImage;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.ChatTextSizeSettingActivity;
import com.tencent.mobileqq.activity.aio.ChatAdapter1;
import com.tencent.mobileqq.activity.aio.ChatBackground;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.aio.item.PicItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.bubble.ChatXListView;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.multimsg.MultiMsgManager;
import com.tencent.mobileqq.widget.ScrollerRunnable;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.LayoutParams;
import java.util.List;
import lhy;

public class MultiForwardChatPie
  extends BaseChatPie
{
  public static final String ae = "MultiForwardActivity";
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  private AIOAnimationConatiner jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner;
  private Drawable[] jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable;
  String af;
  public String ag;
  private ChatAdapter1 jdField_b_of_type_ComTencentMobileqqActivityAioChatAdapter1;
  private ChatXListView jdField_b_of_type_ComTencentMobileqqBubbleChatXListView;
  ScrollerRunnable jdField_b_of_type_ComTencentMobileqqWidgetScrollerRunnable;
  public List b;
  List c;
  private final int ds;
  private int dt;
  private RelativeLayout e;
  private RelativeLayout jdField_f_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_f_of_type_AndroidWidgetTextView;
  public long g;
  private View jdField_g_of_type_AndroidViewView;
  private ImageView jdField_g_of_type_AndroidWidgetImageView;
  private long h;
  
  public MultiForwardChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_ComTencentMobileqqActivityAioChatAdapter1 = null;
    ds = 300;
  }
  
  protected void A() {}
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent) {}
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    if (paramInt == 0)
    {
      URLDrawable.resume();
      AbstractGifImage.resumeAll();
      ApngImage.resumeAll();
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.c();
      return;
    }
    URLDrawable.pause();
    if (!PicItemBuilder.g)
    {
      AbstractGifImage.pauseAll();
      ApngImage.pauseAll();
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.b();
  }
  
  public boolean a(int paramInt)
  {
    return false;
  }
  
  protected boolean a(boolean paramBoolean)
  {
    Object localObject1 = (ViewGroup)d.findViewById(2131297334);
    ((ViewGroup)localObject1).removeView(d.findViewById(2131296923));
    Object localObject2 = View.inflate(jdField_a_of_type_AndroidSupportV4AppFragmentActivity, 2130903077, null);
    Object localObject3 = new RelativeLayout.LayoutParams(-1, -1);
    ((RelativeLayout.LayoutParams)localObject3).addRule(3, 2131297322);
    ((View)localObject2).setLayoutParams((ViewGroup.LayoutParams)localObject3);
    ((ViewGroup)localObject1).addView((View)localObject2);
    af = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getStringExtra("multi_url");
    jdField_g_of_type_Long = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getLongExtra("multi_uniseq", 0L);
    ag = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367626);
    if (QLog.isDevelopLevel()) {
      QLog.d("MultiMsg", 4, "MultiForwardActivity.doOnCreate ResID = " + af + "  msg.uniseq = " + jdField_g_of_type_Long);
    }
    jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)d.findViewById(2131297322));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)d.findViewById(2131297035));
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)d.findViewById(2131297324));
    jdField_c_of_type_AndroidWidgetImageView = ((ImageView)d.findViewById(2131297337));
    jdField_c_of_type_AndroidWidgetImageView.setImageResource(2130842903);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetImageView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131369186));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)d.findViewById(2131297018));
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)d.findViewById(2131297335));
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131367694));
    b(false);
    e = ((RelativeLayout)d.findViewById(2131296898));
    jdField_f_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)d.findViewById(2131296901));
    jdField_g_of_type_AndroidWidgetImageView = ((ImageView)d.findViewById(2131296902));
    jdField_f_of_type_AndroidWidgetTextView = ((TextView)d.findViewById(2131296903));
    jdField_b_of_type_ComTencentMobileqqBubbleChatXListView = ((ChatXListView)d.findViewById(2131296899));
    jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.setStackFromBottom(false);
    jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.setTranscriptMode(0);
    jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.setLongClickable(true);
    jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.setDelAnimationDuration(300L);
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner = ((AIOAnimationConatiner)d.findViewById(2131296900));
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.a = jdField_b_of_type_ComTencentMobileqqBubbleChatXListView;
    jdField_b_of_type_ComTencentMobileqqWidgetScrollerRunnable = new ScrollerRunnable(jdField_b_of_type_ComTencentMobileqqBubbleChatXListView);
    localObject1 = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getIntent().getExtras();
    localObject2 = ((Bundle)localObject1).getString("uin");
    localObject3 = ((Bundle)localObject1).getString("troop_code");
    int i = ((Bundle)localObject1).getInt("uintype");
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = new SessionInfo();
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString = ((String)localObject2);
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int = i;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_JavaLangString = ((String)localObject3);
    MultiMsgManager.a().a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((String)localObject2, i, jdField_g_of_type_Long);
    if (localObject1 != null)
    {
      MultiMsgManager.a().a(issend);
      jdField_g_of_type_AndroidViewView = new View(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
      jdField_g_of_type_AndroidViewView.setLayoutParams(new AbsListView.LayoutParams(-1, (int)TypedValue.applyDimension(1, 10.0F, jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDisplayMetrics())));
      jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.b(jdField_g_of_type_AndroidViewView);
      jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.setAdapter(jdField_b_of_type_ComTencentMobileqqActivityAioChatAdapter1);
      jdField_b_of_type_ComTencentMobileqqWidgetScrollerRunnable = new ScrollerRunnable(jdField_b_of_type_ComTencentMobileqqBubbleChatXListView);
      jdField_b_of_type_ComTencentMobileqqActivityAioChatAdapter1 = new ChatAdapter1(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidSupportV4AppFragmentActivity, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner, this);
      jdField_b_of_type_ComTencentMobileqqActivityAioChatAdapter1.a = Boolean.valueOf(false);
      jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.setAdapter(jdField_b_of_type_ComTencentMobileqqActivityAioChatAdapter1);
      localObject1 = LayoutInflater.from(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()).inflate(2130903196, null);
      jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.setOverscrollHeader(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDrawable(2130840222));
      jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.setOverScrollHeader((View)localObject1);
      jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground = new ChatBackground();
      jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_b_of_type_Int = ChatTextSizeSettingActivity.a(BaseApplicationImpl.getContext());
      if (ChatBackground.a(BaseApplicationImpl.getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, true, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground)) {
        e.setBackgroundDrawable(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_ComTencentMobileqqActivityAioChatBackground.jdField_a_of_type_AndroidGraphicsDrawableDrawable);
      }
      jdField_b_of_type_JavaUtilList = MultiMsgManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_g_of_type_Long);
      jdField_b_of_type_AndroidWidgetTextView.setText(ag);
      if ((jdField_b_of_type_JavaUtilList != null) && (jdField_b_of_type_JavaUtilList.size() != 0)) {
        break label993;
      }
      h = System.currentTimeMillis();
      if (QLog.isColorLevel()) {
        QLog.d("MultiMsg", 2, "MultiForwardActivity.doOnCreate, start requestReceiveMultiMsg");
      }
      s();
      MultiMsgManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int, af, jdField_g_of_type_Long, new lhy(this));
    }
    label993:
    do
    {
      return true;
      MultiMsgManager.a().a(0);
      break;
      localObject1 = ChatActivityUtils.a(jdField_b_of_type_JavaUtilList, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      localObject1 = ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplicationImpl.getContext(), jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, (MessageRecord)localObject1);
      jdField_f_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
      jdField_b_of_type_ComTencentMobileqqBubbleChatXListView.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner.setVisibility(0);
      jdField_b_of_type_ComTencentMobileqqActivityAioChatAdapter1.a(jdField_b_of_type_JavaUtilList, (CharSequence)localObject1);
    } while (!QLog.isColorLevel());
    QLog.d("MultiMsg", 2, "MultiForwardActivity.doOnCreate, MultiMsg has been downloaded");
    return true;
  }
  
  protected boolean d()
  {
    return false;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    }
    v();
  }
  
  protected boolean s()
  {
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable == null)
    {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getResources().getDrawable(2130838193);
      jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable = jdField_b_of_type_AndroidWidgetTextView.getCompoundDrawables();
      dt = jdField_b_of_type_AndroidWidgetTextView.getCompoundDrawablePadding();
      jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(10);
      jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(jdField_a_of_type_AndroidGraphicsDrawableDrawable, jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[1], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[2], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[3]);
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).start();
      return true;
    }
    return false;
  }
  
  public boolean t()
  {
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable != null)
    {
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).stop();
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
      jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(dt);
      jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[0], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[1], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[2], jdField_a_of_type_ArrayOfAndroidGraphicsDrawableDrawable[3]);
      return true;
    }
    return false;
  }
  
  protected void u()
  {
    jdField_b_of_type_ComTencentMobileqqActivityAioChatAdapter1.a();
  }
  
  public void v()
  {
    if (jdField_a_of_type_AndroidSupportV4AppFragmentActivity != null) {
      jdField_a_of_type_AndroidSupportV4AppFragmentActivity.finish();
    }
  }
  
  protected void x() {}
  
  protected void y() {}
}
