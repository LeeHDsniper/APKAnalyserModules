.class Lcom/localytics/android/UploadHandler;
.super Landroid/os/Handler;
.source "UploadHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;,
        Lcom/localytics/android/UploadHandler$UploadType;
    }
.end annotation


# instance fields
.field protected final mApiKey:Ljava/lang/String;

.field protected final mContext:Landroid/content/Context;

.field private final mInstallId:Ljava/lang/String;

.field protected final mProvider:Lcom/localytics/android/LocalyticsProvider;

.field private final mSessionHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sessionHandler"    # Landroid/os/Handler;
    .param p3, "apiKey"    # Ljava/lang/String;
    .param p4, "installId"    # Ljava/lang/String;
    .param p5, "looper"    # Landroid/os/Looper;

    .prologue
    .line 158
    invoke-direct {p0, p5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 160
    iput-object p1, p0, Lcom/localytics/android/UploadHandler;->mContext:Landroid/content/Context;

    .line 161
    invoke-static {p1, p3}, Lcom/localytics/android/LocalyticsProvider;->getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/localytics/android/LocalyticsProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/localytics/android/UploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    .line 162
    iput-object p2, p0, Lcom/localytics/android/UploadHandler;->mSessionHandler:Landroid/os/Handler;

    .line 163
    iput-object p3, p0, Lcom/localytics/android/UploadHandler;->mApiKey:Ljava/lang/String;

    .line 164
    iput-object p4, p0, Lcom/localytics/android/UploadHandler;->mInstallId:Ljava/lang/String;

    .line 165
    return-void
.end method

.method static convertAttributesToJson(Lcom/localytics/android/LocalyticsProvider;Landroid/content/Context;J)Lorg/json/JSONObject;
    .registers 16
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "eventId"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 1894
    const/4 v7, 0x0

    .line 1897
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_2
    const-string v1, "attributes"

    const/4 v2, 0x0

    const-string v0, "%s = ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ?"

    const/16 v3, 0xb

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "events_key_ref"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    const/4 v4, 0x5

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    const/4 v4, 0x6

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    const/4 v4, 0x7

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    const/16 v4, 0x8

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    const/16 v4, 0x9

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    const/16 v4, 0xa

    const-string v5, "attribute_key"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/16 v0, 0xb

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v0, 0x1

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    aput-object v5, v4, v0

    const/4 v0, 0x2

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    aput-object v5, v4, v0

    const/4 v0, 0x3

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    aput-object v5, v4, v0

    const/4 v0, 0x4

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    aput-object v5, v4, v0

    const/4 v0, 0x5

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    aput-object v5, v4, v0

    const/4 v0, 0x6

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    aput-object v5, v4, v0

    const/4 v0, 0x7

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    aput-object v5, v4, v0

    const/16 v0, 0x8

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    aput-object v5, v4, v0

    const/16 v0, 0x9

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    aput-object v5, v4, v0

    const/16 v0, 0xa

    sget-object v5, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1899
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I
    :try_end_92
    .catchall {:try_start_2 .. :try_end_92} :catchall_d1

    move-result v0

    if-nez v0, :cond_9c

    .line 1920
    if-eqz v7, :cond_9b

    .line 1922
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1923
    const/4 v7, 0x0

    :cond_9b
    :goto_9b
    return-object v6

    .line 1904
    :cond_9c
    :try_start_9c
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 1906
    .local v6, "attributes":Lorg/json/JSONObject;
    const-string v0, "attribute_key"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 1907
    .local v9, "keyColumn":I
    const-string v0, "attribute_value"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v11

    .line 1908
    .local v11, "valueColumn":I
    :goto_ad
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_d9

    .line 1910
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1911
    .local v8, "key":Ljava/lang/String;
    invoke-interface {v7, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 1913
    .local v10, "value":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v8, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_d0
    .catchall {:try_start_9c .. :try_end_d0} :catchall_d1

    goto :goto_ad

    .line 1920
    .end local v6    # "attributes":Lorg/json/JSONObject;
    .end local v8    # "key":Ljava/lang/String;
    .end local v9    # "keyColumn":I
    .end local v10    # "value":Ljava/lang/String;
    .end local v11    # "valueColumn":I
    :catchall_d1
    move-exception v0

    if-eqz v7, :cond_d8

    .line 1922
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1923
    const/4 v7, 0x0

    :cond_d8
    throw v0

    .line 1920
    .restart local v6    # "attributes":Lorg/json/JSONObject;
    .restart local v9    # "keyColumn":I
    .restart local v11    # "valueColumn":I
    :cond_d9
    if-eqz v7, :cond_9b

    .line 1922
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1923
    const/4 v7, 0x0

    goto :goto_9b
.end method

.method static convertDatabaseToJson(Landroid/content/Context;Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/util/List;
    .registers 25
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p2, "apiKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/localytics/android/LocalyticsProvider;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 730
    new-instance v18, Ljava/util/LinkedList;

    invoke-direct/range {v18 .. v18}, Ljava/util/LinkedList;-><init>()V

    .line 731
    .local v18, "result":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    const/4 v11, 0x0

    .line 734
    .local v11, "cursor":Landroid/database/Cursor;
    :try_start_6
    const-string v3, "upload_blobs"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 736
    invoke-static/range {p1 .. p2}, Lcom/localytics/android/UploadHandler;->getApiKeyCreationTime(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)J

    move-result-wide v12

    .line 738
    .local v12, "creationTime":J
    const-string v2, "_id"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v16

    .line 739
    .local v16, "idColumn":I
    const-string v2, "uuid"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v19

    .line 740
    .local v19, "uuidColumn":I
    :cond_22
    :goto_22
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_25
    .catchall {:try_start_6 .. :try_end_25} :catchall_f3

    move-result v2

    if-eqz v2, :cond_102

    .line 744
    :try_start_28
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 746
    .local v10, "blobHeader":Lorg/json/JSONObject;
    const-string v2, "dt"

    const-string v3, "h"

    invoke-virtual {v10, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 747
    const-string v2, "pa"

    invoke-virtual {v10, v2, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 748
    const-string v2, "seq"

    move/from16 v0, v16

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v10, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 749
    const-string v2, "u"

    move/from16 v0, v19

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 750
    const-string v2, "attrs"

    move/from16 v0, v16

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    move-object/from16 v0, p1

    invoke-static {v0, v4, v5}, Lcom/localytics/android/UploadHandler;->getSessionIdForBlobId(Lcom/localytics/android/LocalyticsProvider;J)J

    move-result-wide v4

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v1, v4, v5}, Lcom/localytics/android/UploadHandler;->getAttributesFromSession(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v10, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 752
    invoke-static/range {p1 .. p1}, Lcom/localytics/android/UploadHandler;->getIdentifiers(Lcom/localytics/android/LocalyticsProvider;)Lorg/json/JSONObject;

    move-result-object v17

    .line 753
    .local v17, "identifiers":Lorg/json/JSONObject;
    if-eqz v17, :cond_75

    .line 755
    const-string v2, "ids"

    move-object/from16 v0, v17

    invoke-virtual {v10, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 758
    :cond_75
    move-object/from16 v0, v18

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 760
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_87

    .line 762
    const-string v2, "Localytics"

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_87
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_87} :catch_e5
    .catchall {:try_start_28 .. :try_end_87} :catchall_f3

    .line 765
    :cond_87
    const/4 v9, 0x0

    .line 768
    .local v9, "blobEvents":Landroid/database/Cursor;
    :try_start_88
    const-string v3, "upload_blob_events"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v5, "events_key_ref"

    aput-object v5, v4, v2

    const-string v2, "%s = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "upload_blobs_key_ref"

    aput-object v7, v5, v6

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v2, 0x1

    new-array v6, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    move/from16 v0, v16

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    const-string v7, "events_key_ref"

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 772
    const-string v2, "events_key_ref"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v15

    .line 773
    .local v15, "eventIdColumn":I
    :goto_be
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_fb

    .line 775
    invoke-interface {v9, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    move/from16 v0, v16

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    move-object/from16 v2, p1

    move-object/from16 v3, p0

    move-object/from16 v8, p2

    invoke-static/range {v2 .. v8}, Lcom/localytics/android/UploadHandler;->convertEventToJson(Lcom/localytics/android/LocalyticsProvider;Landroid/content/Context;JJLjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_dd
    .catchall {:try_start_88 .. :try_end_dd} :catchall_de

    goto :goto_be

    .line 780
    .end local v15    # "eventIdColumn":I
    :catchall_de
    move-exception v2

    if-eqz v9, :cond_e4

    .line 782
    :try_start_e1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_e4
    throw v2
    :try_end_e5
    .catch Lorg/json/JSONException; {:try_start_e1 .. :try_end_e5} :catch_e5
    .catchall {:try_start_e1 .. :try_end_e5} :catchall_f3

    .line 786
    .end local v9    # "blobEvents":Landroid/database/Cursor;
    .end local v10    # "blobHeader":Lorg/json/JSONObject;
    .end local v17    # "identifiers":Lorg/json/JSONObject;
    :catch_e5
    move-exception v14

    .line 788
    .local v14, "e":Lorg/json/JSONException;
    :try_start_e6
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_22

    .line 790
    const-string v2, "Localytics"

    const-string v3, "Caught exception"

    invoke-static {v2, v3, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_f1
    .catchall {:try_start_e6 .. :try_end_f1} :catchall_f3

    goto/16 :goto_22

    .line 797
    .end local v12    # "creationTime":J
    .end local v14    # "e":Lorg/json/JSONException;
    .end local v16    # "idColumn":I
    .end local v19    # "uuidColumn":I
    :catchall_f3
    move-exception v2

    if-eqz v11, :cond_fa

    .line 799
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 800
    const/4 v11, 0x0

    :cond_fa
    throw v2

    .line 780
    .restart local v9    # "blobEvents":Landroid/database/Cursor;
    .restart local v10    # "blobHeader":Lorg/json/JSONObject;
    .restart local v12    # "creationTime":J
    .restart local v15    # "eventIdColumn":I
    .restart local v16    # "idColumn":I
    .restart local v17    # "identifiers":Lorg/json/JSONObject;
    .restart local v19    # "uuidColumn":I
    :cond_fb
    if-eqz v9, :cond_22

    .line 782
    :try_start_fd
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_100
    .catch Lorg/json/JSONException; {:try_start_fd .. :try_end_100} :catch_e5
    .catchall {:try_start_fd .. :try_end_100} :catchall_f3

    goto/16 :goto_22

    .line 797
    .end local v9    # "blobEvents":Landroid/database/Cursor;
    .end local v10    # "blobHeader":Lorg/json/JSONObject;
    .end local v15    # "eventIdColumn":I
    .end local v17    # "identifiers":Lorg/json/JSONObject;
    :cond_102
    if-eqz v11, :cond_108

    .line 799
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 800
    const/4 v11, 0x0

    .line 804
    :cond_108
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_121

    .line 806
    const-string v2, "Localytics"

    const-string v3, "JSON result is %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 809
    :cond_121
    return-object v18
.end method

.method static convertEventToJson(Lcom/localytics/android/LocalyticsProvider;Landroid/content/Context;JJLjava/lang/String;)Lorg/json/JSONObject;
    .registers 51
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "eventId"    # J
    .param p4, "blobId"    # J
    .param p6, "apiKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1199
    new-instance v30, Lorg/json/JSONObject;

    invoke-direct/range {v30 .. v30}, Lorg/json/JSONObject;-><init>()V

    .line 1201
    .local v30, "result":Lorg/json/JSONObject;
    const/4 v14, 0x0

    .line 1205
    .local v14, "cursor":Landroid/database/Cursor;
    :try_start_6
    const-string v5, "events"

    const/4 v6, 0x0

    const-string v4, "%s = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "_id"

    aput-object v9, v7, v8

    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v4, 0x1

    new-array v8, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    const-string v9, "_id"

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 1208
    invoke-interface {v14}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_939

    .line 1210
    const-string v4, "event_name"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 1211
    .local v19, "eventName":Ljava/lang/String;
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    invoke-static {v0, v1, v2}, Lcom/localytics/android/UploadHandler;->getSessionIdForEventId(Lcom/localytics/android/LocalyticsProvider;J)J

    move-result-wide v34

    .line 1212
    .local v34, "sessionId":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v34

    invoke-static {v0, v1, v2}, Lcom/localytics/android/UploadHandler;->getSessionUuid(Lcom/localytics/android/LocalyticsProvider;J)Ljava/lang/String;

    move-result-object v33

    .line 1213
    .local v33, "sessionUuid":Ljava/lang/String;
    move-object/from16 v0, p0

    move-wide/from16 v1, v34

    invoke-static {v0, v1, v2}, Lcom/localytics/android/UploadHandler;->getSessionStartTime(Lcom/localytics/android/LocalyticsProvider;J)J

    move-result-wide v36

    .line 1215
    .local v36, "sessionStartTime":J
    sget-object v4, Lcom/localytics/android/Constants;->OPEN_EVENT:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27a

    .line 1217
    const-string v4, "dt"

    const-string v5, "s"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1218
    const-string v4, "ct"

    const-string v5, "wall_time"

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    long-to-double v6, v6

    const-wide v8, 0x408f400000000000L

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1220
    const-string v4, "u"

    move-object/from16 v0, v30

    move-object/from16 v1, v33

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1222
    move-object/from16 v0, p0

    move-wide/from16 v1, v34

    invoke-static {v0, v1, v2}, Lcom/localytics/android/UploadHandler;->getElapsedTimeSinceLastSession(Lcom/localytics/android/LocalyticsProvider;J)J

    move-result-wide v16

    .line 1223
    .local v16, "elapsedTime":J
    const-wide/16 v4, 0x0

    cmp-long v4, v16, v4

    if-lez v4, :cond_a7

    .line 1224
    const-string v4, "sl"

    const-wide/16 v6, 0x3e8

    div-long v6, v16, v6

    long-to-float v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 1230
    :cond_a7
    const-string v4, "nth"

    move-object/from16 v0, v30

    move-wide/from16 v1, v34

    invoke-virtual {v0, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1235
    const-string v4, "event_lat"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_fa

    const-string v4, "event_lng"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_fa

    .line 1238
    const-string v4, "event_lat"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v24

    .line 1239
    .local v24, "lat":D
    const-string v4, "event_lng"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v26

    .line 1241
    .local v26, "lng":D
    const-wide/16 v4, 0x0

    cmpl-double v4, v24, v4

    if-eqz v4, :cond_fa

    const-wide/16 v4, 0x0

    cmpl-double v4, v26, v4

    if-eqz v4, :cond_fa

    .line 1243
    const-string v4, "lat"

    move-object/from16 v0, v30

    move-wide/from16 v1, v24

    invoke-virtual {v0, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1244
    const-string v4, "lng"

    move-object/from16 v0, v30

    move-wide/from16 v1, v26

    invoke-virtual {v0, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1248
    .end local v24    # "lat":D
    .end local v26    # "lng":D
    :cond_fa
    const-string v4, "customer_id"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_12a

    .line 1250
    const-string v4, "customer_id"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 1251
    .local v15, "customerID":Ljava/lang/String;
    const-string v4, "user_type"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v39

    .line 1253
    .local v39, "userType":Ljava/lang/String;
    const-string v4, "cid"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1254
    const-string v4, "utp"

    move-object/from16 v0, v30

    move-object/from16 v1, v39

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1257
    .end local v15    # "customerID":Ljava/lang/String;
    .end local v39    # "userType":Ljava/lang/String;
    :cond_12a
    const-string v4, "ids"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_14e

    .line 1259
    const-string v4, "ids"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    .line 1260
    .local v20, "ids":Ljava/lang/String;
    const-string v4, "ids"

    new-instance v5, Lorg/json/JSONObject;

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_14e
    .catchall {:try_start_6 .. :try_end_14e} :catchall_1ab

    .line 1266
    .end local v20    # "ids":Ljava/lang/String;
    :cond_14e
    const/4 v11, 0x0

    .line 1269
    .local v11, "attributesCursor":Landroid/database/Cursor;
    :try_start_14f
    const-string v5, "attributes"

    const/4 v6, 0x0

    const-string v4, "%s = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "events_key_ref"

    aput-object v9, v7, v8

    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v4, 0x1

    new-array v8, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    const/4 v9, 0x0

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 1271
    const-string v4, "attribute_key"

    invoke-interface {v11, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    .line 1272
    .local v22, "keyColumn":I
    const-string v4, "attribute_value"

    invoke-interface {v11, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v41

    .line 1273
    .local v41, "valueColumn":I
    :cond_17d
    :goto_17d
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_26d

    .line 1275
    move/from16 v0, v22

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 1276
    .local v21, "key":Ljava/lang/String;
    move/from16 v0, v41

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 1278
    .local v40, "value":Ljava/lang/String;
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b3

    .line 1280
    const-string v4, "c0"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1a2
    .catchall {:try_start_14f .. :try_end_1a2} :catchall_1a3

    goto :goto_17d

    .line 1322
    .end local v21    # "key":Ljava/lang/String;
    .end local v22    # "keyColumn":I
    .end local v40    # "value":Ljava/lang/String;
    .end local v41    # "valueColumn":I
    :catchall_1a3
    move-exception v4

    if-eqz v11, :cond_1aa

    .line 1324
    :try_start_1a6
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 1325
    const/4 v11, 0x0

    :cond_1aa
    throw v4
    :try_end_1ab
    .catchall {:try_start_1a6 .. :try_end_1ab} :catchall_1ab

    .line 1699
    .end local v11    # "attributesCursor":Landroid/database/Cursor;
    .end local v16    # "elapsedTime":J
    .end local v19    # "eventName":Ljava/lang/String;
    .end local v33    # "sessionUuid":Ljava/lang/String;
    .end local v34    # "sessionId":J
    .end local v36    # "sessionStartTime":J
    :catchall_1ab
    move-exception v4

    if-eqz v14, :cond_1b2

    .line 1701
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1702
    const/4 v14, 0x0

    :cond_1b2
    throw v4

    .line 1282
    .restart local v11    # "attributesCursor":Landroid/database/Cursor;
    .restart local v16    # "elapsedTime":J
    .restart local v19    # "eventName":Ljava/lang/String;
    .restart local v21    # "key":Ljava/lang/String;
    .restart local v22    # "keyColumn":I
    .restart local v33    # "sessionUuid":Ljava/lang/String;
    .restart local v34    # "sessionId":J
    .restart local v36    # "sessionStartTime":J
    .restart local v40    # "value":Ljava/lang/String;
    .restart local v41    # "valueColumn":I
    :cond_1b3
    :try_start_1b3
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c7

    .line 1284
    const-string v4, "c1"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_17d

    .line 1286
    :cond_1c7
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1db

    .line 1288
    const-string v4, "c2"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_17d

    .line 1290
    :cond_1db
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1ef

    .line 1292
    const-string v4, "c3"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_17d

    .line 1294
    :cond_1ef
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_204

    .line 1296
    const-string v4, "c4"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_17d

    .line 1298
    :cond_204
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_219

    .line 1300
    const-string v4, "c5"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_17d

    .line 1302
    :cond_219
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_22e

    .line 1304
    const-string v4, "c6"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_17d

    .line 1306
    :cond_22e
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_243

    .line 1308
    const-string v4, "c7"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_17d

    .line 1310
    :cond_243
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_258

    .line 1312
    const-string v4, "c8"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_17d

    .line 1314
    :cond_258
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_17d

    .line 1316
    const-string v4, "c9"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_26b
    .catchall {:try_start_1b3 .. :try_end_26b} :catchall_1a3

    goto/16 :goto_17d

    .line 1322
    .end local v21    # "key":Ljava/lang/String;
    .end local v40    # "value":Ljava/lang/String;
    :cond_26d
    if-eqz v11, :cond_273

    .line 1324
    :try_start_26f
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_272
    .catchall {:try_start_26f .. :try_end_272} :catchall_1ab

    .line 1325
    const/4 v11, 0x0

    .line 1699
    .end local v11    # "attributesCursor":Landroid/database/Cursor;
    .end local v16    # "elapsedTime":J
    .end local v22    # "keyColumn":I
    .end local v41    # "valueColumn":I
    :cond_273
    :goto_273
    if-eqz v14, :cond_279

    .line 1701
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1702
    const/4 v14, 0x0

    .line 1706
    :cond_279
    return-object v30

    .line 1329
    :cond_27a
    :try_start_27a
    sget-object v4, Lcom/localytics/android/Constants;->CLOSE_EVENT:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_594

    .line 1331
    const-string v4, "dt"

    const-string v5, "c"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1332
    const-string v4, "u"

    const-string v5, "uuid"

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1333
    const-string v4, "su"

    move-object/from16 v0, v30

    move-object/from16 v1, v33

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1334
    const-string v4, "ss"

    move-wide/from16 v0, v36

    long-to-double v6, v0

    const-wide v8, 0x408f400000000000L

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1335
    const-string v4, "ct"

    const-string v5, "wall_time"

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    long-to-double v6, v6

    const-wide v8, 0x408f400000000000L

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_2d7
    .catchall {:try_start_27a .. :try_end_2d7} :catchall_1ab

    .line 1341
    const/16 v32, 0x0

    .line 1344
    .local v32, "sessionCursor":Landroid/database/Cursor;
    :try_start_2d9
    const-string v5, "sessions"

    const/4 v4, 0x1

    new-array v6, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v7, "session_start_wall_time"

    aput-object v7, v6, v4

    const-string v4, "%s = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "_id"

    aput-object v9, v7, v8

    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v4, 0x1

    new-array v8, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v9, "session_key_ref"

    invoke-interface {v14, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v14, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v42

    invoke-static/range {v42 .. v43}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    const/4 v9, 0x0

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v32

    .line 1347
    invoke-interface/range {v32 .. v32}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_3b1

    .line 1349
    const-string v4, "ctl"

    const-string v5, "wall_time"

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    long-to-double v6, v6

    const-wide v8, 0x408f400000000000L

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    const-string v5, "session_start_wall_time"

    move-object/from16 v0, v32

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v32

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    long-to-double v8, v8

    const-wide v42, 0x408f400000000000L

    div-double v8, v8, v42

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    sub-long/2addr v6, v8

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_349
    .catchall {:try_start_2d9 .. :try_end_349} :catchall_3b9

    .line 1362
    if-eqz v32, :cond_350

    .line 1364
    :try_start_34b
    invoke-interface/range {v32 .. v32}, Landroid/database/Cursor;->close()V
    :try_end_34e
    .catchall {:try_start_34b .. :try_end_34e} :catchall_1ab

    .line 1365
    const/16 v32, 0x0

    .line 1372
    :cond_350
    const/16 v18, 0x0

    .line 1375
    .local v18, "eventHistoryCursor":Landroid/database/Cursor;
    :try_start_352
    const-string v5, "event_history"

    const/4 v4, 0x1

    new-array v6, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v7, "name"

    aput-object v7, v6, v4

    const-string v4, "%s = ? AND %s = ?"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "session_key_ref"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "type"

    aput-object v9, v7, v8

    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v4, 0x2

    new-array v8, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    const/4 v4, 0x1

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    const-string v9, "_id"

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v18

    .line 1378
    new-instance v31, Lorg/json/JSONArray;

    invoke-direct/range {v31 .. v31}, Lorg/json/JSONArray;-><init>()V

    .line 1379
    .local v31, "screens":Lorg/json/JSONArray;
    :goto_38e
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_3c2

    .line 1381
    const-string v4, "name"

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_3a7
    .catchall {:try_start_352 .. :try_end_3a7} :catchall_3a8

    goto :goto_38e

    .line 1391
    .end local v31    # "screens":Lorg/json/JSONArray;
    :catchall_3a8
    move-exception v4

    if-eqz v18, :cond_3b0

    .line 1393
    :try_start_3ab
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 1394
    const/16 v18, 0x0

    :cond_3b0
    throw v4
    :try_end_3b1
    .catchall {:try_start_3ab .. :try_end_3b1} :catchall_1ab

    .line 1357
    .end local v18    # "eventHistoryCursor":Landroid/database/Cursor;
    :cond_3b1
    :try_start_3b1
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Session didn\'t exist"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_3b9
    .catchall {:try_start_3b1 .. :try_end_3b9} :catchall_3b9

    .line 1362
    :catchall_3b9
    move-exception v4

    if-eqz v32, :cond_3c1

    .line 1364
    :try_start_3bc
    invoke-interface/range {v32 .. v32}, Landroid/database/Cursor;->close()V

    .line 1365
    const/16 v32, 0x0

    :cond_3c1
    throw v4
    :try_end_3c2
    .catchall {:try_start_3bc .. :try_end_3c2} :catchall_1ab

    .line 1384
    .restart local v18    # "eventHistoryCursor":Landroid/database/Cursor;
    .restart local v31    # "screens":Lorg/json/JSONArray;
    :cond_3c2
    :try_start_3c2
    invoke-virtual/range {v31 .. v31}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lez v4, :cond_3d1

    .line 1386
    const-string v4, "fl"

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3d1
    .catchall {:try_start_3c2 .. :try_end_3d1} :catchall_3a8

    .line 1391
    :cond_3d1
    if-eqz v18, :cond_3d8

    .line 1393
    :try_start_3d3
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 1394
    const/16 v18, 0x0

    .line 1401
    :cond_3d8
    const-string v4, "event_lat"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_422

    const-string v4, "event_lng"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_422

    .line 1404
    const-string v4, "event_lat"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v24

    .line 1405
    .restart local v24    # "lat":D
    const-string v4, "event_lng"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v26

    .line 1407
    .restart local v26    # "lng":D
    const-wide/16 v4, 0x0

    cmpl-double v4, v24, v4

    if-eqz v4, :cond_422

    const-wide/16 v4, 0x0

    cmpl-double v4, v26, v4

    if-eqz v4, :cond_422

    .line 1409
    const-string v4, "lat"

    move-object/from16 v0, v30

    move-wide/from16 v1, v24

    invoke-virtual {v0, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1410
    const-string v4, "lng"

    move-object/from16 v0, v30

    move-wide/from16 v1, v26

    invoke-virtual {v0, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1414
    .end local v24    # "lat":D
    .end local v26    # "lng":D
    :cond_422
    const-string v4, "customer_id"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_452

    .line 1416
    const-string v4, "customer_id"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 1417
    .restart local v15    # "customerID":Ljava/lang/String;
    const-string v4, "user_type"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v39

    .line 1419
    .restart local v39    # "userType":Ljava/lang/String;
    const-string v4, "cid"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1420
    const-string v4, "utp"

    move-object/from16 v0, v30

    move-object/from16 v1, v39

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1423
    .end local v15    # "customerID":Ljava/lang/String;
    .end local v39    # "userType":Ljava/lang/String;
    :cond_452
    const-string v4, "ids"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_476

    .line 1425
    const-string v4, "ids"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    .line 1426
    .restart local v20    # "ids":Ljava/lang/String;
    const-string v4, "ids"

    new-instance v5, Lorg/json/JSONObject;

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_476
    .catchall {:try_start_3d3 .. :try_end_476} :catchall_1ab

    .line 1432
    .end local v20    # "ids":Ljava/lang/String;
    :cond_476
    const/4 v11, 0x0

    .line 1435
    .restart local v11    # "attributesCursor":Landroid/database/Cursor;
    :try_start_477
    const-string v5, "attributes"

    const/4 v6, 0x0

    const-string v4, "%s = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "events_key_ref"

    aput-object v9, v7, v8

    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v4, 0x1

    new-array v8, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    const/4 v9, 0x0

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 1437
    const-string v4, "attribute_key"

    invoke-interface {v11, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    .line 1438
    .restart local v22    # "keyColumn":I
    const-string v4, "attribute_value"

    invoke-interface {v11, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v41

    .line 1439
    .restart local v41    # "valueColumn":I
    :cond_4a5
    :goto_4a5
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_58c

    .line 1441
    move/from16 v0, v22

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 1442
    .restart local v21    # "key":Ljava/lang/String;
    move/from16 v0, v41

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 1444
    .restart local v40    # "value":Ljava/lang/String;
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4d3

    .line 1446
    const-string v4, "c0"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4ca
    .catchall {:try_start_477 .. :try_end_4ca} :catchall_4cb

    goto :goto_4a5

    .line 1488
    .end local v21    # "key":Ljava/lang/String;
    .end local v22    # "keyColumn":I
    .end local v40    # "value":Ljava/lang/String;
    .end local v41    # "valueColumn":I
    :catchall_4cb
    move-exception v4

    if-eqz v11, :cond_4d2

    .line 1490
    :try_start_4ce
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 1491
    const/4 v11, 0x0

    :cond_4d2
    throw v4
    :try_end_4d3
    .catchall {:try_start_4ce .. :try_end_4d3} :catchall_1ab

    .line 1448
    .restart local v21    # "key":Ljava/lang/String;
    .restart local v22    # "keyColumn":I
    .restart local v40    # "value":Ljava/lang/String;
    .restart local v41    # "valueColumn":I
    :cond_4d3
    :try_start_4d3
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e7

    .line 1450
    const-string v4, "c1"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_4a5

    .line 1452
    :cond_4e7
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4fb

    .line 1454
    const-string v4, "c2"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_4a5

    .line 1456
    :cond_4fb
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50f

    .line 1458
    const-string v4, "c3"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_4a5

    .line 1460
    :cond_50f
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_523

    .line 1462
    const-string v4, "c4"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_4a5

    .line 1464
    :cond_523
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_538

    .line 1466
    const-string v4, "c5"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_4a5

    .line 1468
    :cond_538
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_54d

    .line 1470
    const-string v4, "c6"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_4a5

    .line 1472
    :cond_54d
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_562

    .line 1474
    const-string v4, "c7"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_4a5

    .line 1476
    :cond_562
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_577

    .line 1478
    const-string v4, "c8"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_4a5

    .line 1480
    :cond_577
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4a5

    .line 1482
    const-string v4, "c9"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_58a
    .catchall {:try_start_4d3 .. :try_end_58a} :catchall_4cb

    goto/16 :goto_4a5

    .line 1488
    .end local v21    # "key":Ljava/lang/String;
    .end local v40    # "value":Ljava/lang/String;
    :cond_58c
    if-eqz v11, :cond_273

    .line 1490
    :try_start_58e
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 1491
    const/4 v11, 0x0

    goto/16 :goto_273

    .line 1495
    .end local v11    # "attributesCursor":Landroid/database/Cursor;
    .end local v18    # "eventHistoryCursor":Landroid/database/Cursor;
    .end local v22    # "keyColumn":I
    .end local v31    # "screens":Lorg/json/JSONArray;
    .end local v32    # "sessionCursor":Landroid/database/Cursor;
    .end local v41    # "valueColumn":I
    :cond_594
    sget-object v4, Lcom/localytics/android/Constants;->OPT_IN_EVENT:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5a8

    sget-object v4, Lcom/localytics/android/Constants;->OPT_OUT_EVENT:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5f6

    .line 1497
    :cond_5a8
    const-string v4, "dt"

    const-string v5, "o"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1498
    const-string v4, "u"

    move-object/from16 v0, v30

    move-object/from16 v1, p6

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1499
    const-string v5, "out"

    sget-object v4, Lcom/localytics/android/Constants;->OPT_OUT_EVENT:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5ef

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_5cc
    move-object/from16 v0, v30

    invoke-virtual {v0, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1500
    const-string v4, "ct"

    const-string v5, "wall_time"

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    long-to-double v6, v6

    const-wide v8, 0x408f400000000000L

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto/16 :goto_273

    .line 1499
    :cond_5ef
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_5cc

    .line 1503
    :cond_5f6
    sget-object v4, Lcom/localytics/android/Constants;->FLOW_EVENT:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6ff

    .line 1505
    const-string v4, "dt"

    const-string v5, "f"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1506
    const-string v4, "u"

    const-string v5, "uuid"

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1507
    const-string v4, "ss"

    move-wide/from16 v0, v36

    long-to-double v6, v0

    const-wide v8, 0x408f400000000000L

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_62e
    .catchall {:try_start_58e .. :try_end_62e} :catchall_1ab

    .line 1516
    const/16 v18, 0x0

    .line 1519
    .restart local v18    # "eventHistoryCursor":Landroid/database/Cursor;
    :try_start_630
    const-string v5, "event_history"

    const/4 v4, 0x3

    new-array v6, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v7, "type"

    aput-object v7, v6, v4

    const/4 v4, 0x1

    const-string v7, "processed_in_blob"

    aput-object v7, v6, v4

    const/4 v4, 0x2

    const-string v7, "name"

    aput-object v7, v6, v4

    const-string v4, "%s = ? AND %s <= ?"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "session_key_ref"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "processed_in_blob"

    aput-object v9, v7, v8

    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v4, 0x2

    new-array v8, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    const/4 v4, 0x1

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    const-string v9, "_id"

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v18

    .line 1525
    new-instance v28, Lorg/json/JSONArray;

    invoke-direct/range {v28 .. v28}, Lorg/json/JSONArray;-><init>()V

    .line 1526
    .local v28, "newScreens":Lorg/json/JSONArray;
    new-instance v29, Lorg/json/JSONArray;

    invoke-direct/range {v29 .. v29}, Lorg/json/JSONArray;-><init>()V

    .line 1527
    .local v29, "oldScreens":Lorg/json/JSONArray;
    :goto_67a
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_6e4

    .line 1529
    const-string v4, "name"

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 1531
    .local v23, "name":Ljava/lang/String;
    const-string v4, "type"

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    if-nez v4, :cond_6ce

    .line 1533
    const-string v38, "e"

    .line 1540
    .local v38, "type":Ljava/lang/String;
    :goto_6a0
    const-string v4, "processed_in_blob"

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v18

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    cmp-long v4, p4, v4

    if-nez v4, :cond_6d1

    .line 1542
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v0, v38

    move-object/from16 v1, v23

    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_6c4
    .catchall {:try_start_630 .. :try_end_6c4} :catchall_6c5

    goto :goto_67a

    .line 1555
    .end local v23    # "name":Ljava/lang/String;
    .end local v28    # "newScreens":Lorg/json/JSONArray;
    .end local v29    # "oldScreens":Lorg/json/JSONArray;
    .end local v38    # "type":Ljava/lang/String;
    :catchall_6c5
    move-exception v4

    if-eqz v18, :cond_6cd

    .line 1557
    :try_start_6c8
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 1558
    const/16 v18, 0x0

    :cond_6cd
    throw v4
    :try_end_6ce
    .catchall {:try_start_6c8 .. :try_end_6ce} :catchall_1ab

    .line 1537
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v28    # "newScreens":Lorg/json/JSONArray;
    .restart local v29    # "oldScreens":Lorg/json/JSONArray;
    :cond_6ce
    :try_start_6ce
    const-string v38, "s"

    .restart local v38    # "type":Ljava/lang/String;
    goto :goto_6a0

    .line 1546
    :cond_6d1
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v0, v38

    move-object/from16 v1, v23

    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_67a

    .line 1550
    .end local v23    # "name":Ljava/lang/String;
    .end local v38    # "type":Ljava/lang/String;
    :cond_6e4
    const-string v4, "nw"

    move-object/from16 v0, v30

    move-object/from16 v1, v28

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1551
    const-string v4, "od"

    move-object/from16 v0, v30

    move-object/from16 v1, v29

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6f6
    .catchall {:try_start_6ce .. :try_end_6f6} :catchall_6c5

    .line 1555
    if-eqz v18, :cond_273

    .line 1557
    :try_start_6f8
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 1558
    const/16 v18, 0x0

    goto/16 :goto_273

    .line 1568
    .end local v18    # "eventHistoryCursor":Landroid/database/Cursor;
    .end local v28    # "newScreens":Lorg/json/JSONArray;
    .end local v29    # "oldScreens":Lorg/json/JSONArray;
    :cond_6ff
    const-string v4, "dt"

    const-string v5, "e"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1569
    const-string v4, "ct"

    const-string v5, "wall_time"

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    long-to-double v6, v6

    const-wide v8, 0x408f400000000000L

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1571
    const-string v4, "u"

    const-string v5, "uuid"

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1572
    const-string v4, "su"

    move-object/from16 v0, v30

    move-object/from16 v1, v33

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1573
    const-string v4, "n"

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1578
    const-string v4, "clv_increase"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 1579
    .local v12, "clv":J
    const-wide/16 v4, 0x0

    cmp-long v4, v12, v4

    if-eqz v4, :cond_770

    .line 1581
    const-string v4, "v"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 1587
    :cond_770
    const-string v4, "event_lat"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_7ba

    const-string v4, "event_lng"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_7ba

    .line 1590
    const-string v4, "event_lat"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v24

    .line 1591
    .restart local v24    # "lat":D
    const-string v4, "event_lng"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v26

    .line 1593
    .restart local v26    # "lng":D
    const-wide/16 v4, 0x0

    cmpl-double v4, v24, v4

    if-eqz v4, :cond_7ba

    const-wide/16 v4, 0x0

    cmpl-double v4, v26, v4

    if-eqz v4, :cond_7ba

    .line 1595
    const-string v4, "lat"

    move-object/from16 v0, v30

    move-wide/from16 v1, v24

    invoke-virtual {v0, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1596
    const-string v4, "lng"

    move-object/from16 v0, v30

    move-wide/from16 v1, v26

    invoke-virtual {v0, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 1600
    .end local v24    # "lat":D
    .end local v26    # "lng":D
    :cond_7ba
    const-string v4, "customer_id"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_7ea

    .line 1602
    const-string v4, "customer_id"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 1603
    .restart local v15    # "customerID":Ljava/lang/String;
    const-string v4, "user_type"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v39

    .line 1605
    .restart local v39    # "userType":Ljava/lang/String;
    const-string v4, "cid"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1606
    const-string v4, "utp"

    move-object/from16 v0, v30

    move-object/from16 v1, v39

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1609
    .end local v15    # "customerID":Ljava/lang/String;
    .end local v39    # "userType":Ljava/lang/String;
    :cond_7ea
    const-string v4, "ids"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_80e

    .line 1611
    const-string v4, "ids"

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    .line 1612
    .restart local v20    # "ids":Ljava/lang/String;
    const-string v4, "ids"

    new-instance v5, Lorg/json/JSONObject;

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_80e
    .catchall {:try_start_6f8 .. :try_end_80e} :catchall_1ab

    .line 1618
    .end local v20    # "ids":Ljava/lang/String;
    :cond_80e
    const/4 v11, 0x0

    .line 1621
    .restart local v11    # "attributesCursor":Landroid/database/Cursor;
    :try_start_80f
    const-string v5, "attributes"

    const/4 v6, 0x0

    const-string v4, "%s = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "events_key_ref"

    aput-object v9, v7, v8

    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v4, 0x1

    new-array v8, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    const/4 v9, 0x0

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v9}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 1623
    const-string v4, "attribute_key"

    invoke-interface {v11, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    .line 1624
    .restart local v22    # "keyColumn":I
    const-string v4, "attribute_value"

    invoke-interface {v11, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v41

    .line 1625
    .restart local v41    # "valueColumn":I
    :cond_83d
    :goto_83d
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_924

    .line 1627
    move/from16 v0, v22

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 1628
    .restart local v21    # "key":Ljava/lang/String;
    move/from16 v0, v41

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 1630
    .restart local v40    # "value":Ljava/lang/String;
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_86b

    .line 1632
    const-string v4, "c0"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_862
    .catchall {:try_start_80f .. :try_end_862} :catchall_863

    goto :goto_83d

    .line 1674
    .end local v21    # "key":Ljava/lang/String;
    .end local v22    # "keyColumn":I
    .end local v40    # "value":Ljava/lang/String;
    .end local v41    # "valueColumn":I
    :catchall_863
    move-exception v4

    if-eqz v11, :cond_86a

    .line 1676
    :try_start_866
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 1677
    const/4 v11, 0x0

    :cond_86a
    throw v4
    :try_end_86b
    .catchall {:try_start_866 .. :try_end_86b} :catchall_1ab

    .line 1634
    .restart local v21    # "key":Ljava/lang/String;
    .restart local v22    # "keyColumn":I
    .restart local v40    # "value":Ljava/lang/String;
    .restart local v41    # "valueColumn":I
    :cond_86b
    :try_start_86b
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_87f

    .line 1636
    const-string v4, "c1"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_83d

    .line 1638
    :cond_87f
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_893

    .line 1640
    const-string v4, "c2"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_83d

    .line 1642
    :cond_893
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8a7

    .line 1644
    const-string v4, "c3"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_83d

    .line 1646
    :cond_8a7
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8bb

    .line 1648
    const-string v4, "c4"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_83d

    .line 1650
    :cond_8bb
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8d0

    .line 1652
    const-string v4, "c5"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_83d

    .line 1654
    :cond_8d0
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8e5

    .line 1656
    const-string v4, "c6"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_83d

    .line 1658
    :cond_8e5
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8fa

    .line 1660
    const-string v4, "c7"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_83d

    .line 1662
    :cond_8fa
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_90f

    .line 1664
    const-string v4, "c8"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_83d

    .line 1666
    :cond_90f
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_83d

    .line 1668
    const-string v4, "c9"

    move-object/from16 v0, v30

    move-object/from16 v1, v40

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_922
    .catchall {:try_start_86b .. :try_end_922} :catchall_863

    goto/16 :goto_83d

    .line 1674
    .end local v21    # "key":Ljava/lang/String;
    .end local v40    # "value":Ljava/lang/String;
    :cond_924
    if-eqz v11, :cond_92a

    .line 1676
    :try_start_926
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 1677
    const/4 v11, 0x0

    .line 1681
    :cond_92a
    invoke-static/range {p0 .. p3}, Lcom/localytics/android/UploadHandler;->convertAttributesToJson(Lcom/localytics/android/LocalyticsProvider;Landroid/content/Context;J)Lorg/json/JSONObject;

    move-result-object v10

    .line 1683
    .local v10, "attributes":Lorg/json/JSONObject;
    if-eqz v10, :cond_273

    .line 1685
    const-string v4, "attrs"

    move-object/from16 v0, v30

    invoke-virtual {v0, v4, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_273

    .line 1694
    .end local v10    # "attributes":Lorg/json/JSONObject;
    .end local v11    # "attributesCursor":Landroid/database/Cursor;
    .end local v12    # "clv":J
    .end local v19    # "eventName":Ljava/lang/String;
    .end local v22    # "keyColumn":I
    .end local v33    # "sessionUuid":Ljava/lang/String;
    .end local v34    # "sessionId":J
    .end local v36    # "sessionStartTime":J
    .end local v41    # "valueColumn":I
    :cond_939
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4}, Ljava/lang/RuntimeException;-><init>()V

    throw v4
    :try_end_93f
    .catchall {:try_start_926 .. :try_end_93f} :catchall_1ab
.end method

.method static deleteBlobsAndSessions(Lcom/localytics/android/LocalyticsProvider;)V
    .registers 27
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;

    .prologue
    .line 912
    new-instance v22, Ljava/util/LinkedList;

    invoke-direct/range {v22 .. v22}, Ljava/util/LinkedList;-><init>()V

    .line 913
    .local v22, "sessionsToDelete":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/Long;>;"
    new-instance v14, Ljava/util/HashSet;

    invoke-direct {v14}, Ljava/util/HashSet;-><init>()V

    .line 915
    .local v14, "blobsToDelete":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Long;>;"
    const/4 v11, 0x0

    .line 918
    .local v11, "blobEvents":Landroid/database/Cursor;
    :try_start_b
    const-string v3, "upload_blob_events"

    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v5, "_id"

    aput-object v5, v4, v2

    const/4 v2, 0x1

    const-string v5, "events_key_ref"

    aput-object v5, v4, v2

    const/4 v2, 0x2

    const-string v5, "upload_blobs_key_ref"

    aput-object v5, v4, v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 924
    const-string v2, "upload_blobs_key_ref"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v23

    .line 925
    .local v23, "uploadBlobIdColumn":I
    const-string v2, "_id"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    .line 926
    .local v10, "blobEventIdColumn":I
    const-string v2, "events_key_ref"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v18

    .line 927
    .local v18, "eventIdColumn":I
    :goto_3a
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_142

    .line 929
    move/from16 v0, v23

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 930
    .local v12, "blobId":J
    invoke-interface {v11, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 931
    .local v8, "blobEventId":J
    move/from16 v0, v18

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 934
    .local v16, "eventId":J
    const-string v2, "upload_blob_events"

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "_id"

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3, v4}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 939
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 942
    const-string v2, "attributes"

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "events_key_ref"

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3, v4}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_95
    .catchall {:try_start_b .. :try_end_95} :catchall_132

    .line 947
    const/4 v15, 0x0

    .line 950
    .local v15, "eventCursor":Landroid/database/Cursor;
    :try_start_96
    const-string v3, "events"

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v5, "session_key_ref"

    aput-object v5, v4, v2

    const-string v2, "%s = ? AND %s = ?"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "event_name"

    aput-object v7, v5, v6

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v2, 0x2

    new-array v6, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    const/4 v2, 0x1

    sget-object v7, Lcom/localytics/android/Constants;->CLOSE_EVENT:Ljava/lang/String;

    aput-object v7, v6, v2

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 956
    invoke-interface {v15}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_10b

    .line 958
    const-string v2, "session_key_ref"

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    .line 960
    .local v20, "sessionId":J
    const-string v2, "event_history"

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "session_key_ref"

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3, v4}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 963
    const-string v2, "session_key_ref"

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_10b
    .catchall {:try_start_96 .. :try_end_10b} :catchall_13a

    .line 968
    .end local v20    # "sessionId":J
    :cond_10b
    if-eqz v15, :cond_111

    .line 970
    :try_start_10d
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 971
    const/4 v15, 0x0

    .line 976
    :cond_111
    const-string v2, "events"

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "_id"

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3, v4}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_130
    .catchall {:try_start_10d .. :try_end_130} :catchall_132

    goto/16 :goto_3a

    .line 981
    .end local v8    # "blobEventId":J
    .end local v10    # "blobEventIdColumn":I
    .end local v12    # "blobId":J
    .end local v15    # "eventCursor":Landroid/database/Cursor;
    .end local v16    # "eventId":J
    .end local v18    # "eventIdColumn":I
    .end local v23    # "uploadBlobIdColumn":I
    :catchall_132
    move-exception v2

    if-eqz v11, :cond_139

    .line 983
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 984
    const/4 v11, 0x0

    :cond_139
    throw v2

    .line 968
    .restart local v8    # "blobEventId":J
    .restart local v10    # "blobEventIdColumn":I
    .restart local v12    # "blobId":J
    .restart local v15    # "eventCursor":Landroid/database/Cursor;
    .restart local v16    # "eventId":J
    .restart local v18    # "eventIdColumn":I
    .restart local v23    # "uploadBlobIdColumn":I
    :catchall_13a
    move-exception v2

    if-eqz v15, :cond_141

    .line 970
    :try_start_13d
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 971
    const/4 v15, 0x0

    :cond_141
    throw v2
    :try_end_142
    .catchall {:try_start_13d .. :try_end_142} :catchall_132

    .line 981
    .end local v8    # "blobEventId":J
    .end local v12    # "blobId":J
    .end local v15    # "eventCursor":Landroid/database/Cursor;
    .end local v16    # "eventId":J
    :cond_142
    if-eqz v11, :cond_148

    .line 983
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 984
    const/4 v11, 0x0

    .line 989
    :cond_148
    invoke-virtual {v14}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .local v19, "i$":Ljava/util/Iterator;
    :goto_14c
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17c

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v24

    .line 991
    .local v24, "x":J
    const-string v2, "upload_blobs"

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "_id"

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3, v4}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_14c

    .line 995
    .end local v24    # "x":J
    :cond_17c
    invoke-virtual/range {v22 .. v22}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_180
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b0

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v24

    .line 997
    .restart local v24    # "x":J
    const-string v2, "sessions"

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "_id"

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3, v4}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_180

    .line 999
    .end local v24    # "x":J
    :cond_1b0
    return-void
.end method

.method static deleteProfileAttribute(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/StringBuilder;)V
    .registers 7
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "rowsToDelete"    # Ljava/lang/StringBuilder;

    .prologue
    .line 894
    const-string v0, "profile"

    const-string v1, "%s IN (%s)"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 895
    return-void
.end method

.method private getApiKey()Ljava/lang/String;
    .registers 4

    .prologue
    .line 169
    iget-object v0, p0, Lcom/localytics/android/UploadHandler;->mApiKey:Ljava/lang/String;

    .line 170
    .local v0, "apiKey":Ljava/lang/String;
    iget-object v2, p0, Lcom/localytics/android/UploadHandler;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/localytics/android/DatapointHelper;->getLocalyticsRollupKeyOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 171
    .local v1, "rollupKey":Ljava/lang/String;
    if-eqz v1, :cond_11

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_11

    .line 173
    move-object v0, v1

    .line 176
    :cond_11
    return-object v0
.end method

.method static getApiKeyCreationTime(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)J
    .registers 9
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1011
    const/4 v6, 0x0

    .line 1014
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "api_keys"

    const/4 v2, 0x0

    const-string v0, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "api_key"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1016
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 1018
    const-string v0, "created_time"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    long-to-float v0, v0

    const/high16 v1, 0x447a0000

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I
    :try_end_35
    .catchall {:try_start_1 .. :try_end_35} :catchall_46

    move-result v0

    int-to-long v0, v0

    .line 1028
    if-eqz v6, :cond_3d

    .line 1030
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1031
    const/4 v6, 0x0

    :cond_3d
    return-wide v0

    .line 1024
    :cond_3e
    :try_start_3e
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "API key entry couldn\'t be found"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_46
    .catchall {:try_start_3e .. :try_end_46} :catchall_46

    .line 1028
    :catchall_46
    move-exception v0

    if-eqz v6, :cond_4d

    .line 1030
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1031
    const/4 v6, 0x0

    :cond_4d
    throw v0
.end method

.method static getAttributesFromSession(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;J)Lorg/json/JSONObject;
    .registers 22
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "apiKey"    # Ljava/lang/String;
    .param p2, "sessionId"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1048
    const/4 v8, 0x0

    .line 1051
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v3, "sessions"

    const/4 v4, 0x0

    const-string v2, "%s = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "_id"

    aput-object v7, v5, v6

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v2, 0x1

    new-array v6, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1053
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_213

    .line 1055
    new-instance v17, Lorg/json/JSONObject;

    invoke-direct/range {v17 .. v17}, Lorg/json/JSONObject;-><init>()V

    .line 1058
    .local v17, "result":Lorg/json/JSONObject;
    const-string v2, "av"

    const-string v3, "app_version"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1059
    const-string v2, "dac"

    const-string v3, "network_type"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1060
    const-string v2, "device_android_id_hash"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1061
    .local v9, "deviceID":Ljava/lang/String;
    const-string v2, ""

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_69

    .line 1062
    const-string v2, "du"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1064
    :cond_69
    const-string v2, "dc"

    const-string v3, "device_country"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1065
    const-string v2, "dma"

    const-string v3, "device_manufacturer"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1066
    const-string v2, "dmo"

    const-string v3, "device_model"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1067
    const-string v2, "dov"

    const-string v3, "android_version"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1068
    const-string v2, "dp"

    const-string v3, "Android"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1069
    const-string v3, "dms"

    const-string v2, "device_serial_number_hash"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v2

    if-eqz v2, :cond_1ef

    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :goto_c6
    move-object/from16 v0, v17

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1071
    const-string v2, "dsdk"

    const-string v3, "android_sdk"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1072
    const-string v2, "au"

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1073
    const-string v2, "lv"

    const-string v3, "localytics_library_version"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1074
    const-string v2, "dt"

    const-string v3, "a"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1075
    const-string v3, "caid"

    const-string v2, "device_android_id"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v2

    if-eqz v2, :cond_1fb

    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :goto_10f
    move-object/from16 v0, v17

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1077
    const-string v3, "gcadid"

    const-string v2, "device_advertising_id"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v2

    if-eqz v2, :cond_207

    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :goto_124
    move-object/from16 v0, v17

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1081
    const-string v2, "iu"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 1082
    .local v13, "installationID":Ljava/lang/String;
    if-eqz v13, :cond_13c

    .line 1084
    const-string v2, "iu"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1086
    :cond_13c
    const-string v2, "dlc"

    const-string v3, "locale_country"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1087
    const-string v2, "dll"

    const-string v3, "locale_language"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1088
    const-string v2, "nca"

    const-string v3, "network_carrier"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1089
    const-string v2, "nc"

    const-string v3, "network_country"

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1092
    const-string v2, "fb_attribution"

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/localytics/android/UploadHandler;->getStringFromAppInfo(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1093
    .local v10, "fbAttribution":Ljava/lang/String;
    if-eqz v10, :cond_191

    .line 1095
    const-string v2, "fbat"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1098
    :cond_191
    const-string v2, "play_attribution"

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/localytics/android/UploadHandler;->getStringFromAppInfo(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1099
    .local v15, "playAttribution":Ljava/lang/String;
    if-eqz v15, :cond_1a2

    .line 1101
    const-string v2, "aurl"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1104
    :cond_1a2
    const-string v2, "registration_id"

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/localytics/android/UploadHandler;->getStringFromAppInfo(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 1105
    .local v16, "registrationId":Ljava/lang/String;
    if-eqz v16, :cond_1b5

    .line 1107
    const-string v2, "push"

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1110
    :cond_1b5
    const-string v2, "first_android_id"

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/localytics/android/UploadHandler;->getStringFromAppInfo(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1111
    .local v12, "firstAndroidId":Ljava/lang/String;
    if-eqz v12, :cond_1c6

    .line 1113
    const-string v2, "aid"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1116
    :cond_1c6
    const-string v2, "first_advertising_id"

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/localytics/android/UploadHandler;->getStringFromAppInfo(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1117
    .local v11, "firstAdvertisingId":Ljava/lang/String;
    if-eqz v11, :cond_1d7

    .line 1119
    const-string v2, "gadid"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1122
    :cond_1d7
    const-string v2, "package_name"

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/localytics/android/UploadHandler;->getStringFromAppInfo(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1123
    .local v14, "packageName":Ljava/lang/String;
    if-eqz v14, :cond_1e8

    .line 1125
    const-string v2, "pkg"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1e8
    .catchall {:try_start_1 .. :try_end_1e8} :catchall_21b

    .line 1135
    :cond_1e8
    if-eqz v8, :cond_1ee

    .line 1137
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1138
    const/4 v8, 0x0

    :cond_1ee
    return-object v17

    .line 1069
    .end local v10    # "fbAttribution":Ljava/lang/String;
    .end local v11    # "firstAdvertisingId":Ljava/lang/String;
    .end local v12    # "firstAndroidId":Ljava/lang/String;
    .end local v13    # "installationID":Ljava/lang/String;
    .end local v14    # "packageName":Ljava/lang/String;
    .end local v15    # "playAttribution":Ljava/lang/String;
    .end local v16    # "registrationId":Ljava/lang/String;
    :cond_1ef
    :try_start_1ef
    const-string v2, "device_serial_number_hash"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_c6

    .line 1075
    :cond_1fb
    const-string v2, "device_android_id"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_10f

    .line 1077
    :cond_207
    const-string v2, "device_advertising_id"

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_124

    .line 1131
    .end local v9    # "deviceID":Ljava/lang/String;
    .end local v17    # "result":Lorg/json/JSONObject;
    :cond_213
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "No session exists"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_21b
    .catchall {:try_start_1ef .. :try_end_21b} :catchall_21b

    .line 1135
    :catchall_21b
    move-exception v2

    if-eqz v8, :cond_222

    .line 1137
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1138
    const/4 v8, 0x0

    :cond_222
    throw v2
.end method

.method static getCustomerID(Lcom/localytics/android/LocalyticsProvider;)Ljava/lang/String;
    .registers 3
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;

    .prologue
    .line 889
    invoke-virtual {p0}, Lcom/localytics/android/LocalyticsProvider;->getUserIdAndType()Ljava/util/Map;

    move-result-object v0

    const-string v1, "id"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method static getElapsedTimeSinceLastSession(Lcom/localytics/android/LocalyticsProvider;J)J
    .registers 10
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "sessionId"    # J

    .prologue
    .line 1856
    const/4 v6, 0x0

    .line 1859
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "sessions"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "elapsed"

    aput-object v3, v2, v0

    const-string v0, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1862
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 1864
    const-string v0, "elapsed"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_38
    .catchall {:try_start_1 .. :try_end_38} :catchall_46

    move-result-wide v0

    .line 1874
    if-eqz v6, :cond_3f

    .line 1876
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1877
    const/4 v6, 0x0

    :cond_3f
    return-wide v0

    .line 1870
    :cond_40
    :try_start_40
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
    :try_end_46
    .catchall {:try_start_40 .. :try_end_46} :catchall_46

    .line 1874
    :catchall_46
    move-exception v0

    if-eqz v6, :cond_4d

    .line 1876
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1877
    const/4 v6, 0x0

    :cond_4d
    throw v0
.end method

.method static getIdentifiers(Lcom/localytics/android/LocalyticsProvider;)Lorg/json/JSONObject;
    .registers 9
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1152
    const/4 v6, 0x0

    .line 1155
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "identifiers"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1157
    const/4 v7, 0x0

    .line 1159
    .local v7, "result":Lorg/json/JSONObject;
    :goto_d
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 1161
    if-nez v7, :cond_1a

    .line 1163
    new-instance v7, Lorg/json/JSONObject;

    .end local v7    # "result":Lorg/json/JSONObject;
    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 1166
    .restart local v7    # "result":Lorg/json/JSONObject;
    :cond_1a
    const-string v0, "key"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "value"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_32

    goto :goto_d

    .line 1173
    .end local v7    # "result":Lorg/json/JSONObject;
    :catchall_32
    move-exception v0

    if-eqz v6, :cond_39

    .line 1175
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1176
    const/4 v6, 0x0

    :cond_39
    throw v0

    .line 1173
    .restart local v7    # "result":Lorg/json/JSONObject;
    :cond_3a
    if-eqz v6, :cond_40

    .line 1175
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1176
    const/4 v6, 0x0

    :cond_40
    return-object v7
.end method

.method static getProfileAttributes(Lcom/localytics/android/LocalyticsProvider;)Ljava/util/TreeMap;
    .registers 17
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/localytics/android/LocalyticsProvider;",
            ")",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 814
    new-instance v13, Ljava/util/TreeMap;

    invoke-direct {v13}, Ljava/util/TreeMap;-><init>()V

    .line 815
    .local v13, "profileAttributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;>;"
    const/4 v8, 0x0

    .line 818
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_6
    const-string v1, "profile"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "_id ASC"

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 820
    :cond_13
    :goto_13
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_a5

    .line 822
    const-string v0, "action"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 823
    .local v12, "operation":I
    sget-object v0, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;->SET_ATTRIBUTE:Lcom/localytics/android/LocalyticsSession$ProfileDbAction;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsSession$ProfileDbAction;->ordinal()I

    move-result v0

    if-ne v12, v0, :cond_13

    .line 825
    const-string v0, "customer_id"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 826
    .local v9, "customerID":Ljava/lang/String;
    const-string v0, "attribute"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 827
    .local v7, "attributeString":Ljava/lang/String;
    const-string v0, "_id"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    .line 829
    .local v14, "rowID":Ljava/lang/String;
    invoke-virtual {v13, v9}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;
    :try_end_53
    .catchall {:try_start_6 .. :try_end_53} :catchall_68

    .line 833
    .local v15, "tupleForCustomer":Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;
    :try_start_53
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_58
    .catch Lorg/json/JSONException; {:try_start_53 .. :try_end_58} :catch_70
    .catchall {:try_start_53 .. :try_end_58} :catchall_68

    .line 844
    .local v6, "attributeJSON":Lorg/json/JSONObject;
    :cond_58
    :goto_58
    if-nez v15, :cond_82

    .line 846
    :try_start_5a
    new-instance v15, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;

    .end local v15    # "tupleForCustomer":Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {v15, v6, v0}, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;-><init>(Lorg/json/JSONObject;Ljava/lang/StringBuilder;)V

    .line 847
    .restart local v15    # "tupleForCustomer":Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;
    invoke-virtual {v13, v9, v15}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_67
    .catchall {:try_start_5a .. :try_end_67} :catchall_68

    goto :goto_13

    .line 865
    .end local v6    # "attributeJSON":Lorg/json/JSONObject;
    .end local v7    # "attributeString":Ljava/lang/String;
    .end local v9    # "customerID":Ljava/lang/String;
    .end local v12    # "operation":I
    .end local v14    # "rowID":Ljava/lang/String;
    .end local v15    # "tupleForCustomer":Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;
    :catchall_68
    move-exception v0

    if-eqz v8, :cond_6f

    .line 867
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 868
    const/4 v8, 0x0

    :cond_6f
    throw v0

    .line 835
    .restart local v7    # "attributeString":Ljava/lang/String;
    .restart local v9    # "customerID":Ljava/lang/String;
    .restart local v12    # "operation":I
    .restart local v14    # "rowID":Ljava/lang/String;
    .restart local v15    # "tupleForCustomer":Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;
    :catch_70
    move-exception v10

    .line 837
    .local v10, "e":Lorg/json/JSONException;
    :try_start_71
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 838
    .restart local v6    # "attributeJSON":Lorg/json/JSONObject;
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_58

    .line 840
    const-string v0, "Localytics"

    const-string v1, "Profile attribute is unreadable; data will not be uploaded but will be deleted."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_58

    .line 851
    .end local v10    # "e":Lorg/json/JSONException;
    :cond_82
    iget-object v0, v15, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;->rowIDs:Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_8d
    .catchall {:try_start_71 .. :try_end_8d} :catchall_68

    .line 854
    :try_start_8d
    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 855
    .local v11, "key":Ljava/lang/String;
    iget-object v0, v15, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;->consolidatedJSON:Lorg/json/JSONObject;

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v11, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_a0
    .catch Ljava/lang/Exception; {:try_start_8d .. :try_end_a0} :catch_a2
    .catchall {:try_start_8d .. :try_end_a0} :catchall_68

    goto/16 :goto_13

    .line 857
    .end local v11    # "key":Ljava/lang/String;
    :catch_a2
    move-exception v0

    goto/16 :goto_13

    .line 865
    .end local v6    # "attributeJSON":Lorg/json/JSONObject;
    .end local v7    # "attributeString":Ljava/lang/String;
    .end local v9    # "customerID":Ljava/lang/String;
    .end local v12    # "operation":I
    .end local v14    # "rowID":Ljava/lang/String;
    .end local v15    # "tupleForCustomer":Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;
    :cond_a5
    if-eqz v8, :cond_ab

    .line 867
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 868
    const/4 v8, 0x0

    .line 872
    :cond_ab
    return-object v13
.end method

.method static getSessionIdForBlobId(Lcom/localytics/android/LocalyticsProvider;J)J
    .registers 16
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "blobId"    # J

    .prologue
    .line 1942
    const/4 v6, 0x0

    .line 1945
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "upload_blob_events"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "events_key_ref"

    aput-object v3, v2, v0

    const-string v0, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "upload_blobs_key_ref"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1949
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_7f

    .line 1951
    const-string v0, "events_key_ref"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_38
    .catchall {:try_start_1 .. :try_end_38} :catchall_87

    move-result-wide v8

    .line 1963
    .local v8, "eventId":J
    if-eqz v6, :cond_3f

    .line 1965
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1966
    const/4 v6, 0x0

    .line 1973
    :cond_3f
    const/4 v6, 0x0

    .line 1976
    :try_start_40
    const-string v1, "events"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "session_key_ref"

    aput-object v3, v2, v0

    const-string v0, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1980
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_8f

    .line 1982
    const-string v0, "session_key_ref"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_77
    .catchall {:try_start_40 .. :try_end_77} :catchall_97

    move-result-wide v10

    .line 1994
    .local v10, "sessionId":J
    if-eqz v6, :cond_7e

    .line 1996
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1997
    const/4 v6, 0x0

    .line 2002
    :cond_7e
    return-wide v10

    .line 1958
    .end local v8    # "eventId":J
    .end local v10    # "sessionId":J
    :cond_7f
    :try_start_7f
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "No events associated with blob"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_87
    .catchall {:try_start_7f .. :try_end_87} :catchall_87

    .line 1963
    :catchall_87
    move-exception v0

    if-eqz v6, :cond_8e

    .line 1965
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1966
    const/4 v6, 0x0

    :cond_8e
    throw v0

    .line 1989
    .restart local v8    # "eventId":J
    :cond_8f
    :try_start_8f
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "No session associated with event"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_97
    .catchall {:try_start_8f .. :try_end_97} :catchall_97

    .line 1994
    :catchall_97
    move-exception v0

    if-eqz v6, :cond_9e

    .line 1996
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1997
    const/4 v6, 0x0

    :cond_9e
    throw v0
.end method

.method static getSessionIdForEventId(Lcom/localytics/android/LocalyticsProvider;J)J
    .registers 10
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "eventId"    # J

    .prologue
    .line 1718
    const/4 v6, 0x0

    .line 1721
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "events"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "session_key_ref"

    aput-object v3, v2, v0

    const-string v0, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1724
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 1726
    const-string v0, "session_key_ref"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_38
    .catchall {:try_start_1 .. :try_end_38} :catchall_46

    move-result-wide v0

    .line 1736
    if-eqz v6, :cond_3f

    .line 1738
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1739
    const/4 v6, 0x0

    :cond_3f
    return-wide v0

    .line 1732
    :cond_40
    :try_start_40
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
    :try_end_46
    .catchall {:try_start_40 .. :try_end_46} :catchall_46

    .line 1736
    :catchall_46
    move-exception v0

    if-eqz v6, :cond_4d

    .line 1738
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1739
    const/4 v6, 0x0

    :cond_4d
    throw v0
.end method

.method static getSessionStartTime(Lcom/localytics/android/LocalyticsProvider;J)J
    .registers 10
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "sessionId"    # J

    .prologue
    .line 1821
    const/4 v6, 0x0

    .line 1824
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "sessions"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "session_start_wall_time"

    aput-object v3, v2, v0

    const-string v0, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1827
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 1829
    const-string v0, "session_start_wall_time"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_38
    .catchall {:try_start_1 .. :try_end_38} :catchall_46

    move-result-wide v0

    .line 1839
    if-eqz v6, :cond_3f

    .line 1841
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1842
    const/4 v6, 0x0

    :cond_3f
    return-wide v0

    .line 1835
    :cond_40
    :try_start_40
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
    :try_end_46
    .catchall {:try_start_40 .. :try_end_46} :catchall_46

    .line 1839
    :catchall_46
    move-exception v0

    if-eqz v6, :cond_4d

    .line 1841
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1842
    const/4 v6, 0x0

    :cond_4d
    throw v0
.end method

.method static getSessionUuid(Lcom/localytics/android/LocalyticsProvider;J)Ljava/lang/String;
    .registers 10
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "sessionId"    # J

    .prologue
    .line 1753
    const/4 v6, 0x0

    .line 1756
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_1
    const-string v1, "sessions"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "uuid"

    aput-object v3, v2, v0

    const-string v0, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1759
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 1761
    const-string v0, "uuid"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_38
    .catchall {:try_start_1 .. :try_end_38} :catchall_46

    move-result-object v0

    .line 1771
    if-eqz v6, :cond_3f

    .line 1773
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1774
    const/4 v6, 0x0

    :cond_3f
    return-object v0

    .line 1767
    :cond_40
    :try_start_40
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
    :try_end_46
    .catchall {:try_start_40 .. :try_end_46} :catchall_46

    .line 1771
    :catchall_46
    move-exception v0

    if-eqz v6, :cond_4d

    .line 1773
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1774
    const/4 v6, 0x0

    :cond_4d
    throw v0
.end method

.method static getStringFromAppInfo(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 1788
    const/4 v6, 0x0

    .line 1792
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_2
    const-string v1, "info"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1794
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 1796
    invoke-interface {v6, p1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1a
    .catchall {:try_start_2 .. :try_end_1a} :catchall_2a

    move-result-object v0

    .line 1801
    if-eqz v6, :cond_21

    .line 1803
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1804
    const/4 v6, 0x0

    .line 1808
    :cond_21
    :goto_21
    return-object v0

    .line 1801
    :cond_22
    if-eqz v6, :cond_28

    .line 1803
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1804
    const/4 v6, 0x0

    :cond_28
    move-object v0, v7

    .line 1808
    goto :goto_21

    .line 1801
    :catchall_2a
    move-exception v0

    if-eqz v6, :cond_31

    .line 1803
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1804
    const/4 v6, 0x0

    :cond_31
    throw v0
.end method

.method private retrieveHttpResponse(Lcom/localytics/android/UploadHandler$UploadType;Ljava/io/InputStream;)V
    .registers 9
    .param p1, "uploadType"    # Lcom/localytics/android/UploadHandler$UploadType;
    .param p2, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 698
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    const-string v5, "UTF-8"

    invoke-direct {v4, p2, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 699
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 701
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 702
    .local v1, "line":Ljava/lang/String;
    :goto_12
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1c

    .line 704
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_12

    .line 707
    :cond_1c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 708
    .local v3, "response":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2d

    .line 710
    sget-object v4, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    if-ne p1, v4, :cond_31

    .line 712
    invoke-virtual {p0, v3}, Lcom/localytics/android/UploadHandler;->onUploadResponded(Ljava/lang/String;)V

    .line 720
    :cond_2d
    :goto_2d
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 721
    return-void

    .line 716
    :cond_31
    invoke-virtual {p0, v3}, Lcom/localytics/android/UploadHandler;->onProfileUploadResponded(Ljava/lang/String;)V

    goto :goto_2d
.end method

.method private upload(Lcom/localytics/android/UploadHandler$UploadType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 33
    .param p1, "uploadType"    # Lcom/localytics/android/UploadHandler$UploadType;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "body"    # Ljava/lang/String;
    .param p4, "installId"    # Ljava/lang/String;
    .param p5, "apiKey"    # Ljava/lang/String;
    .param p6, "customerID"    # Ljava/lang/String;

    .prologue
    .line 379
    if-nez p2, :cond_a

    .line 381
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "url cannot be null"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 384
    :cond_a
    if-nez p3, :cond_14

    .line 386
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "body cannot be null"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 390
    :cond_14
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_37

    .line 392
    sget-object v20, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_193

    .line 394
    const-string v20, "Localytics"

    const-string v21, "Upload body before compression is: %s"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object p3, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 412
    :cond_37
    :goto_37
    const/4 v9, 0x0

    .line 415
    .local v9, "gos":Ljava/util/zip/GZIPOutputStream;
    :try_start_38
    const-string v20, "UTF-8"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v13

    .line 416
    .local v13, "originalBytes":[B
    sget-object v20, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_1ac

    .line 421
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    array-length v0, v13

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v4, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 422
    .local v4, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v10, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v10, v4}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_59
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_38 .. :try_end_59} :catch_1c3
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_59} :catch_1ef
    .catchall {:try_start_38 .. :try_end_59} :catchall_21c

    .line 423
    .end local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    .local v10, "gos":Ljava/util/zip/GZIPOutputStream;
    :try_start_59
    invoke-virtual {v10, v13}, Ljava/util/zip/GZIPOutputStream;->write([B)V

    .line 424
    invoke-virtual {v10}, Ljava/util/zip/GZIPOutputStream;->finish()V

    .line 430
    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getApiLevel()I

    move-result v20

    const/16 v21, 0x13

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_6e

    .line 432
    invoke-virtual {v10}, Ljava/util/zip/GZIPOutputStream;->flush()V

    .line 435
    :cond_6e
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_71
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_59 .. :try_end_71} :catch_447
    .catch Ljava/io/IOException; {:try_start_59 .. :try_end_71} :catch_443
    .catchall {:try_start_59 .. :try_end_71} :catchall_43f

    move-result-object v19

    .local v19, "uploadData":[B
    move-object v9, v10

    .line 460
    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v10    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    :goto_73
    if-eqz v9, :cond_79

    .line 464
    :try_start_75
    invoke-virtual {v9}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_78
    .catch Ljava/io/IOException; {:try_start_75 .. :try_end_78} :catch_1b0

    .line 465
    const/4 v9, 0x0

    .line 480
    :cond_79
    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getApiLevel()I

    move-result v20

    const/16 v21, 0x9

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_2db

    .line 482
    const/4 v6, 0x0

    .line 485
    .local v6, "connection":Ljava/net/HttpURLConnection;
    :try_start_86
    new-instance v20, Ljava/net/URL;

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v20

    move-object/from16 v0, v20

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v6, v0

    .line 487
    const v20, 0xea60

    move/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 488
    const v20, 0xea60

    move/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 489
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 490
    sget-object v20, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_238

    .line 492
    const-string v20, "Content-Type"

    const-string v21, "application/x-gzip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 493
    const-string v20, "Content-Encoding"

    const-string v21, "gzip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    :goto_cd
    const-string v20, "Accept-Encoding"

    const-string v21, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    const-string v20, "x-upload-time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    move-wide/from16 v0, v22

    long-to-double v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0x408f400000000000L

    div-double v22, v22, v24

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->round(D)J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 505
    const-string v20, "x-install-id"

    move-object/from16 v0, v20

    move-object/from16 v1, p4

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    const-string v20, "x-app-id"

    move-object/from16 v0, v20

    move-object/from16 v1, p5

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    const-string v20, "x-client-version"

    const-string v21, "androida_2.70"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    const-string v20, "x-app-version"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/UploadHandler;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    const-string v20, "x-customer-id"

    move-object/from16 v0, v20

    move-object/from16 v1, p6

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_13c
    .catch Ljava/net/MalformedURLException; {:try_start_86 .. :try_end_13c} :catch_245
    .catch Ljava/io/IOException; {:try_start_86 .. :try_end_13c} :catch_26b
    .catchall {:try_start_86 .. :try_end_13c} :catchall_2a2

    .line 512
    const/16 v18, 0x0

    .line 515
    .local v18, "stream":Ljava/io/OutputStream;
    :try_start_13e
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v18

    .line 517
    invoke-virtual/range {v18 .. v19}, Ljava/io/OutputStream;->write([B)V
    :try_end_145
    .catchall {:try_start_13e .. :try_end_145} :catchall_25f

    .line 521
    if-eqz v18, :cond_14f

    .line 523
    :try_start_147
    invoke-virtual/range {v18 .. v18}, Ljava/io/OutputStream;->flush()V

    .line 524
    invoke-virtual/range {v18 .. v18}, Ljava/io/OutputStream;->close()V

    .line 525
    const/16 v18, 0x0

    .line 529
    :cond_14f
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v17

    .line 531
    .local v17, "statusCode":I
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_17a

    .line 533
    sget-object v20, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_285

    .line 535
    const-string v20, "Localytics"

    const-string v21, "Upload complete with status %d"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_17a
    .catch Ljava/net/MalformedURLException; {:try_start_147 .. :try_end_17a} :catch_245
    .catch Ljava/io/IOException; {:try_start_147 .. :try_end_17a} :catch_26b
    .catchall {:try_start_147 .. :try_end_17a} :catchall_2a2

    .line 546
    :cond_17a
    :goto_17a
    const/16 v20, 0x190

    move/from16 v0, v17

    move/from16 v1, v20

    if-lt v0, v1, :cond_2aa

    const/16 v20, 0x1f3

    move/from16 v0, v17

    move/from16 v1, v20

    if-gt v0, v1, :cond_2aa

    .line 548
    const/16 v20, 0x1

    .line 584
    if-eqz v6, :cond_192

    .line 586
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 587
    const/4 v6, 0x0

    .line 688
    .end local v6    # "connection":Ljava/net/HttpURLConnection;
    .end local v13    # "originalBytes":[B
    .end local v17    # "statusCode":I
    .end local v18    # "stream":Ljava/io/OutputStream;
    .end local v19    # "uploadData":[B
    :cond_192
    :goto_192
    return v20

    .line 398
    .end local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    :cond_193
    const-string v20, "Localytics"

    const-string v21, "Profile upload body is: %s"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object p3, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_37

    .line 439
    .restart local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v13    # "originalBytes":[B
    :cond_1ac
    move-object/from16 v19, v13

    .restart local v19    # "uploadData":[B
    goto/16 :goto_73

    .line 467
    :catch_1b0
    move-exception v7

    .line 469
    .local v7, "e":Ljava/io/IOException;
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_1c0

    .line 471
    const-string v20, "Localytics"

    const-string v21, "Caught exception"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 474
    :cond_1c0
    const/16 v20, 0x0

    goto :goto_192

    .line 442
    .end local v7    # "e":Ljava/io/IOException;
    .end local v13    # "originalBytes":[B
    .end local v19    # "uploadData":[B
    :catch_1c3
    move-exception v7

    .line 444
    .local v7, "e":Ljava/io/UnsupportedEncodingException;
    :goto_1c4
    :try_start_1c4
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_1d3

    .line 446
    const-string v20, "Localytics"

    const-string v21, "UnsupportedEncodingException"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1d3
    .catchall {:try_start_1c4 .. :try_end_1d3} :catchall_21c

    .line 448
    :cond_1d3
    const/16 v20, 0x0

    .line 460
    if-eqz v9, :cond_192

    .line 464
    :try_start_1d7
    invoke-virtual {v9}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_1da
    .catch Ljava/io/IOException; {:try_start_1d7 .. :try_end_1da} :catch_1dc

    .line 465
    const/4 v9, 0x0

    goto :goto_192

    .line 467
    :catch_1dc
    move-exception v7

    .line 469
    .local v7, "e":Ljava/io/IOException;
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_1ec

    .line 471
    const-string v20, "Localytics"

    const-string v21, "Caught exception"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 474
    :cond_1ec
    const/16 v20, 0x0

    goto :goto_192

    .line 450
    .end local v7    # "e":Ljava/io/IOException;
    :catch_1ef
    move-exception v7

    .line 452
    .restart local v7    # "e":Ljava/io/IOException;
    :goto_1f0
    :try_start_1f0
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_1ff

    .line 454
    const-string v20, "Localytics"

    const-string v21, "IOException"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1ff
    .catchall {:try_start_1f0 .. :try_end_1ff} :catchall_21c

    .line 456
    :cond_1ff
    const/16 v20, 0x0

    .line 460
    if-eqz v9, :cond_192

    .line 464
    :try_start_203
    invoke-virtual {v9}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_206
    .catch Ljava/io/IOException; {:try_start_203 .. :try_end_206} :catch_208

    .line 465
    const/4 v9, 0x0

    goto :goto_192

    .line 467
    :catch_208
    move-exception v7

    .line 469
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_218

    .line 471
    const-string v20, "Localytics"

    const-string v21, "Caught exception"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 474
    :cond_218
    const/16 v20, 0x0

    goto/16 :goto_192

    .line 460
    .end local v7    # "e":Ljava/io/IOException;
    :catchall_21c
    move-exception v20

    :goto_21d
    if-eqz v9, :cond_223

    .line 464
    :try_start_21f
    invoke-virtual {v9}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_222
    .catch Ljava/io/IOException; {:try_start_21f .. :try_end_222} :catch_224

    .line 465
    const/4 v9, 0x0

    .line 474
    :cond_223
    throw v20

    .line 467
    :catch_224
    move-exception v7

    .line 469
    .restart local v7    # "e":Ljava/io/IOException;
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_234

    .line 471
    const-string v20, "Localytics"

    const-string v21, "Caught exception"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 474
    :cond_234
    const/16 v20, 0x0

    goto/16 :goto_192

    .line 497
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v6    # "connection":Ljava/net/HttpURLConnection;
    .restart local v13    # "originalBytes":[B
    .restart local v19    # "uploadData":[B
    :cond_238
    :try_start_238
    const-string v20, "Content-Type"

    const-string v21, "application/json; charset=utf-8"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v6, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_243
    .catch Ljava/net/MalformedURLException; {:try_start_238 .. :try_end_243} :catch_245
    .catch Ljava/io/IOException; {:try_start_238 .. :try_end_243} :catch_26b
    .catchall {:try_start_238 .. :try_end_243} :catchall_2a2

    goto/16 :goto_cd

    .line 564
    :catch_245
    move-exception v7

    .line 566
    .local v7, "e":Ljava/net/MalformedURLException;
    :try_start_246
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_255

    .line 568
    const-string v20, "Localytics"

    const-string v21, "ClientProtocolException"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_255
    .catchall {:try_start_246 .. :try_end_255} :catchall_2a2

    .line 571
    :cond_255
    const/16 v20, 0x0

    .line 584
    if-eqz v6, :cond_192

    .line 586
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 587
    const/4 v6, 0x0

    goto/16 :goto_192

    .line 521
    .end local v7    # "e":Ljava/net/MalformedURLException;
    .restart local v18    # "stream":Ljava/io/OutputStream;
    :catchall_25f
    move-exception v20

    if-eqz v18, :cond_26a

    .line 523
    :try_start_262
    invoke-virtual/range {v18 .. v18}, Ljava/io/OutputStream;->flush()V

    .line 524
    invoke-virtual/range {v18 .. v18}, Ljava/io/OutputStream;->close()V

    .line 525
    const/16 v18, 0x0

    :cond_26a
    throw v20
    :try_end_26b
    .catch Ljava/net/MalformedURLException; {:try_start_262 .. :try_end_26b} :catch_245
    .catch Ljava/io/IOException; {:try_start_262 .. :try_end_26b} :catch_26b
    .catchall {:try_start_262 .. :try_end_26b} :catchall_2a2

    .line 573
    .end local v18    # "stream":Ljava/io/OutputStream;
    :catch_26b
    move-exception v7

    .line 575
    .local v7, "e":Ljava/io/IOException;
    :try_start_26c
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_27b

    .line 577
    const-string v20, "Localytics"

    const-string v21, "ClientProtocolException"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_27b
    .catchall {:try_start_26c .. :try_end_27b} :catchall_2a2

    .line 580
    :cond_27b
    const/16 v20, 0x0

    .line 584
    if-eqz v6, :cond_192

    .line 586
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 587
    const/4 v6, 0x0

    goto/16 :goto_192

    .line 539
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v17    # "statusCode":I
    .restart local v18    # "stream":Ljava/io/OutputStream;
    :cond_285
    :try_start_285
    const-string v20, "Localytics"

    const-string v21, "Profile upload complete with status %d"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2a0
    .catch Ljava/net/MalformedURLException; {:try_start_285 .. :try_end_2a0} :catch_245
    .catch Ljava/io/IOException; {:try_start_285 .. :try_end_2a0} :catch_26b
    .catchall {:try_start_285 .. :try_end_2a0} :catchall_2a2

    goto/16 :goto_17a

    .line 584
    .end local v17    # "statusCode":I
    .end local v18    # "stream":Ljava/io/OutputStream;
    :catchall_2a2
    move-exception v20

    if-eqz v6, :cond_2a9

    .line 586
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 587
    const/4 v6, 0x0

    :cond_2a9
    throw v20

    .line 554
    .restart local v17    # "statusCode":I
    .restart local v18    # "stream":Ljava/io/OutputStream;
    :cond_2aa
    const/16 v20, 0x1f4

    move/from16 v0, v17

    move/from16 v1, v20

    if-lt v0, v1, :cond_2c4

    const/16 v20, 0x257

    move/from16 v0, v17

    move/from16 v1, v20

    if-gt v0, v1, :cond_2c4

    .line 556
    const/16 v20, 0x0

    .line 584
    if-eqz v6, :cond_192

    .line 586
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 587
    const/4 v6, 0x0

    goto/16 :goto_192

    .line 562
    :cond_2c4
    :try_start_2c4
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/UploadHandler;->retrieveHttpResponse(Lcom/localytics/android/UploadHandler$UploadType;Ljava/io/InputStream;)V
    :try_end_2d1
    .catch Ljava/net/MalformedURLException; {:try_start_2c4 .. :try_end_2d1} :catch_245
    .catch Ljava/io/IOException; {:try_start_2c4 .. :try_end_2d1} :catch_26b
    .catchall {:try_start_2c4 .. :try_end_2d1} :catchall_2a2

    .line 584
    if-eqz v6, :cond_2d7

    .line 586
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 587
    const/4 v6, 0x0

    .line 688
    .end local v6    # "connection":Ljava/net/HttpURLConnection;
    .end local v18    # "stream":Ljava/io/OutputStream;
    :cond_2d7
    :goto_2d7
    const/16 v20, 0x1

    goto/16 :goto_192

    .line 598
    .end local v17    # "statusCode":I
    :cond_2db
    new-instance v11, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v11}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 600
    .local v11, "httpParameters":Lorg/apache/http/params/HttpParams;
    const v20, 0xea60

    move/from16 v0, v20

    invoke-static {v11, v0}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 603
    const v20, 0xea60

    move/from16 v0, v20

    invoke-static {v11, v0}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 605
    new-instance v5, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v5, v11}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 606
    .local v5, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v12, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, p2

    invoke-direct {v12, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 607
    .local v12, "method":Lorg/apache/http/client/methods/HttpPost;
    sget-object v20, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_3c5

    .line 609
    const-string v20, "Content-Type"

    const-string v21, "application/x-gzip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 610
    const-string v20, "Content-Encoding"

    const-string v21, "gzip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 616
    :goto_31a
    const-string v20, "x-upload-time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    move-wide/from16 v0, v22

    long-to-double v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0x408f400000000000L

    div-double v22, v22, v24

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->round(D)J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    const-string v20, "x-install-id"

    move-object/from16 v0, v20

    move-object/from16 v1, p4

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 618
    const-string v20, "x-app-id"

    move-object/from16 v0, v20

    move-object/from16 v1, p5

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    const-string v20, "x-client-version"

    const-string v21, "androida_2.70"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 620
    const-string v20, "x-app-version"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/UploadHandler;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 621
    const-string v20, "x-customer-id"

    move-object/from16 v0, v20

    move-object/from16 v1, p6

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    :try_start_374
    new-instance v14, Lorg/apache/http/entity/ByteArrayEntity;

    move-object/from16 v0, v19

    invoke-direct {v14, v0}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    .line 626
    .local v14, "patchBody":Lorg/apache/http/entity/ByteArrayEntity;
    invoke-virtual {v12, v14}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 628
    invoke-virtual {v5, v12}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v15

    .line 630
    .local v15, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v15}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v16

    .line 631
    .local v16, "status":Lorg/apache/http/StatusLine;
    invoke-interface/range {v16 .. v16}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v17

    .line 633
    .restart local v17    # "statusCode":I
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_3b1

    .line 635
    sget-object v20, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_3d2

    .line 637
    const-string v20, "Localytics"

    const-string v21, "Upload complete with status %d"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3b1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_374 .. :try_end_3b1} :catch_3ee
    .catch Ljava/io/IOException; {:try_start_374 .. :try_end_3b1} :catch_42b

    .line 648
    :cond_3b1
    :goto_3b1
    const/16 v20, 0x190

    move/from16 v0, v17

    move/from16 v1, v20

    if-lt v0, v1, :cond_402

    const/16 v20, 0x1f3

    move/from16 v0, v17

    move/from16 v1, v20

    if-gt v0, v1, :cond_402

    .line 650
    const/16 v20, 0x1

    goto/16 :goto_192

    .line 614
    .end local v14    # "patchBody":Lorg/apache/http/entity/ByteArrayEntity;
    .end local v15    # "response":Lorg/apache/http/HttpResponse;
    .end local v16    # "status":Lorg/apache/http/StatusLine;
    .end local v17    # "statusCode":I
    :cond_3c5
    const-string v20, "Content-Type"

    const-string v21, "application/json; charset=utf-8"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_31a

    .line 641
    .restart local v14    # "patchBody":Lorg/apache/http/entity/ByteArrayEntity;
    .restart local v15    # "response":Lorg/apache/http/HttpResponse;
    .restart local v16    # "status":Lorg/apache/http/StatusLine;
    .restart local v17    # "statusCode":I
    :cond_3d2
    :try_start_3d2
    const-string v20, "Localytics"

    const-string v21, "Profile upload complete with status %d"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3ed
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3d2 .. :try_end_3ed} :catch_3ee
    .catch Ljava/io/IOException; {:try_start_3d2 .. :try_end_3ed} :catch_42b

    goto :goto_3b1

    .line 670
    .end local v14    # "patchBody":Lorg/apache/http/entity/ByteArrayEntity;
    .end local v15    # "response":Lorg/apache/http/HttpResponse;
    .end local v16    # "status":Lorg/apache/http/StatusLine;
    .end local v17    # "statusCode":I
    :catch_3ee
    move-exception v7

    .line 672
    .local v7, "e":Lorg/apache/http/client/ClientProtocolException;
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_3fe

    .line 674
    const-string v20, "Localytics"

    const-string v21, "ClientProtocolException"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 676
    :cond_3fe
    const/16 v20, 0x0

    goto/16 :goto_192

    .line 656
    .end local v7    # "e":Lorg/apache/http/client/ClientProtocolException;
    .restart local v14    # "patchBody":Lorg/apache/http/entity/ByteArrayEntity;
    .restart local v15    # "response":Lorg/apache/http/HttpResponse;
    .restart local v16    # "status":Lorg/apache/http/StatusLine;
    .restart local v17    # "statusCode":I
    :cond_402
    const/16 v20, 0x1f4

    move/from16 v0, v17

    move/from16 v1, v20

    if-lt v0, v1, :cond_416

    const/16 v20, 0x257

    move/from16 v0, v17

    move/from16 v1, v20

    if-gt v0, v1, :cond_416

    .line 658
    const/16 v20, 0x0

    goto/16 :goto_192

    .line 664
    :cond_416
    :try_start_416
    invoke-interface {v15}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 665
    .local v8, "entry":Lorg/apache/http/HttpEntity;
    if-eqz v8, :cond_2d7

    .line 667
    invoke-interface {v8}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/UploadHandler;->retrieveHttpResponse(Lcom/localytics/android/UploadHandler$UploadType;Ljava/io/InputStream;)V
    :try_end_429
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_416 .. :try_end_429} :catch_3ee
    .catch Ljava/io/IOException; {:try_start_416 .. :try_end_429} :catch_42b

    goto/16 :goto_2d7

    .line 678
    .end local v8    # "entry":Lorg/apache/http/HttpEntity;
    .end local v14    # "patchBody":Lorg/apache/http/entity/ByteArrayEntity;
    .end local v15    # "response":Lorg/apache/http/HttpResponse;
    .end local v16    # "status":Lorg/apache/http/StatusLine;
    .end local v17    # "statusCode":I
    :catch_42b
    move-exception v7

    .line 680
    .local v7, "e":Ljava/io/IOException;
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_43b

    .line 682
    const-string v20, "Localytics"

    const-string v21, "IOException"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 684
    :cond_43b
    const/16 v20, 0x0

    goto/16 :goto_192

    .line 460
    .end local v5    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v7    # "e":Ljava/io/IOException;
    .end local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    .end local v11    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v12    # "method":Lorg/apache/http/client/methods/HttpPost;
    .end local v19    # "uploadData":[B
    .restart local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v10    # "gos":Ljava/util/zip/GZIPOutputStream;
    :catchall_43f
    move-exception v20

    move-object v9, v10

    .end local v10    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    goto/16 :goto_21d

    .line 450
    .end local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v10    # "gos":Ljava/util/zip/GZIPOutputStream;
    :catch_443
    move-exception v7

    move-object v9, v10

    .end local v10    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    goto/16 :goto_1f0

    .line 442
    .end local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v10    # "gos":Ljava/util/zip/GZIPOutputStream;
    :catch_447
    move-exception v7

    move-object v9, v10

    .end local v10    # "gos":Ljava/util/zip/GZIPOutputStream;
    .restart local v9    # "gos":Ljava/util/zip/GZIPOutputStream;
    goto/16 :goto_1c4
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 23
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 184
    :try_start_0
    invoke-super/range {p0 .. p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 186
    move-object/from16 v0, p1

    iget v2, v0, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_1d2

    .line 315
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Fell through switch statement"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_12

    .line 319
    :catch_12
    move-exception v13

    .line 321
    .local v13, "e":Ljava/lang/Exception;
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_1e

    .line 323
    const-string v2, "Localytics"

    const-string v3, "Localytics library threw an uncaught exception"

    invoke-static {v2, v3, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 331
    .end local v13    # "e":Ljava/lang/Exception;
    :cond_1e
    :goto_1e
    return-void

    .line 190
    :pswitch_1f
    :try_start_1f
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_2a

    .line 192
    const-string v2, "Localytics"

    const-string v3, "UploadHandler received MESSAGE_UPLOAD"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    :cond_2a
    move-object/from16 v0, p1

    iget-object v11, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v11, Ljava/lang/Runnable;
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_30} :catch_12

    .line 202
    .local v11, "callback":Ljava/lang/Runnable;
    :try_start_30
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/UploadHandler;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/UploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/localytics/android/UploadHandler;->mApiKey:Ljava/lang/String;

    invoke-static {v2, v3, v4}, Lcom/localytics/android/UploadHandler;->convertDatabaseToJson(Landroid/content/Context;Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/util/List;

    move-result-object v18

    .line 204
    .local v18, "toUpload":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_bc

    .line 206
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .local v10, "builder":Ljava/lang/StringBuilder;
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :goto_4f
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7e

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/json/JSONObject;

    .line 209
    .local v15, "json":Lorg/json/JSONObject;
    invoke-virtual {v15}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    const/16 v2, 0xa

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_67
    .catchall {:try_start_30 .. :try_end_67} :catchall_68

    goto :goto_4f

    .line 230
    .end local v10    # "builder":Ljava/lang/StringBuilder;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v15    # "json":Lorg/json/JSONObject;
    .end local v18    # "toUpload":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    :catchall_68
    move-exception v2

    if-eqz v11, :cond_75

    .line 236
    :try_start_6b
    new-instance v3, Ljava/lang/Thread;

    const-string v4, "upload_callback"

    invoke-direct {v3, v11, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 239
    :cond_75
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/UploadHandler;->mSessionHandler:Landroid/os/Handler;

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    throw v2
    :try_end_7e
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_7e} :catch_12

    .line 213
    .restart local v10    # "builder":Ljava/lang/StringBuilder;
    .restart local v14    # "i$":Ljava/util/Iterator;
    .restart local v18    # "toUpload":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    :cond_7e
    :try_start_7e
    invoke-direct/range {p0 .. p0}, Lcom/localytics/android/UploadHandler;->getApiKey()Ljava/lang/String;

    move-result-object v7

    .line 214
    .local v7, "apiKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/UploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v2}, Lcom/localytics/android/UploadHandler;->getCustomerID(Lcom/localytics/android/LocalyticsProvider;)Ljava/lang/String;

    move-result-object v8

    .line 216
    .local v8, "customerID":Ljava/lang/String;
    sget-object v3, Lcom/localytics/android/UploadHandler$UploadType;->SESSIONS:Lcom/localytics/android/UploadHandler$UploadType;

    sget-boolean v2, Lcom/localytics/android/Constants;->USE_HTTPS:Z

    if-eqz v2, :cond_d2

    const-string v2, "https://%s/api/v2/uploads"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    sget-object v20, Lcom/localytics/android/Constants;->ANALYTICS_URL:Ljava/lang/String;

    aput-object v20, v4, v6

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :goto_9e
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/UploadHandler;->mInstallId:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/localytics/android/UploadHandler;->upload(Lcom/localytics/android/UploadHandler$UploadType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_bc

    .line 218
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/UploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    new-instance v3, Lcom/localytics/android/UploadHandler$1;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/localytics/android/UploadHandler$1;-><init>(Lcom/localytics/android/UploadHandler;)V

    invoke-virtual {v2, v3}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V
    :try_end_bc
    .catchall {:try_start_7e .. :try_end_bc} :catchall_68

    .line 230
    .end local v7    # "apiKey":Ljava/lang/String;
    .end local v8    # "customerID":Ljava/lang/String;
    .end local v10    # "builder":Ljava/lang/StringBuilder;
    .end local v14    # "i$":Ljava/util/Iterator;
    :cond_bc
    if-eqz v11, :cond_c8

    .line 236
    :try_start_be
    new-instance v2, Ljava/lang/Thread;

    const-string v3, "upload_callback"

    invoke-direct {v2, v11, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 239
    :cond_c8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/UploadHandler;->mSessionHandler:Landroid/os/Handler;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_d0
    .catch Ljava/lang/Exception; {:try_start_be .. :try_end_d0} :catch_12

    goto/16 :goto_1e

    .line 216
    .restart local v7    # "apiKey":Ljava/lang/String;
    .restart local v8    # "customerID":Ljava/lang/String;
    .restart local v10    # "builder":Ljava/lang/StringBuilder;
    .restart local v14    # "i$":Ljava/util/Iterator;
    :cond_d2
    :try_start_d2
    const-string v2, "http://%s/api/v2/applications/%s/uploads"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    sget-object v20, Lcom/localytics/android/Constants;->ANALYTICS_URL:Ljava/lang/String;

    aput-object v20, v4, v6

    const/4 v6, 0x1

    aput-object v7, v4, v6

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_e2
    .catchall {:try_start_d2 .. :try_end_e2} :catchall_68

    move-result-object v4

    goto :goto_9e

    .line 245
    .end local v7    # "apiKey":Ljava/lang/String;
    .end local v8    # "customerID":Ljava/lang/String;
    .end local v10    # "builder":Ljava/lang/StringBuilder;
    .end local v11    # "callback":Ljava/lang/Runnable;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v18    # "toUpload":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    :pswitch_e4
    :try_start_e4
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_ef

    .line 247
    const-string v2, "Localytics"

    const-string v3, "Received MESSAGE_RETRY_UPLOAD_REQUEST"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_ef
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/UploadHandler;->mSessionHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/UploadHandler;->mSessionHandler:Landroid/os/Handler;

    const/4 v4, 0x4

    move-object/from16 v0, p1

    iget-object v6, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, v4, v6}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_1e

    .line 255
    :pswitch_105
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_110

    .line 257
    const-string v2, "Localytics"

    const-string v3, "UploadHandler received MESSAGE_UPLOAD_PROFILE"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    :cond_110
    move-object/from16 v0, p1

    iget-object v11, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v11, Ljava/lang/Runnable;

    .line 265
    .restart local v11    # "callback":Ljava/lang/Runnable;
    invoke-direct/range {p0 .. p0}, Lcom/localytics/android/UploadHandler;->getApiKey()Ljava/lang/String;

    move-result-object v7

    .line 267
    .restart local v7    # "apiKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/UploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v2}, Lcom/localytics/android/UploadHandler;->getProfileAttributes(Lcom/localytics/android/LocalyticsProvider;)Ljava/util/TreeMap;

    move-result-object v16

    .line 268
    .local v16, "profileAttributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .restart local v14    # "i$":Ljava/util/Iterator;
    :cond_12a
    :goto_12a
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_199

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 270
    .local v9, "attribute":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 271
    .restart local v8    # "customerID":Ljava/lang/String;
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;

    iget-object v12, v2, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;->consolidatedJSON:Lorg/json/JSONObject;

    .line 272
    .local v12, "consolidatedJSON":Lorg/json/JSONObject;
    new-instance v19, Lorg/json/JSONObject;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONObject;-><init>()V

    .line 273
    .local v19, "uploadJSON":Lorg/json/JSONObject;
    const-string v2, "attributes"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 274
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;

    iget-object v0, v2, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;->rowIDs:Ljava/lang/StringBuilder;

    move-object/from16 v17, v0

    .line 275
    .local v17, "rows":Ljava/lang/StringBuilder;
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    .line 277
    .local v5, "uploadString":Ljava/lang/String;
    sget-object v3, Lcom/localytics/android/UploadHandler$UploadType;->PROFILES:Lcom/localytics/android/UploadHandler$UploadType;

    const-string v2, "https://%s/v1/apps/%s/profiles/%s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    sget-object v20, Lcom/localytics/android/Constants;->PROFILES_URL:Ljava/lang/String;

    aput-object v20, v4, v6

    const/4 v6, 0x1

    aput-object v7, v4, v6

    const/4 v6, 0x2

    const-string v20, "UTF-8"

    move-object/from16 v0, v20

    invoke-static {v8, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v4, v6

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/UploadHandler;->mInstallId:Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/localytics/android/UploadHandler;->upload(Lcom/localytics/android/UploadHandler$UploadType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12a

    .line 279
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/UploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    new-instance v3, Lcom/localytics/android/UploadHandler$2;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v3, v0, v1}, Lcom/localytics/android/UploadHandler$2;-><init>(Lcom/localytics/android/UploadHandler;Ljava/lang/StringBuilder;)V

    invoke-virtual {v2, v3}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_12a

    .line 288
    .end local v5    # "uploadString":Ljava/lang/String;
    .end local v8    # "customerID":Ljava/lang/String;
    .end local v9    # "attribute":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;>;"
    .end local v12    # "consolidatedJSON":Lorg/json/JSONObject;
    .end local v17    # "rows":Ljava/lang/StringBuilder;
    .end local v19    # "uploadJSON":Lorg/json/JSONObject;
    :cond_199
    if-eqz v11, :cond_1a5

    .line 294
    new-instance v2, Ljava/lang/Thread;

    const-string v3, "upload_profile_callback"

    invoke-direct {v2, v11, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 297
    :cond_1a5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/UploadHandler;->mSessionHandler:Landroid/os/Handler;

    const/16 v3, 0x12

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_1e

    .line 302
    .end local v7    # "apiKey":Ljava/lang/String;
    .end local v11    # "callback":Ljava/lang/Runnable;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v16    # "profileAttributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;>;"
    :pswitch_1b0
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_1bb

    .line 304
    const-string v2, "Localytics"

    const-string v3, "Received MESSAGE_RETRY_UPLOAD_PROFILE_REQUEST"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    :cond_1bb
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/UploadHandler;->mSessionHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/UploadHandler;->mSessionHandler:Landroid/os/Handler;

    const/16 v4, 0x11

    move-object/from16 v0, p1

    iget-object v6, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v3, v4, v6}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1d0
    .catch Ljava/lang/Exception; {:try_start_e4 .. :try_end_1d0} :catch_12

    goto/16 :goto_1e

    .line 186
    :pswitch_data_1d2
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_e4
        :pswitch_105
        :pswitch_1b0
    .end packed-switch
.end method

.method protected onProfileUploadResponded(Ljava/lang/String;)V
    .registers 6
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 360
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_15

    .line 362
    const-string v0, "Localytics"

    const-string v1, "Profile response is: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    :cond_15
    return-void
.end method

.method protected onUploadResponded(Ljava/lang/String;)V
    .registers 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 351
    return-void
.end method
