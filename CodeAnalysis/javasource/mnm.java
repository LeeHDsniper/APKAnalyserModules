import QQService.EVIPSPEC;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import java.util.Comparator;

public class mnm
  implements Comparator
{
  public static final int a = -1;
  
  private mnm()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(mnk paramMnk)
  {
    if (jdField_a_of_type_Int != -1) {
      return jdField_a_of_type_Int;
    }
    Friends localFriends = jdField_a_of_type_ComTencentMobileqqDataFriends;
    int k = ContactUtils.a(detalStatusFlag, iTermType);
    int j;
    int i;
    if ((k != 6) && (k != 0))
    {
      j = 65536;
      if (!localFriends.isServiceEnabled(EVIPSPEC.E_SP_SUPERVIP)) {
        break label132;
      }
      i = 4096;
      switch (k)
      {
      case 5: 
      case 6: 
      default: 
        label64:
        i = j | i | (int)localFriends.getLastLoginType();
      }
    }
    for (;;)
    {
      jdField_a_of_type_Int = i;
      return i;
      j = 131072;
      break;
      label132:
      if (localFriends.isServiceEnabled(EVIPSPEC.E_SP_QQVIP))
      {
        i = 8192;
        break label64;
      }
      if (localFriends.isServiceEnabled(EVIPSPEC.E_SP_SUPERQQ))
      {
        i = 12288;
        break label64;
      }
      i = 16384;
      break label64;
      i = j | i | 0x1;
      continue;
      i = j | i | 0x2;
      continue;
      i = j | i | 0x3;
    }
  }
  
  public int a(mnk paramMnk1, mnk paramMnk2)
  {
    return a(paramMnk1) - a(paramMnk2);
  }
}
