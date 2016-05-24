.class public Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;
.super Ljava/lang/Object;
.source "AdobeDCXManifestFormatConverter.java"


# static fields
.field static DCXTypeMapperToVersion4:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 201
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->DCXTypeMapperToVersion4:Lorg/json/JSONObject;

    return-void
.end method

.method static recursiveUpdateComponentsToVersion2(Lorg/json/JSONObject;)Z
    .registers 10
    .param p0, "dict"    # Lorg/json/JSONObject;

    .prologue
    .line 334
    :try_start_0
    const-string v8, "components"

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 335
    .local v3, "components":Lorg/json/JSONArray;
    if-eqz v3, :cond_58

    .line 336
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_9
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v4, v8, :cond_58

    .line 337
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 338
    .local v2, "component":Lorg/json/JSONObject;
    if-eqz v2, :cond_4a

    .line 339
    const-string v8, "_links"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 340
    .local v6, "links":Lorg/json/JSONObject;
    if-eqz v6, :cond_4a

    .line 341
    const-string v8, "latest-version"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 342
    .local v5, "latestVersionLink":Lorg/json/JSONObject;
    const-string v8, "self"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 344
    .local v7, "selfLink":Lorg/json/JSONObject;
    if-eqz v5, :cond_35

    .line 345
    const-string v8, "stormcloud#asset"

    invoke-virtual {v6, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 346
    const-string v8, "latest-version"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 349
    :cond_35
    if-eqz v7, :cond_41

    .line 350
    const-string v8, "stormcloud#asset-version"

    invoke-virtual {v6, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 351
    const-string v8, "self"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 355
    :cond_41
    if-eqz v5, :cond_4d

    if-nez v7, :cond_4d

    .line 357
    const-string v8, "stormcloud#asset-version"

    invoke-virtual {v6, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 336
    .end local v5    # "latestVersionLink":Lorg/json/JSONObject;
    .end local v6    # "links":Lorg/json/JSONObject;
    .end local v7    # "selfLink":Lorg/json/JSONObject;
    :cond_4a
    :goto_4a
    add-int/lit8 v4, v4, 0x1

    goto :goto_9

    .line 358
    .restart local v5    # "latestVersionLink":Lorg/json/JSONObject;
    .restart local v6    # "links":Lorg/json/JSONObject;
    .restart local v7    # "selfLink":Lorg/json/JSONObject;
    :cond_4d
    if-nez v5, :cond_4a

    if-eqz v7, :cond_4a

    .line 360
    const-string v8, "stormcloud#asset"

    invoke-virtual {v6, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_56
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_56} :catch_57

    goto :goto_4a

    .line 366
    .end local v2    # "component":Lorg/json/JSONObject;
    .end local v3    # "components":Lorg/json/JSONArray;
    .end local v4    # "i":I
    .end local v5    # "latestVersionLink":Lorg/json/JSONObject;
    .end local v6    # "links":Lorg/json/JSONObject;
    .end local v7    # "selfLink":Lorg/json/JSONObject;
    :catch_57
    move-exception v8

    .line 371
    :cond_58
    const-string v8, "children"

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 372
    .local v1, "children":Lorg/json/JSONArray;
    if-eqz v1, :cond_76

    .line 373
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_61
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v4, v8, :cond_76

    .line 374
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 375
    .local v0, "child":Lorg/json/JSONObject;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->recursiveUpdateComponentsToVersion2(Lorg/json/JSONObject;)Z

    move-result v8

    if-nez v8, :cond_73

    .line 376
    const/4 v8, 0x0

    .line 381
    .end local v0    # "child":Lorg/json/JSONObject;
    .end local v4    # "i":I
    :goto_72
    return v8

    .line 373
    .restart local v0    # "child":Lorg/json/JSONObject;
    .restart local v4    # "i":I
    :cond_73
    add-int/lit8 v4, v4, 0x1

    goto :goto_61

    .line 381
    .end local v0    # "child":Lorg/json/JSONObject;
    .end local v4    # "i":I
    :cond_76
    const/4 v8, 0x1

    goto :goto_72
.end method

.method static recursiveUpdateComponentsToVersion3(Lorg/json/JSONObject;)Z
    .registers 10
    .param p0, "dict"    # Lorg/json/JSONObject;

    .prologue
    .line 259
    const-string v8, "components"

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 260
    .local v3, "components":Lorg/json/JSONArray;
    if-eqz v3, :cond_3a

    .line 261
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_9
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v5, v8, :cond_3a

    .line 262
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 263
    .local v2, "component":Lorg/json/JSONObject;
    if-eqz v2, :cond_37

    .line 264
    const-string v8, "_links"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 265
    .local v7, "links":Lorg/json/JSONObject;
    const-string v8, "etag"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 266
    .local v4, "etag":Ljava/lang/String;
    if-eqz v7, :cond_37

    if-eqz v4, :cond_37

    .line 267
    const-string v8, "stormcloud#asset"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 268
    .local v6, "link":Lorg/json/JSONObject;
    if-eqz v6, :cond_32

    .line 270
    :try_start_2d
    const-string v8, "etag"

    invoke-virtual {v6, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_32
    .catch Lorg/json/JSONException; {:try_start_2d .. :try_end_32} :catch_5a

    .line 275
    :cond_32
    :goto_32
    const-string v8, "etag"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 261
    .end local v4    # "etag":Ljava/lang/String;
    .end local v6    # "link":Lorg/json/JSONObject;
    .end local v7    # "links":Lorg/json/JSONObject;
    :cond_37
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 281
    .end local v2    # "component":Lorg/json/JSONObject;
    .end local v5    # "i":I
    :cond_3a
    const-string v8, "children"

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 282
    .local v1, "children":Lorg/json/JSONArray;
    if-eqz v1, :cond_58

    .line 283
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_43
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v5, v8, :cond_58

    .line 284
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 285
    .local v0, "child":Lorg/json/JSONObject;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->recursiveUpdateComponentsToVersion3(Lorg/json/JSONObject;)Z

    move-result v8

    if-nez v8, :cond_55

    .line 286
    const/4 v8, 0x0

    .line 291
    .end local v0    # "child":Lorg/json/JSONObject;
    .end local v5    # "i":I
    :goto_54
    return v8

    .line 283
    .restart local v0    # "child":Lorg/json/JSONObject;
    .restart local v5    # "i":I
    :cond_55
    add-int/lit8 v5, v5, 0x1

    goto :goto_43

    .line 291
    .end local v0    # "child":Lorg/json/JSONObject;
    .end local v5    # "i":I
    :cond_58
    const/4 v8, 0x1

    goto :goto_54

    .line 271
    .end local v1    # "children":Lorg/json/JSONArray;
    .restart local v2    # "component":Lorg/json/JSONObject;
    .restart local v4    # "etag":Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v6    # "link":Lorg/json/JSONObject;
    .restart local v7    # "links":Lorg/json/JSONObject;
    :catch_5a
    move-exception v8

    goto :goto_32
.end method

.method static recursiveUpdateComponentsToVersion4(Lorg/json/JSONObject;)Z
    .registers 9
    .param p0, "dict"    # Lorg/json/JSONObject;

    .prologue
    const/4 v6, 0x1

    .line 164
    if-nez p0, :cond_4

    .line 198
    :cond_3
    :goto_3
    return v6

    .line 167
    :cond_4
    const-string v7, "components"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 168
    .local v3, "components":Lorg/json/JSONArray;
    if-eqz v3, :cond_49

    .line 169
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_d
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v4, v7, :cond_49

    .line 170
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 171
    .local v2, "component":Lorg/json/JSONObject;
    if-eqz v2, :cond_46

    .line 172
    const-string v7, "_links"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 173
    .local v5, "links":Lorg/json/JSONObject;
    if-eqz v5, :cond_46

    .line 174
    const-string v7, "stormcloud#asset"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_2e

    .line 175
    const-string v7, "stormcloud#asset"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 177
    :cond_2e
    const-string v7, "stormcloud#asset-version"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_3b

    .line 178
    const-string v7, "stormcloud#asset-version"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 180
    :cond_3b
    invoke-virtual {v5}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-nez v7, :cond_46

    .line 181
    const-string v7, "_links"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 169
    .end local v5    # "links":Lorg/json/JSONObject;
    :cond_46
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 188
    .end local v2    # "component":Lorg/json/JSONObject;
    .end local v4    # "i":I
    :cond_49
    const-string v7, "children"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 189
    .local v1, "children":Lorg/json/JSONArray;
    if-eqz v1, :cond_3

    .line 190
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_52
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v4, v7, :cond_3

    .line 191
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 192
    .local v0, "child":Lorg/json/JSONObject;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->recursiveUpdateComponentsToVersion4(Lorg/json/JSONObject;)Z

    move-result v7

    if-nez v7, :cond_64

    .line 193
    const/4 v6, 0x0

    goto :goto_3

    .line 190
    :cond_64
    add-int/lit8 v4, v4, 0x1

    goto :goto_52
.end method

.method static recursiveUpdateComponentsToVersion5(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 10
    .param p0, "dict"    # Lorg/json/JSONObject;
    .param p1, "storageIdLookup"    # Lorg/json/JSONObject;

    .prologue
    .line 91
    if-nez p0, :cond_4

    move-object v7, p1

    .line 128
    :goto_3
    return-object v7

    .line 95
    :cond_4
    const-string v7, "components"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 96
    .local v4, "components":Lorg/json/JSONArray;
    if-eqz v4, :cond_32

    .line 97
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_d
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v5, v7, :cond_32

    .line 98
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 99
    .local v2, "component":Lorg/json/JSONObject;
    if-eqz v2, :cond_2f

    .line 100
    const-string v7, "localStorageAssetId"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 101
    .local v6, "storageId":Ljava/lang/String;
    if-eqz v6, :cond_2f

    .line 102
    const-string v7, "id"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 105
    .local v3, "componentId":Ljava/lang/String;
    :try_start_27
    invoke-virtual {p1, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_27 .. :try_end_2a} :catch_52

    .line 110
    :goto_2a
    const-string v7, "localStorageAssetId"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    .end local v3    # "componentId":Ljava/lang/String;
    .end local v6    # "storageId":Ljava/lang/String;
    :cond_2f
    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 116
    .end local v2    # "component":Lorg/json/JSONObject;
    .end local v5    # "i":I
    :cond_32
    const-string v7, "children"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 117
    .local v1, "children":Lorg/json/JSONArray;
    if-eqz v1, :cond_50

    .line 118
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_3b
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v5, v7, :cond_50

    .line 119
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 120
    .local v0, "child":Lorg/json/JSONObject;
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->recursiveUpdateComponentsToVersion5(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    .line 122
    if-nez p1, :cond_4d

    .line 123
    const/4 v7, 0x0

    goto :goto_3

    .line 118
    :cond_4d
    add-int/lit8 v5, v5, 0x1

    goto :goto_3b

    .end local v0    # "child":Lorg/json/JSONObject;
    .end local v5    # "i":I
    :cond_50
    move-object v7, p1

    .line 128
    goto :goto_3

    .line 106
    .end local v1    # "children":Lorg/json/JSONArray;
    .restart local v2    # "component":Lorg/json/JSONObject;
    .restart local v3    # "componentId":Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v6    # "storageId":Ljava/lang/String;
    :catch_52
    move-exception v7

    goto :goto_2a
.end method

.method static updateLocalDataInManifestDictionaryToVersion1(Lorg/json/JSONObject;)Z
    .registers 7
    .param p0, "dict"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x1

    .line 56
    :try_start_1
    const-string v4, "local"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 57
    .local v2, "local":Lorg/json/JSONObject;
    if-nez v2, :cond_13

    .line 58
    new-instance v2, Lorg/json/JSONObject;

    .end local v2    # "local":Lorg/json/JSONObject;
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 59
    .restart local v2    # "local":Lorg/json/JSONObject;
    const-string v4, "local"

    invoke-virtual {p0, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    :cond_13
    const-string v4, "manifestEtag"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_2e

    .line 63
    const-string v4, "etag"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "etag":Ljava/lang/String;
    if-eqz v1, :cond_2e

    .line 65
    const-string v4, "manifestEtag"

    invoke-virtual {v2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 66
    const-string v4, "etag"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    .end local v1    # "etag":Ljava/lang/String;
    :cond_2e
    const-string v4, "version"

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_34
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_34} :catch_35

    .line 77
    .end local v2    # "local":Lorg/json/JSONObject;
    :goto_34
    return v3

    .line 75
    :catch_35
    move-exception v0

    .line 77
    .local v0, "e":Lorg/json/JSONException;
    const/4 v3, 0x0

    goto :goto_34
.end method

.method public static updateManifestDictionary(Lorg/json/JSONObject;J)Z
    .registers 10
    .param p0, "dict"    # Lorg/json/JSONObject;
    .param p1, "fversion"    # J

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 35
    const-wide/16 v4, 0x1

    cmp-long v3, p1, v4

    if-gez v3, :cond_f

    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->updateManifestDictionaryToVersion1(Lorg/json/JSONObject;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 46
    :cond_e
    :goto_e
    return v1

    .line 36
    :cond_f
    const-wide/16 v4, 0x2

    cmp-long v3, p1, v4

    if-gez v3, :cond_1b

    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->updateManifestDictionaryToVersion2(Lorg/json/JSONObject;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 37
    :cond_1b
    const-wide/16 v4, 0x3

    cmp-long v3, p1, v4

    if-gez v3, :cond_27

    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->updateManifestDictionaryToVersion3(Lorg/json/JSONObject;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 38
    :cond_27
    const-wide/16 v4, 0x4

    cmp-long v3, p1, v4

    if-gez v3, :cond_33

    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->updateManifestDictionaryToVersion4(Lorg/json/JSONObject;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 39
    :cond_33
    const-wide/16 v4, 0x5

    cmp-long v3, p1, v4

    if-gez v3, :cond_3f

    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->updateManifestDictionaryToVersion5(Lorg/json/JSONObject;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 42
    :cond_3f
    const-string v3, "local"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_5d

    const-string v3, "local"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "version"

    invoke-virtual {v3, v4, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    .line 44
    .local v0, "localVersionNumber":I
    :goto_53
    if-ge v0, v2, :cond_5b

    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->updateLocalDataInManifestDictionaryToVersion1(Lorg/json/JSONObject;)Z

    move-result v3

    if-eqz v3, :cond_e

    :cond_5b
    move v1, v2

    .line 46
    goto :goto_e

    .end local v0    # "localVersionNumber":I
    :cond_5d
    move v0, v1

    .line 42
    goto :goto_53
.end method

.method static updateManifestDictionaryToVersion1(Lorg/json/JSONObject;)Z
    .registers 16
    .param p0, "dict"    # Lorg/json/JSONObject;

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 426
    const-string v13, "_links"

    invoke-virtual {p0, v13}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 427
    .local v9, "links":Lorg/json/JSONObject;
    if-nez v9, :cond_b

    .line 489
    :goto_a
    return v11

    .line 435
    :cond_b
    :try_start_b
    const-string v13, "self"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "etag"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 436
    .local v5, "etag":Ljava/lang/String;
    if-eqz v5, :cond_29

    .line 437
    const-string v13, "etag"

    invoke-virtual {p0, v13, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 438
    const-string v13, "self"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "etag"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 444
    :cond_29
    const-string v13, "components"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 446
    .local v2, "components":Lorg/json/JSONArray;
    if-eqz v2, :cond_8f

    .line 448
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_32
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v7, v13, :cond_85

    .line 449
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 450
    .local v0, "comp":Lorg/json/JSONObject;
    if-eqz v0, :cond_82

    .line 451
    const-string v13, "id"

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    if-nez v13, :cond_4f

    .line 452
    const-string v13, "id"

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->generateUuid()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 454
    :cond_4f
    const-string v13, "href"

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 456
    .local v6, "href":Ljava/lang/String;
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 457
    .local v10, "self":Lorg/json/JSONObject;
    const-string v13, "href"

    invoke-virtual {v10, v13, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 458
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 459
    .local v8, "latestVersion":Lorg/json/JSONObject;
    const-string v13, "href"

    invoke-virtual {v8, v13, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 461
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 462
    .local v1, "componentLinks":Lorg/json/JSONObject;
    const-string v13, "self"

    invoke-virtual {v1, v13, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 463
    const-string v13, "latest-version"

    invoke-virtual {v1, v13, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 465
    const-string v13, "_links"

    invoke-virtual {v0, v13, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 467
    const-string v13, "href"

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 448
    .end local v1    # "componentLinks":Lorg/json/JSONObject;
    .end local v6    # "href":Ljava/lang/String;
    .end local v8    # "latestVersion":Lorg/json/JSONObject;
    .end local v10    # "self":Lorg/json/JSONObject;
    :cond_82
    add-int/lit8 v7, v7, 0x1

    goto :goto_32

    .line 472
    .end local v0    # "comp":Lorg/json/JSONObject;
    :cond_85
    const-string v13, "components"

    invoke-virtual {p0, v13, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 473
    const-string v13, "components"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 477
    .end local v7    # "i":I
    :cond_8f
    const-string v13, "container"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 478
    .local v3, "containerLink":Lorg/json/JSONObject;
    if-eqz v3, :cond_a1

    .line 479
    const-string v13, "dma#container"

    invoke-virtual {v9, v13, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 480
    const-string v13, "container"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 484
    :cond_a1
    const-string v13, "manifest-format-version"

    const/4 v14, 0x1

    invoke-virtual {p0, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_a7
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_a7} :catch_aa

    move v11, v12

    .line 486
    goto/16 :goto_a

    .line 487
    .end local v2    # "components":Lorg/json/JSONArray;
    .end local v3    # "containerLink":Lorg/json/JSONObject;
    .end local v5    # "etag":Ljava/lang/String;
    :catch_aa
    move-exception v4

    .line 489
    .local v4, "e":Lorg/json/JSONException;
    goto/16 :goto_a
.end method

.method static updateManifestDictionaryToVersion2(Lorg/json/JSONObject;)Z
    .registers 7
    .param p0, "dict"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x0

    .line 388
    :try_start_1
    const-string v4, "_links"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 389
    .local v2, "links":Lorg/json/JSONObject;
    if-eqz v2, :cond_34

    .line 390
    const-string v4, "dma#container"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 391
    .local v1, "link":Lorg/json/JSONObject;
    if-eqz v1, :cond_22

    .line 392
    const-string v4, "service"

    const-string v5, "stormcloud"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 393
    const-string v4, "dma#document"

    invoke-virtual {v2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 394
    const-string v4, "dma#container"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 397
    :cond_22
    const-string v4, "self"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 398
    if-eqz v1, :cond_34

    .line 399
    const-string v4, "stormcloud#asset"

    invoke-virtual {v2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 400
    const-string v4, "self"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 406
    .end local v1    # "link":Lorg/json/JSONObject;
    :cond_34
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->recursiveUpdateComponentsToVersion2(Lorg/json/JSONObject;)Z

    move-result v4

    if-nez v4, :cond_3b

    .line 416
    .end local v2    # "links":Lorg/json/JSONObject;
    :goto_3a
    return v3

    .line 411
    .restart local v2    # "links":Lorg/json/JSONObject;
    :cond_3b
    const-string v4, "manifest-format-version"

    const/4 v5, 0x2

    invoke-virtual {p0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_41
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_41} :catch_43

    .line 413
    const/4 v3, 0x1

    goto :goto_3a

    .line 414
    .end local v2    # "links":Lorg/json/JSONObject;
    :catch_43
    move-exception v0

    .line 416
    .local v0, "e":Lorg/json/JSONException;
    goto :goto_3a
.end method

.method static updateManifestDictionaryToVersion3(Lorg/json/JSONObject;)Z
    .registers 6
    .param p0, "dict"    # Lorg/json/JSONObject;

    .prologue
    .line 297
    const-string v3, "_links"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 298
    .local v2, "links":Lorg/json/JSONObject;
    const-string v3, "etag"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 299
    .local v0, "etag":Ljava/lang/String;
    if-eqz v2, :cond_22

    if-eqz v0, :cond_22

    .line 300
    const-string v3, "stormcloud#asset"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 301
    .local v1, "link":Lorg/json/JSONObject;
    if-eqz v1, :cond_1d

    .line 303
    :try_start_18
    const-string v3, "etag"

    invoke-virtual {v1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_1d} :catch_34

    .line 308
    :cond_1d
    :goto_1d
    const-string v3, "etag"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 312
    .end local v1    # "link":Lorg/json/JSONObject;
    :cond_22
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->recursiveUpdateComponentsToVersion3(Lorg/json/JSONObject;)Z

    move-result v3

    if-nez v3, :cond_2a

    .line 313
    const/4 v3, 0x0

    .line 324
    :goto_29
    return v3

    .line 318
    :cond_2a
    :try_start_2a
    const-string v3, "manifest-format-version"

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_30
    .catch Lorg/json/JSONException; {:try_start_2a .. :try_end_30} :catch_32

    .line 324
    :goto_30
    const/4 v3, 0x1

    goto :goto_29

    .line 319
    :catch_32
    move-exception v3

    goto :goto_30

    .line 304
    .restart local v1    # "link":Lorg/json/JSONObject;
    :catch_34
    move-exception v3

    goto :goto_1d
.end method

.method static updateManifestDictionaryToVersion4(Lorg/json/JSONObject;)Z
    .registers 8
    .param p0, "dict"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x0

    .line 209
    :try_start_1
    const-string v4, "_links"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 210
    .local v1, "links":Lorg/json/JSONObject;
    if-eqz v1, :cond_2e

    .line 211
    const-string v4, "stormcloud#asset"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_16

    .line 212
    const-string v4, "stormcloud#asset"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 214
    :cond_16
    const-string v4, "dma#document"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_23

    .line 215
    const-string v4, "dma#document"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 217
    :cond_23
    invoke-virtual {v1}, Lorg/json/JSONObject;->length()I

    move-result v4

    if-nez v4, :cond_2e

    .line 218
    const-string v4, "_links"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 223
    :cond_2e
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->recursiveUpdateComponentsToVersion4(Lorg/json/JSONObject;)Z

    move-result v4

    if-nez v4, :cond_35

    .line 248
    .end local v1    # "links":Lorg/json/JSONObject;
    :goto_34
    return v3

    .line 228
    .restart local v1    # "links":Lorg/json/JSONObject;
    :cond_35
    sget-object v4, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->DCXTypeMapperToVersion4:Lorg/json/JSONObject;

    invoke-virtual {v4}, Lorg/json/JSONObject;->length()I

    move-result v4

    if-nez v4, :cond_58

    .line 230
    sget-object v4, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->DCXTypeMapperToVersion4:Lorg/json/JSONObject;

    const-string v5, "application/vnd.adobe.html+cd"

    const-string v6, "application/vnd.adobe.html+dcx"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 231
    sget-object v4, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->DCXTypeMapperToVersion4:Lorg/json/JSONObject;

    const-string v5, "application/vnd.adobe.violet.sketchBook+cd"

    const-string v6, "application/vnd.adobe.sketch.project+dcx"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 232
    sget-object v4, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->DCXTypeMapperToVersion4:Lorg/json/JSONObject;

    const-string v5, "application/vnd.adobe.test+cd"

    const-string v6, "application/vnd.adobe.test+dcx"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 236
    :cond_58
    sget-object v4, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->DCXTypeMapperToVersion4:Lorg/json/JSONObject;

    const-string v5, "type"

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 237
    .local v2, "newType":Ljava/lang/String;
    if-eqz v2, :cond_6b

    .line 238
    const-string v4, "type"

    invoke-virtual {p0, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 242
    :cond_6b
    const-string v4, "manifest-format-version"

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_71
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_71} :catch_73

    .line 244
    const/4 v3, 0x1

    goto :goto_34

    .line 246
    .end local v1    # "links":Lorg/json/JSONObject;
    .end local v2    # "newType":Ljava/lang/String;
    :catch_73
    move-exception v0

    .line 248
    .local v0, "e":Lorg/json/JSONException;
    goto :goto_34
.end method

.method static updateManifestDictionaryToVersion5(Lorg/json/JSONObject;)Z
    .registers 7
    .param p0, "dict"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x0

    .line 136
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    invoke-static {p0, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestFormatConverter;->recursiveUpdateComponentsToVersion5(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 138
    .local v2, "storageIdLookup":Lorg/json/JSONObject;
    if-nez v2, :cond_d

    .line 154
    :goto_c
    return v3

    .line 142
    :cond_d
    :try_start_d
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v4

    if-lez v4, :cond_22

    .line 143
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 144
    .local v1, "local":Lorg/json/JSONObject;
    const-string v4, "copyOnWrite#storageIds"

    invoke-virtual {v1, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 145
    const-string v4, "local"

    invoke-virtual {p0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 149
    .end local v1    # "local":Lorg/json/JSONObject;
    :cond_22
    const-string v4, "manifest-format-version"

    const/4 v5, 0x5

    invoke-virtual {p0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_28
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_28} :catch_2a

    .line 151
    const/4 v3, 0x1

    goto :goto_c

    .line 152
    :catch_2a
    move-exception v0

    .line 154
    .local v0, "e":Lorg/json/JSONException;
    goto :goto_c
.end method
