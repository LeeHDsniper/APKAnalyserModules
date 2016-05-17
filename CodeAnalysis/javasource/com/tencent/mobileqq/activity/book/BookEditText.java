package com.tencent.mobileqq.activity.book;

import android.content.Context;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.widget.EditText;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.UnsupportedEncodingException;
import los;

public class BookEditText
  extends EditText
{
  private int jdField_a_of_type_Int = 80;
  private BookEditText.BookEditTextInputListener jdField_a_of_type_ComTencentMobileqqActivityBookBookEditText$BookEditTextInputListener;
  private boolean jdField_a_of_type_Boolean = false;
  private InputFilter[] jdField_a_of_type_ArrayOfAndroidTextInputFilter = { new los(this) };
  
  public BookEditText(Context paramContext)
  {
    this(paramContext, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public BookEditText(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setInputType(131072);
    setSingleLine(false);
    setHorizontallyScrolling(false);
    setFilters(jdField_a_of_type_ArrayOfAndroidTextInputFilter);
  }
  
  public int a(String paramString)
  {
    if (paramString == null) {
      return 0;
    }
    try
    {
      int i = paramString.toString().getBytes("utf8").length;
      return i;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      localUnsupportedEncodingException.printStackTrace();
    }
    return paramString.toString().getBytes().length;
  }
  
  public void setCanInputWhenLenghtLimit(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public void setInputListener(BookEditText.BookEditTextInputListener paramBookEditTextInputListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityBookBookEditText$BookEditTextInputListener = paramBookEditTextInputListener;
  }
  
  public void setTextLengthLimit(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
  }
}
