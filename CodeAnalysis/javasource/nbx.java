import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import java.util.Comparator;

public class nbx
  implements Comparator
{
  public nbx(PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  int a(PhoneContact paramPhoneContact)
  {
    int j = ContactUtils.a(detalStatusFlag, iTermType);
    if ((j != 6) && (j != 0)) {}
    for (int i = 65536;; i = 131072) {
      switch (j)
      {
      case 5: 
      case 6: 
      default: 
        return i | (int)a.a(unifiedCode);
      }
    }
    return i | 0x1;
    return i | 0x2;
    return i | 0x3;
  }
  
  public int a(PhoneContact paramPhoneContact1, PhoneContact paramPhoneContact2)
  {
    int j = 0;
    int k = 1;
    int i;
    if ((isNewRecommend) || (highLightTimeStamp != 0L))
    {
      i = 1;
      if ((isNewRecommend) || (highLightTimeStamp != 0L)) {
        j = 1;
      }
      if (((i == 0) && (j == 0)) || ((i != 0) && (j != 0))) {
        break label78;
      }
      if (j == 0) {
        break label76;
      }
      i = k;
    }
    label76:
    label78:
    do
    {
      return i;
      i = 0;
      break;
      return -1;
      j = c(paramPhoneContact1, paramPhoneContact2);
      i = j;
    } while (j != 0);
    return b(paramPhoneContact1, paramPhoneContact2);
  }
  
  int b(PhoneContact paramPhoneContact1, PhoneContact paramPhoneContact2)
  {
    Object localObject2 = pinyinFirst;
    String str = pinyinFirst;
    Object localObject1 = localObject2;
    if (((String)localObject2).endsWith("#")) {
      localObject1 = "Za";
    }
    localObject2 = str;
    if (str.endsWith("#")) {
      localObject2 = "Za";
    }
    int j = ((String)localObject1).compareTo((String)localObject2);
    int i = j;
    if (j == 0) {
      i = pinyinAll.compareTo(pinyinAll);
    }
    return i;
  }
  
  int c(PhoneContact paramPhoneContact1, PhoneContact paramPhoneContact2)
  {
    return a(paramPhoneContact1) - a(paramPhoneContact2);
  }
}
