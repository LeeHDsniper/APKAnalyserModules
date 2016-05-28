.class public Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils;
.super Ljava/lang/Object;
.source "AdobeEntitlementUtils.java"


# direct methods
.method public static JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 8
    .param p0, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;
        }
    .end annotation

    .prologue
    .line 61
    if-nez p0, :cond_a

    .line 63
    new-instance v4, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;

    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;->AdobeEntitlementErrorMissingJSONData:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;

    invoke-direct {v4, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;)V

    throw v4

    .line 65
    :cond_a
    const/4 v1, 0x0

    .line 68
    .local v1, "jsonData":Lorg/json/JSONObject;
    :try_start_b
    const-string v4, "while \\(1\\) \\{\\}"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 69
    .local v3, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 70
    .local v2, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_25

    .line 71
    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 73
    :cond_25
    new-instance v1, Lorg/json/JSONObject;

    .end local v1    # "jsonData":Lorg/json/JSONObject;
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_2a} :catch_2b

    .line 78
    .restart local v1    # "jsonData":Lorg/json/JSONObject;
    return-object v1

    .line 74
    .end local v1    # "jsonData":Lorg/json/JSONObject;
    .end local v2    # "matcher":Ljava/util/regex/Matcher;
    .end local v3    # "pattern":Ljava/util/regex/Pattern;
    :catch_2b
    move-exception v0

    .line 75
    .local v0, "e":Lorg/json/JSONException;
    new-instance v4, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;

    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;->AdobeEntitlementErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;

    const-string v6, "Parsed collection data is not of type dictionary."

    invoke-direct {v4, v5, v6, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4
.end method

.method public static areValuesEqual(Lorg/json/JSONObject;Lorg/json/JSONObject;)Z
    .registers 15
    .param p0, "services1"    # Lorg/json/JSONObject;
    .param p1, "services2"    # Lorg/json/JSONObject;

    .prologue
    .line 268
    const/4 v0, 0x0

    .local v0, "count1":I
    const/4 v1, 0x0

    .line 270
    .local v1, "count2":I
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "iterator":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_12

    .line 271
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 272
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 275
    :cond_12
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    :goto_16
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_22

    .line 276
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 277
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 280
    :cond_22
    if-ne v0, v1, :cond_75

    const/4 v8, 0x1

    .line 281
    .local v8, "result":Z
    :goto_25
    if-eqz v8, :cond_74

    .line 283
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    :cond_2b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_74

    .line 284
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 285
    .local v5, "key":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 286
    .local v6, "obj1":Lorg/json/JSONObject;
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 288
    .local v7, "obj2":Lorg/json/JSONObject;
    if-eqz v6, :cond_72

    if-eqz v7, :cond_72

    .line 290
    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "innerIter":Ljava/util/Iterator;
    :cond_47
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_72

    .line 292
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 293
    .local v2, "inerKey":Ljava/lang/String;
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-class v12, Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_77

    .line 294
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 295
    .local v9, "val1":Ljava/lang/String;
    invoke-virtual {v7, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 296
    .local v10, "val2":Ljava/lang/String;
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_47

    .line 297
    const/4 v8, 0x0

    .line 319
    .end local v2    # "inerKey":Ljava/lang/String;
    .end local v3    # "innerIter":Ljava/util/Iterator;
    .end local v9    # "val1":Ljava/lang/String;
    .end local v10    # "val2":Ljava/lang/String;
    :cond_72
    :goto_72
    if-nez v8, :cond_2b

    .line 326
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "obj1":Lorg/json/JSONObject;
    .end local v7    # "obj2":Lorg/json/JSONObject;
    :cond_74
    return v8

    .line 280
    .end local v8    # "result":Z
    :cond_75
    const/4 v8, 0x0

    goto :goto_25

    .line 301
    .restart local v2    # "inerKey":Ljava/lang/String;
    .restart local v3    # "innerIter":Ljava/util/Iterator;
    .restart local v5    # "key":Ljava/lang/String;
    .restart local v6    # "obj1":Lorg/json/JSONObject;
    .restart local v7    # "obj2":Lorg/json/JSONObject;
    .restart local v8    # "result":Z
    :cond_77
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-class v12, Lorg/json/JSONObject;

    invoke-virtual {v11, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_97

    .line 302
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 303
    .local v9, "val1":Lorg/json/JSONObject;
    invoke-virtual {v7, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 304
    .local v10, "val2":Lorg/json/JSONObject;
    invoke-static {v9, v10}, Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils;->areValuesEqual(Lorg/json/JSONObject;Lorg/json/JSONObject;)Z

    move-result v11

    if-nez v11, :cond_47

    .line 305
    const/4 v8, 0x0

    .line 306
    goto :goto_72

    .line 309
    .end local v9    # "val1":Lorg/json/JSONObject;
    .end local v10    # "val2":Lorg/json/JSONObject;
    :cond_97
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v9

    .line 310
    .local v9, "val1":Z
    invoke-virtual {v7, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v10

    .line 311
    .local v10, "val2":Z
    if-eq v9, v10, :cond_47

    .line 312
    const/4 v8, 0x0

    .line 313
    goto :goto_72
.end method

.method public static fallbackEndpointsData()Lorg/json/JSONObject;
    .registers 5

    .prologue
    .line 84
    const/4 v2, 0x0

    .line 87
    .local v2, "result":Lorg/json/JSONObject;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v1

    .line 89
    .local v1, "environment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIMSEnvironmentTestUS:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    if-ne v1, v4, :cond_1b

    .line 92
    :try_start_d
    new-instance v3, Lorg/json/JSONObject;

    const-string v4, "{\nendpoints:\n\t[\n\t{\"features\" : {\"photos\" : {\"service\" : {\"uri\" : \"https://api.oznext.com\"}}},\n\t\t\"id\" : \"00000000-0000-0000-0000-000000000000\",\n\t\t\"name\" : \"Adobe Creative Cloud [QA1]\",\n\t\t\"private\" : NO,\n\t\t\"status\" : \"ONLINE\"}\n\t]\n};"

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_14} :catch_16

    .end local v2    # "result":Lorg/json/JSONObject;
    .local v3, "result":Lorg/json/JSONObject;
    move-object v2, v3

    .line 153
    .end local v3    # "result":Lorg/json/JSONObject;
    .restart local v2    # "result":Lorg/json/JSONObject;
    :cond_15
    :goto_15
    return-object v2

    .line 102
    :catch_16
    move-exception v0

    .line 103
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_15

    .line 106
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1b
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIMSEnvironmentStageUS:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    if-ne v1, v4, :cond_2d

    .line 109
    :try_start_1f
    new-instance v3, Lorg/json/JSONObject;

    const-string v4, "{\nendpoints:\n\t[\n\t{\"features\" : {\n\t\t\"files\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage-stage.adobe.io\"},\"archive\" :{ \"uri\" : \"https://cc-api-storage-stage.adobe.io\"}},\n\t\t\"assets\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage-stage.adobe.io\"}},\n\t\t\"libraries\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage-stage.adobe.io\"}},\n\t\t\"imageservices\" : {\"service\" : {\"uri\" : \"https://cc-api-image-stage.adobe.io\"}},\n\t\t\"clipboard\" : {\"service\" : {\"uri\" : \"https://cc-api-storage-stage.adobe.io\"}}\n\t},\n\t\t\"id\" : \"00000000-0000-0000-0000-000000000000\",\n\t\t\"name\" : \"Adobe Creative Cloud [Stage] (static)\",\n\t\t\"private\" : NO,\n\t\t\"status\" : \"ONLINE\"},\n\t]\n};"

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_26
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_26} :catch_28

    .end local v2    # "result":Lorg/json/JSONObject;
    .restart local v3    # "result":Lorg/json/JSONObject;
    move-object v2, v3

    .line 127
    .end local v3    # "result":Lorg/json/JSONObject;
    .restart local v2    # "result":Lorg/json/JSONObject;
    goto :goto_15

    .line 125
    :catch_28
    move-exception v0

    .line 126
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_15

    .line 129
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2d
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIMSEnvironmentProductionUS:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    if-ne v1, v4, :cond_15

    .line 132
    :try_start_31
    new-instance v3, Lorg/json/JSONObject;

    const-string v4, "{\nendpoints:\n\t[\n\t{\"features\" : {\n\t\t\"files\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage.adobe.io\"}, \"archive\" :{ \"uri\" : \"https://cc-api-storage.adobe.io\"} },\n\t\t\"assets\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage.adobe.io\"}},\n\t\t\"libraries\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage.adobe.io\"}},\n\t\t\"imageservices\" : {\"service\" : {\"uri\" : \"https://cc-api-image.adobe.io\"}},\n\t\t\"clipboard\" : {\"service\" : {\"uri\" : \"https://cc-api-storage.adobe.io\"}}\n\t},\n\t\t\"id\" : \"00000000-0000-0000-0000-000000000000\",\n\t\t\"name\" : \"Adobe Creative Cloud\",\n\t\t\"private\" : NO,\n\t\t\"status\" : \"ONLINE\"},\n\t]\n};"

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_38
    .catch Lorg/json/JSONException; {:try_start_31 .. :try_end_38} :catch_3a

    .end local v2    # "result":Lorg/json/JSONObject;
    .restart local v3    # "result":Lorg/json/JSONObject;
    move-object v2, v3

    .line 150
    .end local v3    # "result":Lorg/json/JSONObject;
    .restart local v2    # "result":Lorg/json/JSONObject;
    goto :goto_15

    .line 148
    :catch_3a
    move-exception v0

    .line 149
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_15
.end method

.method public static fallbackServicesData()Lorg/json/JSONObject;
    .registers 6

    .prologue
    .line 157
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 159
    .local v2, "result":Lorg/json/JSONObject;
    :try_start_5
    const-string v3, "endpoints"

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils;->fallbackEndpointsData()Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "endpoints"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 160
    new-instance v1, Lorg/json/JSONObject;

    const-string v3, "\t\t\t{\nBehance: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nccv: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\ncollaboration: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\ncolor: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\ndesign_assets: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nedge_inspect: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nextract: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nfile_sync: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nimage: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nlibraries: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nlightroom: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nphonegap_build: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\npreview: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nstorage: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nstory: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nsync_metadata: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nsync_settings: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\ntypekit: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            }\n        }"

    invoke-direct {v1, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 234
    .local v1, "entilementService":Lorg/json/JSONObject;
    const-string v3, "services"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_20
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_20} :catch_21

    .line 239
    .end local v1    # "entilementService":Lorg/json/JSONObject;
    :goto_20
    return-object v2

    .line 235
    :catch_21
    move-exception v0

    .line 236
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_20
.end method

.method public static getServicesForUserProfile(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 5
    .param p0, "userProfileItems"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;
        }
    .end annotation

    .prologue
    .line 246
    if-eqz p0, :cond_11

    const-string v1, "services"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_11

    .line 248
    const-string v1, "services"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 249
    .local v0, "publicServices":Lorg/json/JSONObject;
    return-object v0

    .line 253
    .end local v0    # "publicServices":Lorg/json/JSONObject;
    :cond_11
    if-eqz p0, :cond_25

    const-string v1, "services"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_25

    .line 255
    new-instance v1, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;->AdobeEntitlementErrorNoServicesAvailable:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;

    const-string v3, "No Public Services are available for this user."

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;Ljava/lang/String;)V

    throw v1

    .line 260
    :cond_25
    new-instance v1, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;->AdobeEntitlementErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;

    const-string v3, "Query for Public Services returned an unexpected response."

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;Ljava/lang/String;)V

    throw v1
.end method
