.class public Lcom/google/android/gms/internal/zzdv$zzd;
.super Lcom/google/android/gms/internal/zzik;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzdv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zzd"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzik",
        "<",
        "Lcom/google/android/gms/internal/zzbe;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzpc:Ljava/lang/Object;

.field private final zzxV:Lcom/google/android/gms/internal/zzdv$zze;

.field private zzxW:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzdv$zze;)V
    .registers 3

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzik;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdv$zzd;->zzpc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdv$zzd;->zzxV:Lcom/google/android/gms/internal/zzdv$zze;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzdv$zzd;)Lcom/google/android/gms/internal/zzdv$zze;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdv$zzd;->zzxV:Lcom/google/android/gms/internal/zzdv$zze;

    return-object v0
.end method


# virtual methods
.method public release()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdv$zzd;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzdv$zzd;->zzxW:Z

    if-eqz v0, :cond_9

    monitor-exit v1

    :goto_8
    return-void

    :cond_9
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzdv$zzd;->zzxW:Z

    new-instance v0, Lcom/google/android/gms/internal/zzdv$zzd$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzdv$zzd$1;-><init>(Lcom/google/android/gms/internal/zzdv$zzd;)V

    new-instance v2, Lcom/google/android/gms/internal/zzij$zzb;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzij$zzb;-><init>()V

    invoke-virtual {p0, v0, v2}, Lcom/google/android/gms/internal/zzdv$zzd;->zza(Lcom/google/android/gms/internal/zzij$zzc;Lcom/google/android/gms/internal/zzij$zza;)V

    new-instance v0, Lcom/google/android/gms/internal/zzdv$zzd$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzdv$zzd$2;-><init>(Lcom/google/android/gms/internal/zzdv$zzd;)V

    new-instance v2, Lcom/google/android/gms/internal/zzdv$zzd$3;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzdv$zzd$3;-><init>(Lcom/google/android/gms/internal/zzdv$zzd;)V

    invoke-virtual {p0, v0, v2}, Lcom/google/android/gms/internal/zzdv$zzd;->zza(Lcom/google/android/gms/internal/zzij$zzc;Lcom/google/android/gms/internal/zzij$zza;)V

    monitor-exit v1

    goto :goto_8

    :catchall_28
    move-exception v0

    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_28

    throw v0
.end method
