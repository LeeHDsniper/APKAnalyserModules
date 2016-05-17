import android.content.Context;
import android.graphics.Typeface;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.LinearInterpolator;
import android.view.animation.ScaleAnimation;
import android.view.animation.TranslateAnimation;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.MyAdapter;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.SwipeUpAndDragCallBack;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.SwipeUpAndDragListener;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.Logger;
import java.util.ArrayList;

public class lew
  extends lfa
{
  int jdField_a_of_type_Int;
  RelativeLayout.LayoutParams jdField_a_of_type_AndroidWidgetRelativeLayout$LayoutParams;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  int[] jdField_a_of_type_ArrayOfInt;
  RelativeLayout.LayoutParams b;
  
  public lew(PhotoListPanel.SwipeUpAndDragListener paramSwipeUpAndDragListener, Context paramContext, ViewGroup paramViewGroup)
  {
    super(paramSwipeUpAndDragListener, paramContext, paramViewGroup);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_c_of_type_AndroidWidgetRelativeLayout = new RelativeLayout(paramContext);
    jdField_a_of_type_AndroidWidgetRelativeLayout$LayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    jdField_a_of_type_AndroidWidgetTextView = new TextView(paramContext);
    jdField_a_of_type_AndroidWidgetTextView.setText("松手发送");
    jdField_a_of_type_AndroidWidgetTextView.setTextSize(14.0F);
    jdField_a_of_type_AndroidWidgetTextView.setTextColor(-1);
    jdField_a_of_type_AndroidWidgetTextView.setBackgroundResource(2130837613);
    jdField_a_of_type_AndroidWidgetTextView.setTypeface(Typeface.defaultFromStyle(1));
    jdField_b_of_type_AndroidWidgetRelativeLayout$LayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    jdField_b_of_type_AndroidWidgetRelativeLayout$LayoutParams.topMargin = ((int)(6.0F * e));
    jdField_b_of_type_AndroidWidgetRelativeLayout$LayoutParams.addRule(14);
    jdField_a_of_type_ArrayOfInt = new int[2];
  }
  
  AnimationSet a()
  {
    float f = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.a(jdField_b_of_type_Int, jdField_c_of_type_AndroidWidgetRelativeLayout.getWidth(), jdField_c_of_type_AndroidWidgetRelativeLayout.getHeight());
    Logger.a("PhotoListPanel", "createDragReleaseSendAnim", "d scale = " + f);
    jdField_c_of_type_AndroidWidgetRelativeLayout.getLocationInWindow(jdField_a_of_type_ArrayOfInt);
    int j = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ArrayOfInt[0] - (int)(65.0F * jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.e + 0.5F + jdField_c_of_type_AndroidWidgetRelativeLayout.getWidth() * f + 0.5F) - jdField_a_of_type_ArrayOfInt[0];
    int k = jdField_a_of_type_AndroidViewViewGroup.getHeight() + jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ArrayOfInt[1] - jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.getHeight() - (int)(10.0F * jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.e + 0.5F + jdField_c_of_type_AndroidWidgetRelativeLayout.getHeight() * f + 0.5F) - jdField_a_of_type_Int;
    int i = j;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.getItemViewType(jdField_b_of_type_Int) == 1) {
      i = j + (int)(9.0F * jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.e + 0.5F);
    }
    Logger.a("PhotoListPanel", "createDragReleaseSendAnim", " deltY = " + k + ", flyStartLocation[1] = " + jdField_a_of_type_ArrayOfInt[1] + ",inputBarRightTopCorner[1] = " + jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ArrayOfInt[1] + ",top = " + jdField_c_of_type_AndroidWidgetRelativeLayout.getTop());
    AnimationSet localAnimationSet = new AnimationSet(false);
    Object localObject = new ScaleAnimation(1.0F, f, 1.0F, f);
    ((ScaleAnimation)localObject).setStartOffset(0L);
    ((ScaleAnimation)localObject).setDuration(500L);
    localAnimationSet.addAnimation((Animation)localObject);
    localObject = new AnimationSet(false);
    ((AnimationSet)localObject).setStartOffset(0L);
    ((AnimationSet)localObject).setDuration(500L);
    TranslateAnimation localTranslateAnimation = new TranslateAnimation(0.0F, i, 0.0F, 0.0F);
    localTranslateAnimation.setInterpolator(new LinearInterpolator());
    ((AnimationSet)localObject).addAnimation(localTranslateAnimation);
    localTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, 0.0F, k);
    localTranslateAnimation.setInterpolator(new AccelerateInterpolator());
    ((AnimationSet)localObject).addAnimation(localTranslateAnimation);
    localAnimationSet.addAnimation((Animation)localObject);
    localObject = new AlphaAnimation(1.0F, 0.0F);
    ((AlphaAnimation)localObject).setStartOffset(500L - 200L / 2L);
    ((AlphaAnimation)localObject).setDuration(200L);
    localAnimationSet.addAnimation((Animation)localObject);
    localAnimationSet.setFillAfter(false);
    return localAnimationSet;
  }
  
  void a(View paramView, int paramInt)
  {
    super.a(paramView, paramInt);
    paramInt = paramView.getWidth() - (int)(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.e * 2.0F + 0.5F);
    int i = paramView.getHeight() - (int)(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.e * 2.0F + 0.5F) * 2;
    jdField_a_of_type_AndroidWidgetRelativeLayout$LayoutParams.leftMargin = (jdField_c_of_type_ArrayOfInt[0] + (int)(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.e * 2.0F + 0.5F));
    jdField_a_of_type_AndroidWidgetRelativeLayout$LayoutParams.topMargin = (jdField_c_of_type_ArrayOfInt[1] - jdField_b_of_type_ArrayOfInt[1] - jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_Int + (int)(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.e * 2.0F + 0.5F));
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.g = (i * 3 / 5);
    paramView = (ViewGroup)jdField_a_of_type_AndroidWidgetImageView.getParent();
    if (paramView != null)
    {
      jdField_a_of_type_AndroidWidgetImageView.clearAnimation();
      paramView.removeView(jdField_a_of_type_AndroidWidgetImageView);
    }
    jdField_c_of_type_AndroidWidgetRelativeLayout.addView(jdField_a_of_type_AndroidWidgetImageView, new RelativeLayout.LayoutParams(paramInt, i));
    d = new RelativeLayout.LayoutParams(paramInt, i);
    d.leftMargin = jdField_a_of_type_AndroidWidgetRelativeLayout$LayoutParams.leftMargin;
    d.topMargin = jdField_a_of_type_AndroidWidgetRelativeLayout$LayoutParams.topMargin;
    jdField_c_of_type_AndroidWidgetRelativeLayout.addView(jdField_a_of_type_AndroidWidgetTextView, jdField_b_of_type_AndroidWidgetRelativeLayout$LayoutParams);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
    jdField_a_of_type_AndroidViewViewGroup.addView(jdField_a_of_type_AndroidWidgetRelativeLayout, jdField_c_of_type_AndroidWidgetRelativeLayout$LayoutParams);
    jdField_a_of_type_AndroidViewView.startAnimation(jdField_a_of_type_AndroidViewAnimationAlphaAnimation);
    jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_b_of_type_AndroidWidgetRelativeLayout, d);
    jdField_a_of_type_AndroidWidgetRelativeLayout.addView(jdField_c_of_type_AndroidWidgetRelativeLayout, jdField_a_of_type_AndroidWidgetRelativeLayout$LayoutParams);
    Logger.a("PhotoListPanel", "DragHandler", "drag prepare, contentParent = " + jdField_c_of_type_AndroidWidgetRelativeLayout.getParent());
  }
  
  boolean a(MotionEvent paramMotionEvent)
  {
    paramMotionEvent.getX();
    float f1 = paramMotionEvent.getY();
    float f2 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.d;
    paramMotionEvent = (RelativeLayout.LayoutParams)jdField_c_of_type_AndroidWidgetRelativeLayout.getLayoutParams();
    topMargin = ((int)(f1 - f2 + topMargin));
    jdField_a_of_type_Int = (jdField_b_of_type_ArrayOfInt[1] + jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_Int + topMargin);
    jdField_c_of_type_AndroidWidgetRelativeLayout.setLayoutParams(paramMotionEvent);
    Logger.a("PhotoListPanel", "DragHandler", "drag hanldeMove, contentParent = " + jdField_c_of_type_AndroidWidgetRelativeLayout.getParent());
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.d = f1;
    if (-(int)(f1 - jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_b_of_type_Float) > (int)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.g)
    {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      return true;
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
    return true;
  }
  
  boolean b(MotionEvent paramMotionEvent)
  {
    boolean bool = false;
    Logger.a("PhotoListPanel", "handleUp", "handler = " + this);
    float f1 = paramMotionEvent.getX();
    float f2 = paramMotionEvent.getY();
    if (jdField_a_of_type_AndroidWidgetTextView.getVisibility() == 4)
    {
      if ((SystemClock.elapsedRealtime() - jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_Long < 200L) && (Math.abs(f2 - jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_b_of_type_Float) < jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_b_of_type_Int) && (Math.abs(f1 - jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_Float) < jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_b_of_type_Int))
      {
        a();
        return false;
      }
      jdField_c_of_type_AndroidWidgetRelativeLayout.getLocationInWindow(jdField_a_of_type_ArrayOfInt);
      jdField_a_of_type_AndroidViewView.getLocationInWindow(jdField_c_of_type_ArrayOfInt);
      paramMotionEvent = new TranslateAnimation(0.0F, 0.0F, 0.0F, (int)(2.0F * jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.e + 0.5F) + jdField_c_of_type_ArrayOfInt[1] - jdField_a_of_type_ArrayOfInt[1]);
      paramMotionEvent.setFillAfter(true);
      paramMotionEvent.setDuration(200L);
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_Boolean = true;
      jdField_c_of_type_AndroidWidgetRelativeLayout.startAnimation(paramMotionEvent);
      paramMotionEvent.setAnimationListener(jdField_a_of_type_AndroidViewAnimationAnimation$AnimationListener);
    }
    while (jdField_a_of_type_AndroidWidgetTextView.getVisibility() != 0) {
      return true;
    }
    Logger.a("PhotoListPanel", "DragHandler", "@#handleUp, createFlyAnimation ");
    paramMotionEvent = a();
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_Boolean = true;
    Logger.a("PhotoListPanel", "DragHandler", "@#handleUp, startFlyAnimation ");
    jdField_c_of_type_AndroidWidgetRelativeLayout.startAnimation(paramMotionEvent);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
    int i = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.getItemViewType(jdField_b_of_type_Int);
    Object localObject = new ArrayList();
    ((ArrayList)localObject).add(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a(jdField_b_of_type_Int).a);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragCallBack != null)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragCallBack;
      String str = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a(jdField_b_of_type_Int).a;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.f == 2) {
        bool = true;
      }
      ((PhotoListPanel.SwipeUpAndDragCallBack)localObject).a(str, bool);
    }
    for (;;)
    {
      paramMotionEvent.setAnimationListener(new lex(this, f2));
      break;
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$SwipeUpAndDragListener.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.a(i, (ArrayList)localObject, false, true, "0X8005E0D", "0", i + "");
    }
  }
}
