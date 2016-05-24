.class public final Lcom/google/android/gms/internal/zzdz;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field public final zzyk:Ljava/lang/String;

.field public final zzyl:Ljava/lang/String;

.field public final zzym:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzyn:Ljava/lang/String;

.field public final zzyo:Ljava/lang/String;

.field public final zzyp:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzyq:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzyr:Ljava/lang/String;

.field public final zzys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzyt:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdz;->zzyl:Ljava/lang/String;

    const-string v0, "adapters"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v0

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v0, 0x0

    :goto_1c
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v0, v4, :cond_2c

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    :cond_2c
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdz;->zzym:Ljava/util/List;

    const-string v0, "allocation_id"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdz;->zzyn:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    const-string v2, "clickurl"

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/internal/zzef;->zza(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdz;->zzyp:Ljava/util/List;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    const-string v2, "imp_urls"

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/internal/zzef;->zza(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdz;->zzyq:Ljava/util/List;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    const-string v2, "video_start_urls"

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/internal/zzef;->zza(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdz;->zzys:Ljava/util/List;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    const-string v2, "video_complete_urls"

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/internal/zzef;->zza(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdz;->zzyt:Ljava/util/List;

    const-string v0, "ad"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_91

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_76
    iput-object v0, p0, Lcom/google/android/gms/internal/zzdz;->zzyk:Ljava/lang/String;

    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_93

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_84
    iput-object v0, p0, Lcom/google/android/gms/internal/zzdz;->zzyr:Ljava/lang/String;

    if-eqz v2, :cond_8e

    const-string v0, "class_name"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_8e
    iput-object v1, p0, Lcom/google/android/gms/internal/zzdz;->zzyo:Ljava/lang/String;

    return-void

    :cond_91
    move-object v0, v1

    goto :goto_76

    :cond_93
    move-object v0, v1

    goto :goto_84
.end method
