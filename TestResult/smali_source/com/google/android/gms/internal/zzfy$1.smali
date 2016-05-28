.class Lcom/google/android/gms/internal/zzfy$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfy;->zzh(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzCB:Lcom/google/android/gms/internal/zzfx;

.field final synthetic zzCC:Lcom/google/android/gms/internal/zzfy;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfy;Lcom/google/android/gms/internal/zzfx;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfy$1;->zzCC:Lcom/google/android/gms/internal/zzfy;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfy$1;->zzCB:Lcom/google/android/gms/internal/zzfx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfy$1;->zzCC:Lcom/google/android/gms/internal/zzfy;

    iget-object v1, v0, Lcom/google/android/gms/internal/zzfy;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfy$1;->zzCC:Lcom/google/android/gms/internal/zzfy;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfy;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->errorCode:I

    const/4 v2, -0x2

    if-eq v0, v2, :cond_10

    monitor-exit v1

    :goto_f
    return-void

    :cond_10
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfy$1;->zzCC:Lcom/google/android/gms/internal/zzfy;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfy;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfy$1;->zzCC:Lcom/google/android/gms/internal/zzfy;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/internal/zziq$zza;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfy$1;->zzCB:Lcom/google/android/gms/internal/zzfx;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfy$1;->zzCC:Lcom/google/android/gms/internal/zzfy;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzfy;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzfx;->zza(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;)V

    monitor-exit v1

    goto :goto_f

    :catchall_28
    move-exception v0

    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_5 .. :try_end_2a} :catchall_28

    throw v0
.end method
