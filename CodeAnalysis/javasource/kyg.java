import android.widget.ImageView;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder.Holder;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.Emoticon;
import com.tencent.mobileqq.data.EmoticonPackage;
import com.tencent.mobileqq.emoticon.MagicFaceDownloadListener;
import com.tencent.mobileqq.emoticonview.PicEmoticonInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.EmoticonManager;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;

public class kyg
  implements MagicFaceDownloadListener
{
  public kyg(MarketFaceItemBuilder paramMarketFaceItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(EmoticonPackage paramEmoticonPackage)
  {
    Object localObject1 = null;
    label22:
    Object localObject2;
    Emoticon localEmoticon;
    Object localObject3;
    boolean bool;
    if ((!a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a()) || (paramEmoticonPackage == null))
    {
      return;
    }
    else
    {
      do
      {
        localObject2 = ((EmoticonManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).a(epId);
      } while (localObject2 == null);
      localObject2 = ((List)localObject2).iterator();
      if (((Iterator)localObject2).hasNext())
      {
        localEmoticon = (Emoticon)((Iterator)localObject2).next();
        localObject3 = a.jdField_a_of_type_JavaUtilList.iterator();
        for (;;)
        {
          if (((Iterator)localObject3).hasNext())
          {
            localObject2 = (MarketFaceItemBuilder.Holder)((Iterator)localObject3).next();
            if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (epId.equals(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId)))
            {
              ChatMessage localChatMessage = jdField_a_of_type_ComTencentMobileqqDataChatMessage;
              if ((jdField_a_of_type_Boolean) && (e.hasWindowFocus()))
              {
                bool = true;
                label178:
                jdField_a_of_type_Boolean = false;
                localObject3 = Boolean.valueOf(bool);
                localObject1 = localObject2;
                localObject2 = localChatMessage;
              }
            }
          }
        }
      }
    }
    for (;;)
    {
      if (((Boolean)localObject3).booleanValue()) {
        if (localObject2 != null)
        {
          localObject2 = senderuin;
          ((BaseActivity)a.jdField_b_of_type_AndroidContentContext).runOnUiThread(new kyh(this, localEmoticon, (String)localObject2, (MarketFaceItemBuilder.Holder)localObject1));
        }
      }
      for (;;)
      {
        localObject1 = a.jdField_a_of_type_JavaUtilList.iterator();
        if (!((Iterator)localObject1).hasNext()) {
          break label22;
        }
        localObject2 = (MarketFaceItemBuilder.Holder)((Iterator)localObject1).next();
        if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo == null) || (!epId.equals(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId))) {
          break;
        }
        if (jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.jobType == 2) {
          ((BaseActivity)a.jdField_b_of_type_AndroidContentContext).runOnUiThread(new kyj(this));
        }
        a.jdField_a_of_type_JavaUtilList.remove(localObject2);
        return;
        bool = false;
        break label178;
        if ((localEmoticon != null) && (jobType == 4)) {
          ((BaseActivity)a.jdField_b_of_type_AndroidContentContext).runOnUiThread(new kyi(this, (MarketFaceItemBuilder.Holder)localObject1, localEmoticon));
        }
      }
      localObject2 = null;
      localObject3 = Boolean.valueOf(false);
    }
  }
  
  public void b(EmoticonPackage paramEmoticonPackage)
  {
    Iterator localIterator = a.jdField_a_of_type_JavaUtilList.iterator();
    while (localIterator.hasNext())
    {
      MarketFaceItemBuilder.Holder localHolder = (MarketFaceItemBuilder.Holder)localIterator.next();
      if ((jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo != null) && (epId.equals(jdField_a_of_type_ComTencentMobileqqEmoticonviewPicEmoticonInfo.a.epId)))
      {
        if (QLog.isColorLevel()) {
          QLog.d(a.jdField_b_of_type_JavaLangString, 2, "Download magic Emoji fail!");
        }
        ((BaseActivity)a.jdField_b_of_type_AndroidContentContext).runOnUiThread(new kyk(this, localHolder));
        a.jdField_a_of_type_JavaUtilList.remove(localHolder);
      }
    }
  }
  
  public void c(EmoticonPackage paramEmoticonPackage) {}
}
