.class final Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;
.super Landroid/os/Handler;
.source "ReceiptManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Dispatcher"
.end annotation


# instance fields
.field logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private mContext:Landroid/content/Context;

.field private final mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

.field private mUploadHandler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "looper"    # Landroid/os/Looper;
    .param p3, "info"    # Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    .prologue
    .line 106
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 94
    const-string v0, "ReceiptDispatcher"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 107
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    .line 108
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    .line 109
    return-void
.end method

.method private addTicket(Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;)V
    .registers 12
    .param p1, "ticket"    # Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 156
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->toJSON(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    .line 160
    .local v0, "json":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-boolean v3, v3, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->signatureRequired:Z

    if-eqz v3, :cond_4f

    .line 161
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiSecret(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 164
    .local v2, "secret":Ljava/lang/String;
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    iget-boolean v3, p1, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->isFree:Z

    if-eqz v3, :cond_4a

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriFree:Ljava/lang/String;

    .line 165
    :goto_24
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    .line 164
    invoke-static {v6, v3, v7, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_49

    .line 168
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    move-result-object v3

    iget-boolean v6, p1, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->isFree:Z

    invoke-virtual {v3, v0, v6}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->addTicket(Lorg/json/JSONObject;Z)J

    move-result-wide v4

    .line 169
    .local v4, "ticketId":J
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "added ticket with id: %d"

    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-interface {v3, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 179
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "secret":Ljava/lang/String;
    .end local v4    # "ticketId":J
    :cond_49
    :goto_49
    return-void

    .line 164
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v2    # "secret":Ljava/lang/String;
    :cond_4a
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriPaid:Ljava/lang/String;

    goto :goto_24

    .line 172
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "secret":Ljava/lang/String;
    :cond_4f
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    iget-boolean v3, p1, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->isFree:Z

    if-eqz v3, :cond_7f

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriFree:Ljava/lang/String;

    .line 173
    :goto_59
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    .line 172
    invoke-static {v6, v3, v7}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_49

    .line 175
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    move-result-object v3

    iget-boolean v6, p1, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;->isFree:Z

    invoke-virtual {v3, v0, v6}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->addTicket(Lorg/json/JSONObject;Z)J

    move-result-wide v4

    .line 176
    .restart local v4    # "ticketId":J
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "added ticket with id: %d"

    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-interface {v3, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_49

    .line 172
    .end local v4    # "ticketId":J
    :cond_7f
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriPaid:Ljava/lang/String;

    goto :goto_59
.end method

.method private close()V
    .registers 1

    .prologue
    .line 241
    return-void
.end method

.method private init()V
    .registers 5

    .prologue
    .line 231
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "init"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 232
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->S_UPLOAD_HANDLER_THREAD:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mUploadHandler:Landroid/os/Handler;

    .line 233
    return-void
.end method

.method private open()V
    .registers 1

    .prologue
    .line 237
    return-void
.end method

.method private sendContent(Ljava/lang/String;)V
    .registers 15
    .param p1, "userId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 182
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "sendContent"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 184
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 188
    .local v6, "bundleId":Ljava/lang/String;
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 189
    .local v10, "jsonRootObject":Lorg/json/JSONObject;
    const-string v0, "adobeId"

    invoke-virtual {v10, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 190
    const-string v0, "applicationId"

    invoke-virtual {v10, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 191
    const-string v0, "isProduction"

    const/4 v1, 0x1

    invoke-virtual {v10, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 193
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 195
    .local v9, "jsonArray":Lorg/json/JSONArray;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    const-string v2, "pack/content/installed/list"

    .line 196
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "pack_identifier"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 195
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 201
    .local v7, "cursor":Landroid/database/Cursor;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "cursor.size: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 203
    if-eqz v7, :cond_82

    .line 204
    :goto_5e
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_7a

    .line 205
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 206
    .local v8, "identifier":Ljava/lang/String;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "adding: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v8, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 207
    invoke-virtual {v9, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_5e

    .line 210
    .end local v8    # "identifier":Ljava/lang/String;
    :cond_7a
    const-string v0, "content"

    invoke-virtual {v10, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 211
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 214
    :cond_82
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->signatureRequired:Z

    if-eqz v0, :cond_b8

    .line 215
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    .line 216
    .local v11, "key":Ljava/lang/String;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiSecret(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    .line 218
    .local v12, "secret":Ljava/lang/String;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriContent:Ljava/lang/String;

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, v11, v12}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b7

    .line 219
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "upload failed, adding content to the database..."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 220
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    move-result-object v0

    invoke-virtual {v0, v10}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->addContent(Lorg/json/JSONObject;)J

    .line 228
    .end local v11    # "key":Ljava/lang/String;
    .end local v12    # "secret":Ljava/lang/String;
    :cond_b7
    :goto_b7
    return-void

    .line 223
    :cond_b8
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriContent:Ljava/lang/String;

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b7

    .line 224
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "upload failed, adding content to the database..."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 225
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    move-result-object v0

    invoke-virtual {v0, v10}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->addContent(Lorg/json/JSONObject;)J

    goto :goto_b7
.end method

.method private upload()V
    .registers 3

    .prologue
    .line 244
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "upload"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 245
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->mUploadHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 246
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 113
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "handleMessage: %d"

    new-array v3, v3, [Ljava/lang/Object;

    iget v4, p1, Landroid/os/Message;->what:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 115
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 118
    :try_start_16
    iget v1, p1, Landroid/os/Message;->what:I

    sparse-switch v1, :sswitch_data_5e

    .line 145
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "didn\'t handle message: %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 153
    :goto_2e
    return-void

    .line 121
    :sswitch_2f
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->init()V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_32} :catch_33

    goto :goto_2e

    .line 149
    :catch_33
    move-exception v0

    .line 150
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 151
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_2e

    .line 125
    .end local v0    # "e":Ljava/lang/Exception;
    :sswitch_41
    :try_start_41
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->open()V

    goto :goto_2e

    .line 129
    :sswitch_45
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->close()V

    goto :goto_2e

    .line 133
    :sswitch_49
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->upload()V

    goto :goto_2e

    .line 137
    :sswitch_4d
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->addTicket(Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;)V

    goto :goto_2e

    .line 141
    :sswitch_55
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->sendContent(Ljava/lang/String;)V
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_5c} :catch_33

    goto :goto_2e

    .line 118
    nop

    :sswitch_data_5e
    .sparse-switch
        0x1 -> :sswitch_2f
        0x2 -> :sswitch_41
        0x3 -> :sswitch_45
        0x4 -> :sswitch_49
        0x64 -> :sswitch_4d
        0x65 -> :sswitch_55
    .end sparse-switch
.end method
