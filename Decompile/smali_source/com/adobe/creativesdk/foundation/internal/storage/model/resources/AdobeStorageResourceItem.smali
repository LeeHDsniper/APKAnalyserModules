.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
.super Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
.source "AdobeStorageResourceItem.java"


# instance fields
.field private data:[B

.field private length:Ljava/lang/Number;

.field private md5:Ljava/lang/String;

.field private optionalMetadata:Lorg/json/JSONObject;

.field private path:Ljava/lang/String;

.field private version:Ljava/lang/Number;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;-><init>()V

    return-void
.end method

.method public static escapeAssetName(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "asset"    # Ljava/lang/String;

    .prologue
    .line 86
    if-nez p0, :cond_4

    .line 87
    const/4 p0, 0x0

    .line 97
    :goto_3
    return-object p0

    .line 91
    :cond_4
    :try_start_4
    const-string v1, "UTF-8"

    invoke-static {p0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "+"

    const-string v3, "%20"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    :try_end_11
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_11} :catch_13

    move-result-object p0

    goto :goto_3

    .line 92
    :catch_13
    move-exception v0

    .line 94
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_3
.end method

.method public static resourceFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .registers 3
    .param p0, "href"    # Ljava/net/URI;

    .prologue
    .line 56
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;-><init>()V

    .line 57
    .local v0, "resource":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    iput-object p0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->href:Ljava/net/URI;

    .line 58
    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->getLastPathComponent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->name:Ljava/lang/String;

    .line 59
    return-object v0
.end method

.method public static validAssetName(Ljava/lang/String;)Z
    .registers 5
    .param p0, "asset"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 112
    if-nez p0, :cond_4

    .line 120
    :cond_3
    :goto_3
    return v2

    .line 116
    :cond_4
    const-string v3, ".*[\\\\:\\*\\?\"\\/<>\\|\\x00-\\x1F]+.*"

    invoke-virtual {p0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    .line 118
    .local v1, "hasIllegalChars":Z
    const-string v3, ".*[\\ \\.]$"

    invoke-virtual {p0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    .line 120
    .local v0, "endWithDot":Z
    if-nez v1, :cond_3

    if-nez v0, :cond_3

    const/4 v2, 0x1

    goto :goto_3
.end method


# virtual methods
.method public getLength()Ljava/lang/Number;
    .registers 2

    .prologue
    .line 382
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->length:Ljava/lang/Number;

    return-object v0
.end method

.method public getMd5()Ljava/lang/String;
    .registers 2

    .prologue
    .line 364
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->md5:Ljava/lang/String;

    return-object v0
.end method

.method public getOptionalMetadata()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 373
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->optionalMetadata:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 346
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/Number;
    .registers 2

    .prologue
    .line 355
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->version:Ljava/lang/Number;

    return-object v0
.end method

.method public setData([B)V
    .registers 2
    .param p1, "data"    # [B

    .prologue
    .line 341
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->data:[B

    .line 342
    return-void
.end method

.method public setLength(Ljava/lang/Number;)V
    .registers 2
    .param p1, "length"    # Ljava/lang/Number;

    .prologue
    .line 386
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->length:Ljava/lang/Number;

    .line 387
    return-void
.end method

.method public setMd5(Ljava/lang/String;)V
    .registers 2
    .param p1, "md5"    # Ljava/lang/String;

    .prologue
    .line 368
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->md5:Ljava/lang/String;

    .line 369
    return-void
.end method

.method public setVersion(Ljava/lang/Number;)V
    .registers 2
    .param p1, "version"    # Ljava/lang/Number;

    .prologue
    .line 359
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->version:Ljava/lang/Number;

    .line 360
    return-void
.end method

.method public updateFromCollectionDictionary(Lorg/json/JSONObject;)V
    .registers 10
    .param p1, "paramDict"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;
        }
    .end annotation

    .prologue
    .line 228
    const/4 v1, 0x0

    .line 229
    .local v1, "error":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 230
    .local v4, "optionalMeta":Lorg/json/JSONObject;
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 231
    .local v3, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c0

    .line 233
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 236
    .local v2, "key":Ljava/lang/String;
    const-string v5, "name"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_27

    .line 237
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->name:Ljava/lang/String;

    goto :goto_a

    .line 239
    :cond_27
    const-string v5, "type"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_38

    .line 240
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    goto :goto_a

    .line 242
    :cond_38
    const-string v5, "etag"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_49

    .line 243
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    goto :goto_a

    .line 245
    :cond_49
    const-string v5, "size"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5a

    .line 246
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->length:Ljava/lang/Number;

    goto :goto_a

    .line 248
    :cond_5a
    const-string v5, "md5"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6b

    .line 249
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->md5:Ljava/lang/String;

    goto :goto_a

    .line 251
    :cond_6b
    const-string v5, "id"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7c

    .line 252
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->internalID:Ljava/lang/String;

    goto :goto_a

    .line 254
    :cond_7c
    const-string v5, "created"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8e

    .line 255
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->created:Ljava/lang/String;

    goto/16 :goto_a

    .line 257
    :cond_8e
    const-string v5, "modified"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a0

    .line 258
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->modified:Ljava/lang/String;

    goto/16 :goto_a

    .line 260
    :cond_a0
    const-string v5, "ordinal"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b1

    .line 261
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    int-to-long v6, v5

    iput-wide v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->ordinal:J

    goto/16 :goto_a

    .line 265
    :cond_b1
    :try_start_b1
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_b8
    .catch Lorg/json/JSONException; {:try_start_b1 .. :try_end_b8} :catch_ba

    goto/16 :goto_a

    .line 266
    :catch_ba
    move-exception v0

    .line 268
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_a

    .line 273
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v2    # "key":Ljava/lang/String;
    :cond_c0
    const-string v5, "page"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_ce

    .line 275
    :try_start_c8
    const-string v5, "page"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_ce
    .catch Lorg/json/JSONException; {:try_start_c8 .. :try_end_ce} :catch_fe

    .line 282
    :cond_ce
    :goto_ce
    const-string v5, "height"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_dc

    .line 284
    :try_start_d6
    const-string v5, "height"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_dc
    .catch Lorg/json/JSONException; {:try_start_d6 .. :try_end_dc} :catch_103

    .line 291
    :cond_dc
    :goto_dc
    const-string v5, "width"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_ea

    .line 293
    :try_start_e4
    const-string v5, "width"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_ea
    .catch Lorg/json/JSONException; {:try_start_e4 .. :try_end_ea} :catch_108

    .line 300
    :cond_ea
    :goto_ea
    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->optionalMetadata:Lorg/json/JSONObject;

    .line 302
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->name:Ljava/lang/String;

    if-nez v5, :cond_10d

    .line 303
    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v6, "Item doesn\'t have a name."

    invoke-static {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    .line 305
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;

    invoke-direct {v5, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    throw v5

    .line 276
    :catch_fe
    move-exception v0

    .line 278
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_ce

    .line 285
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_103
    move-exception v0

    .line 287
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_dc

    .line 294
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_108
    move-exception v0

    .line 296
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_ea

    .line 306
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_10d
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->type:Ljava/lang/String;

    if-nez v5, :cond_11f

    .line 307
    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v6, "Item doesn\'t have a type."

    invoke-static {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    .line 309
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;

    invoke-direct {v5, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    throw v5

    .line 315
    :cond_11f
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->modified:Ljava/lang/String;

    if-nez v5, :cond_131

    .line 316
    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const-string v6, "Item doesn\'t have a modified time."

    invoke-static {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    .line 318
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;

    invoke-direct {v5, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    throw v5

    .line 323
    :cond_131
    return-void
.end method
