.class public Lcom/adobe/creativesdk/aviary/internal/services/MessageService;
.super Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
.source "MessageService.java"


# instance fields
.field private mDownloadInProgress:Z

.field private mEnabled:Z

.field private final mFutureListener:Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 3
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    .line 32
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/services/MessageService;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->mFutureListener:Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/services/MessageService;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->handleActiveMessage()Z

    move-result v0

    return v0
.end method

.method private downloadNextMessage()V
    .registers 7

    .prologue
    .line 198
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "downloadNextMessage"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 200
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    if-nez v1, :cond_e

    .line 265
    :cond_d
    :goto_d
    return-void

    .line 204
    :cond_e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/ThreadPoolService;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/ThreadPoolService;

    .line 206
    .local v0, "threadService":Lcom/adobe/creativesdk/aviary/internal/services/ThreadPoolService;
    if-eqz v0, :cond_d

    .line 207
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/services/MessageService;)V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->mFutureListener:Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;

    const/4 v3, 0x1

    new-array v3, v3, [Landroid/content/Context;

    const/4 v4, 0x0

    .line 263
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    aput-object v5, v3, v4

    .line 207
    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/ThreadPoolService;->submit(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)Lcom/adobe/creativesdk/aviary/internal/threading/Future;

    goto :goto_d
.end method

.method private getBaseContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 50
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 52
    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private handleActiveMessage()Z
    .registers 16

    .prologue
    .line 100
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "handleActiveMessage"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 102
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getBaseContext()Landroid/content/Context;

    move-result-object v9

    .line 104
    .local v9, "context":Landroid/content/Context;
    if-nez v9, :cond_16

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "context is null"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 106
    const/4 v0, 0x0

    .line 168
    :goto_15
    return v0

    .line 109
    :cond_16
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->mEnabled:Z

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->isActive()Z

    move-result v0

    if-nez v0, :cond_40

    .line 110
    :cond_20
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "enabled: %b, active: %b"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->mEnabled:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->isActive()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 111
    const/4 v0, 0x0

    goto :goto_15

    .line 114
    :cond_40
    const/4 v13, 0x0

    .line 117
    .local v13, "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    invoke-virtual {v9}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "message/future/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->LAUNCH:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;

    .line 119
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 117
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 122
    .local v10, "cursor":Landroid/database/Cursor;
    if-eqz v10, :cond_7f

    .line 124
    :try_start_72
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_7c

    .line 125
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    :try_end_7b
    .catchall {:try_start_72 .. :try_end_7b} :catchall_fb

    move-result-object v13

    .line 128
    :cond_7c
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 132
    :cond_7f
    if-eqz v13, :cond_10a

    .line 133
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "found active message: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentIdentifier()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 134
    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentPath()Ljava/lang/String;

    move-result-object v8

    .line 135
    .local v8, "contentPath":Ljava/lang/String;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "content path: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v8, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 137
    if-eqz v8, :cond_107

    .line 138
    new-instance v12, Ljava/io/File;

    invoke-direct {v12, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 139
    .local v12, "file":Ljava/io/File;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "file exists: %b"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 141
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_107

    .line 142
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v11, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 146
    .local v11, "densityDpi":I
    new-instance v14, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v14}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 147
    .local v14, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v0, 0x1

    iput-boolean v0, v14, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 148
    iput v11, v14, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    .line 149
    const/16 v0, 0xf0

    iput v0, v14, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    .line 150
    const/4 v0, 0x1

    iput-boolean v0, v14, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 151
    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v14}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 153
    iget v7, v14, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 154
    .local v7, "bitmapWidth":I
    iget v6, v14, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 156
    .local v6, "bitmapHeight":I
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_100

    .line 157
    invoke-direct {p0, v13, v7, v6}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->showMessage(Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;II)V

    .line 158
    const/4 v0, 0x1

    goto/16 :goto_15

    .line 128
    .end local v6    # "bitmapHeight":I
    .end local v7    # "bitmapWidth":I
    .end local v8    # "contentPath":Ljava/lang/String;
    .end local v11    # "densityDpi":I
    .end local v12    # "file":Ljava/io/File;
    .end local v14    # "options":Landroid/graphics/BitmapFactory$Options;
    :catchall_fb
    move-exception v0

    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0

    .line 160
    .restart local v6    # "bitmapHeight":I
    .restart local v7    # "bitmapWidth":I
    .restart local v8    # "contentPath":Ljava/lang/String;
    .restart local v11    # "densityDpi":I
    .restart local v12    # "file":Ljava/io/File;
    .restart local v14    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_100
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "file doesn\'t exist!"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 168
    .end local v6    # "bitmapHeight":I
    .end local v7    # "bitmapWidth":I
    .end local v8    # "contentPath":Ljava/lang/String;
    .end local v11    # "densityDpi":I
    .end local v12    # "file":Ljava/io/File;
    .end local v14    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_107
    :goto_107
    const/4 v0, 0x0

    goto/16 :goto_15

    .line 165
    :cond_10a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "no active messages"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_107
.end method

.method private showMessage(Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;II)V
    .registers 10
    .param p1, "messageContent"    # Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    .param p2, "bitmapWidth"    # I
    .param p3, "bitmapHeight"    # I

    .prologue
    .line 69
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "showMessage: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 70
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "bitmap size: %dx%d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 72
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 73
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "android.intent.extra.TITLE"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getParagraph()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    const-string v1, "uri"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    const-string v1, "header_file"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    const-string v1, "action_button"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getActionButtonText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    const-string v1, "dismiss_button"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getDismissButtonText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    const-string v1, "layout_style"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getLayoutStyle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    const-string v1, "show_new_banner"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->isShowNewBanner()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 81
    const-string v1, "message_id"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getMessageId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 82
    const-string v1, "message_content_id"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 83
    const-string v1, "message_bitmap_width"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 84
    const-string v1, "message_bitmap_height"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 86
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "need to dispatch the message!!!!"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 88
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->mEnabled:Z

    if-eqz v1, :cond_c0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    if-eqz v1, :cond_c0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->isActive()Z

    move-result v1

    if-eqz v1, :cond_c0

    .line 89
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/events/MessageReceivedEvent;

    invoke-direct {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/events/MessageReceivedEvent;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {v1, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 91
    :cond_c0
    return-void
.end method

.method private showNextMessage()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 172
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "showNextMessage"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 174
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 175
    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->isActive()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 176
    :cond_14
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "context is null or not active"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 195
    :cond_1b
    :goto_1b
    return-void

    .line 180
    :cond_1c
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v1

    const-string v2, "aviary.messages.enabled"

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_30

    .line 181
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "messages disabled by user, skipping"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    goto :goto_1b

    .line 186
    :cond_30
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->handleActiveMessage()Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 187
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "handleActiveMessage is handling the message. stopping"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    goto :goto_1b

    .line 191
    :cond_3e
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->mDownloadInProgress:Z

    if-nez v1, :cond_1b

    .line 192
    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->mDownloadInProgress:Z

    .line 193
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->downloadNextMessage()V

    goto :goto_1b
.end method


# virtual methods
.method public dispose()V
    .registers 3

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "dispose"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->mEnabled:Z

    .line 59
    return-void
.end method

.method public processMessages()V
    .registers 3

    .prologue
    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "processMessages"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->mEnabled:Z

    .line 64
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->showNextMessage()V

    .line 65
    return-void
.end method
