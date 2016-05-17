import com.tencent.mobileqq.activity.contact.addcontact.SearchContactsFragment;
import com.tencent.mobileqq.activity.contact.addcontact.ViewFactory.GuideView.OnItemClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class lra
  implements ViewFactory.GuideView.OnItemClickListener
{
  public lra(SearchContactsFragment paramSearchContactsFragment)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SearchContactsFragment", 2, "guide view | onItemClick type is:" + paramInt + " keyWords is:" + paramString);
    }
    a.jdField_a_of_type_Boolean = true;
    a.jdField_a_of_type_Int = paramInt;
    a.a(paramString, false);
  }
}
