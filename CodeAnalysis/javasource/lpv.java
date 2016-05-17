import android.text.TextUtils;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.FormMutiItem;

class lpv
  implements Runnable
{
  lpv(lpu paramLpu, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString))
    {
      jdField_a_of_type_Lpu.a.b.setSecondLineText("");
      jdField_a_of_type_Lpu.a.b.setSecondLineVisible(false);
      return;
    }
    jdField_a_of_type_Lpu.a.b.setSecondLineText(jdField_a_of_type_JavaLangString);
    jdField_a_of_type_Lpu.a.b.setSecondLineVisible(true);
  }
}
