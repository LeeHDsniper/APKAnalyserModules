import android.graphics.drawable.Drawable;
import android.text.Editable;
import android.widget.EditText;
import com.tencent.mobileqq.emoticonview.EmoticonCallback;
import com.tencent.mobileqq.emoticonview.EmoticonInfo;
import com.tencent.mobileqq.emoticonview.SystemAndEmojiEmoticonInfo;
import com.tencent.mobileqq.emoticonview.SystemEmoticonInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialogWtihEmoticonInput;

public class snf
  implements EmoticonCallback
{
  public snf(QQCustomDialogWtihEmoticonInput paramQQCustomDialogWtihEmoticonInput)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(EmoticonInfo paramEmoticonInfo)
  {
    int i;
    int j;
    if ((paramEmoticonInfo instanceof SystemEmoticonInfo))
    {
      i = QQCustomDialogWtihEmoticonInput.a(a).getSelectionStart();
      j = QQCustomDialogWtihEmoticonInput.a(a).getSelectionEnd();
      if ((i < 0) || (j < 0) || (j < i)) {}
    }
    int k;
    int m;
    do
    {
      QQCustomDialogWtihEmoticonInput.a(a).getEditableText().replace(i, j, com.tencent.mobileqq.text.TextUtils.b(a));
      do
      {
        return;
      } while (!(paramEmoticonInfo instanceof SystemAndEmojiEmoticonInfo));
      paramEmoticonInfo = (SystemAndEmojiEmoticonInfo)paramEmoticonInfo;
      i = QQCustomDialogWtihEmoticonInput.a(a).getSelectionStart();
      j = QQCustomDialogWtihEmoticonInput.a(a).getSelectionEnd();
      k = h;
      m = i;
    } while ((i < 0) || (j < 0) || (j < i) || ((k == 2) && (m == -1)));
    if (k == 1) {}
    for (paramEmoticonInfo = com.tencent.mobileqq.text.TextUtils.b(m);; paramEmoticonInfo = com.tencent.mobileqq.text.TextUtils.a(m))
    {
      QQCustomDialogWtihEmoticonInput.a(a).getEditableText().replace(i, j, paramEmoticonInfo);
      QQCustomDialogWtihEmoticonInput.a(a).requestFocus();
      return;
    }
  }
  
  public void a(EmoticonInfo paramEmoticonInfo1, EmoticonInfo paramEmoticonInfo2, Drawable paramDrawable) {}
  
  public boolean a(EmoticonInfo paramEmoticonInfo)
  {
    return true;
  }
  
  public void b()
  {
    if (QQCustomDialogWtihEmoticonInput.a(a).getSelectionStart() == 0) {}
    for (;;)
    {
      return;
      try
      {
        Editable localEditable = QQCustomDialogWtihEmoticonInput.a(a).getText();
        int i = QQCustomDialogWtihEmoticonInput.a(a).getSelectionStart();
        int j = android.text.TextUtils.getOffsetBefore(QQCustomDialogWtihEmoticonInput.a(a).getText(), i);
        if (i != j)
        {
          localEditable.delete(Math.min(i, j), Math.max(i, j));
          return;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
  }
  
  public void b(EmoticonInfo paramEmoticonInfo) {}
  
  public void c() {}
  
  public void d() {}
  
  public void setting() {}
}
