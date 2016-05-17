import com.tencent.mobileqq.activity.aio.photo.AIOImageProviderService;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProviderCallBack;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PicInfoInterface.ErrInfo;
import com.tencent.mobileqq.pic.PicResult;
import com.tencent.mobileqq.pic.UiCallBack.DownAdapter;

public class lee
  extends UiCallBack.DownAdapter
{
  public lee(AIOImageProviderService paramAIOImageProviderService, long paramLong1, int paramInt1, int paramInt2, long paramLong2, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, PicResult paramPicResult)
  {
    IAIOImageProviderCallBack localIAIOImageProviderCallBack = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.a;
    if (localIAIOImageProviderCallBack != null)
    {
      if (d == 0) {
        localIAIOImageProviderCallBack.a(jdField_a_of_type_Long, jdField_a_of_type_Int, jdField_b_of_type_Int, 1, jdField_a_of_type_JavaLangString, jdField_a_of_type_Boolean);
      }
    }
    else {
      return;
    }
    localIAIOImageProviderCallBack.a(jdField_a_of_type_Long, jdField_a_of_type_Int, jdField_b_of_type_Int, 2, "step:" + jdField_a_of_type_ComTencentMobileqqPicPicInfoInterface$ErrInfo.jdField_a_of_type_JavaLangString + ", desc:" + jdField_a_of_type_ComTencentMobileqqPicPicInfoInterface$ErrInfo.b, jdField_a_of_type_Boolean);
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    IAIOImageProviderCallBack localIAIOImageProviderCallBack = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageProviderService.a;
    if (localIAIOImageProviderCallBack != null) {
      localIAIOImageProviderCallBack.a(jdField_a_of_type_Long, jdField_a_of_type_Int, jdField_b_of_type_Int, paramInt, jdField_b_of_type_Long, paramBoolean);
    }
  }
}
