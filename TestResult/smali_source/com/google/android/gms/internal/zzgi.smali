.class public Lcom/google/android/gms/internal/zzgi;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzgf$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzgf$zza",
        "<",
        "Lcom/google/android/gms/ads/internal/formats/zzf;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzDl:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzgi;->zzDl:Z

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzgf;Lorg/json/JSONObject;Lcom/google/android/gms/internal/zzlh;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzgf;",
            "Lorg/json/JSONObject;",
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/google/android/gms/ads/internal/formats/zzc;",
            ">;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "name"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "image_value"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzgi;->zzDl:Z

    invoke-virtual {p1, p2, v1, v2}, Lcom/google/android/gms/internal/zzgf;->zza(Lorg/json/JSONObject;Ljava/lang/String;Z)Ljava/util/concurrent/Future;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/google/android/gms/internal/zzlh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private zza(Lorg/json/JSONObject;Lcom/google/android/gms/internal/zzlh;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "string_value"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lcom/google/android/gms/internal/zzlh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private zzc(Lcom/google/android/gms/internal/zzlh;)Lcom/google/android/gms/internal/zzlh;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/zzlh",
            "<TK;",
            "Ljava/util/concurrent/Future",
            "<TV;>;>;)",
            "Lcom/google/android/gms/internal/zzlh",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    new-instance v2, Lcom/google/android/gms/internal/zzlh;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzlh;-><init>()V

    const/4 v0, 0x0

    move v1, v0

    :goto_7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzlh;->size()I

    move-result v0

    if-ge v1, v0, :cond_22

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzlh;->keyAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzlh;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/internal/zzlh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_7

    :cond_22
    return-object v2
.end method


# virtual methods
.method public synthetic zza(Lcom/google/android/gms/internal/zzgf;Lorg/json/JSONObject;)Lcom/google/android/gms/ads/internal/formats/zzh$zza;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzgi;->zzd(Lcom/google/android/gms/internal/zzgf;Lorg/json/JSONObject;)Lcom/google/android/gms/ads/internal/formats/zzf;

    move-result-object v0

    return-object v0
.end method

.method public zzd(Lcom/google/android/gms/internal/zzgf;Lorg/json/JSONObject;)Lcom/google/android/gms/ads/internal/formats/zzf;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    new-instance v1, Lcom/google/android/gms/internal/zzlh;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzlh;-><init>()V

    new-instance v2, Lcom/google/android/gms/internal/zzlh;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzlh;-><init>()V

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/zzgf;->zze(Lorg/json/JSONObject;)Lcom/google/android/gms/internal/zzih;

    move-result-object v3

    const-string v0, "custom_assets"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v0, 0x0

    :goto_15
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v0, v5, :cond_56

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "type"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "string"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_33

    invoke-direct {p0, v5, v2}, Lcom/google/android/gms/internal/zzgi;->zza(Lorg/json/JSONObject;Lcom/google/android/gms/internal/zzlh;)V

    :goto_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    :cond_33
    const-string v7, "image"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3f

    invoke-direct {p0, p1, v5, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Lcom/google/android/gms/internal/zzgf;Lorg/json/JSONObject;Lcom/google/android/gms/internal/zzlh;)V

    goto :goto_30

    :cond_3f
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unknown custom asset type: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_30

    :cond_56
    new-instance v4, Lcom/google/android/gms/ads/internal/formats/zzf;

    const-string v0, "custom_template_id"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/zzgi;->zzc(Lcom/google/android/gms/internal/zzlh;)Lcom/google/android/gms/internal/zzlh;

    move-result-object v1

    invoke-interface {v3}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/ads/internal/formats/zza;

    invoke-direct {v4, v5, v1, v2, v0}, Lcom/google/android/gms/ads/internal/formats/zzf;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/ads/internal/formats/zza;)V

    return-object v4
.end method
