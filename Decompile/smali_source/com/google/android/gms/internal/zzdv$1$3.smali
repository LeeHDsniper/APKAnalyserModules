.class Lcom/google/android/gms/internal/zzdv$1$3;
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

.field final synthetic zzxQ:Lcom/google/android/gms/internal/zzic;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdv$1;Lcom/google/android/gms/internal/zzbb;Lcom/google/android/gms/internal/zzic;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdv$1$3;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdv$1$3;->zzxM:Lcom/google/android/gms/internal/zzbb;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzdv$1$3;->zzxQ:Lcom/google/android/gms/internal/zzic;

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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$3;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzdv;->zzc(Lcom/google/android/gms/internal/zzdv;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_9
    const-string v0, "JS Engine is requesting an update"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$3;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzdv;->zze(Lcom/google/android/gms/internal/zzdv;)I

    move-result v0

    if-nez v0, :cond_2c

    const-string v0, "Starting reload."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$3;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    const/4 v2, 0x2

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzdv;->zza(Lcom/google/android/gms/internal/zzdv;I)I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$3;->zzxN:Lcom/google/android/gms/internal/zzdv$1;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzdv$1;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdv;->zzdK()Lcom/google/android/gms/internal/zzdv$zze;

    :cond_2c
    iget-object v2, p0, Lcom/google/android/gms/internal/zzdv$1$3;->zzxM:Lcom/google/android/gms/internal/zzbb;

    const-string v3, "/requestReload"

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$1$3;->zzxQ:Lcom/google/android/gms/internal/zzic;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzic;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzdg;

    invoke-interface {v2, v3, v0}, Lcom/google/android/gms/internal/zzbb;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    monitor-exit v1

    return-void

    :catchall_3d
    move-exception v0

    monitor-exit v1
    :try_end_3f
    .catchall {:try_start_9 .. :try_end_3f} :catchall_3d

    throw v0
.end method
