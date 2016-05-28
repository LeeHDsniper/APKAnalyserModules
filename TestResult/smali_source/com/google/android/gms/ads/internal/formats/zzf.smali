.class public Lcom/google/android/gms/ads/internal/formats/zzf;
.super Lcom/google/android/gms/internal/zzcr$zza;

# interfaces
.implements Lcom/google/android/gms/ads/internal/formats/zzh$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzpc:Ljava/lang/Object;

.field private final zzvS:Lcom/google/android/gms/ads/internal/formats/zza;

.field private zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

.field private final zzvW:Ljava/lang/String;

.field private final zzvX:Lcom/google/android/gms/internal/zzlh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/ads/internal/formats/zzc;",
            ">;"
        }
    .end annotation
.end field

.field private final zzvY:Lcom/google/android/gms/internal/zzlh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/internal/zzlh;Lcom/google/android/gms/ads/internal/formats/zza;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/ads/internal/formats/zzc;",
            ">;",
            "Lcom/google/android/gms/internal/zzlh",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/ads/internal/formats/zza;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcr$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzpc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvW:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvX:Lcom/google/android/gms/internal/zzlh;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvY:Lcom/google/android/gms/internal/zzlh;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvS:Lcom/google/android/gms/ads/internal/formats/zza;

    return-void
.end method


# virtual methods
.method public getAvailableAssetNames()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvX:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlh;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvY:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzlh;->size()I

    move-result v1

    add-int/2addr v0, v1

    new-array v4, v0, [Ljava/lang/String;

    move v1, v2

    move v3, v2

    :goto_12
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvX:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlh;->size()I

    move-result v0

    if-ge v1, v0, :cond_2b

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvX:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzlh;->keyAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    aput-object v0, v4, v3

    add-int/lit8 v0, v1, 0x1

    add-int/lit8 v1, v3, 0x1

    move v3, v1

    move v1, v0

    goto :goto_12

    :cond_2b
    :goto_2b
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvY:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlh;->size()I

    move-result v0

    if-ge v2, v0, :cond_42

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvY:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzlh;->keyAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    aput-object v0, v4, v3

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_2b

    :cond_42
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCustomTemplateId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvW:Ljava/lang/String;

    return-object v0
.end method

.method public performClick(Ljava/lang/String;)V
    .registers 4
    .param p1, "assetName"    # Ljava/lang/String;

    .prologue
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    if-nez v0, :cond_e

    const-string v0, "Attempt to call performClick before ad initialized."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->e(Ljava/lang/String;)V

    monitor-exit v1

    :goto_d
    return-void

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/formats/zzh;->performClick(Ljava/lang/String;)V

    monitor-exit v1

    goto :goto_d

    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public recordImpression()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    if-nez v0, :cond_e

    const-string v0, "Attempt to perform recordImpression before ad initialized."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->e(Ljava/lang/String;)V

    monitor-exit v1

    :goto_d
    return-void

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/formats/zzh;->recordImpression()V

    monitor-exit v1

    goto :goto_d

    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public zzS(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvY:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzlh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public zzT(Ljava/lang/String;)Lcom/google/android/gms/internal/zzcj;
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvX:Lcom/google/android/gms/internal/zzlh;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzlh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzcj;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/formats/zzh;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzdu()Ljava/lang/String;
    .registers 2

    const-string v0, "3"

    return-object v0
.end method

.method public zzdv()Lcom/google/android/gms/ads/internal/formats/zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzf;->zzvS:Lcom/google/android/gms/ads/internal/formats/zza;

    return-object v0
.end method
