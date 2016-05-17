import android.content.Context;
import android.content.res.Resources;
import android.graphics.Paint;
import android.os.Build.VERSION;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.item.QzoneFeedItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kzp
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  public kzp(QzoneFeedItemBuilder paramQzoneFeedItemBuilder, CharSequence paramCharSequence, kzr paramKzr)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onGlobalLayout()
  {
    Paint localPaint = new Paint();
    localPaint.setTextSize(jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a.getResources().getDimension(2131494393));
    if (!TextUtils.isEmpty(jdField_a_of_type_JavaLangCharSequence)) {}
    int i = (int)(localPaint.measureText(jdField_a_of_type_JavaLangCharSequence, 0, jdField_a_of_type_JavaLangCharSequence.length()) + 0.5D);
    int j = jdField_a_of_type_Kzr.b.getWidth();
    int k = (int)(jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a.getResources().getDimension(2131494391) + 0.5D);
    int m = (int)(jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a.getResources().getDimension(2131494392) + 0.5D);
    int n = (int)(jdField_a_of_type_ComTencentMobileqqActivityAioItemQzoneFeedItemBuilder.a.getResources().getDimension(2131494390) + 0.5D);
    jdField_a_of_type_Kzr.e.setMaxWidth(j - k - m - n - i - 1);
    if (Build.VERSION.SDK_INT >= 16)
    {
      jdField_a_of_type_Kzr.a.getViewTreeObserver().removeOnGlobalLayoutListener(this);
      return;
    }
    jdField_a_of_type_Kzr.a.getViewTreeObserver().removeGlobalOnLayoutListener(this);
  }
}
