.class final Lcom/localytics/android/JsonHelper;
.super Ljava/lang/Object;
.source "JsonHelper.java"


# direct methods
.method public static fromJson(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "json"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 83
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-ne p0, v0, :cond_6

    .line 85
    const/4 p0, 0x0

    .line 97
    .end local p0    # "json":Ljava/lang/Object;
    :cond_5
    :goto_5
    return-object p0

    .line 87
    .restart local p0    # "json":Ljava/lang/Object;
    :cond_6
    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_11

    .line 89
    check-cast p0, Lorg/json/JSONObject;

    .end local p0    # "json":Ljava/lang/Object;
    invoke-static {p0}, Lcom/localytics/android/JsonHelper;->toMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p0

    goto :goto_5

    .line 91
    .restart local p0    # "json":Ljava/lang/Object;
    :cond_11
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_5

    .line 93
    check-cast p0, Lorg/json/JSONArray;

    .end local p0    # "json":Ljava/lang/Object;
    invoke-static {p0}, Lcom/localytics/android/JsonHelper;->toList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p0

    goto :goto_5
.end method

.method public static getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 123
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 124
    .local v0, "integerValue":I
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 126
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_9

    .line 128
    const/4 v2, 0x0

    .line 139
    .end local v1    # "value":Ljava/lang/Object;
    :goto_8
    return v2

    .line 130
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_9
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_15

    .line 132
    check-cast v1, Ljava/lang/Integer;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :cond_13
    :goto_13
    move v2, v0

    .line 139
    goto :goto_8

    .line 134
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_15
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_13

    .line 136
    check-cast v1, Ljava/lang/String;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_13
.end method

.method public static getSafeListFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 185
    .local v0, "listValue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 187
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_9

    .line 189
    const/4 v2, 0x0

    .line 196
    :goto_8
    return-object v2

    .line 191
    :cond_9
    instance-of v2, v1, Ljava/util/List;

    if-eqz v2, :cond_10

    move-object v0, v1

    .line 193
    check-cast v0, Ljava/util/List;

    :cond_10
    move-object v2, v0

    .line 196
    goto :goto_8
.end method

.method public static getSafeMapFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 167
    .local v0, "mapValue":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 169
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_9

    .line 171
    const/4 v2, 0x0

    .line 178
    :goto_8
    return-object v2

    .line 173
    :cond_9
    instance-of v2, v1, Ljava/util/Map;

    if-eqz v2, :cond_10

    move-object v0, v1

    .line 175
    check-cast v0, Ljava/util/Map;

    :cond_10
    move-object v2, v0

    .line 178
    goto :goto_8
.end method

.method public static getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 144
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 145
    .local v0, "stringValue":Ljava/lang/String;
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 147
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_9

    .line 149
    const/4 v2, 0x0

    .line 160
    .end local v1    # "value":Ljava/lang/Object;
    :goto_8
    return-object v2

    .line 151
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_9
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_19

    .line 153
    check-cast v1, Ljava/lang/Integer;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :cond_17
    :goto_17
    move-object v2, v0

    .line 160
    goto :goto_8

    .line 155
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_19
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_17

    move-object v0, v1

    .line 157
    check-cast v0, Ljava/lang/String;

    goto :goto_17
.end method

.method public static getSafeStringFromValue(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 103
    const/4 v0, 0x0

    .line 105
    .local v0, "stringValue":Ljava/lang/String;
    if-nez p0, :cond_5

    .line 107
    const/4 v1, 0x0

    .line 118
    .end local p0    # "value":Ljava/lang/Object;
    :goto_4
    return-object v1

    .line 109
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v1, p0, Ljava/lang/Integer;

    if-eqz v1, :cond_15

    .line 111
    check-cast p0, Ljava/lang/Integer;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :cond_13
    :goto_13
    move-object v1, v0

    .line 118
    goto :goto_4

    .line 113
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_15
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_13

    move-object v0, p0

    .line 115
    check-cast v0, Ljava/lang/String;

    goto :goto_13
.end method

.method public static toJSON(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p0, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 21
    instance-of v5, p0, Ljava/util/Map;

    if-eqz v5, :cond_2e

    .line 23
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .local v1, "json":Lorg/json/JSONObject;
    move-object v3, p0

    .line 24
    check-cast v3, Ljava/util/Map;

    .line 25
    .local v3, "map":Ljava/util/Map;
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 27
    .local v2, "key":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/localytics/android/JsonHelper;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_14

    .line 31
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "json":Lorg/json/JSONObject;
    .end local v2    # "key":Ljava/lang/Object;
    .end local v3    # "map":Ljava/util/Map;
    :cond_2e
    instance-of v5, p0, Ljava/lang/Iterable;

    if-eqz v5, :cond_4b

    .line 33
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 34
    .local v1, "json":Lorg/json/JSONArray;
    check-cast p0, Ljava/lang/Iterable;

    .end local p0    # "object":Ljava/lang/Object;
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_3d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 36
    .local v4, "value":Ljava/lang/Object;
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_3d

    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "json":Lorg/json/JSONArray;
    .end local v4    # "value":Ljava/lang/Object;
    .restart local p0    # "object":Ljava/lang/Object;
    :cond_4b
    move-object v1, p0

    .line 42
    .end local p0    # "object":Ljava/lang/Object;
    :cond_4c
    return-object v1
.end method

.method public static toList(Lorg/json/JSONArray;)Ljava/util/List;
    .registers 4
    .param p0, "array"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .local v1, "list":Ljava/util/List;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_1a

    .line 76
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/JsonHelper;->fromJson(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 78
    :cond_1a
    return-object v1
.end method

.method public static toMap(Lorg/json/JSONObject;)Ljava/util/Map;
    .registers 5
    .param p0, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 61
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 62
    .local v1, "keys":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    .line 64
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 65
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/localytics/android/JsonHelper;->fromJson(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9

    .line 67
    .end local v0    # "key":Ljava/lang/String;
    :cond_21
    return-object v2
.end method
