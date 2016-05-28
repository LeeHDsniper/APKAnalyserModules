.class public final Lcom/adobe/creativesdk/aviary/internal/headless/moa/JSONWriter;
.super Ljava/lang/Object;
.source "JSONWriter.java"


# direct methods
.method public static encode(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;)Ljava/lang/String;
    .registers 14
    .param p0, "actionlist"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .param p1, "metadata"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 31
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 32
    .local v8, "jroot":Lorg/json/JSONObject;
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 34
    .local v6, "jactionlist":Lorg/json/JSONArray;
    monitor-enter p0

    .line 35
    :try_start_b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 36
    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    :goto_f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_90

    .line 37
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    .line 38
    .local v1, "current":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 39
    .local v9, "obj":Lorg/json/JSONObject;
    const-string v10, "action"

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->entrySet()Ljava/util/Set;

    move-result-object v2

    .line 42
    .local v2, "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 43
    .local v4, "entryIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :goto_31
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_8c

    .line 44
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 45
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    instance-of v10, v10, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;

    if-eqz v10, :cond_5e

    .line 46
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;

    check-cast v11, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;

    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;->encode()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_31

    .line 57
    .end local v1    # "current":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    .end local v2    # "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "entryIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    .end local v9    # "obj":Lorg/json/JSONObject;
    :catchall_5b
    move-exception v10

    monitor-exit p0
    :try_end_5d
    .catchall {:try_start_b .. :try_end_5d} :catchall_5b

    throw v10

    .line 47
    .restart local v1    # "current":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    .restart local v2    # "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v4    # "entryIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    .restart local v9    # "obj":Lorg/json/JSONObject;
    :cond_5e
    :try_start_5e
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    instance-of v10, v10, Ljava/util/Collection;

    if-eqz v10, :cond_7e

    .line 48
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 49
    .local v0, "array":Lorg/json/JSONArray;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Collection;

    invoke-static {v0, v10}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/JSONWriter;->encodeCollection(Lorg/json/JSONArray;Ljava/util/Collection;)V

    .line 50
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v9, v10, v0}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_31

    .line 52
    .end local v0    # "array":Lorg/json/JSONArray;
    :cond_7e
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_31

    .line 55
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_8c
    invoke-virtual {v6, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_f

    .line 57
    .end local v1    # "current":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    .end local v2    # "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4    # "entryIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v9    # "obj":Lorg/json/JSONObject;
    :cond_90
    monitor-exit p0
    :try_end_91
    .catchall {:try_start_5e .. :try_end_91} :catchall_5b

    .line 59
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->encode()Lorg/json/JSONObject;

    move-result-object v7

    .line 61
    .local v7, "jmetadata":Lorg/json/JSONObject;
    const-string v10, "metadata"

    invoke-virtual {v8, v10, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    const-string v10, "actionlist"

    invoke-virtual {v8, v10, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method

.method static encodeCollection(Lorg/json/JSONArray;Ljava/util/Collection;)V
    .registers 6
    .param p0, "parent"    # Lorg/json/JSONArray;
    .param p1, "object"    # Ljava/util/Collection;

    .prologue
    .line 69
    monitor-enter p1

    .line 70
    :try_start_1
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 71
    .local v1, "arrayIterator":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    .line 72
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 73
    .local v2, "item":Ljava/lang/Object;
    instance-of v3, v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;

    if-eqz v3, :cond_20

    .line 74
    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;

    .end local v2    # "item":Ljava/lang/Object;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;->encode()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_5

    .line 85
    .end local v1    # "arrayIterator":Ljava/util/Iterator;
    :catchall_1d
    move-exception v3

    monitor-exit p1
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_1d

    throw v3

    .line 76
    .restart local v1    # "arrayIterator":Ljava/util/Iterator;
    .restart local v2    # "item":Ljava/lang/Object;
    :cond_20
    :try_start_20
    instance-of v3, v2, Ljava/util/Collection;

    if-eqz v3, :cond_32

    .line 77
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 78
    .local v0, "array":Lorg/json/JSONArray;
    check-cast v2, Ljava/util/Collection;

    .end local v2    # "item":Ljava/lang/Object;
    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/JSONWriter;->encodeCollection(Lorg/json/JSONArray;Ljava/util/Collection;)V

    .line 79
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_5

    .line 81
    .end local v0    # "array":Lorg/json/JSONArray;
    .restart local v2    # "item":Ljava/lang/Object;
    :cond_32
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_5

    .line 85
    .end local v2    # "item":Ljava/lang/Object;
    :cond_36
    monitor-exit p1
    :try_end_37
    .catchall {:try_start_20 .. :try_end_37} :catchall_1d

    .line 86
    return-void
.end method
