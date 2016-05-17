import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Emoticon;
import com.tencent.mobileqq.data.EmoticonPackage;
import com.tencent.mobileqq.emosm.EmosmUtils;
import com.tencent.mobileqq.emoticon.EmojiManager;
import com.tencent.mobileqq.emoticon.ReqInfo;
import com.tencent.mobileqq.emoticonview.EmoticonUtils;
import com.tencent.mobileqq.emoticonview.PicEmoticonInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.vip.DownloadTask;
import com.tencent.mobileqq.widget.QQProgressDialog;
import java.io.File;
import java.util.ArrayList;
import java.util.Map;

public class kye
  extends kyo
{
  private int jdField_a_of_type_Int;
  private Context jdField_a_of_type_AndroidContentContext;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private PicEmoticonInfo jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo;
  private QQProgressDialog jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog;
  
  public kye(MarketFaceItemBuilder paramMarketFaceItemBuilder)
  {
    super(paramMarketFaceItemBuilder, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, QQAppInterface paramQQAppInterface, Context paramContext, PicEmoticonInfo paramPicEmoticonInfo, QQProgressDialog paramQQProgressDialog, SessionInfo paramSessionInfo)
  {
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo = paramPicEmoticonInfo;
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = paramQQProgressDialog;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
  }
  
  public void onDone(DownloadTask paramDownloadTask)
  {
    if (paramDownloadTask.a() == 3)
    {
      EmojiManager localEmojiManager = (EmojiManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(42);
      Object localObject1 = paramDownloadTask.a();
      EmoticonPackage localEmoticonPackage = (EmoticonPackage)((Bundle)localObject1).getSerializable("emoticonPackage");
      Object localObject2 = EmosmUtils.a(epId);
      int i = ((Bundle)localObject1).getInt("jsonType", EmojiManager.e);
      paramDownloadTask = (File)a.get(localObject2);
      localObject1 = new ArrayList();
      localObject2 = new ArrayList();
      ReqInfo localReqInfo = new ReqInfo();
      if (paramDownloadTask.exists())
      {
        paramDownloadTask = FileUtils.a(paramDownloadTask);
        if (localEmojiManager.a(localEmoticonPackage, i, paramDownloadTask, (ArrayList)localObject1, (ArrayList)localObject2, localReqInfo) == null) {
          break label137;
        }
      }
      label137:
      while (Long.parseLong(epId) != Long.parseLong(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId))
      {
        return;
        paramDownloadTask = null;
        break;
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences().edit().putInt("emosm_json_last_download_timestamp", (int)(System.currentTimeMillis() / 1000L)).commit();
      EmoticonUtils.a(jdField_a_of_type_Int, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo, null, jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
      return;
    }
    EmoticonUtils.a(jdField_a_of_type_Int + 1000, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo, null, jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
  }
}
