.class Lcom/localytics/android/AmpSessionHandler;
.super Lcom/localytics/android/SessionHandler;
.source "AmpSessionHandler.java"


# static fields
.field private static final AMP_RULEEVENTS_SORT_ORDER:Ljava/lang/String;

.field private static final AMP_RULES_SORT_ORDER:Ljava/lang/String;

.field private static final JOINER_ARG_AMP_RULES_COLUMNS:[Ljava/lang/String;

.field private static final PROJECTION_AMP_RULEEVENTS:[Ljava/lang/String;

.field private static final SELECTION_AMP_RULEEVENTS:Ljava/lang/String;

.field private static final SELECTION_AMP_RULES:Ljava/lang/String;


# instance fields
.field private mFragmentManager:Landroid/support/v4/app/FragmentManager;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 54
    const-string v0, "%s > ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "expiration"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/AmpSessionHandler;->SELECTION_AMP_RULES:Ljava/lang/String;

    .line 56
    const-string v0, "%s = ?"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "event_name"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/AmpSessionHandler;->SELECTION_AMP_RULEEVENTS:Ljava/lang/String;

    .line 63
    const-string v0, "CAST(%s AS TEXT)"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "_id"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/AmpSessionHandler;->AMP_RULES_SORT_ORDER:Ljava/lang/String;

    .line 70
    const-string v0, "CAST(%s as TEXT)"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "rule_id_ref"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/AmpSessionHandler;->AMP_RULEEVENTS_SORT_ORDER:Ljava/lang/String;

    .line 75
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/AmpSessionHandler;->JOINER_ARG_AMP_RULES_COLUMNS:[Ljava/lang/String;

    .line 80
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "rule_id_ref"

    aput-object v1, v0, v3

    sput-object v0, Lcom/localytics/android/AmpSessionHandler;->PROJECTION_AMP_RULEEVENTS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "looper"    # Landroid/os/Looper;

    .prologue
    .line 95
    invoke-direct {p0, p1, p2, p3}, Lcom/localytics/android/SessionHandler;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)V

    .line 98
    sget-object v0, Lcom/localytics/android/AmpSessionHandler;->sUploadHandlerThread:Landroid/os/HandlerThread;

    const-class v1, Lcom/localytics/android/AmpUploadHandler;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/HandlerThread;->setName(Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method static synthetic access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpSessionHandler;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/localytics/android/AmpSessionHandler;Ljava/util/Map;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lcom/localytics/android/AmpSessionHandler;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/localytics/android/AmpSessionHandler;->getRemoteFileURL(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/localytics/android/AmpSessionHandler;IZ)Z
    .registers 4
    .param p0, "x0"    # Lcom/localytics/android/AmpSessionHandler;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lcom/localytics/android/AmpSessionHandler;->doesCreativeExist(IZ)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/localytics/android/AmpSessionHandler;Ljava/util/Map;)Z
    .registers 3
    .param p0, "x0"    # Lcom/localytics/android/AmpSessionHandler;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/localytics/android/AmpSessionHandler;->updateDisplayingCandidate(Ljava/util/Map;)Z

    move-result v0

    return v0
.end method

.method private decompressZipFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 18
    .param p1, "zipFileDir"    # Ljava/lang/String;
    .param p2, "unzipFileDir"    # Ljava/lang/String;
    .param p3, "filename"    # Ljava/lang/String;

    .prologue
    .line 1362
    const/4 v8, 0x0

    .line 1365
    .local v8, "zis":Ljava/util/zip/ZipInputStream;
    :try_start_1
    new-instance v9, Ljava/util/zip/ZipInputStream;

    new-instance v10, Ljava/io/FileInputStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-object v12, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v10}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_24} :catch_e1
    .catchall {:try_start_1 .. :try_end_24} :catchall_df

    .line 1367
    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .local v9, "zis":Ljava/util/zip/ZipInputStream;
    const/4 v7, 0x0

    .line 1369
    .local v7, "ze":Ljava/util/zip/ZipEntry;
    const/16 v10, 0x2000

    :try_start_27
    new-array v1, v10, [B

    .line 1371
    .local v1, "buffer":[B
    :cond_29
    :goto_29
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v7

    if-eqz v7, :cond_ac

    .line 1374
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1375
    .local v4, "entryName":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v10

    if-eqz v10, :cond_88

    .line 1377
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1378
    .local v6, "newFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->mkdir()Z

    move-result v10

    if-nez v10, :cond_29

    .line 1380
    sget-boolean v10, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v10, :cond_29

    .line 1382
    const-string v10, "Localytics"

    const-string v11, "Could not create directory %s"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v4, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_72
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_72} :catch_73
    .catchall {:try_start_27 .. :try_end_72} :catchall_9b

    goto :goto_29

    .line 1401
    .end local v1    # "buffer":[B
    .end local v4    # "entryName":Ljava/lang/String;
    .end local v6    # "newFile":Ljava/io/File;
    :catch_73
    move-exception v3

    move-object v8, v9

    .line 1403
    .end local v7    # "ze":Ljava/util/zip/ZipEntry;
    .end local v9    # "zis":Ljava/util/zip/ZipInputStream;
    .local v3, "e":Ljava/io/IOException;
    .restart local v8    # "zis":Ljava/util/zip/ZipInputStream;
    :goto_75
    :try_start_75
    sget-boolean v10, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v10, :cond_80

    .line 1405
    const-string v10, "Localytics"

    const-string v11, "Caught IOException"

    invoke-static {v10, v11, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_80
    .catchall {:try_start_75 .. :try_end_80} :catchall_df

    .line 1407
    :cond_80
    const/4 v10, 0x0

    .line 1413
    if-eqz v8, :cond_87

    .line 1415
    :try_start_83
    invoke-virtual {v8}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_86
    .catch Ljava/io/IOException; {:try_start_83 .. :try_end_86} :catch_c3

    .line 1416
    const/4 v8, 0x0

    .line 1429
    .end local v3    # "e":Ljava/io/IOException;
    :cond_87
    :goto_87
    return v10

    .line 1388
    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v1    # "buffer":[B
    .restart local v4    # "entryName":Ljava/lang/String;
    .restart local v7    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v9    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_88
    :try_start_88
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 1390
    .local v5, "fos":Ljava/io/FileOutputStream;
    const/4 v2, 0x0

    .line 1391
    .local v2, "byteRead":I
    :goto_8e
    const/4 v10, 0x0

    array-length v11, v1

    invoke-virtual {v9, v1, v10, v11}, Ljava/util/zip/ZipInputStream;->read([BII)I

    move-result v2

    if-lez v2, :cond_a4

    .line 1393
    const/4 v10, 0x0

    invoke-virtual {v5, v1, v10, v2}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_9a
    .catch Ljava/io/IOException; {:try_start_88 .. :try_end_9a} :catch_73
    .catchall {:try_start_88 .. :try_end_9a} :catchall_9b

    goto :goto_8e

    .line 1411
    .end local v1    # "buffer":[B
    .end local v2    # "byteRead":I
    .end local v4    # "entryName":Ljava/lang/String;
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    :catchall_9b
    move-exception v10

    move-object v8, v9

    .line 1413
    .end local v7    # "ze":Ljava/util/zip/ZipEntry;
    .end local v9    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v8    # "zis":Ljava/util/zip/ZipInputStream;
    :goto_9d
    if-eqz v8, :cond_a3

    .line 1415
    :try_start_9f
    invoke-virtual {v8}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_a2
    .catch Ljava/io/IOException; {:try_start_9f .. :try_end_a2} :catch_d1

    .line 1416
    const/4 v8, 0x0

    .line 1425
    :cond_a3
    throw v10

    .line 1396
    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v1    # "buffer":[B
    .restart local v2    # "byteRead":I
    .restart local v4    # "entryName":Ljava/lang/String;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v9    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_a4
    :try_start_a4
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 1397
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->closeEntry()V
    :try_end_aa
    .catch Ljava/io/IOException; {:try_start_a4 .. :try_end_aa} :catch_73
    .catchall {:try_start_a4 .. :try_end_aa} :catchall_9b

    goto/16 :goto_29

    .line 1413
    .end local v2    # "byteRead":I
    .end local v4    # "entryName":Ljava/lang/String;
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    :cond_ac
    if-eqz v9, :cond_e3

    .line 1415
    :try_start_ae
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_b1
    .catch Ljava/io/IOException; {:try_start_ae .. :try_end_b1} :catch_b4

    .line 1416
    const/4 v8, 0x0

    .line 1429
    .end local v9    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v8    # "zis":Ljava/util/zip/ZipInputStream;
    :goto_b2
    const/4 v10, 0x1

    goto :goto_87

    .line 1419
    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v9    # "zis":Ljava/util/zip/ZipInputStream;
    :catch_b4
    move-exception v3

    .line 1421
    .restart local v3    # "e":Ljava/io/IOException;
    sget-boolean v10, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v10, :cond_c0

    .line 1423
    const-string v10, "Localytics"

    const-string v11, "Caught IOException"

    invoke-static {v10, v11, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1425
    :cond_c0
    const/4 v10, 0x0

    move-object v8, v9

    .end local v9    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v8    # "zis":Ljava/util/zip/ZipInputStream;
    goto :goto_87

    .line 1419
    .end local v1    # "buffer":[B
    .end local v7    # "ze":Ljava/util/zip/ZipEntry;
    :catch_c3
    move-exception v3

    .line 1421
    sget-boolean v10, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v10, :cond_cf

    .line 1423
    const-string v10, "Localytics"

    const-string v11, "Caught IOException"

    invoke-static {v10, v11, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1425
    :cond_cf
    const/4 v10, 0x0

    goto :goto_87

    .line 1419
    .end local v3    # "e":Ljava/io/IOException;
    :catch_d1
    move-exception v3

    .line 1421
    .restart local v3    # "e":Ljava/io/IOException;
    sget-boolean v10, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v10, :cond_dd

    .line 1423
    const-string v10, "Localytics"

    const-string v11, "Caught IOException"

    invoke-static {v10, v11, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1425
    :cond_dd
    const/4 v10, 0x0

    goto :goto_87

    .line 1411
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_df
    move-exception v10

    goto :goto_9d

    .line 1401
    :catch_e1
    move-exception v3

    goto :goto_75

    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v1    # "buffer":[B
    .restart local v7    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v9    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_e3
    move-object v8, v9

    .end local v9    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v8    # "zis":Ljava/util/zip/ZipInputStream;
    goto :goto_b2
.end method

.method private doesCreativeExist(IZ)Z
    .registers 9
    .param p1, "ruleId"    # I
    .param p2, "isZipped"    # Z

    .prologue
    .line 1311
    if-eqz p2, :cond_37

    .line 1313
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/localytics/android/AmpSessionHandler;->getZipFileDirPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "amp_rule_%d.zip"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1320
    .local v0, "file":Ljava/io/File;
    :goto_32
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    return v1

    .line 1317
    .end local v0    # "file":Ljava/io/File;
    :cond_37
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p1}, Lcom/localytics/android/AmpSessionHandler;->getUnzipFileDirPath(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "index.html"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v0    # "file":Ljava/io/File;
    goto :goto_32
.end method

.method private final getAmpConditionValues(I)Ljava/util/Vector;
    .registers 13
    .param p1, "conditionId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1077
    const/4 v8, 0x0

    .line 1079
    .local v8, "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 1082
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_2
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "amp_condition_values"

    const/4 v2, 0x0

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v10, "condition_id_ref"

    aput-object v10, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_23
    .catchall {:try_start_2 .. :try_end_23} :catchall_48

    move-result-object v6

    move-object v9, v8

    .line 1083
    .end local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v9, "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_25
    :try_start_25
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_41

    .line 1085
    const-string v0, "value"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 1087
    .local v7, "value":Ljava/lang/String;
    if-nez v9, :cond_53

    .line 1089
    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V
    :try_end_3c
    .catchall {:try_start_25 .. :try_end_3c} :catchall_50

    .line 1092
    .end local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_3c
    :try_start_3c
    invoke-virtual {v8, v7}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_3f
    .catchall {:try_start_3c .. :try_end_3f} :catchall_48

    move-object v9, v8

    .line 1093
    .end local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_25

    .line 1097
    .end local v7    # "value":Ljava/lang/String;
    :cond_41
    if-eqz v6, :cond_47

    .line 1099
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1100
    const/4 v6, 0x0

    .line 1104
    :cond_47
    return-object v9

    .line 1097
    .end local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :catchall_48
    move-exception v0

    :goto_49
    if-eqz v6, :cond_4f

    .line 1099
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1100
    const/4 v6, 0x0

    :cond_4f
    throw v0

    .line 1097
    .end local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :catchall_50
    move-exception v0

    move-object v8, v9

    .end local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_49

    .end local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v7    # "value":Ljava/lang/String;
    .restart local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_53
    move-object v8, v9

    .end local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_3c
.end method

.method private getAmpConditions(I)Ljava/util/Vector;
    .registers 17
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Vector",
            "<",
            "Lcom/localytics/android/AmpCondition;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1033
    const/4 v6, 0x0

    .line 1036
    .local v6, "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    const/4 v10, 0x0

    .line 1039
    .local v10, "cursor":Landroid/database/Cursor;
    :try_start_2
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "amp_conditions"

    const/4 v2, 0x0

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v14, "rule_id_ref"

    aput-object v14, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_23
    .catchall {:try_start_2 .. :try_end_23} :catchall_6e

    move-result-object v10

    move-object v7, v6

    .line 1040
    .end local v6    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    .local v7, "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    :goto_25
    :try_start_25
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_67

    .line 1042
    const-string v0, "_id"

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 1043
    .local v9, "conditionId":I
    const-string v0, "attribute_name"

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 1044
    .local v11, "name":Ljava/lang/String;
    const-string v0, "operator"

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 1045
    .local v12, "operator":Ljava/lang/String;
    invoke-direct {p0, v9}, Lcom/localytics/android/AmpSessionHandler;->getAmpConditionValues(I)Ljava/util/Vector;

    move-result-object v13

    .line 1047
    .local v13, "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-nez v7, :cond_79

    .line 1049
    new-instance v6, Ljava/util/Vector;

    invoke-direct {v6}, Ljava/util/Vector;-><init>()V
    :try_end_54
    .catchall {:try_start_25 .. :try_end_54} :catchall_76

    .line 1052
    .end local v7    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    .restart local v6    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    :goto_54
    :try_start_54
    new-instance v8, Lcom/localytics/android/AmpCondition;

    invoke-direct {v8, v11, v12, v13}, Lcom/localytics/android/AmpCondition;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Vector;)V

    .line 1053
    .local v8, "condition":Lcom/localytics/android/AmpCondition;
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/localytics/android/AmpCondition;->setPackageName(Ljava/lang/String;)V

    .line 1054
    invoke-virtual {v6, v8}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_65
    .catchall {:try_start_54 .. :try_end_65} :catchall_6e

    move-object v7, v6

    .line 1055
    .end local v6    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    .restart local v7    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    goto :goto_25

    .line 1059
    .end local v8    # "condition":Lcom/localytics/android/AmpCondition;
    .end local v9    # "conditionId":I
    .end local v11    # "name":Ljava/lang/String;
    .end local v12    # "operator":Ljava/lang/String;
    .end local v13    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_67
    if-eqz v10, :cond_6d

    .line 1061
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1062
    const/4 v10, 0x0

    .line 1066
    :cond_6d
    return-object v7

    .line 1059
    .end local v7    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    .restart local v6    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    :catchall_6e
    move-exception v0

    :goto_6f
    if-eqz v10, :cond_75

    .line 1061
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1062
    const/4 v10, 0x0

    :cond_75
    throw v0

    .line 1059
    .end local v6    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    .restart local v7    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    :catchall_76
    move-exception v0

    move-object v6, v7

    .end local v7    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    .restart local v6    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    goto :goto_6f

    .end local v6    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    .restart local v7    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    .restart local v9    # "conditionId":I
    .restart local v11    # "name":Ljava/lang/String;
    .restart local v12    # "operator":Ljava/lang/String;
    .restart local v13    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_79
    move-object v6, v7

    .end local v7    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    .restart local v6    # "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    goto :goto_54
.end method

.method private getAmpMessageMaps(Ljava/lang/String;)Ljava/util/Vector;
    .registers 17
    .param p1, "eventName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Vector",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 1115
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    .line 1117
    .local v7, "ampMessageMaps":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v14, 0x0

    .line 1118
    .local v14, "rulesCursor":Landroid/database/Cursor;
    const/4 v11, 0x0

    .line 1121
    .local v11, "ruleEventsCursor":Landroid/database/Cursor;
    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    .line 1123
    .local v10, "now":Ljava/lang/String;
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "amp_rules"

    const/4 v2, 0x0

    sget-object v3, Lcom/localytics/android/AmpSessionHandler;->SELECTION_AMP_RULES:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v10, v4, v5

    sget-object v5, Lcom/localytics/android/AmpSessionHandler;->AMP_RULES_SORT_ORDER:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 1125
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "amp_ruleevent"

    const/4 v2, 0x0

    sget-object v3, Lcom/localytics/android/AmpSessionHandler;->SELECTION_AMP_RULEEVENTS:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    sget-object v5, Lcom/localytics/android/AmpSessionHandler;->AMP_RULEEVENTS_SORT_ORDER:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 1127
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_39
    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge v8, v0, :cond_1af

    .line 1129
    invoke-interface {v11, v8}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 1131
    const-string v0, "rule_id_ref"

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 1132
    .local v13, "ruleIdRef":I
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_4d
    invoke-interface {v14}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge v9, v0, :cond_1a8

    .line 1134
    invoke-interface {v14, v9}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 1136
    const-string v0, "_id"

    invoke-interface {v14, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v14, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 1137
    .local v12, "ruleId":I
    if-ne v12, v13, :cond_1a4

    .line 1139
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 1141
    .local v6, "ampMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "_id"

    const-string v1, "_id"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1142
    const-string v0, "campaign_id"

    const-string v1, "campaign_id"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1143
    const-string v0, "expiration"

    const-string v1, "expiration"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1144
    const-string v0, "display_seconds"

    const-string v1, "display_seconds"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1145
    const-string v0, "display_session"

    const-string v1, "display_session"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1146
    const-string v0, "version"

    const-string v1, "version"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1147
    const-string v0, "phone_location"

    const-string v1, "phone_location"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1148
    const-string v0, "phone_size_width"

    const-string v1, "phone_size_width"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1149
    const-string v0, "phone_size_height"

    const-string v1, "phone_size_height"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1150
    const-string v0, "tablet_location"

    const-string v1, "tablet_location"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1151
    const-string v0, "tablet_size_width"

    const-string v1, "tablet_size_width"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1152
    const-string v0, "tablet_size_height"

    const-string v1, "tablet_size_height"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1153
    const-string v0, "time_to_display"

    const-string v1, "time_to_display"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1154
    const-string v0, "internet_required"

    const-string v1, "internet_required"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1155
    const-string v0, "ab_test"

    const-string v1, "ab_test"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1156
    const-string v0, "rule_name"

    const-string v1, "rule_name"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1157
    const-string v0, "location"

    const-string v1, "location"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1158
    const-string v0, "devices"

    const-string v1, "devices"

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v14, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1160
    invoke-virtual {v7, v6}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 1132
    .end local v6    # "ampMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1a4
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_4d

    .line 1163
    .end local v12    # "ruleId":I
    :cond_1a8
    invoke-interface {v14}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_1ab
    .catchall {:try_start_7 .. :try_end_1ab} :catchall_1bc

    .line 1127
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_39

    .line 1168
    .end local v9    # "j":I
    .end local v13    # "ruleIdRef":I
    :cond_1af
    if-eqz v14, :cond_1b5

    .line 1170
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1171
    const/4 v14, 0x0

    .line 1174
    :cond_1b5
    if-eqz v11, :cond_1bb

    .line 1176
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 1177
    const/4 v11, 0x0

    .line 1181
    :cond_1bb
    return-object v7

    .line 1168
    .end local v8    # "i":I
    .end local v10    # "now":Ljava/lang/String;
    :catchall_1bc
    move-exception v0

    if-eqz v14, :cond_1c3

    .line 1170
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1171
    const/4 v14, 0x0

    .line 1174
    :cond_1c3
    if-eqz v11, :cond_1c9

    .line 1176
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 1177
    const/4 v11, 0x0

    :cond_1c9
    throw v0
.end method

.method private getRemoteFileURL(Ljava/util/Map;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1331
    .local p1, "ampMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 1333
    .local v1, "url":Ljava/lang/String;
    const-string v2, "devices"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1335
    .local v0, "devices":Ljava/lang/String;
    const-string v2, "tablet"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_1a

    .line 1337
    const-string v2, "tablet_location"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "url":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 1348
    .restart local v1    # "url":Ljava/lang/String;
    :goto_19
    return-object v1

    .line 1339
    :cond_1a
    const-string v2, "both"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_2b

    .line 1341
    const-string v2, "phone_location"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "url":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .restart local v1    # "url":Ljava/lang/String;
    goto :goto_19

    .line 1345
    :cond_2b
    const-string v2, "phone_location"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "url":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .restart local v1    # "url":Ljava/lang/String;
    goto :goto_19
.end method

.method private getUnzipFileDirPath(I)Ljava/lang/String;
    .registers 10
    .param p1, "ruleId"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1465
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1473
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1475
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1476
    const-string v3, ".localytics"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1477
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1478
    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler;->mApiKey:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1479
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1480
    const-string v3, "amp_rule_%d"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1482
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1484
    .local v2, "path":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1487
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_53

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_71

    .line 1489
    :cond_53
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_71

    .line 1491
    sget-boolean v3, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v3, :cond_70

    .line 1493
    const-string v3, "Localytics"

    const-string v4, "Could not create the directory %s for saving the decompressed file."

    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1495
    :cond_70
    const/4 v2, 0x0

    .line 1499
    .end local v2    # "path":Ljava/lang/String;
    :cond_71
    return-object v2
.end method

.method private getZipFileDirPath()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1439
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1447
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1449
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1450
    const-string v1, ".localytics"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1451
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1452
    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler;->mApiKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1454
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private isAmpMessageSatisfiedConditions(Ljava/util/Map;Ljava/util/Map;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 1001
    .local p1, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x1

    .line 1004
    .local v5, "satisfied":Z
    const-string v6, "campaign_id"

    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1005
    .local v1, "campaignId":I
    iget-object v6, p0, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v6, v1}, Lcom/localytics/android/AmpHelper;->getRuleIdFromCampaignId(Lcom/localytics/android/LocalyticsProvider;I)I

    move-result v4

    .line 1008
    .local v4, "ruleId":I
    invoke-direct {p0, v4}, Lcom/localytics/android/AmpSessionHandler;->getAmpConditions(I)Ljava/util/Vector;

    move-result-object v0

    .line 1011
    .local v0, "ampConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/AmpCondition;>;"
    if-eqz v0, :cond_30

    .line 1013
    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_30

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/localytics/android/AmpCondition;

    .line 1015
    .local v2, "condition":Lcom/localytics/android/AmpCondition;
    invoke-virtual {v2, p2}, Lcom/localytics/android/AmpCondition;->isSatisfiedByAttributes(Ljava/util/Map;)Z

    move-result v6

    if-nez v6, :cond_1d

    .line 1017
    const/4 v5, 0x0

    .line 1023
    .end local v2    # "condition":Lcom/localytics/android/AmpCondition;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_30
    return v5
.end method

.method private isConnectingToInternet()Z
    .registers 6

    .prologue
    .line 1509
    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 1510
    .local v0, "connectivity":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_25

    .line 1512
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v2

    .line 1513
    .local v2, "info":[Landroid/net/NetworkInfo;
    if-eqz v2, :cond_25

    .line 1515
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    array-length v3, v2

    if-ge v1, v3, :cond_25

    .line 1517
    aget-object v3, v2, v1

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    sget-object v4, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v3, v4, :cond_22

    .line 1519
    const/4 v3, 0x1

    .line 1524
    .end local v1    # "i":I
    .end local v2    # "info":[Landroid/net/NetworkInfo;
    :goto_21
    return v3

    .line 1515
    .restart local v1    # "i":I
    .restart local v2    # "info":[Landroid/net/NetworkInfo;
    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 1524
    .end local v1    # "i":I
    .end local v2    # "info":[Landroid/net/NetworkInfo;
    :cond_25
    const/4 v3, 0x0

    goto :goto_21
.end method

.method private retrieveDisplayingCandidate(Ljava/util/Vector;Ljava/util/Map;)Ljava/util/Map;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Vector",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "ampMessages":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x1

    .line 1195
    const/4 v1, 0x0

    .line 1197
    .local v1, "candidate":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_6
    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_35

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 1200
    .local v0, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "internet_required"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v5, :cond_33

    move v3, v5

    .line 1201
    .local v3, "internetRequired":Z
    :goto_21
    if-eqz v3, :cond_29

    invoke-direct {p0}, Lcom/localytics/android/AmpSessionHandler;->isConnectingToInternet()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1207
    :cond_29
    if-eqz p2, :cond_31

    invoke-direct {p0, v0, p2}, Lcom/localytics/android/AmpSessionHandler;->isAmpMessageSatisfiedConditions(Ljava/util/Map;Ljava/util/Map;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1212
    :cond_31
    move-object v1, v0

    .line 1213
    goto :goto_6

    .line 1200
    .end local v3    # "internetRequired":Z
    :cond_33
    const/4 v3, 0x0

    goto :goto_21

    .line 1215
    .end local v0    # "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_35
    if-eqz v1, :cond_3d

    invoke-direct {p0, v1}, Lcom/localytics/android/AmpSessionHandler;->updateDisplayingCandidate(Ljava/util/Map;)Z

    move-result v4

    if-nez v4, :cond_3e

    .line 1217
    :cond_3d
    const/4 v1, 0x0

    .line 1220
    .end local v1    # "candidate":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_3e
    return-object v1
.end method

.method private updateDisplayingCandidate(Ljava/util/Map;)Z
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 1228
    .local p1, "candidate":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v5, 0x0

    .line 1229
    .local v5, "localHtmlURL":Ljava/lang/String;
    const-string v10, "_id"

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 1230
    .local v7, "ruleId":I
    invoke-direct {p0}, Lcom/localytics/android/AmpSessionHandler;->getZipFileDirPath()Ljava/lang/String;

    move-result-object v9

    .line 1231
    .local v9, "zipFileDirPath":Ljava/lang/String;
    invoke-direct {p0, v7}, Lcom/localytics/android/AmpSessionHandler;->getUnzipFileDirPath(I)Ljava/lang/String;

    move-result-object v8

    .line 1232
    .local v8, "unzipFileDirPath":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/localytics/android/AmpSessionHandler;->getRemoteFileURL(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v10

    const-string v11, ".zip"

    invoke-virtual {v10, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    .line 1235
    .local v3, "isZipped":Z
    invoke-direct {p0, v7, v3}, Lcom/localytics/android/AmpSessionHandler;->doesCreativeExist(IZ)Z

    move-result v10

    if-nez v10, :cond_42

    .line 1238
    invoke-static {p1}, Lcom/localytics/android/AmpDownloader;->getRemoteFileURL(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v6

    .line 1239
    .local v6, "remoteFileURL":Ljava/lang/String;
    iget-object v10, p0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    iget-object v11, p0, Lcom/localytics/android/AmpSessionHandler;->mApiKey:Ljava/lang/String;

    int-to-long v12, v7

    invoke-static {v10, v11, v12, v13, v3}, Lcom/localytics/android/AmpDownloader;->getLocalFileURL(Landroid/content/Context;Ljava/lang/String;JZ)Ljava/lang/String;

    move-result-object v4

    .line 1240
    .local v4, "localFileURL":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_42

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_42

    .line 1242
    const/4 v10, 0x1

    invoke-static {v6, v4, v10}, Lcom/localytics/android/AmpDownloader;->downloadFile(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 1247
    .end local v4    # "localFileURL":Ljava/lang/String;
    .end local v6    # "remoteFileURL":Ljava/lang/String;
    :cond_42
    if-eqz v3, :cond_81

    .line 1250
    const-string v10, "amp_rule_%d.zip"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v9, v8, v10}, Lcom/localytics/android/AmpSessionHandler;->decompressZipFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_79

    .line 1253
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "file://"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "index.html"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1261
    :cond_79
    :goto_79
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_a1

    .line 1263
    const/4 v10, 0x0

    .line 1297
    :goto_80
    return v10

    .line 1258
    :cond_81
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "file://"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "index.html"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_79

    .line 1269
    :cond_a1
    const/4 v2, 0x0

    .line 1270
    .local v2, "displayWidth":I
    const/4 v1, 0x0

    .line 1271
    .local v1, "displayHeight":I
    const-string v10, "devices"

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1273
    .local v0, "devices":Ljava/lang/String;
    const-string v10, "tablet"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_eb

    .line 1275
    const-string v10, "tablet_size_width"

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 1276
    const-string v10, "tablet_size_height"

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1292
    :goto_cb
    const-string v10, "html_url"

    invoke-interface {p1, v10, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1293
    const-string v10, "base_path"

    invoke-interface {p1, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1294
    const-string v10, "display_width"

    int-to-float v11, v2

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-interface {p1, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1295
    const-string v10, "display_height"

    int-to-float v11, v1

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-interface {p1, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1297
    const/4 v10, 0x1

    goto :goto_80

    .line 1278
    :cond_eb
    const-string v10, "both"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_10c

    .line 1280
    const-string v10, "phone_size_width"

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 1281
    const-string v10, "phone_size_height"

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_cb

    .line 1285
    :cond_10c
    const-string v10, "phone_size_width"

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 1286
    const-string v10, "phone_size_height"

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_cb
.end method


# virtual methods
.method ampTrigger(Ljava/lang/String;Ljava/util/Map;)V
    .registers 8
    .param p1, "eventName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 247
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/localytics/android/AmpSessionHandler;->getAmpMessageMaps(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v1

    .line 248
    .local v1, "ampMessages":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v3

    if-nez v3, :cond_2e

    .line 249
    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 251
    iget-object v3, p0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 252
    .local v2, "eventString":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/localytics/android/AmpSessionHandler;->getAmpMessageMaps(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v1

    .line 257
    .end local v2    # "eventString":Ljava/lang/String;
    :cond_2e
    invoke-direct {p0, v1, p2}, Lcom/localytics/android/AmpSessionHandler;->retrieveDisplayingCandidate(Ljava/util/Vector;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 259
    .local v0, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v0, :cond_35

    .line 306
    :goto_34
    return-void

    .line 264
    :cond_35
    new-instance v3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v4, Lcom/localytics/android/AmpSessionHandler$2;

    invoke-direct {v4, p0, v0, p2}, Lcom/localytics/android/AmpSessionHandler$2;-><init>(Lcom/localytics/android/AmpSessionHandler;Ljava/util/Map;Ljava/util/Map;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_34
.end method

.method protected createUploadHandler(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;)Lcom/localytics/android/UploadHandler;
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sessionHandler"    # Landroid/os/Handler;
    .param p3, "apiKey"    # Ljava/lang/String;
    .param p4, "installId"    # Ljava/lang/String;
    .param p5, "looper"    # Landroid/os/Looper;

    .prologue
    .line 125
    new-instance v0, Lcom/localytics/android/AmpUploadHandler;

    move-object v1, p1

    move-object v2, p0

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/localytics/android/AmpUploadHandler;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;)V

    return-object v0
.end method

.method public getDialogCallbacks()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/localytics/android/AmpCallable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 549
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 552
    .local v0, "callbacks":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/AmpCallable;>;"
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/AmpSessionHandler$9;

    invoke-direct {v2, p0}, Lcom/localytics/android/AmpSessionHandler$9;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/AmpSessionHandler$10;

    invoke-direct {v2, p0}, Lcom/localytics/android/AmpSessionHandler$10;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 596
    return-object v0
.end method

.method public getJavaScriptClientCallbacks(Ljava/util/Map;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/localytics/android/AmpCallable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 601
    .local p1, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 607
    .local v0, "callbacks":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/AmpCallable;>;"
    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/AmpSessionHandler$11;

    invoke-direct {v2, p0}, Lcom/localytics/android/AmpSessionHandler$11;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 855
    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/AmpSessionHandler$12;

    invoke-direct {v2, p0}, Lcom/localytics/android/AmpSessionHandler$12;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 904
    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/AmpSessionHandler$13;

    invoke-direct {v2, p0}, Lcom/localytics/android/AmpSessionHandler$13;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 930
    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/AmpSessionHandler$14;

    invoke-direct {v2, p0, p1}, Lcom/localytics/android/AmpSessionHandler$14;-><init>(Lcom/localytics/android/AmpSessionHandler;Ljava/util/Map;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 976
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/AmpSessionHandler$15;

    invoke-direct {v2, p0}, Lcom/localytics/android/AmpSessionHandler$15;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 989
    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 14
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 134
    const/4 v8, 0x3

    :try_start_1
    new-array v6, v8, [Ljava/lang/Integer;

    const/4 v8, 0x0

    const/16 v9, 0xd

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v8

    const/4 v8, 0x1

    const/16 v9, 0xf

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v8

    const/4 v8, 0x2

    const/16 v9, 0x13

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v8

    .line 135
    .local v6, "ignoredMessages":[Ljava/lang/Integer;
    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    iget v9, p1, Landroid/os/Message;->what:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_31

    .line 137
    invoke-super {p0, p1}, Lcom/localytics/android/SessionHandler;->handleMessage(Landroid/os/Message;)V

    .line 140
    :cond_31
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_46

    .line 142
    const-string v8, "Localytics"

    const-string v9, "Handler received %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    :cond_46
    iget v8, p1, Landroid/os/Message;->what:I

    sparse-switch v8, :sswitch_data_da

    .line 232
    .end local v6    # "ignoredMessages":[Ljava/lang/Integer;
    :cond_4b
    :goto_4b
    return-void

    .line 149
    .restart local v6    # "ignoredMessages":[Ljava/lang/Integer;
    :sswitch_4c
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_57

    .line 151
    const-string v8, "Localytics"

    const-string v9, "Handler received MESSAGE_TRIGGER_AMP"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    :cond_57
    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v8, [Ljava/lang/Object;

    move-object v0, v8

    check-cast v0, [Ljava/lang/Object;

    move-object v7, v0

    .line 156
    .local v7, "params":[Ljava/lang/Object;
    const/4 v8, 0x0

    aget-object v5, v7, v8

    check-cast v5, Ljava/lang/String;

    .line 158
    .local v5, "event":Ljava/lang/String;
    const/4 v8, 0x1

    aget-object v3, v7, v8

    check-cast v3, Ljava/util/Map;

    .line 159
    .local v3, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, v5, v3}, Lcom/localytics/android/AmpSessionHandler;->ampTrigger(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6c} :catch_6d

    goto :goto_4b

    .line 220
    .end local v3    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "event":Ljava/lang/String;
    .end local v6    # "ignoredMessages":[Ljava/lang/Integer;
    .end local v7    # "params":[Ljava/lang/Object;
    :catch_6d
    move-exception v4

    .line 222
    .local v4, "e":Ljava/lang/Exception;
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_4b

    .line 224
    const-string v8, "Localytics"

    const-string v9, "Localytics library threw an uncaught exception"

    invoke-static {v8, v9, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4b

    .line 165
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v6    # "ignoredMessages":[Ljava/lang/Integer;
    :sswitch_7a
    :try_start_7a
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_85

    .line 167
    const-string v8, "Localytics"

    const-string v9, "Amp Session Handler received MESSAGE_TAG_EVENT"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    :cond_85
    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v8, [Ljava/lang/Object;

    move-object v0, v8

    check-cast v0, [Ljava/lang/Object;

    move-object v7, v0

    .line 172
    .restart local v7    # "params":[Ljava/lang/Object;
    const/4 v8, 0x0

    aget-object v5, v7, v8

    check-cast v5, Ljava/lang/String;

    .line 174
    .restart local v5    # "event":Ljava/lang/String;
    const/4 v8, 0x1

    aget-object v3, v7, v8

    check-cast v3, Ljava/util/Map;

    .line 180
    .restart local v3    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, v5, v3}, Lcom/localytics/android/AmpSessionHandler;->ampTrigger(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_4b

    .line 186
    .end local v3    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "event":Ljava/lang/String;
    .end local v7    # "params":[Ljava/lang/Object;
    :sswitch_9b
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_a6

    .line 188
    const-string v8, "Localytics"

    const-string v9, "Amp Session Handler received MESSAGE_SHOW_AMP_TEST"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    :cond_a6
    new-instance v8, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v9, Lcom/localytics/android/AmpSessionHandler$1;

    invoke-direct {v9, p0}, Lcom/localytics/android/AmpSessionHandler$1;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    const-wide/16 v10, 0x3e8

    invoke-virtual {v8, v9, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_4b

    .line 208
    :sswitch_ba
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_c5

    .line 210
    const-string v8, "Localytics"

    const-string v9, "Amp Session Handler received MESSAGE_DELETE_AMP_RESOURCES"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    :cond_c5
    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v8, [Ljava/lang/Object;

    move-object v0, v8

    check-cast v0, [Ljava/lang/Object;

    move-object v7, v0

    .line 214
    .restart local v7    # "params":[Ljava/lang/Object;
    const/4 v8, 0x0

    aget-object v2, v7, v8

    check-cast v2, Ljava/util/Map;

    .line 216
    .local v2, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v8, p0, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const/4 v9, 0x1

    invoke-static {v8, v2, v9}, Lcom/localytics/android/AmpHelper;->destroyLocalAmp(Lcom/localytics/android/LocalyticsProvider;Ljava/util/Map;Z)V
    :try_end_d8
    .catch Ljava/lang/Exception; {:try_start_7a .. :try_end_d8} :catch_6d

    goto/16 :goto_4b

    .line 145
    :sswitch_data_da
    .sparse-switch
        0x3 -> :sswitch_7a
        0xd -> :sswitch_4c
        0xf -> :sswitch_9b
        0x13 -> :sswitch_ba
    .end sparse-switch
.end method

.method public setFragmentManager(Landroid/support/v4/app/FragmentManager;)V
    .registers 2
    .param p1, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    .line 109
    return-void
.end method

.method showAmpTest()V
    .registers 8

    .prologue
    .line 315
    iget-object v5, p0, Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    if-nez v5, :cond_5

    .line 540
    :cond_4
    :goto_4
    return-void

    .line 320
    :cond_5
    iget-object v5, p0, Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    const-string v6, "amp_test_mode_button"

    invoke-virtual {v5, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v5

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    const-string v6, "amp_test_mode_list"

    invoke-virtual {v5, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v5

    if-nez v5, :cond_4

    .line 326
    invoke-static {}, Lcom/localytics/android/TestModeButton;->newInstance()Lcom/localytics/android/TestModeButton;

    move-result-object v1

    .line 327
    .local v1, "button":Lcom/localytics/android/TestModeButton;
    invoke-static {}, Lcom/localytics/android/TestModeListView;->newInstance()Lcom/localytics/android/TestModeListView;

    move-result-object v4

    .line 328
    .local v4, "listView":Lcom/localytics/android/TestModeListView;
    new-instance v0, Lcom/localytics/android/AmpRulesAdapter;

    iget-object v5, p0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    invoke-direct {v0, v5}, Lcom/localytics/android/AmpRulesAdapter;-><init>(Landroid/content/Context;)V

    .line 330
    .local v0, "adapter":Lcom/localytics/android/AmpRulesAdapter;
    invoke-virtual {v4, v0}, Lcom/localytics/android/TestModeListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 335
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    .line 337
    .local v2, "callbacksForButton":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/AmpCallable;>;"
    const/16 v5, 0x9

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lcom/localytics/android/AmpSessionHandler$3;

    invoke-direct {v6, p0, v0, v4}, Lcom/localytics/android/AmpSessionHandler$3;-><init>(Lcom/localytics/android/AmpSessionHandler;Lcom/localytics/android/AmpRulesAdapter;Lcom/localytics/android/TestModeListView;)V

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    invoke-virtual {v1, v2}, Lcom/localytics/android/TestModeButton;->setCallbacks(Ljava/util/Map;)Lcom/localytics/android/TestModeButton;

    .line 350
    iget-object v5, p0, Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    const-string v6, "amp_test_mode_button"

    invoke-virtual {v1, v5, v6}, Lcom/localytics/android/TestModeButton;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 356
    iget-object v5, p0, Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z

    .line 361
    new-instance v3, Ljava/util/TreeMap;

    invoke-direct {v3}, Ljava/util/TreeMap;-><init>()V

    .line 364
    .local v3, "callbacksForList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/AmpCallable;>;"
    const/16 v5, 0xa

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lcom/localytics/android/AmpSessionHandler$4;

    invoke-direct {v6, p0, v1}, Lcom/localytics/android/AmpSessionHandler$4;-><init>(Lcom/localytics/android/AmpSessionHandler;Lcom/localytics/android/TestModeButton;)V

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    const/16 v5, 0xc

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lcom/localytics/android/AmpSessionHandler$5;

    invoke-direct {v6, p0, v0}, Lcom/localytics/android/AmpSessionHandler$5;-><init>(Lcom/localytics/android/AmpSessionHandler;Lcom/localytics/android/AmpRulesAdapter;)V

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    const/16 v5, 0xd

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lcom/localytics/android/AmpSessionHandler$6;

    invoke-direct {v6, p0}, Lcom/localytics/android/AmpSessionHandler$6;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    const/16 v5, 0xe

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lcom/localytics/android/AmpSessionHandler$7;

    invoke-direct {v6, p0}, Lcom/localytics/android/AmpSessionHandler$7;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    const/16 v5, 0xb

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lcom/localytics/android/AmpSessionHandler$8;

    invoke-direct {v6, p0}, Lcom/localytics/android/AmpSessionHandler$8;-><init>(Lcom/localytics/android/AmpSessionHandler;)V

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    invoke-virtual {v4, v3}, Lcom/localytics/android/TestModeListView;->setCallbacks(Ljava/util/Map;)Lcom/localytics/android/TestModeListView;

    goto/16 :goto_4
.end method
