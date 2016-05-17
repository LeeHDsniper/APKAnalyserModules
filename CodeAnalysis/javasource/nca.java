import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Comparator;

class nca
  implements Comparator
{
  nca(nby paramNby)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(PhoneContact paramPhoneContact1, PhoneContact paramPhoneContact2)
  {
    int j = sortWeight - sortWeight;
    int i = j;
    if (j == 0)
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
      j = ((String)localObject1).compareTo((String)localObject2);
      i = j;
      if (j == 0) {
        i = pinyinAll.compareTo(pinyinAll);
      }
    }
    return i;
  }
}
