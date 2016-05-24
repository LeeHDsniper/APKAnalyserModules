.class public Lcom/google/android/gms/internal/zzez;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzez$1;,
        Lcom/google/android/gms/internal/zzez$zza;
    }
.end annotation


# instance fields
.field private final zzzI:Z

.field private final zzzJ:Z

.field private final zzzK:Z

.field private final zzzL:Z

.field private final zzzM:Z


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzez$zza;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzez$zza;->zza(Lcom/google/android/gms/internal/zzez$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzez;->zzzI:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzez$zza;->zzb(Lcom/google/android/gms/internal/zzez$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzez;->zzzJ:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzez$zza;->zzc(Lcom/google/android/gms/internal/zzez$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzez;->zzzK:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzez$zza;->zzd(Lcom/google/android/gms/internal/zzez$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzez;->zzzL:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzez$zza;->zze(Lcom/google/android/gms/internal/zzez$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzez;->zzzM:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzez$zza;Lcom/google/android/gms/internal/zzez$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzez;-><init>(Lcom/google/android/gms/internal/zzez$zza;)V

    return-void
.end method


# virtual methods
.method public toJson()Lorg/json/JSONObject;
    .registers 4

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "sms"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzez;->zzzI:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "tel"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzez;->zzzJ:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "calendar"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzez;->zzzK:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "storePicture"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzez;->zzzL:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "inlineVideo"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzez;->zzzM:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_2c
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_2c} :catch_2e

    move-result-object v0

    :goto_2d
    return-object v0

    :catch_2e
    move-exception v0

    const-string v1, "Error occured while obtaining the MRAID capabilities."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_2d
.end method
