import android.text.InputFilter;
import android.text.Spanned;
import com.tencent.mobileqq.activity.book.BookEditText;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.text.QQText;

public class los
  implements InputFilter
{
  public los(BookEditText paramBookEditText)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public CharSequence filter(CharSequence paramCharSequence, int paramInt1, int paramInt2, Spanned paramSpanned, int paramInt3, int paramInt4)
  {
    a.a(paramSpanned.toString());
    if (a.a(paramCharSequence.toString()) == 0) {
      BookEditText.a(a);
    }
    while (!QQText.a(paramCharSequence.toString())) {
      return paramCharSequence.subSequence(paramInt1, paramInt2 - paramInt1);
    }
    return "";
  }
}
