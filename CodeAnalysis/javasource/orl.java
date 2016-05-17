import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.ProtoReqManager.IProtoRespBack;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoReq;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoResp;

public class orl
  implements ProtoReqManager.IProtoRespBack
{
  public orl(FileTransferHandler paramFileTransferHandler)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(ProtoReqManager.ProtoResp paramProtoResp, ProtoReqManager.ProtoReq paramProtoReq)
  {
    if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_UPLOAD-500".equals(a)) {
      FileTransferHandler.a(a, paramProtoReq, paramProtoResp);
    }
    do
    {
      return;
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_UPLOAD_SUCC-800".equals(a))
      {
        FileTransferHandler.b(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_DOWNLOAD-1200".equals(a))
      {
        FileTransferHandler.c(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_DOWNLOAD_SUCC-1000".equals(a))
      {
        FileTransferHandler.d(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_FORWARD_FILE-700".equals(a))
      {
        FileTransferHandler.e(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_COPY_TO-60100".equals(a))
      {
        FileTransferHandler.f(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_DOWNLOAD_ABS-1100".equals(a))
      {
        FileTransferHandler.g(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_DELETE_FILE-900".equals(a))
      {
        FileTransferHandler.h(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("GTalkFileAppSvr.CMD_DISCUSS_FILE".equals(a))
      {
        FileTransferHandler.i(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_UPLOAD_V2-1600".equals(a))
      {
        FileTransferHandler.j(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_UPLOAD_V3-1700".equals(a))
      {
        FileTransferHandler.k(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("OfflineFilleHandleSvr.pb_ftn_CMD_REQ_APPLY_UPLOAD_HIT_V2-1800".equals(a))
      {
        FileTransferHandler.l(a, paramProtoReq, paramProtoResp);
        return;
      }
      if ("SafeCenterSvr.CMD_FACE2FACE_FLAG_REQ".equals(a))
      {
        FileTransferHandler.m(a, paramProtoReq, paramProtoResp);
        return;
      }
    } while (!"OfflineFilleHandleSvr.pb_ftn_CMD_REQ_RECALL-400".equals(a));
    FileTransferHandler.n(a, paramProtoReq, paramProtoResp);
  }
}
