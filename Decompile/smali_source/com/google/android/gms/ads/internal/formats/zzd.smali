.class public Lcom/google/android/gms/ads/internal/formats/zzd;
.super Lcom/google/android/gms/internal/zzcn$zza;

# interfaces
.implements Lcom/google/android/gms/ads/internal/formats/zzh$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final mExtras:Landroid/os/Bundle;

.field private final zzpc:Ljava/lang/Object;

.field private final zzvK:Ljava/lang/String;

.field private final zzvL:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/ads/internal/formats/zzc;",
            ">;"
        }
    .end annotation
.end field

.field private final zzvM:Ljava/lang/String;

.field private final zzvN:Lcom/google/android/gms/internal/zzcj;

.field private final zzvO:Ljava/lang/String;

.field private final zzvP:D

.field private final zzvQ:Ljava/lang/String;

.field private final zzvR:Ljava/lang/String;

.field private final zzvS:Lcom/google/android/gms/ads/internal/formats/zza;

.field private zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/internal/zzcj;Ljava/lang/String;DLjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/formats/zza;Landroid/os/Bundle;)V
    .registers 14

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcn$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzpc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvK:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvL:Ljava/util/List;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvM:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvN:Lcom/google/android/gms/internal/zzcj;

    iput-object p5, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvO:Ljava/lang/String;

    iput-wide p6, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvP:D

    iput-object p8, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvQ:Ljava/lang/String;

    iput-object p9, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvR:Ljava/lang/String;

    iput-object p10, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvS:Lcom/google/android/gms/ads/internal/formats/zza;

    iput-object p11, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->mExtras:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public getBody()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvM:Ljava/lang/String;

    return-object v0
.end method

.method public getCallToAction()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvO:Ljava/lang/String;

    return-object v0
.end method

.method public getCustomTemplateId()Ljava/lang/String;
    .registers 2

    const-string v0, ""

    return-object v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public getHeadline()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvK:Ljava/lang/String;

    return-object v0
.end method

.method public getImages()Ljava/util/List;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvL:Ljava/util/List;

    return-object v0
.end method

.method public getPrice()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvR:Ljava/lang/String;

    return-object v0
.end method

.method public getStarRating()D
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvP:D

    return-wide v0
.end method

.method public getStore()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvQ:Ljava/lang/String;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/formats/zzh;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzds()Lcom/google/android/gms/internal/zzcj;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvN:Lcom/google/android/gms/internal/zzcj;

    return-object v0
.end method

.method public zzdt()Lcom/google/android/gms/dynamic/zzd;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    return-object v0
.end method

.method public zzdu()Ljava/lang/String;
    .registers 2

    const-string v0, "2"

    return-object v0
.end method

.method public zzdv()Lcom/google/android/gms/ads/internal/formats/zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzd;->zzvS:Lcom/google/android/gms/ads/internal/formats/zza;

    return-object v0
.end method
