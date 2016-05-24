package com.adobe.creativesdk.aviary.internal.receipt;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.adobe.creativesdk.aviary.internal.utils.CredentialsUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class ReceiptManager
  implements IReceiptManager
{
  static final HandlerThread S_DISPATCHER_HANDLER_THREAD = ReceiptUtils.getHandlerThread(Dispatcher.class.getSimpleName());
  static final HandlerThread S_UPLOAD_HANDLER_THREAD = ReceiptUtils.getHandlerThread(UploadHandler.class.getSimpleName());
  private final Context mContext;
  private final Dispatcher mDispatcher;
  
  ReceiptManager(Context paramContext)
  {
    mContext = paramContext;
    paramContext = new EndpointInfo("http://receipts-gateway.aviary.com/v2/receipt/android/free", "http://receipts-gateway.aviary.com/v2/receipt/android/paid", "http://receipts-gateway.aviary.com/v2/content", true);
    mDispatcher = new Dispatcher(mContext, S_DISPATCHER_HANDLER_THREAD.getLooper(), paramContext);
    mDispatcher.sendEmptyMessage(1);
  }
  
  public void close()
  {
    mDispatcher.sendEmptyMessage(3);
  }
  
  public void open()
  {
    mDispatcher.sendEmptyMessage(2);
  }
  
  public void sendContent(String paramString)
  {
    mDispatcher.sendMessage(mDispatcher.obtainMessage(101, paramString));
  }
  
  public void sendTicket(Receipt paramReceipt)
  {
    mDispatcher.sendMessage(mDispatcher.obtainMessage(100, paramReceipt));
  }
  
  public void upload()
  {
    mDispatcher.sendEmptyMessage(4);
  }
  
  static final class Dispatcher
    extends Handler
  {
    LoggerFactory.Logger logger = LoggerFactory.getLogger("ReceiptDispatcher");
    private Context mContext;
    private final ReceiptManager.EndpointInfo mEndpointInfo;
    private Handler mUploadHandler;
    
    Dispatcher(Context paramContext, Looper paramLooper, ReceiptManager.EndpointInfo paramEndpointInfo)
    {
      super();
      mContext = paramContext;
      mEndpointInfo = paramEndpointInfo;
    }
    
    private void addTicket(Receipt paramReceipt)
      throws JSONException
    {
      JSONObject localJSONObject = paramReceipt.toJSON(mContext);
      Object localObject;
      String str1;
      long l;
      if (mEndpointInfo.signatureRequired)
      {
        localObject = CredentialsUtils.getApiKey(mContext);
        String str2 = CredentialsUtils.getApiSecret(mContext);
        Context localContext = mContext;
        if (isFree)
        {
          str1 = mEndpointInfo.uriFree;
          if (!ReceiptUtils.upload(localContext, str1, localJSONObject.toString(), (String)localObject, str2))
          {
            l = ReceiptProvider.getInstance(mContext).addTicket(localJSONObject, isFree);
            logger.log("added ticket with id: %d", new Object[] { Long.valueOf(l) });
          }
        }
      }
      for (;;)
      {
        return;
        str1 = mEndpointInfo.uriPaid;
        break;
        localObject = mContext;
        if (isFree) {}
        for (str1 = mEndpointInfo.uriFree; !ReceiptUtils.upload((Context)localObject, str1, localJSONObject.toString()); str1 = mEndpointInfo.uriPaid)
        {
          l = ReceiptProvider.getInstance(mContext).addTicket(localJSONObject, isFree);
          logger.log("added ticket with id: %d", new Object[] { Long.valueOf(l) });
          return;
        }
      }
    }
    
    private void close() {}
    
    private void init()
    {
      logger.info("init");
      mUploadHandler = new ReceiptManager.UploadHandler(mContext, ReceiptManager.S_UPLOAD_HANDLER_THREAD.getLooper(), mEndpointInfo);
    }
    
    private void open() {}
    
    private void sendContent(String paramString)
      throws JSONException
    {
      logger.info("sendContent");
      SystemUtils.throwIfUiThread();
      Object localObject = mContext.getPackageName();
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("adobeId", paramString);
      localJSONObject.put("applicationId", localObject);
      localJSONObject.put("isProduction", true);
      paramString = new JSONArray();
      localObject = mContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/content/installed/list"), new String[] { "pack_identifier" }, null, null, null);
      logger.verbose("cursor.size: %d", new Object[] { Integer.valueOf(((Cursor)localObject).getCount()) });
      if (localObject != null)
      {
        while (((Cursor)localObject).moveToNext())
        {
          String str = ((Cursor)localObject).getString(0);
          logger.verbose("adding: %s", new Object[] { str });
          paramString.put(str);
        }
        localJSONObject.put("content", paramString);
        IOUtils.closeSilently((Cursor)localObject);
      }
      if (mEndpointInfo.signatureRequired)
      {
        paramString = CredentialsUtils.getApiKey(mContext);
        localObject = CredentialsUtils.getApiSecret(mContext);
        if (!ReceiptUtils.upload(mContext, mEndpointInfo.uriContent, localJSONObject.toString(), paramString, (String)localObject))
        {
          logger.verbose("upload failed, adding content to the database...", new Object[0]);
          ReceiptProvider.getInstance(mContext).addContent(localJSONObject);
        }
      }
      while (ReceiptUtils.upload(mContext, mEndpointInfo.uriContent, localJSONObject.toString())) {
        return;
      }
      logger.verbose("upload failed, adding content to the database...", new Object[0]);
      ReceiptProvider.getInstance(mContext).addContent(localJSONObject);
    }
    
    private void upload()
    {
      logger.info("upload");
      mUploadHandler.sendEmptyMessage(1);
    }
    
    public void handleMessage(Message paramMessage)
    {
      logger.info("handleMessage: %d", new Object[] { Integer.valueOf(what) });
      SystemUtils.throwIfUiThread();
      for (;;)
      {
        try
        {
          switch (what)
          {
          case 1: 
            logger.warn("didn't handle message: %d", new Object[] { Integer.valueOf(what) });
            return;
          }
        }
        catch (Exception paramMessage)
        {
          paramMessage.printStackTrace();
          logger.error(paramMessage.getMessage());
          return;
        }
        init();
        return;
        open();
        return;
        close();
        return;
        upload();
        return;
        addTicket((Receipt)obj);
        return;
        sendContent((String)obj);
        return;
      }
    }
  }
  
  static class EndpointInfo
  {
    final boolean signatureRequired;
    final String uriContent;
    final String uriFree;
    final String uriPaid;
    
    EndpointInfo(String paramString1, String paramString2, String paramString3, boolean paramBoolean)
    {
      uriFree = paramString1;
      uriPaid = paramString2;
      uriContent = paramString3;
      signatureRequired = paramBoolean;
    }
  }
  
  static class Status
  {
    final int count;
    final long id;
    final int status;
    
    public Status(long paramLong, int paramInt1, int paramInt2)
    {
      id = paramLong;
      status = paramInt1;
      count = paramInt2;
    }
  }
  
  static final class UploadHandler
    extends Handler
  {
    LoggerFactory.Logger logger = LoggerFactory.getLogger("ReceiptManagerUploadHandler", LoggerFactory.LoggerType.ConsoleLoggerType);
    private Context mContext;
    private final ReceiptManager.EndpointInfo mEndpointInfo;
    
    public UploadHandler(Context paramContext, Looper paramLooper, ReceiptManager.EndpointInfo paramEndpointInfo)
    {
      super();
      mContext = paramContext;
      mEndpointInfo = paramEndpointInfo;
    }
    
    private void handleResults(Collection<ReceiptManager.Status> paramCollection, ReceiptProvider paramReceiptProvider)
    {
      logger.info("handleResults");
      paramCollection = paramCollection.iterator();
      while (paramCollection.hasNext())
      {
        ReceiptManager.Status localStatus = (ReceiptManager.Status)paramCollection.next();
        logger.verbose("---------", new Object[0]);
        logger.verbose("item {id: %d, status: %d, failCount: %d}", new Object[] { Long.valueOf(id), Integer.valueOf(status), Integer.valueOf(count) });
        if ((status == 200) || (count >= 10))
        {
          try
          {
            int i = paramReceiptProvider.deleteReceipt(id);
            logger.log("deleteCount: %d", new Object[] { Integer.valueOf(i) });
          }
          catch (SQLiteException localSQLiteException1)
          {
            localSQLiteException1.printStackTrace();
          }
        }
        else
        {
          ContentValues localContentValues = new ContentValues();
          localContentValues.put("r_fail_count", Integer.valueOf(count + 1));
          try
          {
            long l = paramReceiptProvider.updateReceipt(id, localContentValues);
            logger.log("updated receipt: %d", new Object[] { Long.valueOf(l) });
          }
          catch (SQLiteException localSQLiteException2)
          {
            localSQLiteException2.printStackTrace();
          }
        }
      }
    }
    
    private void upload()
    {
      logger.info("upload");
      SystemUtils.throwIfUiThread();
      Object localObject = ReceiptProvider.getInstance(mContext);
      Cursor localCursor = ((ReceiptProvider)localObject).getReceipts();
      if (localCursor != null)
      {
        Collection localCollection = uploadReceipts(localCursor);
        IOUtils.closeSilently(localCursor);
        handleResults(localCollection, (ReceiptProvider)localObject);
      }
      localObject = ((ReceiptProvider)localObject).getAccountContent();
      if (localObject != null)
      {
        uploadAccountContent((Cursor)localObject);
        IOUtils.closeSilently((Cursor)localObject);
      }
    }
    
    private Collection<ReceiptManager.Status> uploadAccountContent(Cursor paramCursor)
    {
      logger.info("uploadContent: {cursor.size: %d}", new Object[] { Integer.valueOf(paramCursor.getCount()) });
      ArrayList localArrayList = new ArrayList();
      int j = 0;
      long l;
      Object localObject;
      int i;
      int k;
      if (paramCursor.moveToNext())
      {
        l = paramCursor.getLong(paramCursor.getColumnIndex("r_id"));
        localObject = paramCursor.getBlob(paramCursor.getColumnIndex("r_json"));
        i = paramCursor.getInt(paramCursor.getColumnIndex("r_item_type"));
        k = ReceiptUtils.clamp(paramCursor.getInt(paramCursor.getColumnIndex("r_fail_count")), 0, 255);
        localObject = new String((byte[])localObject, Charset.forName("UTF-8"));
        logger.log("trying to upload content: %d {type: %d, fails count: %d}", new Object[] { Long.valueOf(l), Integer.valueOf(i), Integer.valueOf(k) });
        if (!mEndpointInfo.signatureRequired) {
          break label289;
        }
        String str1 = CredentialsUtils.getApiKey(mContext);
        String str2 = CredentialsUtils.getApiSecret(mContext);
        if (!ReceiptUtils.upload(mContext, mEndpointInfo.uriContent, (String)localObject, str1, str2)) {
          break label261;
        }
        i = 200;
      }
      for (;;)
      {
        localArrayList.add(new ReceiptManager.Status(l, i, k));
        i = j + 1;
        j = i;
        if (i < 20) {
          break;
        }
        return localArrayList;
        label261:
        i = 404;
        logger.error("Failed to send the content: %s", new Object[] { localObject });
        continue;
        label289:
        if (ReceiptUtils.upload(mContext, mEndpointInfo.uriContent, (String)localObject))
        {
          i = 200;
        }
        else
        {
          i = 404;
          logger.error("Failed to send the content: %s", new Object[] { localObject });
        }
      }
    }
    
    private Collection<ReceiptManager.Status> uploadReceipts(Cursor paramCursor)
    {
      logger.info("uploadReceipts: {cursor.size: %d}", new Object[] { Integer.valueOf(paramCursor.getCount()) });
      ArrayList localArrayList = new ArrayList();
      int j = 0;
      long l;
      Object localObject1;
      int i;
      int k;
      String str1;
      Object localObject2;
      if (paramCursor.moveToNext())
      {
        l = paramCursor.getLong(paramCursor.getColumnIndex("r_id"));
        localObject1 = paramCursor.getBlob(paramCursor.getColumnIndex("r_json"));
        i = paramCursor.getInt(paramCursor.getColumnIndex("r_item_type"));
        k = ReceiptUtils.clamp(paramCursor.getInt(paramCursor.getColumnIndex("r_fail_count")), 0, 255);
        str1 = new String((byte[])localObject1, Charset.forName("UTF-8"));
        logger.log("trying to upload ticket: %d {type: %d, fails count: %d}", new Object[] { Long.valueOf(l), Integer.valueOf(i), Integer.valueOf(k) });
        if (!mEndpointInfo.signatureRequired) {
          break label316;
        }
        localObject2 = CredentialsUtils.getApiKey(mContext);
        String str2 = CredentialsUtils.getApiSecret(mContext);
        Context localContext = mContext;
        if (i != 1) {
          break label276;
        }
        localObject1 = mEndpointInfo.uriFree;
        label221:
        if (!ReceiptUtils.upload(localContext, (String)localObject1, str1, (String)localObject2, str2)) {
          break label288;
        }
        i = 200;
      }
      for (;;)
      {
        localArrayList.add(new ReceiptManager.Status(l, i, k));
        i = j + 1;
        j = i;
        if (i < 20) {
          break;
        }
        return localArrayList;
        label276:
        localObject1 = mEndpointInfo.uriPaid;
        break label221;
        label288:
        i = 404;
        logger.error("Failed to send the ticket: %s", new Object[] { str1 });
        continue;
        label316:
        localObject2 = mContext;
        if (i == 1) {}
        for (localObject1 = mEndpointInfo.uriFree;; localObject1 = mEndpointInfo.uriPaid)
        {
          if (!ReceiptUtils.upload((Context)localObject2, (String)localObject1, str1)) {
            break label367;
          }
          i = 200;
          break;
        }
        label367:
        i = 404;
        logger.error("Failed to send the ticket: %s", new Object[] { str1 });
      }
    }
    
    public void handleMessage(Message paramMessage)
    {
      logger.info("handleMessage: %d", new Object[] { Integer.valueOf(what) });
      for (;;)
      {
        try
        {
          switch (what)
          {
          case 1: 
            logger.warn("not handled");
            return;
          }
        }
        catch (Exception paramMessage)
        {
          paramMessage.printStackTrace();
          logger.error(paramMessage.getMessage());
          return;
        }
        upload();
        return;
      }
    }
  }
}
