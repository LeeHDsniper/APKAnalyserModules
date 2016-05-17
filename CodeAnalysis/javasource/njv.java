import OnlinePushPack.MsgInfo;
import android.util.Pair;
import com.tencent.mobileqq.app.message.DiscMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.TimerTask;

public class njv
  extends TimerTask
{
  public njv(DiscMessageProcessor paramDiscMessageProcessor, long paramLong1, long paramLong2, Pair paramPair1, MsgInfo paramMsgInfo, long paramLong3, long paramLong4, byte paramByte, long paramLong5, Pair paramPair2, ArrayList paramArrayList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_Long != jdField_b_of_type_Long)
    {
      DiscMessageProcessor.a(jdField_a_of_type_ComTencentMobileqqAppMessageDiscMessageProcessor, jdField_a_of_type_AndroidUtilPair, jdField_a_of_type_OnlinePushPackMsgInfo, jdField_b_of_type_Long, c, d, jdField_a_of_type_Byte, e, jdField_b_of_type_AndroidUtilPair);
      return;
    }
    DiscMessageProcessor.a(jdField_a_of_type_ComTencentMobileqqAppMessageDiscMessageProcessor, jdField_a_of_type_AndroidUtilPair, jdField_a_of_type_OnlinePushPackMsgInfo, jdField_a_of_type_JavaUtilArrayList, jdField_b_of_type_Long, String.valueOf(c), jdField_a_of_type_Byte, e, false);
  }
}
