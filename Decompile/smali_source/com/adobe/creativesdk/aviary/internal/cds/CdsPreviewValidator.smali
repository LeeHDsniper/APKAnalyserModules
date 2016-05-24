.class final Lcom/adobe/creativesdk/aviary/internal/cds/CdsPreviewValidator;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
.source "CdsPreviewValidator.java"


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V
    .registers 2
    .param p1, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    .line 17
    return-void
.end method


# virtual methods
.method public validate(Landroid/content/Context;JLjava/io/File;Z)Z
    .registers 20
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "packId"    # J
    .param p4, "dir"    # Ljava/io/File;
    .param p5, "isZipFile"    # Z

    .prologue
    .line 21
    const-string v2, "input dir is null"

    move-object/from16 v0, p4

    invoke-static {v2, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    const-string v2, "context is null"

    invoke-static {v2, p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

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

    .line 25
    invoke-static {p1, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

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

    .line 24
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 28
    .local v8, "cursor":Landroid/database/Cursor;
    const-string v2, "cursor is null"

    invoke-static {v2, v8}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsPreviewValidator;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds;->getPreviewItemExt(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Ljava/lang/String;

    move-result-object v12

    .line 32
    .local v12, "previewItemExt":Ljava/lang/String;
    if-eqz v8, :cond_c5

    .line 34
    :try_start_50
    const-string v2, "item_identifier"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 35
    .local v11, "index":I
    const-string v3, "index column < 0"

    const/4 v2, -0x1

    if-le v11, v2, :cond_bc

    const/4 v2, 0x1

    :goto_5c
    invoke-static {v3, v2}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 36
    const-string v3, "cursor is empty"

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_be

    const/4 v2, 0x1

    :goto_68
    invoke-static {v3, v2}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 38
    :goto_6b
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_c0

    .line 39
    invoke-interface {v8, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 40
    .local v10, "identifier":Ljava/lang/String;
    const-string v2, "identifier is null"

    invoke-static {v2, v10}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 42
    new-instance v9, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-direct {v9, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 44
    .local v9, "file":Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' does not exists"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v3

    invoke-static {v2, v3}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V
    :try_end_b6
    .catchall {:try_start_50 .. :try_end_b6} :catchall_b7

    goto :goto_6b

    .line 48
    .end local v9    # "file":Ljava/io/File;
    .end local v10    # "identifier":Ljava/lang/String;
    .end local v11    # "index":I
    :catchall_b7
    move-exception v2

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v2

    .line 35
    .restart local v11    # "index":I
    :cond_bc
    const/4 v2, 0x0

    goto :goto_5c

    .line 36
    :cond_be
    const/4 v2, 0x0

    goto :goto_68

    .line 46
    :cond_c0
    const/4 v2, 0x1

    .line 48
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 51
    .end local v11    # "index":I
    :goto_c4
    return v2

    :cond_c5
    const/4 v2, 0x0

    goto :goto_c4
.end method
