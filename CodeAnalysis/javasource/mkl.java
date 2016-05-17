import com.tencent.mobileqq.activity.selectmember.CreateFaceToFaceDiscussionActivity;
import com.tencent.mobileqq.app.NearFieldDiscussHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class mkl
  extends SosoInterface.OnLocationListener
{
  mkl(mkk paramMkk, int paramInt, boolean paramBoolean1, boolean paramBoolean2, long paramLong, boolean paramBoolean3, boolean paramBoolean4, String paramString)
  {
    super(paramInt, paramBoolean1, paramBoolean2, paramLong, paramBoolean3, paramBoolean4, paramString);
    paramBoolean1 = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    if ((paramInt != 0) || (paramSosoLbsInfo == null)) {
      return;
    }
    paramSosoLbsInfo = CreateFaceToFaceDiscussionActivity.a(a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity, paramSosoLbsInfo);
    NearFieldDiscussHandler localNearFieldDiscussHandler = (NearFieldDiscussHandler)a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.app.a(33);
    switch (a.jdField_a_of_type_Int)
    {
    default: 
      return;
    case 0: 
      localNearFieldDiscussHandler.b(a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.a.toString(), a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.b, paramSosoLbsInfo);
      return;
    case 1: 
      localNearFieldDiscussHandler.a(a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.a.toString(), a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.b, paramSosoLbsInfo, true);
      return;
    case 2: 
      localNearFieldDiscussHandler.a(a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.a.toString(), a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.b, paramSosoLbsInfo, false);
      return;
    }
    localNearFieldDiscussHandler.a(a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.a.toString(), a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.b, paramSosoLbsInfo);
  }
}
