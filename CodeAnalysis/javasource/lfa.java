import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation.AnimationListener;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.MyAdapter.Holder;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.SwipeUpAndDragListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.Logger;

public class lfa
{
  Context jdField_a_of_type_AndroidContentContext;
  View jdField_a_of_type_AndroidViewView;
  ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  AlphaAnimation jdField_a_of_type_AndroidViewAnimationAlphaAnimation;
  Animation.AnimationListener jdField_a_of_type_AndroidViewAnimationAnimation$AnimationListener;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  Runnable jdField_a_of_type_JavaLangRunnable;
  int jdField_b_of_type_Int;
  AlphaAnimation jdField_b_of_type_AndroidViewAnimationAlphaAnimation;
  RelativeLayout jdField_b_of_type_AndroidWidgetRelativeLayout;
  Runnable jdField_b_of_type_JavaLangRunnable;
  int[] jdField_b_of_type_ArrayOfInt;
  RelativeLayout.LayoutParams jdField_c_of_type_AndroidWidgetRelativeLayout$LayoutParams;
  RelativeLayout jdField_c_of_type_AndroidWidgetRelativeLayout;
  int[] jdField_c_of_type_ArrayOfInt;
  RelativeLayout.LayoutParams d;
  
  public lfa(PhotoListPanel.SwipeUpAndDragListener paramSwipeUpAndDragListener, Context paramContext, ViewGroup paramViewGroup)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_AndroidViewViewGroup = paramViewGroup;
    jdField_b_of_type_ArrayOfInt = new int[2];
    jdField_c_of_type_ArrayOfInt = new int[2];
    paramViewGroup.getLocationInWindow(jdField_b_of_type_ArrayOfInt);
    jdField_a_of_type_AndroidWidgetRelativeLayout = new RelativeLayout(paramContext);
    jdField_a_of_type_AndroidWidgetRelativeLayout.setBackgroundResource(17170445);
    jdField_a_of_type_AndroidWidgetRelativeLayout.setOnTouchListener(new lfb(this, paramSwipeUpAndDragListener));
    jdField_c_of_type_AndroidWidgetRelativeLayout$LayoutParams = new RelativeLayout.LayoutParams(-1, -1);
    jdField_c_of_type_AndroidWidgetRelativeLayout$LayoutParams.topMargin = a;
    jdField_b_of_type_AndroidWidgetRelativeLayout = new RelativeLayout(paramContext);
    jdField_b_of_type_AndroidWidgetRelativeLayout.setBackgroundColor(637534208);
    jdField_a_of_type_AndroidWidgetImageView = new ImageView(paramContext);
    jdField_a_of_type_AndroidViewAnimationAlphaAnimation = new AlphaAnimation(1.0F, 0.0F);
    jdField_a_of_type_AndroidViewAnimationAlphaAnimation.setFillAfter(true);
    jdField_b_of_type_AndroidViewAnimationAlphaAnimation = new AlphaAnimation(0.0F, 1.0F);
    jdField_a_of_type_AndroidViewAnimationAnimation$AnimationListener = new lfc(this, paramSwipeUpAndDragListener);
    jdField_a_of_type_JavaLangRunnable = new lfd(this, paramSwipeUpAndDragListener);
    jdField_b_of_type_JavaLangRunnable = new lfe(this, paramSwipeUpAndDragListener);
  }
  
  void a()
  {
    Logger.a("PhotoListPanel", "clear", "handler = " + this);
    jdField_a_of_type_AndroidViewView.clearAnimation();
    jdField_a_of_type_AndroidWidgetRelativeLayout.removeAllViews();
    jdField_a_of_type_AndroidViewViewGroup.removeView(jdField_a_of_type_AndroidWidgetRelativeLayout);
    if (jdField_c_of_type_AndroidWidgetRelativeLayout != null)
    {
      jdField_c_of_type_AndroidWidgetRelativeLayout.postDelayed(jdField_a_of_type_JavaLangRunnable, 50L);
      return;
    }
    jdField_a_of_type_AndroidViewViewGroup.postDelayed(jdField_b_of_type_JavaLangRunnable, 100L);
  }
  
  public void a(View paramView, int paramInt)
  {
    jdField_a_of_type_AndroidViewView = paramView;
    jdField_b_of_type_Int = paramInt;
    paramView.getLocationInWindow(jdField_c_of_type_ArrayOfInt);
    paramView = jdField_a_of_type_AndroidViewView.getTag()).a.getDrawable();
    jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramView);
    jdField_a_of_type_AndroidWidgetImageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
  }
  
  public boolean a(MotionEvent paramMotionEvent)
  {
    return true;
  }
  
  public boolean b(MotionEvent paramMotionEvent)
  {
    return false;
  }
}
