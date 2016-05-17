import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.activity.aio.photo.AIOImageData;
import com.tencent.mobileqq.activity.aio.photo.AIOImageProviderService;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaData;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProviderCallBack;
import com.tencent.mobileqq.app.HotChatHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.MultiMsgProxy;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageForMixedMsg;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.StructMsgForImageShare;
import com.tencent.mobileqq.structmsg.view.StructMsgItemImage;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mqq.app.AccountNotMatchException;

public class lei
  implements Runnable
{
  public lei(AIOImageProviderService paramAIOImageProviderService)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    for (;;)
    {
      try
      {
        localIAIOImageProviderCallBack = a.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProviderCallBack;
        if (localIAIOImageProviderCallBack == null) {
          return;
        }
        l = System.currentTimeMillis();
        Object localObject1 = (QQAppInterface)BaseApplicationImpl.a.getAppRuntime(a.b);
        if (!a.jdField_a_of_type_Boolean)
        {
          if (a.c == null) {
            break label966;
          }
          localObject1 = ((QQAppInterface)localObject1).a().a(a.c, a.jdField_a_of_type_Int, new int[] { 45536, 63536, 64501, 63525, 63514 }, 1000);
          localArrayList2 = new ArrayList();
          localArrayList1 = new ArrayList();
          if (!QLog.isColorLevel()) {
            break label967;
          }
          QLog.d("AIOImageProviderService", 2, "LoadMediaTask.run() init loading size " + ((List)localObject1).size() + ", cost " + (System.currentTimeMillis() - l));
          break label967;
          if (i >= ((List)localObject1).size()) {
            continue;
          }
          localObject3 = (MessageRecord)((List)localObject1).get(i);
          int j = msgtype;
          if (!(localObject3 instanceof MessageForPic)) {
            continue;
          }
          localObject3 = (MessageForPic)localObject3;
          ((MessageForPic)localObject3).parse();
          if ((j == 62536) || (j == 35533))
          {
            if (!QLog.isColorLevel()) {
              break label972;
            }
            QLog.i("AIOImageProviderService", 2, "LoadMediaTask msgType is " + j);
            break label972;
          }
        }
        else
        {
          if (((QQAppInterface)localObject1).a() == null) {
            break label966;
          }
          localObject1 = ((QQAppInterface)localObject1).a().a(a.jdField_a_of_type_Long);
          continue;
        }
        if (HotChatHelper.a((MessageRecord)localObject3)) {
          break label972;
        }
        localArrayList2.add(AIOGalleryUtils.a((MessageForPic)localObject3));
        localArrayList1.add(localObject3);
      }
      catch (AccountNotMatchException localAccountNotMatchException)
      {
        if (QLog.isColorLevel())
        {
          QLog.d("AIOImageProviderService", 2, "no appRuntime");
          return;
          if ((localObject3 instanceof MessageForMixedMsg))
          {
            localObject3 = (MessageForMixedMsg)localObject3;
            ((MessageForMixedMsg)localObject3).parse();
            msgElemList.size();
            localObject3 = msgElemList.iterator();
            if (!((Iterator)localObject3).hasNext()) {
              break label972;
            }
            localObject4 = (MessageRecord)((Iterator)localObject3).next();
            if (!(localObject4 instanceof MessageForPic)) {
              continue;
            }
            localArrayList2.add(AIOGalleryUtils.a((MessageForPic)localObject4));
            localArrayList1.add((MessageForPic)localObject4);
            continue;
          }
        }
      }
      catch (OutOfMemoryError localOutOfMemoryError)
      {
        IAIOImageProviderCallBack localIAIOImageProviderCallBack;
        long l;
        ArrayList localArrayList2;
        ArrayList localArrayList1;
        Object localObject3;
        Object localObject4;
        if (QLog.isColorLevel())
        {
          QLog.d("AIOImageProviderService", 2, "out of memory", localOutOfMemoryError);
          return;
          if ((localObject3 instanceof MessageForStructing))
          {
            localObject3 = (MessageForStructing)localObject3;
            ((MessageForStructing)localObject3).parse();
            if ((structingMsg == null) || (structingMsg.mMsgServiceID != 5)) {
              break label972;
            }
            StructMsgForImageShare localStructMsgForImageShare = (StructMsgForImageShare)structingMsg;
            StructMsgItemImage localStructMsgItemImage = localStructMsgForImageShare.getFirstImageElement();
            if (localStructMsgItemImage == null) {
              break label972;
            }
            localObject4 = jdField_a_of_type_ComTencentMobileqqDataMessageForPic;
            localObject3 = localObject4;
            if (localObject4 == null)
            {
              if (jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgForImageShare == null) {
                jdField_a_of_type_ComTencentMobileqqStructmsgStructMsgForImageShare = localStructMsgForImageShare;
              }
              localObject3 = localStructMsgItemImage.a();
            }
            localObject4 = AIOGalleryUtils.a((MessageForPic)localObject3);
            if ((mMsgActionData != null) && (mMsgActionData.startsWith("comic_plugin.apk")))
            {
              h = 1;
              a = localStructMsgForImageShare.getBytes();
            }
            localArrayList2.add(localObject4);
            localArrayList1.add(localObject3);
            break label972;
          }
          if (MessageForShortVideo.class.isInstance(localObject3))
          {
            localObject3 = (MessageForShortVideo)localObject3;
            if ((busiType != 1) && (busiType != 2) && (busiType != 1007) && (busiType != 1009)) {
              break label972;
            }
            localArrayList2.add(AIOGalleryUtils.a((MessageForShortVideo)localObject3));
            localArrayList1.add(localObject3);
            break label972;
          }
          if (!QLog.isColorLevel()) {
            break label972;
          }
          QLog.i("AIOImageProviderService", 2, "LoadMediaTask " + ((MessageRecord)localObject3).getBaseInfoString());
          break label972;
          if ((QLog.isColorLevel()) && (localArrayList2.isEmpty()))
          {
            localObject2 = localOutOfMemoryError.iterator();
            if (((Iterator)localObject2).hasNext())
            {
              localObject3 = (MessageRecord)((Iterator)localObject2).next();
              QLog.i("AIOImageProviderService", 2, "LoadMediaTask dump mr " + ((MessageRecord)localObject3).getBaseInfoString());
              continue;
            }
          }
          Object localObject2 = (AIORichMediaData[])localArrayList2.toArray(new AIORichMediaData[0]);
          a.jdField_a_of_type_JavaUtilList = localArrayList1;
          if (localObject2.length > 0) {
            localIAIOImageProviderCallBack.a((AIORichMediaData[])localObject2, -1);
          }
          if (QLog.isColorLevel())
          {
            QLog.d("AIOImageProviderService", 2, "LoadMediaTask.run() total size " + localArrayList1.size());
            QLog.d("AIOImageProviderService", 2, "LoadMediaTask.run() end loading, cost " + (System.currentTimeMillis() - l));
          }
        }
      }
      label966:
      return;
      label967:
      int i = 0;
      continue;
      label972:
      i += 1;
    }
  }
}
