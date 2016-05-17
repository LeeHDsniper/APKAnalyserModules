package com.tencent.mobileqq.activity.aio.photo;

import com.tencent.common.galleryactivity.AbstractImageListModel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.List;

public class AIOImageListModel
  implements AbstractImageListModel
{
  static final String jdField_a_of_type_JavaLangString = "AIOImageListModel";
  int jdField_a_of_type_Int;
  AIORichMediaInfo jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo;
  List jdField_a_of_type_JavaUtilList;
  int b;
  public AIORichMediaInfo b;
  int c;
  
  public AIOImageListModel()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new ArrayList();
  }
  
  public int a()
  {
    if (jdField_a_of_type_JavaUtilList != null) {
      return jdField_a_of_type_JavaUtilList.size();
    }
    return 0;
  }
  
  public int a(long paramLong, int paramInt1, int paramInt2, String paramString)
  {
    int i = 0;
    while (i < jdField_a_of_type_JavaUtilList.size())
    {
      Object localObject = jdField_a_of_type_JavaUtilList.get(i)).a;
      if (AIOImageData.class.isInstance(localObject))
      {
        localObject = (AIOImageData)localObject;
        if ((e == paramLong) && (i == paramInt1))
        {
          if ("I:E".equals(paramString))
          {
            switch (paramInt2)
            {
            case 3: 
            default: 
              return i;
            case 2: 
              jdField_b_of_type_Boolean = true;
              return i;
            case 4: 
              jdField_c_of_type_Boolean = true;
              return i;
            }
            jdField_a_of_type_Boolean = true;
            return i;
          }
          switch (paramInt2)
          {
          case 3: 
          case 5: 
          case 6: 
          case 7: 
          default: 
            return i;
          case 1: 
            jdField_a_of_type_JavaLangString = paramString;
            return i;
          case 2: 
            jdField_b_of_type_JavaLangString = paramString;
            return i;
          case 4: 
            jdField_c_of_type_JavaLangString = paramString;
            return i;
          }
          d = paramString;
          return i;
        }
      }
      else if (AIOShortVideoData.class.isInstance(localObject))
      {
        localObject = (AIOShortVideoData)localObject;
        if (e == paramLong)
        {
          if ("I:E".equals(paramString))
          {
            switch (paramInt2)
            {
            default: 
              return i;
            case 0: 
              jdField_a_of_type_Boolean = true;
              return i;
            }
            jdField_b_of_type_Boolean = true;
            return i;
          }
          switch (paramInt2)
          {
          default: 
            return i;
          case 0: 
            jdField_a_of_type_JavaLangString = paramString;
            return i;
          }
          jdField_b_of_type_JavaLangString = paramString;
          return i;
        }
      }
      i += 1;
    }
    return -1;
  }
  
  public AIORichMediaInfo a()
  {
    return jdField_b_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo;
  }
  
  public AIORichMediaInfo a(int paramInt)
  {
    if ((paramInt < jdField_a_of_type_JavaUtilList.size()) && (paramInt >= 0)) {
      return (AIORichMediaInfo)jdField_a_of_type_JavaUtilList.get(paramInt);
    }
    return null;
  }
  
  public List a()
  {
    return jdField_a_of_type_JavaUtilList;
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
    jdField_b_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo = a(paramInt);
  }
  
  public void a(AIORichMediaInfo paramAIORichMediaInfo)
  {
    jdField_a_of_type_JavaUtilList.clear();
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_b_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo = paramAIORichMediaInfo;
    jdField_b_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.jdField_b_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo = jdField_b_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo;
    jdField_a_of_type_JavaUtilList.add(paramAIORichMediaInfo);
  }
  
  public void a(List paramList)
  {
    jdField_a_of_type_JavaUtilList = paramList;
  }
  
  public void a(AIORichMediaData[] paramArrayOfAIORichMediaData, int paramInt)
  {
    ArrayList localArrayList = new ArrayList();
    int j = paramArrayOfAIORichMediaData.length - 1;
    int i = 0;
    if (i < paramArrayOfAIORichMediaData.length)
    {
      AIORichMediaData localAIORichMediaData = paramArrayOfAIORichMediaData[i];
      if ((jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.a.e == e) && (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.a.i == i))
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.jdField_b_of_type_Boolean = true;
        if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo == jdField_b_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo) {
          j = i;
        }
        localArrayList.add(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo);
      }
      for (;;)
      {
        i += 1;
        break;
        if ((jdField_b_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.a.e == e) && (jdField_b_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo.a.i == i))
        {
          localArrayList.add(jdField_b_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo);
          j = i;
        }
        else
        {
          localArrayList.add(new AIORichMediaInfo(localAIORichMediaData));
        }
      }
    }
    if (paramInt >= 0)
    {
      i = paramInt;
      if (paramInt < paramArrayOfAIORichMediaData.length) {}
    }
    else
    {
      i = j;
    }
    jdField_a_of_type_Int = i;
    jdField_a_of_type_JavaUtilList = localArrayList;
  }
  
  public int b()
  {
    return jdField_a_of_type_Int;
  }
  
  public AIORichMediaInfo b()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaInfo;
  }
  
  public void b(int paramInt)
  {
    jdField_b_of_type_Int = paramInt;
  }
  
  public int c()
  {
    return jdField_b_of_type_Int;
  }
  
  public void c(int paramInt)
  {
    c = paramInt;
  }
  
  public int d()
  {
    return c;
  }
}
