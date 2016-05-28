.class public Lcom/google/android/gms/ads/internal/formats/zze;
.super Lcom/google/android/gms/internal/zzcp$zza;

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

.field private final zzvO:Ljava/lang/String;

.field private final zzvS:Lcom/google/android/gms/ads/internal/formats/zza;

.field private zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

.field private final zzvU:Lcom/google/android/gms/internal/zzcj;

.field private final zzvV:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/internal/zzcj;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/formats/zza;Landroid/os/Bundle;)V
    .registers 10

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcp$zza;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzpc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvK:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvL:Ljava/util/List;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvM:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvU:Lcom/google/android/gms/internal/zzcj;

    iput-object p5, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvO:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvV:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvS:Lcom/google/android/gms/ads/internal/formats/zza;

    iput-object p8, p0, Lcom/google/android/gms/ads/internal/formats/zze;->mExtras:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public getAdvertiser()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvV:Ljava/lang/String;

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvM:Ljava/lang/String;

    return-object v0
.end method

.method public getCallToAction()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvO:Ljava/lang/String;

    return-object v0
.end method

.method public getCustomTemplateId()Ljava/lang/String;
    .registers 2

    const-string v0, ""

    return-object v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public getHeadline()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvK:Ljava/lang/String;

    return-object v0
.end method

.method public getImages()Ljava/util/List;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvL:Ljava/util/List;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/formats/zzh;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public zzdt()Lcom/google/android/gms/dynamic/zzd;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvT:Lcom/google/android/gms/ads/internal/formats/zzh;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    return-object v0
.end method

.method public zzdu()Ljava/lang/String;
    .registers 2

    const-string v0, "1"

    return-object v0
.end method

.method public zzdv()Lcom/google/android/gms/ads/internal/formats/zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvS:Lcom/google/android/gms/ads/internal/formats/zza;

    return-object v0
.end method

.method public zzdw()Lcom/google/android/gms/internal/zzcj;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zze;->zzvU:Lcom/google/android/gms/internal/zzcj;

    return-object v0
.end method
