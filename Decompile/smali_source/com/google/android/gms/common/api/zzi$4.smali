.class Lcom/google/android/gms/common/api/zzi$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/Api;I)Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaap:Lcom/google/android/gms/common/api/zzi;

.field final synthetic zzaaq:Lcom/google/android/gms/common/api/Api;

.field final synthetic zzaar:I


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/zzi;Lcom/google/android/gms/common/api/Api;I)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzi$4;->zzaap:Lcom/google/android/gms/common/api/zzi;

    iput-object p2, p0, Lcom/google/android/gms/common/api/zzi$4;->zzaaq:Lcom/google/android/gms/common/api/Api;

    iput p3, p0, Lcom/google/android/gms/common/api/zzi$4;->zzaar:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 5
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$4;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_9
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$4;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzi;->zzb(Lcom/google/android/gms/common/api/zzi;)Lcom/google/android/gms/common/api/zzj;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi$4;->zzaaq:Lcom/google/android/gms/common/api/Api;

    iget v2, p0, Lcom/google/android/gms/common/api/zzi$4;->zzaar:I

    invoke-interface {v0, p1, v1, v2}, Lcom/google/android/gms/common/api/zzj;->zza(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;I)V
    :try_end_16
    .catchall {:try_start_9 .. :try_end_16} :catchall_20

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$4;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_20
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzi$4;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-static {v1}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
