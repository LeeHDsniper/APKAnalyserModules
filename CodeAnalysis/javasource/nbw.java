import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Comparator;

public class nbw
  implements Comparator
{
  public nbw(PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(PhoneContact paramPhoneContact1, PhoneContact paramPhoneContact2)
  {
    return b(paramPhoneContact1, paramPhoneContact2);
  }
  
  int b(PhoneContact paramPhoneContact1, PhoneContact paramPhoneContact2)
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
        break label81;
      }
      if (j == 0) {
        break label76;
      }
      i = k;
    }
    label76:
    label81:
    do
    {
      for (;;)
      {
        return i;
        i = 0;
        break;
        i = -1;
      }
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
      j = ((String)localObject1).compareTo((String)localObject2);
      i = j;
    } while (j != 0);
    return pinyinAll.compareTo(pinyinAll);
  }
}
