.class public Lcom/google/android/gms/internal/zzho;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzGP:Ljava/lang/String;

.field private zzHq:I

.field private zzHr:I

.field private final zzpN:Lcom/google/android/gms/internal/zzhl;

.field private final zzpc:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzhl;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzho;->zzpc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzho;->zzpN:Lcom/google/android/gms/internal/zzhl;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzho;->zzGP:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/zzho;-><init>(Lcom/google/android/gms/internal/zzhl;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzho;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v2, "pmnli"

    iget v3, p0, Lcom/google/android/gms/internal/zzho;->zzHq:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "pmnll"

    iget v3, p0, Lcom/google/android/gms/internal/zzho;->zzHr:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    monitor-exit v1

    return-object v0

    :catchall_18
    move-exception v0

    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw v0
.end method

.method public zzf(II)V
    .registers 6

    iget-object v1, p0, Lcom/google/android/gms/internal/zzho;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput p1, p0, Lcom/google/android/gms/internal/zzho;->zzHq:I

    iput p2, p0, Lcom/google/android/gms/internal/zzho;->zzHr:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzho;->zzpN:Lcom/google/android/gms/internal/zzhl;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzho;->zzGP:Ljava/lang/String;

    invoke-virtual {v0, v2, p0}, Lcom/google/android/gms/internal/zzhl;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzho;)V

    monitor-exit v1

    return-void

    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method
