.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$MessageDownloader;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
.source "CdsDownloaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MessageDownloader"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;-><init>()V

    return-void
.end method


# virtual methods
.method public download(Landroid/content/Context;JZ)Ljava/lang/String;
    .registers 27
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "messageId"    # J
    .param p4, "notify"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 111
    const-string v2, "null context"

    move-object/from16 v0, p1

    invoke-static {v2, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 113
    invoke-static/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getManifestVersion(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;

    move-result-object v13

    .line 114
    .local v13, "manifest":Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    const-string v2, "null manifest"

    invoke-static {v2, v13}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 116
    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v8

    .line 117
    .local v8, "baseUrl":Ljava/lang/String;
    const-string v2, "null baseUrl"

    invoke-static {v2, v8}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 119
    const/4 v14, 0x0

    .line 120
    .local v14, "message":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    const/4 v15, 0x0

    .line 122
    .local v15, "messageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "message/id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/content"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 123
    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "msg_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "msg_identifier"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "msg_type"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "msgcnt_id"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "msgcnt_messageId"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-string v6, "msgcnt_contentURL"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 122
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 128
    .local v9, "cursor":Landroid/database/Cursor;
    if-eqz v9, :cond_7b

    .line 130
    :try_start_6a
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_78

    .line 131
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;

    move-result-object v14

    .line 132
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;
    :try_end_77
    .catchall {:try_start_6a .. :try_end_77} :catchall_160

    move-result-object v15

    .line 135
    :cond_78
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 139
    :cond_7b
    const-string v2, "message is null"

    invoke-static {v2, v14}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 140
    const-string v2, "messageContent is null"

    invoke-static {v2, v15}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 142
    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getContentURL()Ljava/lang/String;

    move-result-object v19

    .line 143
    .local v19, "url":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b6

    .line 144
    const-string v2, "http://"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b6

    const-string v2, "https://"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b6

    .line 145
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 153
    :cond_b6
    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v12

    .line 155
    .local v12, "identifier":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$MessageDownloader;->getCacheDirName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->getCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 156
    .local v10, "destDir":Ljava/io/File;
    const-string v2, "destination directory is null"

    invoke-static {v2, v10}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 157
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v10, v2, v3}, Ljava/io/File;->setReadable(ZZ)Z

    .line 159
    new-instance v11, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v11, v10, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 161
    .local v11, "destFile":Ljava/io/File;
    const/4 v2, 0x0

    move-object/from16 v0, v19

    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->download(Ljava/lang/String;Ljava/util/List;)Ljava/io/ByteArrayInputStream;

    move-result-object v18

    .line 163
    .local v18, "stream":Ljava/io/InputStream;
    new-instance v16, Ljava/io/FileOutputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 164
    .local v16, "outputStream":Ljava/io/OutputStream;
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 166
    invoke-static/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 167
    invoke-static/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 169
    new-instance v20, Landroid/content/ContentValues;

    invoke-direct/range {v20 .. v20}, Landroid/content/ContentValues;-><init>()V

    .line 170
    .local v20, "values":Landroid/content/ContentValues;
    const-string v2, "msgcnt_contentPath"

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "message/id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 178
    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/content/id/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageContentColumn$MessageContentCursorWrapper;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/update"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 177
    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 176
    move-object/from16 v0, v20

    invoke-virtual {v2, v3, v0, v4, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v17

    .line 182
    .local v17, "result":I
    const-string v3, "failed to update the provider"

    if-lez v17, :cond_165

    const/4 v2, 0x1

    :goto_153
    invoke-static {v3, v2}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 184
    if-eqz p4, :cond_15b

    .line 185
    invoke-static/range {p1 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyMessageContentUpdate(Landroid/content/Context;J)V

    .line 188
    :cond_15b
    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 135
    .end local v10    # "destDir":Ljava/io/File;
    .end local v11    # "destFile":Ljava/io/File;
    .end local v12    # "identifier":Ljava/lang/String;
    .end local v16    # "outputStream":Ljava/io/OutputStream;
    .end local v17    # "result":I
    .end local v18    # "stream":Ljava/io/InputStream;
    .end local v19    # "url":Ljava/lang/String;
    .end local v20    # "values":Landroid/content/ContentValues;
    :catchall_160
    move-exception v2

    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v2

    .line 182
    .restart local v10    # "destDir":Ljava/io/File;
    .restart local v11    # "destFile":Ljava/io/File;
    .restart local v12    # "identifier":Ljava/lang/String;
    .restart local v16    # "outputStream":Ljava/io/OutputStream;
    .restart local v17    # "result":I
    .restart local v18    # "stream":Ljava/io/InputStream;
    .restart local v19    # "url":Ljava/lang/String;
    .restart local v20    # "values":Landroid/content/ContentValues;
    :cond_165
    const/4 v2, 0x0

    goto :goto_153
.end method

.method protected getCacheDirName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 192
    const-string v0, "aviary-cds-message-image-cache"

    return-object v0
.end method
