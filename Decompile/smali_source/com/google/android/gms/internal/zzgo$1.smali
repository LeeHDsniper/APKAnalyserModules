.class Lcom/google/android/gms/internal/zzgo$1;
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

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgo$1;->zzFe:Lcom/google/android/gms/internal/zzgo;

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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo$1;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgo;->zza(Lcom/google/android/gms/internal/zzgo;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo$1;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgo;->zzb(Lcom/google/android/gms/internal/zzgo;)Lcom/google/android/gms/internal/zzie;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzie;->isDone()Z

    move-result v0

    if-eqz v0, :cond_15

    monitor-exit v1

    :goto_14
    return-void

    :cond_15
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgo$1;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgo;->zzc(Lcom/google/android/gms/internal/zzgo;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "request_id"

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    monitor-exit v1

    goto :goto_14

    :catchall_29
    move-exception v0

    monitor-exit v1
    :try_end_2b
    .catchall {:try_start_7 .. :try_end_2b} :catchall_29

    throw v0

    :cond_2c
    :try_start_2c
    new-instance v0, Lcom/google/android/gms/internal/zzgq;

    const/4 v2, 0x1

    invoke-direct {v0, v2, p2}, Lcom/google/android/gms/internal/zzgq;-><init>(ILjava/util/Map;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgq;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " request error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgq;->zzfK()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgo$1;->zzFe:Lcom/google/android/gms/internal/zzgo;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgo;->zzb(Lcom/google/android/gms/internal/zzgo;)Lcom/google/android/gms/internal/zzie;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzie;->zzf(Ljava/lang/Object;)V

    monitor-exit v1
    :try_end_64
    .catchall {:try_start_2c .. :try_end_64} :catchall_29

    goto :goto_14
.end method
