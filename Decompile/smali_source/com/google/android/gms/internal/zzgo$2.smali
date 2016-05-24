.class Lcom/google/android/gms/internal/zzgo$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzdg;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzgo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzFe:Lcom/google/android/gms/internal/zzgo;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgo;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgo$2;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
    .registers 9
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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo$2;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgo;->zza(Lcom/google/android/gms/internal/zzgo;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo$2;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgo;->zzb(Lcom/google/android/gms/internal/zzgo;)Lcom/google/android/gms/internal/zzie;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzie;->isDone()Z

    move-result v0

    if-eqz v0, :cond_15

    monitor-exit v1

    :goto_14
    return-void

    :cond_15
    new-instance v2, Lcom/google/android/gms/internal/zzgq;

    const/4 v0, -0x2

    invoke-direct {v2, v0, p2}, Lcom/google/android/gms/internal/zzgq;-><init>(ILjava/util/Map;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo$2;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgo;->zzc(Lcom/google/android/gms/internal/zzgo;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzgq;->getRequestId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzgq;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " ==== "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgo$2;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgo;->zzc(Lcom/google/android/gms/internal/zzgo;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    monitor-exit v1

    goto :goto_14

    :catchall_51
    move-exception v0

    monitor-exit v1
    :try_end_53
    .catchall {:try_start_7 .. :try_end_53} :catchall_51

    throw v0

    :cond_54
    :try_start_54
    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzgq;->getUrl()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_61

    const-string v0, "URL missing in loadAdUrl GMSG."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    monitor-exit v1

    goto :goto_14

    :cond_61
    const-string v0, "%40mediation_adapters%40"

    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9e

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v4

    const-string v0, "check_adapters"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzgo$2;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v5}, Lcom/google/android/gms/internal/zzgo;->zzd(Lcom/google/android/gms/internal/zzgo;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v0, v5}, Lcom/google/android/gms/internal/zzhp;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "%40mediation_adapters%40"

    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzgq;->setUrl(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Ad request URL modified to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    :cond_9e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo$2;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgo;->zzb(Lcom/google/android/gms/internal/zzgo;)Lcom/google/android/gms/internal/zzie;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzie;->zzf(Ljava/lang/Object;)V

    monitor-exit v1
    :try_end_a8
    .catchall {:try_start_54 .. :try_end_a8} :catchall_51

    goto/16 :goto_14
.end method
