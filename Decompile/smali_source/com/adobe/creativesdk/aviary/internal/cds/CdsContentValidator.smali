.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
.source "CdsContentValidator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$FrameValidator;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$OverlayValidator;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$StickerValidator;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$EffectValidator;,
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;
    }
.end annotation


# instance fields
.field mInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V
    .registers 4
    .param p1, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    .line 25
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_32

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->mInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;

    .line 46
    :goto_11
    return-void

    .line 27
    :pswitch_12
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$FrameValidator;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$FrameValidator;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->mInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;

    goto :goto_11

    .line 31
    :pswitch_1a
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$EffectValidator;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$EffectValidator;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->mInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;

    goto :goto_11

    .line 35
    :pswitch_22
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$StickerValidator;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$StickerValidator;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->mInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;

    goto :goto_11

    .line 39
    :pswitch_2a
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$OverlayValidator;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$OverlayValidator;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->mInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;

    goto :goto_11

    .line 25
    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_12
        :pswitch_1a
        :pswitch_22
        :pswitch_2a
    .end packed-switch
.end method


# virtual methods
.method public validate(Landroid/content/Context;JLjava/io/File;Z)Z
    .registers 22
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "dir"    # Ljava/io/File;
    .param p5, "isZipFile"    # Z

    .prologue
    .line 50
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "validate: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 52
    const/4 v13, 0x0

    .line 53
    .local v13, "zip":Ljava/util/zip/ZipFile;
    const/4 v9, 0x0

    .line 55
    .local v9, "files":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p5, :cond_de

    .line 57
    :try_start_2e
    new-instance v14, Ljava/util/zip/ZipFile;

    move-object/from16 v0, p4

    invoke-direct {v14, v0}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_35
    .catch Ljava/util/zip/ZipException; {:try_start_2e .. :try_end_35} :catch_d2
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_35} :catch_d8

    .end local v13    # "zip":Ljava/util/zip/ZipFile;
    .local v14, "zip":Ljava/util/zip/ZipFile;
    move-object v13, v14

    .line 69
    .end local v14    # "zip":Ljava/util/zip/ZipFile;
    .restart local v13    # "zip":Ljava/util/zip/ZipFile;
    :goto_36
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pack/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p2

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/item/list"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 70
    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "item_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "item_identifier"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 69
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 76
    .local v12, "itemsCursor":Landroid/database/Cursor;
    const-string v2, "cannot fetch list of items"

    invoke-static {v2, v12}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 78
    if-eqz v12, :cond_11d

    .line 80
    :try_start_76
    const-string v2, "item_identifier"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 81
    .local v11, "index":I
    const-string v3, "unable to find identifier column index"

    const/4 v2, -0x1

    if-le v11, v2, :cond_e8

    const/4 v2, 0x1

    :goto_82
    invoke-static {v3, v2}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 82
    const-string v3, "item cursor has \'0\' rows"

    invoke-interface {v12}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_ea

    const/4 v2, 0x1

    :goto_8e
    invoke-static {v3, v2}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 84
    :cond_91
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_10d

    .line 85
    invoke-interface {v12, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 86
    .local v10, "identifier":Ljava/lang/String;
    const-string v2, "identifier is null"

    invoke-static {v2, v10}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "checking.. %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v10, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    if-eqz p5, :cond_ec

    .line 90
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->mInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;

    invoke-virtual {v2, v10, v13}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;->validateItem(Ljava/lang/String;Ljava/util/zip/ZipFile;)Z

    move-result v2

    if-nez v2, :cond_91

    .line 91
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "failed to validate %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v10, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_ca
    .catchall {:try_start_76 .. :try_end_ca} :catchall_115

    .line 92
    const/4 v2, 0x0

    .line 103
    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 104
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/util/zip/ZipFile;)V

    .line 107
    .end local v10    # "identifier":Ljava/lang/String;
    .end local v11    # "index":I
    .end local v12    # "itemsCursor":Landroid/database/Cursor;
    :goto_d1
    return v2

    .line 58
    :catch_d2
    move-exception v8

    .line 59
    .local v8, "e1":Ljava/util/zip/ZipException;
    invoke-virtual {v8}, Ljava/util/zip/ZipException;->printStackTrace()V

    .line 60
    const/4 v2, 0x0

    goto :goto_d1

    .line 61
    .end local v8    # "e1":Ljava/util/zip/ZipException;
    :catch_d8
    move-exception v8

    .line 62
    .local v8, "e1":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    .line 63
    const/4 v2, 0x0

    goto :goto_d1

    .line 66
    .end local v8    # "e1":Ljava/io/IOException;
    :cond_de
    invoke-virtual/range {p4 .. p4}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    goto/16 :goto_36

    .line 81
    .restart local v11    # "index":I
    .restart local v12    # "itemsCursor":Landroid/database/Cursor;
    :cond_e8
    const/4 v2, 0x0

    goto :goto_82

    .line 82
    :cond_ea
    const/4 v2, 0x0

    goto :goto_8e

    .line 95
    .restart local v10    # "identifier":Ljava/lang/String;
    :cond_ec
    :try_start_ec
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->mInstance:Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;

    invoke-virtual {v2, v10, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;->validateItem(Ljava/lang/String;Ljava/util/List;)Z

    move-result v2

    if-nez v2, :cond_91

    .line 96
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "failed to validate %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v10, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_105
    .catchall {:try_start_ec .. :try_end_105} :catchall_115

    .line 97
    const/4 v2, 0x0

    .line 103
    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 104
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/util/zip/ZipFile;)V

    goto :goto_d1

    .line 101
    .end local v10    # "identifier":Ljava/lang/String;
    :cond_10d
    const/4 v2, 0x1

    .line 103
    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 104
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/util/zip/ZipFile;)V

    goto :goto_d1

    .line 103
    .end local v11    # "index":I
    :catchall_115
    move-exception v2

    invoke-static {v12}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 104
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/util/zip/ZipFile;)V

    throw v2

    .line 107
    :cond_11d
    const/4 v2, 0x0

    goto :goto_d1
.end method
