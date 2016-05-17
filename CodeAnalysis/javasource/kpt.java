import android.app.Activity;
import android.content.Context;
import android.view.View.OnLongClickListener;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import java.io.UnsupportedEncodingException;

public class kpt
  implements Runnable
{
  int jdField_a_of_type_Int;
  Context jdField_a_of_type_AndroidContentContext;
  View.OnLongClickListener jdField_a_of_type_AndroidViewView$OnLongClickListener;
  BaseChatItemLayout jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout;
  QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  String jdField_a_of_type_JavaLangString;
  String b;
  
  public kpt(QQAppInterface paramQQAppInterface, Context paramContext, BaseChatItemLayout paramBaseChatItemLayout, String paramString1, String paramString2, int paramInt, View.OnLongClickListener paramOnLongClickListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout = paramBaseChatItemLayout;
    jdField_a_of_type_JavaLangString = paramString1;
    b = paramString2;
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_AndroidViewView$OnLongClickListener = paramOnLongClickListener;
  }
  
  public void run()
  {
    String str1 = null;
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null) || (jdField_a_of_type_AndroidContentContext == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout == null) || (jdField_a_of_type_AndroidViewView$OnLongClickListener == null)) {}
    for (;;)
    {
      return;
      label55:
      Object localObject;
      if (jdField_a_of_type_Int == 1)
      {
        str1 = ContactUtils.f(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_JavaLangString, b);
        localObject = str1;
        if (str1 != null)
        {
          localObject = str1;
          if (str1.getBytes().length > 3)
          {
            byte[] arrayOfByte = str1.getBytes();
            localObject = str1;
            if (arrayOfByte[0] == -17)
            {
              localObject = str1;
              if (arrayOfByte[1] == -69)
              {
                localObject = str1;
                if (arrayOfByte[2] == -65)
                {
                  localObject = new byte[arrayOfByte.length - 3];
                  System.arraycopy(arrayOfByte, 3, localObject, 0, localObject.length);
                }
              }
            }
          }
        }
      }
      try
      {
        localObject = new String((byte[])localObject, "UTF-8");
        if (!(jdField_a_of_type_AndroidContentContext instanceof Activity)) {
          continue;
        }
        ((Activity)jdField_a_of_type_AndroidContentContext).runOnUiThread(new kpu(this, (String)localObject));
        return;
        if (jdField_a_of_type_Int != 3000) {
          break label55;
        }
        str1 = ContactUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_JavaLangString, b);
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        for (;;)
        {
          localUnsupportedEncodingException.printStackTrace();
          String str2 = str1;
        }
      }
    }
  }
}
