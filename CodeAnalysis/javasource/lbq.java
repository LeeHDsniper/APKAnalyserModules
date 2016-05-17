import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.item.TextTranslationItemBuilder;
import com.tencent.mobileqq.activity.aio.item.TextTranslationItemBuilder.Holder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lbq
  implements Animation.AnimationListener
{
  public lbq(TextTranslationItemBuilder paramTextTranslationItemBuilder, TextTranslationItemBuilder.Holder paramHolder, CharSequence paramCharSequence)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.b.setText(jdField_a_of_type_JavaLangCharSequence);
    jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.b.startAnimation(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.a);
    jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.a.requestLayout();
    jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.f = 0;
    paramAnimation = (RelativeLayout.LayoutParams)jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.a.getLayoutParams();
    width = -2;
    height = -2;
    jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.a.setAnimation(null);
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.f = 0;
    jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder$Holder.b.startAnimation(jdField_a_of_type_ComTencentMobileqqActivityAioItemTextTranslationItemBuilder.b);
  }
}
