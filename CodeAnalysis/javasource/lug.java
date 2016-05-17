import android.app.Activity;
import android.content.Intent;
import com.tencent.mobileqq.activity.contact.troop.BaseTroopView.ITroopContext;
import com.tencent.mobileqq.activity.contact.troop.TroopView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.widget.QQProgressDialog;
import cooperation.dingdong.DingdongJsApiPlugin.OpenIdData;
import cooperation.dingdong.DingdongOpenIdProvider.Callback;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import tencent.im.oidb.cmd0x589.oidb_0x589.GetUserOpenIdReq;
import tencent.im.oidb.cmd0x589.oidb_0x589.GetUserOpenIdRsp;

public class lug
  implements DingdongOpenIdProvider.Callback
{
  public lug(TroopView paramTroopView, QQProgressDialog paramQQProgressDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(long paramLong, List paramList)
  {
    if (TroopView.a(jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView) == paramLong)
    {
      if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing()) {
        jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
      }
      Intent localIntent = new Intent();
      if (paramList != null)
      {
        ArrayList localArrayList = new ArrayList(paramList.size());
        paramList = paramList.iterator();
        while (paramList.hasNext())
        {
          oidb_0x589.GetUserOpenIdRsp localGetUserOpenIdRsp = (oidb_0x589.GetUserOpenIdRsp)paramList.next();
          if (uint32_result.get() == 0)
          {
            DingdongJsApiPlugin.OpenIdData localOpenIdData = new DingdongJsApiPlugin.OpenIdData();
            jdField_a_of_type_Int = msg_req_id.uint32_req_flag.get();
            jdField_a_of_type_Long = msg_req_id.uint64_req_uin.get();
            jdField_b_of_type_Long = msg_req_id.uint64_req_host_uin.get();
            jdField_a_of_type_JavaLangString = bytes_open_id.get().toStringUtf8();
            jdField_b_of_type_JavaLangString = bytes_group_open_id.get().toStringUtf8();
            c = bytes_discuss_open_id.get().toStringUtf8();
            d = bytes_token.get().toStringUtf8();
            localArrayList.add(localOpenIdData);
          }
        }
        localIntent.putParcelableArrayListExtra("dingdong_param_open_id_result", localArrayList);
      }
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView.a.a().setResult(-1, localIntent);
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView.i();
    }
  }
}
