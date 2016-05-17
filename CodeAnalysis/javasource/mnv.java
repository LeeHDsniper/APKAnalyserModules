import android.os.Handler;
import android.os.Message;
import android.widget.TextView;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.activity.selectmember.TroopMemberListInnerFrame;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.LinkedHashMap;

public class mnv
  extends Handler
{
  public mnv(TroopMemberListInnerFrame paramTroopMemberListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    }
    Object[] arrayOfObject = (Object[])obj;
    if (arrayOfObject.length == 3)
    {
      a.jdField_a_of_type_JavaUtilLinkedHashMap = ((LinkedHashMap)arrayOfObject[0]);
      a.jdField_a_of_type_ArrayOfInt = ((int[])arrayOfObject[1]);
      a.jdField_a_of_type_ArrayOfJavaLangString = ((String[])arrayOfObject[2]);
      a.jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    }
    for (;;)
    {
      a.jdField_a_of_type_Moa.notifyDataSetChanged();
      if ((what != 2) && ((what != 1) || (a.jdField_a_of_type_Boolean))) {
        break;
      }
      a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.n();
      return;
      a.jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
      a.jdField_a_of_type_ArrayOfInt = new int[0];
      a.jdField_a_of_type_ArrayOfJavaLangString = new String[0];
      a.jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    }
  }
}
