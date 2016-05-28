.class Lcom/google/android/gms/internal/zzdv$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzij$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdv;->zzdK()Lcom/google/android/gms/internal/zzdv$zze;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzxL:Lcom/google/android/gms/internal/zzdv;

.field final synthetic zzxS:Lcom/google/android/gms/internal/zzdv$zze;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdv;Lcom/google/android/gms/internal/zzdv$zze;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdv$3;->zzxL:Lcom/google/android/gms/internal/zzdv;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdv$3;->zzxS:Lcom/google/android/gms/internal/zzdv$zze;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$3;->zzxL:Lcom/google/android/gms/internal/zzdv;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzdv;->zzc(Lcom/google/android/gms/internal/zzdv;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$3;->zzxL:Lcom/google/android/gms/internal/zzdv;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzdv;->zza(Lcom/google/android/gms/internal/zzdv;I)I

    const-string v0, "Failed loading new engine. Marking new engine destroyable."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$3;->zzxS:Lcom/google/android/gms/internal/zzdv$zze;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdv$zze;->zzdO()V

    monitor-exit v1

    return-void

    :catchall_19
    move-exception v0

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_19

    throw v0
.end method
