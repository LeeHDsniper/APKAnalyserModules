.class final Lcom/google/android/gms/internal/zzqj;
.super Ljava/lang/Object;


# direct methods
.method static zza(ILorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzag$zza;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/json/JSONArray;",
            "[",
            "Lcom/google/android/gms/internal/zzag$zza;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/google/android/gms/internal/zzag$zza;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzqp$zzg;,
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v7, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Value cycle detected. Current value reference: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "  Previous value references: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzqj;->zzfi(Ljava/lang/String;)V

    :cond_38
    const-string v0, "values"

    invoke-static {p1, p0, v0}, Lcom/google/android/gms/internal/zzqj;->zza(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    aget-object v2, p2, p0

    if-eqz v2, :cond_45

    aget-object v0, p2, p0

    :goto_44
    return-object v0

    :cond_45
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v3, Lcom/google/android/gms/internal/zzag$zza;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzag$zza;-><init>()V

    instance-of v2, v0, Lorg/json/JSONArray;

    if-eqz v2, :cond_78

    check-cast v0, Lorg/json/JSONArray;

    const/4 v2, 0x2

    iput v2, v3, Lcom/google/android/gms/internal/zzag$zza;->type:I

    iput-boolean v7, v3, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-array v2, v2, [Lcom/google/android/gms/internal/zzag$zza;

    iput-object v2, v3, Lcom/google/android/gms/internal/zzag$zza;->zziV:[Lcom/google/android/gms/internal/zzag$zza;

    :goto_64
    iget-object v2, v3, Lcom/google/android/gms/internal/zzag$zza;->zziV:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v2, v2

    if-ge v1, v2, :cond_b2

    iget-object v2, v3, Lcom/google/android/gms/internal/zzag$zza;->zziV:[Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    invoke-static {v4, p1, p2, p3}, Lcom/google/android/gms/internal/zzqj;->zza(ILorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v4

    aput-object v4, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_64

    :cond_78
    instance-of v2, v0, Lorg/json/JSONObject;

    if-eqz v2, :cond_14d

    check-cast v0, Lorg/json/JSONObject;

    const-string v2, "escaping"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    if-eqz v4, :cond_9f

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-array v2, v2, [I

    iput-object v2, v3, Lcom/google/android/gms/internal/zzag$zza;->zzjd:[I

    move v2, v1

    :goto_8f
    iget-object v5, v3, Lcom/google/android/gms/internal/zzag$zza;->zzjd:[I

    array-length v5, v5

    if-ge v2, v5, :cond_9f

    iget-object v5, v3, Lcom/google/android/gms/internal/zzag$zza;->zzjd:[I

    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    aput v6, v5, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_8f

    :cond_9f
    const-string v2, "function_id"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_bd

    const/4 v1, 0x5

    iput v1, v3, Lcom/google/android/gms/internal/zzag$zza;->type:I

    const-string v1, "function_id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Lcom/google/android/gms/internal/zzag$zza;->zziZ:Ljava/lang/String;

    :cond_b2
    :goto_b2
    aput-object v3, p2, p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p3, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-object v0, v3

    goto :goto_44

    :cond_bd
    const-string v2, "macro_reference"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_db

    const/4 v1, 0x4

    iput v1, v3, Lcom/google/android/gms/internal/zzag$zza;->type:I

    iput-boolean v7, v3, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    const-string v1, "macro_reference"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzqj;->zza(ILorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdf;->zzg(Lcom/google/android/gms/internal/zzag$zza;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Lcom/google/android/gms/internal/zzag$zza;->zziY:Ljava/lang/String;

    goto :goto_b2

    :cond_db
    const-string v2, "template_token"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10a

    const/4 v2, 0x7

    iput v2, v3, Lcom/google/android/gms/internal/zzag$zza;->type:I

    iput-boolean v7, v3, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    const-string v2, "template_token"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-array v2, v2, [Lcom/google/android/gms/internal/zzag$zza;

    iput-object v2, v3, Lcom/google/android/gms/internal/zzag$zza;->zzjc:[Lcom/google/android/gms/internal/zzag$zza;

    :goto_f6
    iget-object v2, v3, Lcom/google/android/gms/internal/zzag$zza;->zzjc:[Lcom/google/android/gms/internal/zzag$zza;

    array-length v2, v2

    if-ge v1, v2, :cond_b2

    iget-object v2, v3, Lcom/google/android/gms/internal/zzag$zza;->zzjc:[Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    invoke-static {v4, p1, p2, p3}, Lcom/google/android/gms/internal/zzqj;->zza(ILorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v4

    aput-object v4, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_f6

    :cond_10a
    const/4 v2, 0x3

    iput v2, v3, Lcom/google/android/gms/internal/zzag$zza;->type:I

    iput-boolean v7, v3, Lcom/google/android/gms/internal/zzag$zza;->zzje:Z

    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result v2

    new-array v4, v2, [Lcom/google/android/gms/internal/zzag$zza;

    iput-object v4, v3, Lcom/google/android/gms/internal/zzag$zza;->zziW:[Lcom/google/android/gms/internal/zzag$zza;

    new-array v2, v2, [Lcom/google/android/gms/internal/zzag$zza;

    iput-object v2, v3, Lcom/google/android/gms/internal/zzag$zza;->zziX:[Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    move v2, v1

    :goto_120
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v5, v3, Lcom/google/android/gms/internal/zzag$zza;->zziW:[Lcom/google/android/gms/internal/zzag$zza;

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v1}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v6, p1, p2, p3}, Lcom/google/android/gms/internal/zzqj;->zza(ILorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v6

    aput-object v6, v5, v2

    iget-object v5, v3, Lcom/google/android/gms/internal/zzag$zza;->zziX:[Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1, p1, p2, p3}, Lcom/google/android/gms/internal/zzqj;->zza(ILorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v1

    aput-object v1, v5, v2

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_120

    :cond_14d
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_159

    check-cast v0, Ljava/lang/String;

    iput-object v0, v3, Lcom/google/android/gms/internal/zzag$zza;->zziU:Ljava/lang/String;

    iput v7, v3, Lcom/google/android/gms/internal/zzag$zza;->type:I

    goto/16 :goto_b2

    :cond_159
    instance-of v1, v0, Ljava/lang/Boolean;

    if-eqz v1, :cond_16b

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, v3, Lcom/google/android/gms/internal/zzag$zza;->zzjb:Z

    const/16 v0, 0x8

    iput v0, v3, Lcom/google/android/gms/internal/zzag$zza;->type:I

    goto/16 :goto_b2

    :cond_16b
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_17d

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, v3, Lcom/google/android/gms/internal/zzag$zza;->zzja:J

    const/4 v0, 0x6

    iput v0, v3, Lcom/google/android/gms/internal/zzag$zza;->type:I

    goto/16 :goto_b2

    :cond_17d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid value type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzqj;->zzfi(Ljava/lang/String;)V

    goto/16 :goto_b2
.end method

.method static zza(Lorg/json/JSONObject;Lorg/json/JSONArray;Lorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;I)Lcom/google/android/gms/internal/zzqp$zza;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzqp$zzg;,
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzqp$zza;->zzBC()Lcom/google/android/gms/internal/zzqp$zzb;

    move-result-object v3

    const-string v0, "property"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v0, 0x0

    move v2, v0

    :goto_c
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v2, v0, :cond_51

    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v0

    const-string v1, "properties"

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzqj;->zza(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    const-string v1, "key"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v5, "key"

    invoke-static {p2, v1, v5}, Lcom/google/android/gms/internal/zzqj;->zza(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v5, "value"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v5, "value"

    invoke-static {p3, v0, v5}, Lcom/google/android/gms/internal/zzqj;->zza([Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    sget-object v5, Lcom/google/android/gms/internal/zzae;->zzgv:Lcom/google/android/gms/internal/zzae;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzae;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4d

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzqp$zzb;->zzq(Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/internal/zzqp$zzb;

    :goto_49
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_c

    :cond_4d
    invoke-virtual {v3, v1, v0}, Lcom/google/android/gms/internal/zzqp$zzb;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/internal/zzqp$zzb;

    goto :goto_49

    :cond_51
    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzqp$zzb;->zzBE()Lcom/google/android/gms/internal/zzqp$zza;

    move-result-object v0

    return-object v0
.end method

.method static zza(Lorg/json/JSONObject;Ljava/util/List;Ljava/util/List;Ljava/util/List;[Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/internal/zzqp$zze;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zza;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zza;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zza;",
            ">;[",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ")",
            "Lcom/google/android/gms/internal/zzqp$zze;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzqp$zze;->zzBJ()Lcom/google/android/gms/internal/zzqp$zzf;

    move-result-object v3

    const-string v1, "positive_predicate"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const-string v1, "negative_predicate"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const-string v1, "add_tag"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    const-string v1, "remove_tag"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    const-string v1, "add_tag_rule_name"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    const-string v1, "remove_tag_rule_name"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    const-string v1, "add_macro"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    const-string v1, "remove_macro"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    const-string v1, "add_macro_rule_name"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    const-string v1, "remove_macro_rule_name"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    if-eqz v4, :cond_5d

    const/4 v1, 0x0

    move v2, v1

    :goto_44
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_5d

    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v1

    move-object/from16 v0, p3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzqp$zza;

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/zzqp$zzf;->zzd(Lcom/google/android/gms/internal/zzqp$zza;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_44

    :cond_5d
    if-eqz v5, :cond_7a

    const/4 v1, 0x0

    move v2, v1

    :goto_61
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_7a

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v1

    move-object/from16 v0, p3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzqp$zza;

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/zzqp$zzf;->zze(Lcom/google/android/gms/internal/zzqp$zza;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_61

    :cond_7a
    if-eqz v6, :cond_95

    const/4 v1, 0x0

    move v2, v1

    :goto_7e
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_95

    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzqp$zza;

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/zzqp$zzf;->zzf(Lcom/google/android/gms/internal/zzqp$zza;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_7e

    :cond_95
    if-eqz v7, :cond_b0

    const/4 v1, 0x0

    move v2, v1

    :goto_99
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_b0

    invoke-virtual {v7, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzqp$zza;

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/zzqp$zzf;->zzg(Lcom/google/android/gms/internal/zzqp$zza;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_99

    :cond_b0
    if-eqz v8, :cond_c7

    const/4 v1, 0x0

    :goto_b3
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_c7

    invoke-virtual {v8, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    aget-object v2, p4, v2

    iget-object v2, v2, Lcom/google/android/gms/internal/zzag$zza;->zziU:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/google/android/gms/internal/zzqp$zzf;->zzfl(Ljava/lang/String;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v1, 0x1

    goto :goto_b3

    :cond_c7
    if-eqz v9, :cond_de

    const/4 v1, 0x0

    :goto_ca
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_de

    invoke-virtual {v9, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    aget-object v2, p4, v2

    iget-object v2, v2, Lcom/google/android/gms/internal/zzag$zza;->zziU:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/google/android/gms/internal/zzqp$zzf;->zzfm(Ljava/lang/String;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v1, 0x1

    goto :goto_ca

    :cond_de
    if-eqz v10, :cond_fb

    const/4 v1, 0x0

    move v2, v1

    :goto_e2
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_fb

    invoke-virtual {v10, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v1

    move-object/from16 v0, p2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzqp$zza;

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/zzqp$zzf;->zzh(Lcom/google/android/gms/internal/zzqp$zza;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_e2

    :cond_fb
    if-eqz v11, :cond_118

    const/4 v1, 0x0

    move v2, v1

    :goto_ff
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_118

    invoke-virtual {v11, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v1

    move-object/from16 v0, p2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzqp$zza;

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/zzqp$zzf;->zzi(Lcom/google/android/gms/internal/zzqp$zza;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_ff

    :cond_118
    if-eqz v12, :cond_12f

    const/4 v1, 0x0

    :goto_11b
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_12f

    invoke-virtual {v12, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    aget-object v2, p4, v2

    iget-object v2, v2, Lcom/google/android/gms/internal/zzag$zza;->zziU:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/google/android/gms/internal/zzqp$zzf;->zzfn(Ljava/lang/String;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v1, 0x1

    goto :goto_11b

    :cond_12f
    if-eqz v13, :cond_146

    const/4 v1, 0x0

    :goto_132
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_146

    invoke-virtual {v13, v1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    aget-object v2, p4, v2

    iget-object v2, v2, Lcom/google/android/gms/internal/zzag$zza;->zziU:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/google/android/gms/internal/zzqp$zzf;->zzfo(Ljava/lang/String;)Lcom/google/android/gms/internal/zzqp$zzf;

    add-int/lit8 v1, v1, 0x1

    goto :goto_132

    :cond_146
    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzqp$zzf;->zzBU()Lcom/google/android/gms/internal/zzqp$zze;

    move-result-object v1

    return-object v1
.end method

.method private static zza(Lorg/json/JSONArray;ILjava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/json/JSONArray;",
            "I",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzqp$zzg;
        }
    .end annotation

    if-ltz p1, :cond_e

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge p1, v0, :cond_e

    :try_start_8
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_b} :catch_d

    move-result-object v0

    :goto_c
    return-object v0

    :catch_d
    move-exception v0

    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Index out of bounds detected: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzqj;->zzfi(Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_c
.end method

.method private static zza([Ljava/lang/Object;ILjava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzqp$zzg;
        }
    .end annotation

    if-ltz p1, :cond_5

    array-length v0, p0

    if-lt p1, v0, :cond_25

    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Index out of bounds detected: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzqj;->zzfi(Ljava/lang/String;)V

    :cond_25
    aget-object v0, p0, p1

    return-object v0
.end method

.method static zza(Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Lorg/json/JSONArray;",
            "Lorg/json/JSONArray;",
            "[",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zza;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/google/android/gms/internal/zzqp$zzg;
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    :goto_6
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_1a

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2, p1, p2, p3, v0}, Lcom/google/android/gms/internal/zzqj;->zza(Lorg/json/JSONObject;Lorg/json/JSONArray;Lorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;I)Lcom/google/android/gms/internal/zzqp$zza;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_1a
    return-object v1
.end method

.method static zzeN(Ljava/lang/String;)Lcom/google/android/gms/internal/zzqp$zzc;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/google/android/gms/internal/zzqp$zzg;
        }
    .end annotation

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "resource"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lorg/json/JSONObject;

    if-eqz v1, :cond_57

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {}, Lcom/google/android/gms/internal/zzqp$zzc;->zzBF()Lcom/google/android/gms/internal/zzqp$zzd;

    move-result-object v3

    invoke-static {v0}, Lcom/google/android/gms/internal/zzqj;->zzj(Lorg/json/JSONObject;)[Lcom/google/android/gms/internal/zzag$zza;

    move-result-object v4

    const-string v1, "properties"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    const-string v5, "key"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const-string v6, "tags"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-static {v6, v1, v5, v4}, Lcom/google/android/gms/internal/zzqj;->zza(Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/List;

    move-result-object v6

    const-string v7, "predicates"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-static {v7, v1, v5, v4}, Lcom/google/android/gms/internal/zzqj;->zza(Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/List;

    move-result-object v7

    const-string v8, "macros"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    invoke-static {v8, v1, v5, v4}, Lcom/google/android/gms/internal/zzqj;->zza(Lorg/json/JSONArray;Lorg/json/JSONArray;Lorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_47
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzqp$zza;

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/zzqp$zzd;->zzc(Lcom/google/android/gms/internal/zzqp$zza;)Lcom/google/android/gms/internal/zzqp$zzd;

    goto :goto_47

    :cond_57
    new-instance v0, Lcom/google/android/gms/internal/zzqp$zzg;

    const-string v1, "Resource map not found"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzqp$zzg;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5f
    const-string v1, "rules"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    const/4 v0, 0x0

    :goto_66
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v0, v8, :cond_7a

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-static {v8, v6, v5, v7, v4}, Lcom/google/android/gms/internal/zzqj;->zza(Lorg/json/JSONObject;Ljava/util/List;Ljava/util/List;Ljava/util/List;[Lcom/google/android/gms/internal/zzag$zza;)Lcom/google/android/gms/internal/zzqp$zze;

    move-result-object v8

    invoke-virtual {v3, v8}, Lcom/google/android/gms/internal/zzqp$zzd;->zzb(Lcom/google/android/gms/internal/zzqp$zze;)Lcom/google/android/gms/internal/zzqp$zzd;

    add-int/lit8 v0, v0, 0x1

    goto :goto_66

    :cond_7a
    const-string v0, "1"

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzqp$zzd;->zzfk(Ljava/lang/String;)Lcom/google/android/gms/internal/zzqp$zzd;

    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzqp$zzd;->zzjm(I)Lcom/google/android/gms/internal/zzqp$zzd;

    const-string v0, "runtime"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_8b

    :cond_8b
    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzqp$zzd;->zzBI()Lcom/google/android/gms/internal/zzqp$zzc;

    move-result-object v0

    return-object v0
.end method

.method private static zzfi(Ljava/lang/String;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/zzqp$zzg;
        }
    .end annotation

    invoke-static {p0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/zzqp$zzg;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzqp$zzg;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static zzj(Lorg/json/JSONObject;)[Lcom/google/android/gms/internal/zzag$zza;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/google/android/gms/internal/zzqp$zzg;
        }
    .end annotation

    const/4 v2, 0x0

    const-string v0, "values"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lorg/json/JSONArray;

    if-eqz v1, :cond_22

    check-cast v0, Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    new-array v3, v1, [Lcom/google/android/gms/internal/zzag$zza;

    move v1, v2

    :goto_14
    array-length v4, v3

    if-ge v1, v4, :cond_2a

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4, v2}, Ljava/util/HashSet;-><init>(I)V

    invoke-static {v1, v0, v3, v4}, Lcom/google/android/gms/internal/zzqj;->zza(ILorg/json/JSONArray;[Lcom/google/android/gms/internal/zzag$zza;Ljava/util/Set;)Lcom/google/android/gms/internal/zzag$zza;

    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_22
    new-instance v0, Lcom/google/android/gms/internal/zzqp$zzg;

    const-string v1, "Missing Values list"

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzqp$zzg;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2a
    return-object v3
.end method
