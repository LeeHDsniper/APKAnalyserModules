.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageCopyUtils;
.super Ljava/lang/Object;
.source "AdobeStorageCopyUtils.java"


# direct methods
.method public static deepMutableCopyOfArray(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .registers 8
    .param p0, "source"    # Lorg/json/JSONArray;

    .prologue
    .line 158
    if-nez p0, :cond_4

    .line 159
    const/4 v2, 0x0

    .line 181
    :cond_3
    return-object v2

    .line 161
    :cond_4
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 162
    .local v2, "mutableCopy":Lorg/json/JSONArray;
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 163
    .local v3, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    if-ge v1, v3, :cond_3

    .line 165
    :try_start_10
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 166
    .local v4, "object":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lorg/json/JSONObject;

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 167
    check-cast v4, Lorg/json/JSONObject;

    .end local v4    # "object":Ljava/lang/Object;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageCopyUtils;->deepMutableCopyOfDictionary(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v2, v1, v5}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 163
    :goto_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 169
    .restart local v4    # "object":Ljava/lang/Object;
    :cond_2c
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lorg/json/JSONArray;

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 170
    check-cast v4, Lorg/json/JSONArray;

    .end local v4    # "object":Ljava/lang/Object;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageCopyUtils;->deepMutableCopyOfArray(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v2, v1, v5}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;
    :try_end_41
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_41} :catch_42

    goto :goto_29

    .line 175
    :catch_42
    move-exception v0

    .line 177
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_29

    .line 173
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v4    # "object":Ljava/lang/Object;
    :cond_47
    :try_start_47
    invoke-virtual {v2, v1, v4}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;
    :try_end_4a
    .catch Lorg/json/JSONException; {:try_start_47 .. :try_end_4a} :catch_42

    goto :goto_29
.end method

.method public static deepMutableCopyOfDictionary(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 8
    .param p0, "source"    # Lorg/json/JSONObject;

    .prologue
    .line 132
    if-nez p0, :cond_4

    .line 133
    const/4 v3, 0x0

    .line 154
    :cond_3
    return-object v3

    .line 135
    :cond_4
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 136
    .local v3, "mutableCopy":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 137
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 139
    .local v2, "key":Ljava/lang/String;
    :try_start_19
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 140
    .local v4, "object":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lorg/json/JSONObject;

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_38

    .line 141
    check-cast v4, Lorg/json/JSONObject;

    .end local v4    # "object":Ljava/lang/Object;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageCopyUtils;->deepMutableCopyOfDictionary(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v3, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_32
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_32} :catch_33

    goto :goto_d

    .line 149
    :catch_33
    move-exception v0

    .line 151
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_d

    .line 143
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v4    # "object":Ljava/lang/Object;
    :cond_38
    :try_start_38
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lorg/json/JSONArray;

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 144
    check-cast v4, Lorg/json/JSONArray;

    .end local v4    # "object":Ljava/lang/Object;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageCopyUtils;->deepMutableCopyOfArray(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v3, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_d

    .line 147
    .restart local v4    # "object":Ljava/lang/Object;
    :cond_4e
    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_51
    .catch Lorg/json/JSONException; {:try_start_38 .. :try_end_51} :catch_33

    goto :goto_d
.end method
