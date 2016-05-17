import android.os.Build.VERSION;
import com.tencent.biz.ProtoServlet;
import com.tencent.mobileqq.activity.aio.item.PAWeatherItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.mp.MqqNearbyGdt.ExposeRequest;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.pb.PBStringField;
import mqq.app.NewIntent;

public class kza
  implements Runnable
{
  public kza(PAWeatherItemBuilder paramPAWeatherItemBuilder, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder.jdField_a_of_type_MqqAppNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), ProtoServlet.class);
    jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder.jdField_a_of_type_MqqAppNewIntent.putExtra("cmd", "QQNeartyGdt.Report");
    MqqNearbyGdt.ExposeRequest localExposeRequest = new MqqNearbyGdt.ExposeRequest();
    resolution.set(jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder.jdField_a_of_type_Int + "*" + jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder.b);
    PBStringField localPBStringField = apurl;
    if (jdField_a_of_type_JavaLangString == null) {}
    for (String str = "";; str = jdField_a_of_type_JavaLangString)
    {
      localPBStringField.set(str);
      qua.set(Build.VERSION.RELEASE);
      platform_type.set(1);
      ad_source.set(2);
      jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder.jdField_a_of_type_MqqAppNewIntent.putExtra("data", localExposeRequest.toByteArray());
      jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder.jdField_a_of_type_MqqAppNewIntent.setObserver(new kzb(this));
      jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(jdField_a_of_type_ComTencentMobileqqActivityAioItemPAWeatherItemBuilder.jdField_a_of_type_MqqAppNewIntent);
      return;
    }
  }
}
