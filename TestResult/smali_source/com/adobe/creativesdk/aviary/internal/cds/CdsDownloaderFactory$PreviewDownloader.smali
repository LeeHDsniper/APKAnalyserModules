.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$PreviewDownloader;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
.source "CdsDownloaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PreviewDownloader"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 196
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;-><init>()V

    return-void
.end method


# virtual methods
.method public download(Landroid/content/Context;JZ)Ljava/lang/String;
    .registers 29
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "notify"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 199
    const-string v3, "null context"

    move-object/from16 v0, p1

    invoke-static {v3, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 201
    invoke-static/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getManifestVersion(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;

    move-result-object v16

    .line 202
    .local v16, "manifest":Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    const-string v3, "null manifest"

    move-object/from16 v0, v16

    invoke-static {v3, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 204
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v8

    .line 205
    .local v8, "baseUrl":Ljava/lang/String;
    const-string v3, "null baseUrl"

    invoke-static {v3, v8}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 207
    const/16 v17, 0x0

    .line 208
    .local v17, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    const/4 v9, 0x0

    .line 210
    .local v9, "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pack/id/"

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

    .line 211
    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v7, "pack_id"

    aput-object v7, v4, v5

    const/4 v5, 0x1

    const-string v7, "pack_identifier"

    aput-object v7, v4, v5

    const/4 v5, 0x2

    const-string v7, "pack_type"

    aput-object v7, v4, v5

    const/4 v5, 0x3

    const-string v7, "content_id"

    aput-object v7, v4, v5

    const/4 v5, 0x4

    const-string v7, "content_packId"

    aput-object v7, v4, v5

    const/4 v5, 0x5

    const-string v7, "content_previewURL"

    aput-object v7, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 210
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 216
    .local v12, "cursor":Landroid/database/Cursor;
    if-eqz v12, :cond_7e

    .line 218
    :try_start_6d
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_7b

    .line 219
    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v17

    .line 220
    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    :try_end_7a
    .catchall {:try_start_6d .. :try_end_7a} :catchall_19a

    move-result-object v9

    .line 223
    :cond_7b
    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 227
    :cond_7e
    const-string v3, "null pack"

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 228
    const-string v3, "null content"

    invoke-static {v3, v9}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 230
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getPreviewURL()Ljava/lang/String;

    move-result-object v22

    .line 231
    .local v22, "url":Ljava/lang/String;
    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c5

    .line 232
    const-string v3, "http://"

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c5

    const-string v3, "https://"

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c5

    const-string v3, "file://"

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c5

    .line 233
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 241
    :cond_c5
    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v15

    .line 242
    .local v15, "identifier":Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v18

    .line 243
    .local v18, "packType":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getId()J

    move-result-wide v10

    .line 245
    .local v10, "contentId":J
    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->hunt(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v14

    .line 247
    .local v14, "downloadStream":Ljava/io/InputStream;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$PreviewDownloader;->getCacheDirName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->getCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v13

    .line 248
    .local v13, "destDir":Ljava/io/File;
    const-string v3, "destination directory is null"

    invoke-static {v3, v13}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 249
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v13, v3, v4}, Ljava/io/File;->setReadable(ZZ)Z

    .line 255
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v13, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 256
    .local v6, "destFolder":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 258
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->createNoMediaFile(Ljava/io/File;)V

    .line 260
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed to create dest folder: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v4

    invoke-static {v3, v4}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 261
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v6, v3, v4}, Ljava/io/File;->setReadable(ZZ)Z

    .line 263
    invoke-static {v14, v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->unzip(Ljava/io/InputStream;Ljava/io/File;)V

    .line 264
    invoke-static {v14}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 266
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v21

    .line 267
    .local v21, "type":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->PREVIEW:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    move-object/from16 v0, v21

    invoke-static {v3, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;

    move-result-object v2

    .line 269
    .local v2, "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    const/4 v7, 0x0

    move-object/from16 v3, p1

    move-wide/from16 v4, p2

    invoke-virtual/range {v2 .. v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;->validate(Landroid/content/Context;JLjava/io/File;Z)Z

    move-result v19

    .line 270
    .local v19, "previewIsValid":Z
    const-string v3, "invalid preview content"

    move/from16 v0, v19

    invoke-static {v3, v0}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 272
    new-instance v23, Landroid/content/ContentValues;

    invoke-direct/range {v23 .. v23}, Landroid/content/ContentValues;-><init>()V

    .line 273
    .local v23, "values":Landroid/content/ContentValues;
    const-string v3, "content_previewPath"

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v23

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pack/id/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p2

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/content/id/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/update"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 281
    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 280
    move-object/from16 v0, v23

    invoke-virtual {v3, v4, v0, v5, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v20

    .line 284
    .local v20, "result":I
    const-string v4, "failed to update the provider"

    if-lez v20, :cond_19f

    const/4 v3, 0x1

    :goto_18d
    invoke-static {v4, v3}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 286
    if-eqz p4, :cond_195

    .line 287
    invoke-static/range {p1 .. p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPackContentUpdate(Landroid/content/Context;J)V

    .line 290
    :cond_195
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 223
    .end local v2    # "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    .end local v6    # "destFolder":Ljava/io/File;
    .end local v10    # "contentId":J
    .end local v13    # "destDir":Ljava/io/File;
    .end local v14    # "downloadStream":Ljava/io/InputStream;
    .end local v15    # "identifier":Ljava/lang/String;
    .end local v18    # "packType":Ljava/lang/String;
    .end local v19    # "previewIsValid":Z
    .end local v20    # "result":I
    .end local v21    # "type":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .end local v22    # "url":Ljava/lang/String;
    .end local v23    # "values":Landroid/content/ContentValues;
    :catchall_19a
    move-exception v3

    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v3

    .line 284
    .restart local v2    # "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    .restart local v6    # "destFolder":Ljava/io/File;
    .restart local v10    # "contentId":J
    .restart local v13    # "destDir":Ljava/io/File;
    .restart local v14    # "downloadStream":Ljava/io/InputStream;
    .restart local v15    # "identifier":Ljava/lang/String;
    .restart local v18    # "packType":Ljava/lang/String;
    .restart local v19    # "previewIsValid":Z
    .restart local v20    # "result":I
    .restart local v21    # "type":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .restart local v22    # "url":Ljava/lang/String;
    .restart local v23    # "values":Landroid/content/ContentValues;
    :cond_19f
    const/4 v3, 0x0

    goto :goto_18d
.end method

.method protected getCacheDirName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 294
    const-string v0, "aviary-cds-preview-image-cache"

    return-object v0
.end method
