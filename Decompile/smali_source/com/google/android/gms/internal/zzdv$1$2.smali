.class Lcom/google/android/gms/internal/zzdv$1$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzdg;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdv$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzxM:Lcom/google/android/gms/internal/zzbb;

.field final synthetic zzxN:Lcom/google/android/gms/internal/zzdv$1;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdv$1;Lcom/google/android/gms/internal/zzbb;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxM:Lcom/google/android/gms/internal/zzbb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
    .registers 6
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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzdv;->zzc(Lcom/google/android/gms/internal/zzdv;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_9
    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxK:Lcom/google/android/gms/internal/zzdv$zze;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdv$zze;->getStatus()I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxK:Lcom/google/android/gms/internal/zzdv$zze;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdv$zze;->getStatus()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_21

    :cond_1f
    monitor-exit v1

    :goto_20
    return-void

    :cond_21
    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzdv;->zza(Lcom/google/android/gms/internal/zzdv;I)I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzdv;->zzd(Lcom/google/android/gms/internal/zzdv;)Lcom/google/android/gms/internal/zzdv$zzb;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxM:Lcom/google/android/gms/internal/zzbb;

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzdv$zzb;->zzc(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxK:Lcom/google/android/gms/internal/zzdv$zze;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxM:Lcom/google/android/gms/internal/zzbb;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzdv$zze;->zzg(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdv$1$2;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzdv$1;->zzxK:Lcom/google/android/gms/internal/zzdv$zze;

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzdv;->zza(Lcom/google/android/gms/internal/zzdv;Lcom/google/android/gms/internal/zzdv$zze;)Lcom/google/android/gms/internal/zzdv$zze;

    const-string v0, "Successfully loaded JS Engine."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    monitor-exit v1

    goto :goto_20

    :catchall_51
    move-exception v0

    monitor-exit v1
    :try_end_53
    .catchall {:try_start_9 .. :try_end_53} :catchall_51

    throw v0
.end method
