.class Lcom/google/android/gms/internal/zzgf$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzdg;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgf;->zzb(Lcom/google/android/gms/internal/zzbb;)Lorg/json/JSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzCY:Lcom/google/android/gms/internal/zzbb;

.field final synthetic zzCZ:Lcom/google/android/gms/internal/zzgf$zzb;

.field final synthetic zzDa:Lcom/google/android/gms/internal/zzie;

.field final synthetic zzDb:Lcom/google/android/gms/internal/zzgf;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgf;Lcom/google/android/gms/internal/zzbb;Lcom/google/android/gms/internal/zzgf$zzb;Lcom/google/android/gms/internal/zzie;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgf$1;->zzDb:Lcom/google/android/gms/internal/zzgf;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgf$1;->zzCY:Lcom/google/android/gms/internal/zzbb;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgf$1;->zzCZ:Lcom/google/android/gms/internal/zzgf$zzb;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzgf$1;->zzDa:Lcom/google/android/gms/internal/zzie;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzip;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgf$1;->zzCY:Lcom/google/android/gms/internal/zzbb;

    const-string v1, "/nativeAdPreProcess"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgf$1;->zzCZ:Lcom/google/android/gms/internal/zzgf$zzb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzgf$zzb;->zzDk:Lcom/google/android/gms/internal/zzdg;

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzbb;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    :try_start_c
    const-string v0, "success"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_36

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgf$1;->zzDa:Lcom/google/android/gms/internal/zzie;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "ads"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzie;->zzf(Ljava/lang/Object;)V
    :try_end_2f
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_2f} :catch_30

    :goto_2f
    return-void

    :catch_30
    move-exception v0

    const-string v1, "Malformed native JSON response."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_36
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgf$1;->zzDb:Lcom/google/android/gms/internal/zzgf;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/zzgf;->zzB(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgf$1;->zzDb:Lcom/google/android/gms/internal/zzgf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgf;->zzft()Z

    move-result v0

    const-string v1, "Unable to set the ad state error!"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgf$1;->zzDa:Lcom/google/android/gms/internal/zzie;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzie;->zzf(Ljava/lang/Object;)V

    goto :goto_2f
.end method
