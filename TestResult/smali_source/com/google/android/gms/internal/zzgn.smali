.class public final Lcom/google/android/gms/internal/zzgn;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# static fields
.field private static final zzEY:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/google/android/gms/internal/zzgn;->zzEY:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method private static zzH(I)Ljava/lang/String;
    .registers 6

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "#%06x"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const v4, 0xffffff

    and-int/2addr v4, p0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Ljava/lang/String;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
    .registers 35

    :try_start_0
    new-instance v12, Lorg/json/JSONObject;

    move-object/from16 v0, p2

    invoke-direct {v12, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "ad_base_url"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v2, "ad_url"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "ad_size"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    if-eqz p1, :cond_7f

    move-object/from16 v0, p1

    iget v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDE:I

    if-eqz v2, :cond_7f

    const/16 v25, 0x1

    :goto_26
    if-eqz v25, :cond_82

    const-string v2, "ad_json"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_2f
    const-wide/16 v18, -0x1

    const-string v2, "debug_dialog"

    const/4 v6, 0x0

    invoke-virtual {v12, v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const-string v2, "interstitial_timeout"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8a

    const-string v2, "interstitial_timeout"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    const-wide v8, 0x408f400000000000L

    mul-double/2addr v6, v8

    double-to-long v10, v6

    :goto_4d
    const-string v2, "orientation"

    const/4 v6, 0x0

    invoke-virtual {v12, v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v16, -0x1

    const-string v6, "portrait"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8d

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzhv;->zzgw()I

    move-result v16

    :cond_66
    :goto_66
    const/4 v2, 0x0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_9e

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_209

    const-string v2, "Could not parse the mediation config: Missing required ad_base_url field"

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    :goto_7e
    return-object v2

    :cond_7f
    const/16 v25, 0x0

    goto :goto_26

    :cond_82
    const-string v2, "ad_html"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2f

    :cond_8a
    const-wide/16 v10, -0x1

    goto :goto_4d

    :cond_8d
    const-string v6, "landscape"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_66

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzhv;->zzgv()I

    move-result v16

    goto :goto_66

    :cond_9e
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_e2

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v4, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p0

    invoke-static/range {v2 .. v9}, Lcom/google/android/gms/internal/zzgm;->zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzgq;Lcom/google/android/gms/internal/zzcd;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-result-object v2

    iget-object v4, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzAT:Ljava/lang/String;

    iget-object v5, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->body:Ljava/lang/String;

    iget-wide v0, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEb:J

    move-wide/from16 v18, v0

    move-object v8, v2

    :goto_bf
    const-string v2, "click_urls"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-nez v8, :cond_13c

    const/4 v2, 0x0

    :goto_c8
    if-eqz v6, :cond_206

    if-nez v2, :cond_d1

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    :cond_d1
    const/4 v3, 0x0

    :goto_d2
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v3, v7, :cond_13f

    invoke-virtual {v6, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_d2

    :cond_e2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not parse the mediation config: Missing required "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v25, :cond_139

    const-string v2, "ad_json"

    :goto_f1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " or "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "ad_url"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " field."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V
    :try_end_114
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_114} :catch_116

    goto/16 :goto_7e

    :catch_116
    move-exception v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not parse the mediation config: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(I)V

    goto/16 :goto_7e

    :cond_139
    :try_start_139
    const-string v2, "ad_html"

    goto :goto_f1

    :cond_13c
    iget-object v2, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyw:Ljava/util/List;

    goto :goto_c8

    :cond_13f
    move-object v6, v2

    :goto_140
    const-string v2, "impression_urls"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    if-nez v8, :cond_163

    const/4 v2, 0x0

    :goto_149
    if-eqz v7, :cond_203

    if-nez v2, :cond_152

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    :cond_152
    const/4 v3, 0x0

    :goto_153
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v3, v9, :cond_166

    invoke-virtual {v7, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_153

    :cond_163
    iget-object v2, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzyx:Ljava/util/List;

    goto :goto_149

    :cond_166
    move-object v7, v2

    :goto_167
    const-string v2, "manual_impression_urls"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    if-nez v8, :cond_18a

    const/4 v2, 0x0

    :goto_170
    if-eqz v9, :cond_201

    if-nez v2, :cond_179

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    :cond_179
    const/4 v3, 0x0

    :goto_17a
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v3, v13, :cond_18d

    invoke-virtual {v9, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v2, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_17a

    :cond_18a
    iget-object v2, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDZ:Ljava/util/List;

    goto :goto_170

    :cond_18d
    move-object v13, v2

    :goto_18e
    if-eqz v8, :cond_1ff

    iget v2, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_199

    iget v0, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->orientation:I

    move/from16 v16, v0

    :cond_199
    iget-wide v2, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDW:J

    const-wide/16 v14, 0x0

    cmp-long v2, v2, v14

    if-lez v2, :cond_1ff

    iget-wide v8, v8, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDW:J

    :goto_1a3
    const-string v2, "active_view"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const/16 v22, 0x0

    const-string v2, "ad_is_javascript"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v21

    if-eqz v21, :cond_1bb

    const-string v2, "ad_passback_url"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    :cond_1bb
    const-string v2, "mediation"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v10

    const-string v2, "custom_render_allowed"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v24

    const-string v2, "content_url_opted_out"

    const/4 v3, 0x1

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v27

    const-string v2, "prefetch"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v28

    const-string v2, "oauth2_token_status"

    const/4 v3, 0x0

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v29

    const-string v2, "refresh_interval_milliseconds"

    const-wide/16 v14, -0x1

    invoke-virtual {v12, v2, v14, v15}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v14

    const-string v2, "mediation_config_cache_time_milliseconds"

    const-wide/16 v30, -0x1

    move-wide/from16 v0, v30

    invoke-virtual {v12, v2, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v11

    new-instance v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDG:Z

    move/from16 v26, v0

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v29}, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;-><init>(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;JZJLjava/util/List;JILjava/lang/String;JLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;ZZZZZI)V
    :try_end_1fd
    .catch Lorg/json/JSONException; {:try_start_139 .. :try_end_1fd} :catch_116

    goto/16 :goto_7e

    :cond_1ff
    move-wide v8, v10

    goto :goto_1a3

    :cond_201
    move-object v13, v2

    goto :goto_18e

    :cond_203
    move-object v7, v2

    goto/16 :goto_167

    :cond_206
    move-object v6, v2

    goto/16 :goto_140

    :cond_209
    move-object v8, v2

    move-object v5, v3

    goto/16 :goto_bf
.end method

.method public static zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgr;Lcom/google/android/gms/internal/zzgt$zza;Landroid/location/Location;Lcom/google/android/gms/internal/zzbr;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lorg/json/JSONObject;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;",
            "Lcom/google/android/gms/internal/zzgr;",
            "Lcom/google/android/gms/internal/zzgt$zza;",
            "Landroid/location/Location;",
            "Lcom/google/android/gms/internal/zzbr;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    :try_start_0
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-interface/range {p8 .. p8}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_18

    const-string v2, "eid"

    const-string v3, ","

    move-object/from16 v0, p8

    invoke-static {v3, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_18
    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDx:Landroid/os/Bundle;

    if-eqz v2, :cond_23

    const-string v2, "ad_pos"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDx:Landroid/os/Bundle;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_23
    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    invoke-static {v4, v2}, Lcom/google/android/gms/internal/zzgn;->zza(Ljava/util/HashMap;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V

    const-string v2, "format"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsG:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget v2, v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_3f

    const-string v2, "smart_w"

    const-string v3, "full"

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3f
    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget v2, v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->height:I

    const/4 v3, -0x2

    if-ne v2, v3, :cond_4d

    const-string v2, "smart_h"

    const-string v3, "auto"

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4d
    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsI:[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    if-eqz v2, :cond_a0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v6, v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsI:[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    array-length v7, v6

    const/4 v2, 0x0

    move v3, v2

    :goto_5f
    if-ge v3, v7, :cond_9b

    aget-object v8, v6, v3

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-eqz v2, :cond_6e

    const-string v2, "|"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6e
    iget v2, v8, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    const/4 v9, -0x1

    if-ne v2, v9, :cond_95

    iget v2, v8, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    int-to-float v2, v2

    iget v9, p2, Lcom/google/android/gms/internal/zzgr;->zzDK:F

    div-float/2addr v2, v9

    float-to-int v2, v2

    :goto_7a
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v8, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->height:I

    const/4 v9, -0x2

    if-ne v2, v9, :cond_98

    iget v2, v8, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    int-to-float v2, v2

    iget v8, p2, Lcom/google/android/gms/internal/zzgr;->zzDK:F

    div-float/2addr v2, v8

    float-to-int v2, v2

    :goto_8e
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_5f

    :cond_95
    iget v2, v8, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    goto :goto_7a

    :cond_98
    iget v2, v8, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->height:I

    goto :goto_8e

    :cond_9b
    const-string v2, "sz"

    invoke-virtual {v4, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a0
    iget v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDE:I

    if-eqz v2, :cond_d0

    const-string v2, "native_version"

    iget v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDE:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "native_templates"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqv:Ljava/util/List;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "native_image_orientation"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqt:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzgn;->zzc(Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDS:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_d0

    const-string v2, "native_custom_templates"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDS:Ljava/util/List;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d0
    const-string v2, "slotname"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzpZ:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "pn"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDz:Landroid/content/pm/PackageInfo;

    if-eqz v2, :cond_f1

    const-string v2, "vc"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDz:Landroid/content/pm/PackageInfo;

    iget v3, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f1
    const-string v2, "ms"

    move-object/from16 v0, p7

    invoke-virtual {v4, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "seq_num"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDB:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "session_id"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDC:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "js"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v4, p2, p3}, Lcom/google/android/gms/internal/zzgn;->zza(Ljava/util/HashMap;Lcom/google/android/gms/internal/zzgr;Lcom/google/android/gms/internal/zzgt$zza;)V

    const-string v2, "fdz"

    invoke-virtual {p5}, Lcom/google/android/gms/internal/zzbr;->zzdc()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "platform"

    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "submodel"

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget v2, v2, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->versionCode:I

    const/4 v3, 0x2

    if-lt v2, v3, :cond_141

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsy:Landroid/location/Location;

    if-eqz v2, :cond_141

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsy:Landroid/location/Location;

    invoke-static {v4, v2}, Lcom/google/android/gms/internal/zzgn;->zza(Ljava/util/HashMap;Landroid/location/Location;)V

    :cond_141
    iget v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/4 v3, 0x2

    if-lt v2, v3, :cond_14d

    const-string v2, "quality_signals"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDD:Landroid/os/Bundle;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14d
    iget v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/4 v3, 0x4

    if-lt v2, v3, :cond_161

    iget-boolean v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDG:Z

    if-eqz v2, :cond_161

    const-string v2, "forceHttps"

    iget-boolean v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDG:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_161
    iget v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/4 v3, 0x4

    if-lt v2, v3, :cond_174

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDF:Landroid/os/Bundle;

    if-eqz v2, :cond_174

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDF:Landroid/os/Bundle;

    invoke-static {p0, p1, v2}, Lcom/google/android/gms/internal/zzgn;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Landroid/os/Bundle;)V

    const-string v3, "content_info"

    invoke-virtual {v4, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_174
    iget v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/4 v3, 0x5

    if-lt v2, v3, :cond_23b

    const-string v2, "u_sd"

    iget v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDK:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "sh"

    iget v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDJ:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "sw"

    iget v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDI:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_19a
    iget v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/4 v3, 0x6

    if-lt v2, v3, :cond_1e2

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDL:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_1a4
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_1a4} :catch_25e

    move-result v2

    if-nez v2, :cond_1b3

    :try_start_1a7
    const-string v2, "view_hierarchy"

    new-instance v3, Lorg/json/JSONObject;

    iget-object v5, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDL:Ljava/lang/String;

    invoke-direct {v3, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1b3
    .catch Lorg/json/JSONException; {:try_start_1a7 .. :try_end_1b3} :catch_27b

    :cond_1b3
    :goto_1b3
    :try_start_1b3
    sget-object v2, Lcom/google/android/gms/internal/zzby;->zzuQ:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1d7

    iget-boolean v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDM:Z

    if-eqz v2, :cond_1d7

    const-string v2, "ga_hid"

    iget v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDN:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ga_cid"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDO:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1d7
    const-string v2, "correlation_id"

    iget-wide v6, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDP:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1e2
    iget v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/4 v3, 0x7

    if-lt v2, v3, :cond_1ee

    const-string v2, "request_id"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDQ:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1ee
    iget v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_203

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDU:Lcom/google/android/gms/ads/internal/request/CapabilityParcel;

    if-eqz v2, :cond_203

    const-string v2, "capability"

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDU:Lcom/google/android/gms/ads/internal/request/CapabilityParcel;

    invoke-virtual {v3}, Lcom/google/android/gms/ads/internal/request/CapabilityParcel;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_203
    move-object/from16 v0, p6

    invoke-static {v4, v0}, Lcom/google/android/gms/internal/zzgn;->zza(Ljava/util/HashMap;Ljava/lang/String;)V

    const/4 v2, 0x2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzM(I)Z

    move-result v2

    if-eqz v2, :cond_232

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/google/android/gms/internal/zzhu;->zzx(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Ad Request JSON: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    :cond_232
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/google/android/gms/internal/zzhu;->zzx(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v2

    :goto_23a
    return-object v2

    :cond_23b
    const-string v2, "u_sd"

    iget v3, p2, Lcom/google/android/gms/internal/zzgr;->zzDK:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "sh"

    iget v3, p2, Lcom/google/android/gms/internal/zzgr;->zzDJ:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "sw"

    iget v3, p2, Lcom/google/android/gms/internal/zzgr;->zzDI:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_25c
    .catch Lorg/json/JSONException; {:try_start_1b3 .. :try_end_25c} :catch_25e

    goto/16 :goto_19a

    :catch_25e
    move-exception v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Problem serializing ad request to JSON: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    const/4 v2, 0x0

    goto :goto_23a

    :catch_27b
    move-exception v2

    :try_start_27c
    const-string v3, "Problem serializing view hierarchy to JSON"

    invoke-static {v3, v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_281
    .catch Lorg/json/JSONException; {:try_start_27c .. :try_end_281} :catch_25e

    goto/16 :goto_1b3
.end method

.method static zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Landroid/os/Bundle;)V
    .registers 5

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuK:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_14

    const-string v0, "App index is not enabled"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    :goto_13
    return-void

    :cond_14
    sget-boolean v0, Lcom/google/android/gms/common/internal/zzd;->zzacF:Z

    if-nez v0, :cond_1e

    const-string v0, "Not on package side, return"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    goto :goto_13

    :cond_1e
    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzgI()Z

    move-result v0

    if-eqz v0, :cond_2e

    const-string v0, "Cannot invoked on UI thread"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    goto :goto_13

    :cond_2e
    if-eqz p1, :cond_34

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDz:Landroid/content/pm/PackageInfo;

    if-nez v0, :cond_3a

    :cond_34
    const-string v0, "Invalid ad request info"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_13

    :cond_3a
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDz:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4a

    const-string v0, "Fail to get package name"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_13

    :cond_4a
    :try_start_4a
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zzgn;->zzd(Landroid/content/Context;Ljava/lang/String;)Lcom/google/android/gms/appdatasearch/UsageInfo;

    move-result-object v1

    invoke-static {v1, v0, p2}, Lcom/google/android/gms/internal/zzgn;->zza(Lcom/google/android/gms/appdatasearch/UsageInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_51
    .catch Ljava/lang/RuntimeException; {:try_start_4a .. :try_end_51} :catch_52

    goto :goto_13

    :catch_52
    move-exception v0

    const-string v0, "Fail to add app index to content info"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    goto :goto_13
.end method

.method static zza(Lcom/google/android/gms/appdatasearch/UsageInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 6

    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzle()Lcom/google/android/gms/appdatasearch/DocumentContents;

    move-result-object v0

    if-nez v0, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    invoke-virtual {p0}, Lcom/google/android/gms/appdatasearch/UsageInfo;->zzle()Lcom/google/android/gms/appdatasearch/DocumentContents;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/appdatasearch/DocumentContents;->zzkX()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1c

    const-string v2, "web_url"

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1c
    :try_start_1c
    const-string v1, "intent_data"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/appdatasearch/DocumentContents;->zzbu(Ljava/lang/String;)Lcom/google/android/gms/appdatasearch/DocumentSection;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v1, v0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPe:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    iget-object v0, v0, Lcom/google/android/gms/appdatasearch/DocumentSection;->zzPe:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/appindexing/AndroidAppUri;->newAndroidAppUri(Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/gms/appindexing/AndroidAppUri;

    move-result-object v0

    const-string v1, "app_uri"

    invoke-virtual {v0}, Lcom/google/android/gms/appindexing/AndroidAppUri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1c .. :try_end_3f} :catch_40

    goto :goto_8

    :catch_40
    move-exception v0

    const-string v0, "Failed to parse the third-party Android App URI"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_8
.end method

.method private static zza(Ljava/util/HashMap;Landroid/location/Location;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/location/Location;",
            ")V"
        }
    .end annotation

    const-wide v6, 0x416312d000000000L

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v1

    const/high16 v2, 0x447a0000

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    mul-double/2addr v4, v6

    double-to-long v4, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    mul-double/2addr v4, v6

    double-to-long v4, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const-string v5, "radius"

    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "lat"

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "long"

    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "time"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "uule"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static zza(Ljava/util/HashMap;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/ads/internal/client/AdRequestParcel;",
            ")V"
        }
    .end annotation

    const/4 v6, -0x1

    invoke-static {}, Lcom/google/android/gms/internal/zzhp;->zzgm()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_c

    const-string v1, "abf"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c
    iget-wide v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsq:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_26

    const-string v0, "cust_age"

    sget-object v1, Lcom/google/android/gms/internal/zzgn;->zzEY:Ljava/text/SimpleDateFormat;

    new-instance v2, Ljava/util/Date;

    iget-wide v4, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsq:J

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_26
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    if-eqz v0, :cond_31

    const-string v0, "extras"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->extras:Landroid/os/Bundle;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_31
    iget v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsr:I

    if-eq v0, v6, :cond_40

    const-string v0, "cust_gender"

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsr:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_40
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzss:Ljava/util/List;

    if-eqz v0, :cond_4b

    const-string v0, "kw"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzss:Ljava/util/List;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4b
    iget v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsu:I

    if-eq v0, v6, :cond_5a

    const-string v0, "tag_for_child_directed_treatment"

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsu:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5a
    iget-boolean v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzst:Z

    if-eqz v0, :cond_65

    const-string v0, "adtest"

    const-string v1, "on"

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_65
    iget v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->versionCode:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_90

    iget-boolean v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsv:Z

    if-eqz v0, :cond_78

    const-string v0, "d_imp_hdr"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_78
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsw:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_87

    const-string v0, "ppid"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsw:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_87
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsx:Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;

    if-eqz v0, :cond_90

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsx:Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zzgn;->zza(Ljava/util/HashMap;Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;)V

    :cond_90
    iget v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->versionCode:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_a0

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsz:Ljava/lang/String;

    if-eqz v0, :cond_a0

    const-string v0, "url"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsz:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a0
    iget v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->versionCode:I

    const/4 v1, 0x5

    if-lt v0, v1, :cond_c6

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsB:Landroid/os/Bundle;

    if-eqz v0, :cond_b0

    const-string v0, "custom_targeting"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsB:Landroid/os/Bundle;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b0
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsC:Ljava/util/List;

    if-eqz v0, :cond_bb

    const-string v0, "category_exclusions"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsC:Ljava/util/List;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_bb
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsD:Ljava/lang/String;

    if-eqz v0, :cond_c6

    const-string v0, "request_agent"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsD:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c6
    iget v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->versionCode:I

    const/4 v1, 0x6

    if-lt v0, v1, :cond_d6

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsE:Ljava/lang/String;

    if-eqz v0, :cond_d6

    const-string v0, "request_pkg"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzsE:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d6
    return-void
.end method

.method private static zza(Ljava/util/HashMap;Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztA:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_14

    const-string v1, "acolor"

    iget v2, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztA:I

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgn;->zzH(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->backgroundColor:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_27

    const-string v1, "bgcolor"

    iget v2, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->backgroundColor:I

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgn;->zzH(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_27
    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztB:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_4d

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztC:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_4d

    const-string v1, "gradientto"

    iget v2, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztB:I

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgn;->zzH(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "gradientfrom"

    iget v2, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztC:I

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgn;->zzH(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4d
    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztD:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_60

    const-string v1, "bcolor"

    iget v2, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztD:I

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgn;->zzH(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_60
    const-string v1, "bthick"

    iget v2, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztE:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztF:I

    packed-switch v1, :pswitch_data_ec

    move-object v1, v0

    :goto_71
    if-eqz v1, :cond_78

    const-string v2, "btype"

    invoke-virtual {p0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_78
    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztG:I

    packed-switch v1, :pswitch_data_f8

    :goto_7d
    if-eqz v0, :cond_84

    const-string v1, "callbuttoncolor"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_84
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztH:Ljava/lang/String;

    if-eqz v0, :cond_8f

    const-string v0, "channel"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztH:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8f
    iget v0, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztI:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-eqz v0, :cond_a2

    const-string v0, "dcolor"

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztI:I

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgn;->zzH(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a2
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztJ:Ljava/lang/String;

    if-eqz v0, :cond_ad

    const-string v0, "font"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztJ:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_ad
    iget v0, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztK:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-eqz v0, :cond_c0

    const-string v0, "hcolor"

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztK:I

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgn;->zzH(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c0
    const-string v0, "headersize"

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztL:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztM:Ljava/lang/String;

    if-eqz v0, :cond_d6

    const-string v0, "q"

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/client/SearchAdRequestParcel;->zztM:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d6
    return-void

    :pswitch_d7
    const-string v1, "none"

    goto :goto_71

    :pswitch_da
    const-string v1, "dashed"

    goto :goto_71

    :pswitch_dd
    const-string v1, "dotted"

    goto :goto_71

    :pswitch_e0
    const-string v1, "solid"

    goto :goto_71

    :pswitch_e3
    const-string v0, "dark"

    goto :goto_7d

    :pswitch_e6
    const-string v0, "light"

    goto :goto_7d

    :pswitch_e9
    const-string v0, "medium"

    goto :goto_7d

    :pswitch_data_ec
    .packed-switch 0x0
        :pswitch_d7
        :pswitch_da
        :pswitch_dd
        :pswitch_e0
    .end packed-switch

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_e6
        :pswitch_e9
        :pswitch_e3
    .end packed-switch
.end method

.method private static zza(Ljava/util/HashMap;Lcom/google/android/gms/internal/zzgr;Lcom/google/android/gms/internal/zzgt$zza;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzgr;",
            "Lcom/google/android/gms/internal/zzgt$zza;",
            ")V"
        }
    .end annotation

    const/4 v2, 0x1

    const-string v0, "am"

    iget v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFB:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "cog"

    iget-boolean v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFC:Z

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgn;->zzx(Z)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "coh"

    iget-boolean v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFD:Z

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgn;->zzx(Z)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzgr;->zzFE:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_31

    const-string v0, "carrier"

    iget-object v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFE:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_31
    const-string v0, "gl"

    iget-object v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFF:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p1, Lcom/google/android/gms/internal/zzgr;->zzFG:Z

    if-eqz v0, :cond_45

    const-string v0, "simulator"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_45
    iget-boolean v0, p1, Lcom/google/android/gms/internal/zzgr;->zzFH:Z

    if-eqz v0, :cond_52

    const-string v0, "is_sidewinder"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_52
    const-string v0, "ma"

    iget-boolean v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFI:Z

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgn;->zzx(Z)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "sp"

    iget-boolean v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFJ:Z

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgn;->zzx(Z)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "hl"

    iget-object v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFK:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzgr;->zzFL:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7e

    const-string v0, "mv"

    iget-object v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFL:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7e
    const-string v0, "muv"

    iget v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFM:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p1, Lcom/google/android/gms/internal/zzgr;->zzFN:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_99

    const-string v0, "cnt"

    iget v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFN:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_99
    const-string v0, "gnt"

    iget v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFO:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "pt"

    iget v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFP:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "rm"

    iget v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFQ:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "riv"

    iget v1, p1, Lcom/google/android/gms/internal/zzgr;->zzFR:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "build"

    iget-object v2, p1, Lcom/google/android/gms/internal/zzgr;->zzFW:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "is_charging"

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzgr;->zzFT:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "battery_level"

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzgr;->zzFS:D

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    const-string v2, "battery"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "active_network_state"

    iget v3, p1, Lcom/google/android/gms/internal/zzgr;->zzFV:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "active_network_metered"

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzgr;->zzFU:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    if-eqz p2, :cond_11d

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v3, "predicted_latency_micros"

    iget v4, p2, Lcom/google/android/gms/internal/zzgt$zza;->zzGb:I

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v3, "predicted_down_throughput_bps"

    iget-wide v4, p2, Lcom/google/android/gms/internal/zzgt$zza;->zzGc:J

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v3, "predicted_up_throughput_bps"

    iget-wide v4, p2, Lcom/google/android/gms/internal/zzgt$zza;->zzGd:J

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v3, "predictions"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_11d
    const-string v2, "network"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v1, "device"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static zza(Ljava/util/HashMap;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-eqz p1, :cond_11

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "token"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pan"

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_11
    return-void
.end method

.method private static zzc(Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;)Ljava/lang/String;
    .registers 2

    if-eqz p0, :cond_a

    iget v0, p0, Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;->zzwo:I

    :goto_4
    packed-switch v0, :pswitch_data_12

    const-string v0, "any"

    :goto_9
    return-object v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_4

    :pswitch_c
    const-string v0, "portrait"

    goto :goto_9

    :pswitch_f
    const-string v0, "landscape"

    goto :goto_9

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_c
        :pswitch_f
    .end packed-switch
.end method

.method private static zzd(Landroid/content/Context;Ljava/lang/String;)Lcom/google/android/gms/appdatasearch/UsageInfo;
    .registers 8

    const/4 v1, 0x0

    :try_start_1
    new-instance v0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    sget-object v2, Lcom/google/android/gms/appdatasearch/zza;->zzOQ:Lcom/google/android/gms/common/api/Api;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApi(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->build()Lcom/google/android/gms/common/api/GoogleApiClient;
    :try_end_f
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_f} :catch_73
    .catchall {:try_start_1 .. :try_end_f} :catchall_81

    move-result-object v2

    :try_start_10
    invoke-interface {v2}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    new-instance v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;

    invoke-direct {v0}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzL(Z)Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzbw(Ljava/lang/String;)Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzlb()Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;

    move-result-object v0

    sget-object v3, Lcom/google/android/gms/appdatasearch/zza;->zzOR:Lcom/google/android/gms/appdatasearch/zzk;

    invoke-interface {v3, v2, v0}, Lcom/google/android/gms/appdatasearch/zzk;->zza(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v0

    const-wide/16 v4, 0x1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v4, v5, v3}, Lcom/google/android/gms/common/api/PendingResult;->await(JLjava/util/concurrent/TimeUnit;)Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;

    if-eqz v0, :cond_41

    invoke-virtual {v0}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v3

    if-nez v3, :cond_4c

    :cond_41
    const-string v0, "Fail to obtain recent context call"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V
    :try_end_46
    .catch Ljava/lang/SecurityException; {:try_start_10 .. :try_end_46} :catch_8f
    .catchall {:try_start_10 .. :try_end_46} :catchall_89

    if-eqz v2, :cond_4b

    invoke-interface {v2}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    :cond_4b
    :goto_4b
    return-object v1

    :cond_4c
    :try_start_4c
    iget-object v3, v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPw:Ljava/util/List;

    if-eqz v3, :cond_58

    iget-object v3, v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPw:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_63

    :cond_58
    const-string v0, "Fail to obtain recent context"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V
    :try_end_5d
    .catch Ljava/lang/SecurityException; {:try_start_4c .. :try_end_5d} :catch_8f
    .catchall {:try_start_4c .. :try_end_5d} :catchall_89

    if-eqz v2, :cond_4b

    invoke-interface {v2}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    goto :goto_4b

    :cond_63
    :try_start_63
    iget-object v0, v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->zzPw:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/appdatasearch/UsageInfo;
    :try_end_6c
    .catch Ljava/lang/SecurityException; {:try_start_63 .. :try_end_6c} :catch_8f
    .catchall {:try_start_63 .. :try_end_6c} :catchall_89

    if-eqz v2, :cond_71

    invoke-interface {v2}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    :cond_71
    :goto_71
    move-object v1, v0

    goto :goto_4b

    :catch_73
    move-exception v0

    move-object v0, v1

    :goto_75
    :try_start_75
    const-string v2, "Fail to get recent context"

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V
    :try_end_7a
    .catchall {:try_start_75 .. :try_end_7a} :catchall_8b

    if-eqz v0, :cond_92

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    move-object v0, v1

    goto :goto_71

    :catchall_81
    move-exception v0

    move-object v2, v1

    :goto_83
    if-eqz v2, :cond_88

    invoke-interface {v2}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    :cond_88
    throw v0

    :catchall_89
    move-exception v0

    goto :goto_83

    :catchall_8b
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    goto :goto_83

    :catch_8f
    move-exception v0

    move-object v0, v2

    goto :goto_75

    :cond_92
    move-object v0, v1

    goto :goto_71
.end method

.method private static zzx(Z)Ljava/lang/Integer;
    .registers 2

    if-eqz p0, :cond_8

    const/4 v0, 0x1

    :goto_3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_3
.end method
