import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.text.style.ClickableSpan;
import android.view.View;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.JumpAction;
import com.tencent.mobileqq.utils.JumpParser;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;

public class kxu
  extends ClickableSpan
{
  public final String a;
  private WeakReference jdField_a_of_type_JavaLangRefWeakReference;
  private String jdField_b_of_type_JavaLangString;
  private WeakReference jdField_b_of_type_JavaLangRefWeakReference;
  
  public kxu(GrayTipsItemBuilder paramGrayTipsItemBuilder, QQAppInterface paramQQAppInterface, Context paramContext, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "mqqapi://nearby_entry/nearby_profile?src_type=web&version=1&from=10003&from_type=0&uin=%s&mode=3";
    jdField_a_of_type_JavaLangRefWeakReference = new WeakReference(paramQQAppInterface);
    jdField_b_of_type_JavaLangRefWeakReference = new WeakReference(paramContext);
    jdField_b_of_type_JavaLangString = paramString;
  }
  
  public void onClick(View paramView)
  {
    paramView = (QQAppInterface)jdField_a_of_type_JavaLangRefWeakReference.get();
    Object localObject = (Context)jdField_b_of_type_JavaLangRefWeakReference.get();
    if ((paramView == null) || (localObject == null)) {}
    long l;
    do
    {
      do
      {
        return;
      } while (!(localObject instanceof Activity));
      if (!NetworkUtil.e((Context)localObject))
      {
        QQToast.a((Context)localObject, 2131366990, 0).b(((Context)localObject).getResources().getDimensionPixelSize(2131492908));
        return;
      }
      l = System.currentTimeMillis();
      if ((GrayTipsItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder) == 0L) || (l <= GrayTipsItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder)) || (l - GrayTipsItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder) > 800L)) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("GrayTipsItemBuilder", 2, "click too often...ignore click envent");
    return;
    GrayTipsItemBuilder.a(jdField_a_of_type_ComTencentMobileqqActivityAioItemGrayTipsItemBuilder, l);
    localObject = JumpParser.a(paramView, (Context)localObject, String.format("mqqapi://nearby_entry/nearby_profile?src_type=web&version=1&from=10003&from_type=0&uin=%s&mode=3", new Object[] { jdField_b_of_type_JavaLangString }));
    if (localObject != null) {
      ((JumpAction)localObject).b();
    }
    ReportController.b(paramView, "CliOper", "", "", "0X80055FD", "0X80055FD", 0, 0, com.tencent.mobileqq.nearpeople.NearbyRecommender.NearbyRecommenderUtils.a(paramView)[0], jdField_b_of_type_JavaLangString, "", "");
  }
}
