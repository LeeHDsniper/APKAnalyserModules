.class Lcom/adobe/creativesdk/aviary/internal/services/MessageService$2;
.super Ljava/lang/Object;
.source "MessageService.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->downloadNextMessage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job",
        "<",
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/services/MessageService;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/services/MessageService;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 208
    check-cast p2, [Landroid/content/Context;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$2;->run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Landroid/content/Context;)Ljava/lang/String;
    .registers 17
    .param p2, "params"    # [Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker",
            "<",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ">;[",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 212
    .local p1, "worker":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<Landroid/content/Context;Ljava/lang/String;>;"
    const/4 v0, 0x0

    aget-object v7, p2, v0

    .line 213
    .local v7, "context":Landroid/content/Context;
    if-nez v7, :cond_7

    .line 214
    const/4 v0, 0x0

    .line 261
    :goto_6
    return-object v0

    .line 218
    :cond_7
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "message/future/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->LAUNCH:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    .line 220
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 219
    invoke-static {v7, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 218
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 224
    .local v8, "cursor":Landroid/database/Cursor;
    const/4 v13, 0x0

    .line 226
    .local v13, "nextMessage":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    if-eqz v8, :cond_53

    .line 228
    :cond_39
    :try_start_39
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_50

    .line 229
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;

    move-result-object v12

    .line 230
    .local v12, "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    if-eqz v12, :cond_39

    .line 231
    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentPath()Ljava/lang/String;

    move-result-object v6

    .line 232
    .local v6, "contentPath":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_4c
    .catchall {:try_start_39 .. :try_end_4c} :catchall_86

    move-result v0

    if-eqz v0, :cond_79

    .line 233
    move-object v13, v12

    .line 245
    .end local v6    # "contentPath":Ljava/lang/String;
    .end local v12    # "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    :cond_50
    :goto_50
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 249
    :cond_53
    if-eqz v13, :cond_8f

    .line 250
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->MESSAGE:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    .line 251
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    move-result-object v9

    .line 253
    .local v9, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    if-eqz v9, :cond_8f

    .line 254
    :try_start_5d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "downloading message... %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentIdentifier()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 255
    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getMessageId()J

    move-result-wide v0

    invoke-virtual {v9, v7, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;J)Ljava/lang/String;
    :try_end_77
    .catch Ljava/lang/Throwable; {:try_start_5d .. :try_end_77} :catch_8b

    move-result-object v0

    goto :goto_6

    .line 236
    .end local v9    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    .restart local v6    # "contentPath":Ljava/lang/String;
    .restart local v12    # "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    :cond_79
    :try_start_79
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 237
    .local v11, "file":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->exists()Z
    :try_end_81
    .catchall {:try_start_79 .. :try_end_81} :catchall_86

    move-result v0

    if-nez v0, :cond_39

    .line 238
    move-object v13, v12

    .line 239
    goto :goto_50

    .line 245
    .end local v6    # "contentPath":Ljava/lang/String;
    .end local v11    # "file":Ljava/io/File;
    .end local v12    # "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    :catchall_86
    move-exception v0

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0

    .line 257
    .restart local v9    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    :catch_8b
    move-exception v10

    .line 258
    .local v10, "e":Ljava/lang/Throwable;
    invoke-virtual {v10}, Ljava/lang/Throwable;->printStackTrace()V

    .line 261
    .end local v9    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    .end local v10    # "e":Ljava/lang/Throwable;
    :cond_8f
    const/4 v0, 0x0

    goto/16 :goto_6
.end method
