.class public Lcom/google/android/gms/internal/zzdv$zze;
.super Lcom/google/android/gms/internal/zzik;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzdv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zze"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzik",
        "<",
        "Lcom/google/android/gms/internal/zzbb;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzpc:Ljava/lang/Object;

.field private zzxH:Lcom/google/android/gms/internal/zzdv$zzb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzdv$zzb",
            "<",
            "Lcom/google/android/gms/internal/zzbb;",
            ">;"
        }
    .end annotation
.end field

.field private zzxY:Z

.field private zzxZ:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzdv$zzb;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzdv$zzb",
            "<",
            "Lcom/google/android/gms/internal/zzbb;",
            ">;)V"
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzik;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzpc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxH:Lcom/google/android/gms/internal/zzdv$zzb;

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxY:Z

    iput v1, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzdv$zze;)Lcom/google/android/gms/internal/zzdv$zzb;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxH:Lcom/google/android/gms/internal/zzdv$zzb;

    return-object v0
.end method


# virtual methods
.method public zzdM()Lcom/google/android/gms/internal/zzdv$zzd;
    .registers 5

    new-instance v1, Lcom/google/android/gms/internal/zzdv$zzd;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzdv$zzd;-><init>(Lcom/google/android/gms/internal/zzdv$zze;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzpc:Ljava/lang/Object;

    monitor-enter v2

    :try_start_8
    new-instance v0, Lcom/google/android/gms/internal/zzdv$zze$1;

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zzdv$zze$1;-><init>(Lcom/google/android/gms/internal/zzdv$zze;Lcom/google/android/gms/internal/zzdv$zzd;)V

    new-instance v3, Lcom/google/android/gms/internal/zzdv$zze$2;

    invoke-direct {v3, p0, v1}, Lcom/google/android/gms/internal/zzdv$zze$2;-><init>(Lcom/google/android/gms/internal/zzdv$zze;Lcom/google/android/gms/internal/zzdv$zzd;)V

    invoke-virtual {p0, v0, v3}, Lcom/google/android/gms/internal/zzdv$zze;->zza(Lcom/google/android/gms/internal/zzij$zzc;Lcom/google/android/gms/internal/zzij$zza;)V

    iget v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    if-ltz v0, :cond_25

    const/4 v0, 0x1

    :goto_1a
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzY(Z)V

    iget v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    monitor-exit v2

    return-object v1

    :cond_25
    const/4 v0, 0x0

    goto :goto_1a

    :catchall_27
    move-exception v0

    monitor-exit v2
    :try_end_29
    .catchall {:try_start_8 .. :try_end_29} :catchall_27

    throw v0
.end method

.method protected zzdN()V
    .registers 4

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_4
    iget v2, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    if-lt v2, v0, :cond_1b

    :goto_8
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzY(Z)V

    const-string v0, "Releasing 1 reference for JS Engine"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzdv$zze;->zzdP()V

    monitor-exit v1

    return-void

    :cond_1b
    const/4 v0, 0x0

    goto :goto_8

    :catchall_1d
    move-exception v0

    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_4 .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method public zzdO()V
    .registers 4

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_4
    iget v2, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    if-ltz v2, :cond_18

    :goto_8
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzY(Z)V

    const-string v0, "Releasing root reference. JS Engine will be destroyed once other references are released."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxY:Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzdv$zze;->zzdP()V

    monitor-exit v1

    return-void

    :cond_18
    const/4 v0, 0x0

    goto :goto_8

    :catchall_1a
    move-exception v0

    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_4 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method protected zzdP()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    if-ltz v0, :cond_27

    const/4 v0, 0x1

    :goto_8
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzY(Z)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxY:Z

    if-eqz v0, :cond_29

    iget v0, p0, Lcom/google/android/gms/internal/zzdv$zze;->zzxZ:I

    if-nez v0, :cond_29

    const-string v0, "No reference is left (including root). Cleaning up engine."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/internal/zzdv$zze$3;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzdv$zze$3;-><init>(Lcom/google/android/gms/internal/zzdv$zze;)V

    new-instance v2, Lcom/google/android/gms/internal/zzij$zzb;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzij$zzb;-><init>()V

    invoke-virtual {p0, v0, v2}, Lcom/google/android/gms/internal/zzdv$zze;->zza(Lcom/google/android/gms/internal/zzij$zzc;Lcom/google/android/gms/internal/zzij$zza;)V

    :goto_25
    monitor-exit v1

    return-void

    :cond_27
    const/4 v0, 0x0

    goto :goto_8

    :cond_29
    const-string v0, "There are still references to the engine. Not destroying."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    goto :goto_25

    :catchall_2f
    move-exception v0

    monitor-exit v1
    :try_end_31
    .catchall {:try_start_3 .. :try_end_31} :catchall_2f

    throw v0
.end method
