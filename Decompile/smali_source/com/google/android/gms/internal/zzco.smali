.class public Lcom/google/android/gms/internal/zzco;
.super Lcom/google/android/gms/ads/formats/NativeAppInstallAd;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzwx:Lcom/google/android/gms/internal/zzcn;

.field private final zzwy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/ads/formats/NativeAd$Image;",
            ">;"
        }
    .end annotation
.end field

.field private final zzwz:Lcom/google/android/gms/internal/zzck;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzcn;)V
    .registers 6

    invoke-direct {p0}, Lcom/google/android/gms/ads/formats/NativeAppInstallAd;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwy:Ljava/util/List;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    :try_start_c
    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzcn;->getImages()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_37

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzco;->zzd(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzcj;

    move-result-object v1

    if-eqz v1, :cond_16

    iget-object v2, p0, Lcom/google/android/gms/internal/zzco;->zzwy:Ljava/util/List;

    new-instance v3, Lcom/google/android/gms/internal/zzck;

    invoke-direct {v3, v1}, Lcom/google/android/gms/internal/zzck;-><init>(Lcom/google/android/gms/internal/zzcj;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_30
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_30} :catch_31

    goto :goto_16

    :catch_31
    move-exception v0

    const-string v1, "Failed to get image."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_37
    const/4 v1, 0x0

    :try_start_38
    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzcn;->zzds()Lcom/google/android/gms/internal/zzcj;

    move-result-object v2

    if-eqz v2, :cond_4e

    new-instance v0, Lcom/google/android/gms/internal/zzck;

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/zzck;-><init>(Lcom/google/android/gms/internal/zzcj;)V
    :try_end_45
    .catch Landroid/os/RemoteException; {:try_start_38 .. :try_end_45} :catch_48

    :goto_45
    iput-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwz:Lcom/google/android/gms/internal/zzck;

    return-void

    :catch_48
    move-exception v0

    const-string v2, "Failed to get icon."

    invoke-static {v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4e
    move-object v0, v1

    goto :goto_45
.end method


# virtual methods
.method public getBody()Ljava/lang/CharSequence;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzcn;->getBody()Ljava/lang/String;
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    :goto_6
    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "Failed to get body."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getCallToAction()Ljava/lang/CharSequence;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzcn;->getCallToAction()Ljava/lang/String;
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    :goto_6
    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "Failed to get call to action."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getExtras()Landroid/os/Bundle;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzcn;->getExtras()Landroid/os/Bundle;
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    :goto_6
    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "Failed to get extras"

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getHeadline()Ljava/lang/CharSequence;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzcn;->getHeadline()Ljava/lang/String;
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    :goto_6
    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "Failed to get headline."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getIcon()Lcom/google/android/gms/ads/formats/NativeAd$Image;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwz:Lcom/google/android/gms/internal/zzck;

    return-object v0
.end method

.method public getImages()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/ads/formats/NativeAd$Image;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwy:Ljava/util/List;

    return-object v0
.end method

.method public getPrice()Ljava/lang/CharSequence;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzcn;->getPrice()Ljava/lang/String;
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    :goto_6
    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "Failed to get price."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getStarRating()Ljava/lang/Double;
    .registers 7

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzcn;->getStarRating()D

    move-result-wide v2

    const-wide/high16 v4, -0x4010000000000000L

    cmpl-double v1, v2, v4

    if-nez v1, :cond_e

    :goto_d
    return-object v0

    :cond_e
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;
    :try_end_11
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_11} :catch_13

    move-result-object v0

    goto :goto_d

    :catch_13
    move-exception v1

    const-string v2, "Failed to get star rating."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_d
.end method

.method public getStore()Ljava/lang/CharSequence;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzcn;->getStore()Ljava/lang/String;
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    :goto_6
    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "Failed to get store"

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_6
.end method

.method protected synthetic zzaH()Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzco;->zzdt()Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    return-object v0
.end method

.method zzd(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzcj;
    .registers 3

    instance-of v0, p1, Landroid/os/IBinder;

    if-eqz v0, :cond_b

    check-cast p1, Landroid/os/IBinder;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzcj$zza;->zzt(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzcj;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected zzdt()Lcom/google/android/gms/dynamic/zzd;
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzco;->zzwx:Lcom/google/android/gms/internal/zzcn;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzcn;->zzdt()Lcom/google/android/gms/dynamic/zzd;
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    :goto_6
    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "Failed to retrieve native ad engine."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_6
.end method
