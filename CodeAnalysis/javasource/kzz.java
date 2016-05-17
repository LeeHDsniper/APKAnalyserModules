import android.graphics.Color;
import android.text.TextUtils;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableListener;
import com.tencent.mobileqq.activity.aio.item.RichStatItemBuilder;
import com.tencent.mobileqq.activity.aio.item.RichStatItemBuilder.Holder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SignatureManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.RichStatus;
import com.tencent.mobileqq.vas.SignatureTemplateInfo;
import mqq.app.MobileQQ;

public class kzz
  implements URLDrawable.URLDrawableListener
{
  public kzz(RichStatItemBuilder paramRichStatItemBuilder, RichStatItemBuilder.Holder paramHolder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onLoadCanceled(URLDrawable paramURLDrawable) {}
  
  public void onLoadFialed(URLDrawable paramURLDrawable, Throwable paramThrowable) {}
  
  public void onLoadProgressed(URLDrawable paramURLDrawable, int paramInt) {}
  
  public void onLoadSuccessed(URLDrawable paramURLDrawable)
  {
    SignatureManager.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder.a.getApplication().getResources(), jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder$Holder.a, RichStatItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder), RichStatItemBuilder.a(), jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder.a, false);
    paramURLDrawable = ((SignatureManager)jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder.a.getManager(57)).a(Integer.toString(af));
    if (!TextUtils.isEmpty(p)) {
      jdField_a_of_type_ComTencentMobileqqActivityAioItemRichStatItemBuilder$Holder.c.setTextColor(Color.parseColor(p));
    }
  }
}
