package com.tencent.mobileqq.activity.photo;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import mas;

public class PhotoCropAction
{
  public PhotoCropActivity a;
  public String[] a;
  
  public PhotoCropAction(PhotoCropActivity paramPhotoCropActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity = paramPhotoCropActivity;
  }
  
  public void a()
  {
    if ((jdField_a_of_type_ArrayOfJavaLangString != null) && (jdField_a_of_type_ArrayOfJavaLangString.length > 0))
    {
      ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity, null);
      int i = 0;
      while (i < jdField_a_of_type_ArrayOfJavaLangString.length)
      {
        localActionSheet.a(jdField_a_of_type_ArrayOfJavaLangString[i], 1);
        i += 1;
      }
      localActionSheet.d(2131366996);
      localActionSheet.a(new mas(this, localActionSheet));
      localActionSheet.show();
    }
  }
  
  public void a(int paramInt) {}
  
  public void a(String[] paramArrayOfString)
  {
    jdField_a_of_type_ArrayOfJavaLangString = paramArrayOfString;
  }
}
