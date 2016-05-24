.class public Lcom/google/android/gms/internal/zzgx;
.super Lcom/google/android/gms/ads/internal/zzb;

# interfaces
.implements Lcom/google/android/gms/internal/zzhb;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

.field private zzGh:Ljava/lang/String;

.field private zzGi:Z

.field private zzGj:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzgy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V
    .registers 12

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/ads/internal/zzb;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGj:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public destroy()V
    .registers 5

    const-string v0, "destroy must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGj:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_f
    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :try_start_1b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgx;->zzGj:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzgy;

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgy;->zzfQ()Lcom/google/android/gms/internal/zzei;

    move-result-object v3

    if-eqz v3, :cond_f

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgy;->zzfQ()Lcom/google/android/gms/internal/zzei;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzei;->destroy()V
    :try_end_32
    .catch Landroid/os/RemoteException; {:try_start_1b .. :try_end_32} :catch_33

    goto :goto_f

    :catch_33
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fail to destroy adapter: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_f

    :cond_4b
    return-void
.end method

.method public isLoaded()Z
    .registers 2

    const-string v0, "isLoaded must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqd:Lcom/google/android/gms/internal/zzhq;

    if-nez v0, :cond_1d

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    if-nez v0, :cond_1d

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_1d

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGi:Z

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    :goto_1c
    return v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method public onRewardedVideoAdClosed()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    :try_start_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/reward/client/zzd;->onRewardedVideoAdClosed()V
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_a} :catch_b

    goto :goto_4

    :catch_b
    move-exception v0

    const-string v1, "Could not call RewardedVideoAdListener.onAdClosed()."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4
.end method

.method public onRewardedVideoAdLeftApplication()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    :try_start_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/reward/client/zzd;->onRewardedVideoAdLeftApplication()V
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_a} :catch_b

    goto :goto_4

    :catch_b
    move-exception v0

    const-string v1, "Could not call RewardedVideoAdListener.onAdLeftApplication()."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4
.end method

.method public onRewardedVideoAdOpened()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzgx;->zza(Lcom/google/android/gms/internal/zzhj;Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    if-nez v0, :cond_d

    :goto_c
    return-void

    :cond_d
    :try_start_d
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/reward/client/zzd;->onRewardedVideoAdOpened()V
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_12} :catch_13

    goto :goto_c

    :catch_13
    move-exception v0

    const-string v1, "Could not call RewardedVideoAdListener.onAdOpened()."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_c
.end method

.method public onRewardedVideoStarted()V
    .registers 8

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzhj;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzdz;->zzys:Ljava/util/List;

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzef;->zza(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzhj;Ljava/lang/String;ZLjava/util/List;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    if-nez v0, :cond_27

    :goto_26
    return-void

    :cond_27
    :try_start_27
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/reward/client/zzd;->onRewardedVideoStarted()V
    :try_end_2c
    .catch Landroid/os/RemoteException; {:try_start_27 .. :try_end_2c} :catch_2d

    goto :goto_26

    :catch_2d
    move-exception v0

    const-string v1, "Could not call RewardedVideoAdListener.onVideoStarted()."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_26
.end method

.method public pause()V
    .registers 5

    const-string v0, "pause must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGj:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_f
    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :try_start_1b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgx;->zzGj:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzgy;

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgy;->zzfQ()Lcom/google/android/gms/internal/zzei;

    move-result-object v3

    if-eqz v3, :cond_f

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgy;->zzfQ()Lcom/google/android/gms/internal/zzei;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzei;->pause()V
    :try_end_32
    .catch Landroid/os/RemoteException; {:try_start_1b .. :try_end_32} :catch_33

    goto :goto_f

    :catch_33
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fail to pause adapter: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_f

    :cond_4b
    return-void
.end method

.method public resume()V
    .registers 5

    const-string v0, "resume must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGj:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_f
    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :try_start_1b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgx;->zzGj:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzgy;

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgy;->zzfQ()Lcom/google/android/gms/internal/zzei;

    move-result-object v3

    if-eqz v3, :cond_f

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgy;->zzfQ()Lcom/google/android/gms/internal/zzei;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzei;->resume()V
    :try_end_32
    .catch Landroid/os/RemoteException; {:try_start_1b .. :try_end_32} :catch_33

    goto :goto_f

    :catch_33
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fail to resume adapter: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_f

    :cond_4b
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .registers 3
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    const-string v0, "setUserId must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgx;->zzGh:Ljava/lang/String;

    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/reward/client/RewardedVideoAdRequestParcel;)V
    .registers 4

    const-string v0, "loadAd must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/reward/client/RewardedVideoAdRequestParcel;->zzpZ:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string v0, "Invalid ad unit id. Aborting."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :goto_12
    return-void

    :cond_13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGi:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/reward/client/RewardedVideoAdRequestParcel;->zzpZ:Ljava/lang/String;

    iput-object v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/reward/client/RewardedVideoAdRequestParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    invoke-super {p0, v0}, Lcom/google/android/gms/ads/internal/zzb;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    goto :goto_12
.end method

.method public zza(Lcom/google/android/gms/ads/internal/reward/client/zzd;)V
    .registers 3

    const-string v0, "setRewardedVideoAdListener must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;)V
    .registers 9

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbJ()Lcom/google/android/gms/internal/zzef;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzhj;->zzyQ:Lcom/google/android/gms/internal/zzdz;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzdz;->zzyt:Ljava/util/List;

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzef;->zza(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzhj;Ljava/lang/String;ZLjava/util/List;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    if-nez v0, :cond_27

    :goto_26
    return-void

    :cond_27
    :try_start_27
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_65

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    if-eqz v0, :cond_65

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzea;->zzyB:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_65

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    new-instance v1, Lcom/google/android/gms/internal/zzgv;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzea;->zzyB:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzhj;->zzGG:Lcom/google/android/gms/internal/zzea;

    iget v3, v3, Lcom/google/android/gms/internal/zzea;->zzyC:I

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/internal/zzgv;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/reward/client/zzd;->zza(Lcom/google/android/gms/ads/internal/reward/client/zza;)V
    :try_end_5d
    .catch Landroid/os/RemoteException; {:try_start_27 .. :try_end_5d} :catch_5e

    goto :goto_26

    :catch_5e
    move-exception v0

    const-string v1, "Could not call RewardedVideoAdListener.onRewarded()."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_26

    :cond_65
    :try_start_65
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    new-instance v1, Lcom/google/android/gms/internal/zzgv;

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;->type:Ljava/lang/String;

    iget v3, p1, Lcom/google/android/gms/ads/internal/reward/mediation/client/RewardItemParcel;->zzGE:I

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/internal/zzgv;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/reward/client/zzd;->zza(Lcom/google/android/gms/ads/internal/reward/client/zza;)V
    :try_end_73
    .catch Landroid/os/RemoteException; {:try_start_65 .. :try_end_73} :catch_5e

    goto :goto_26
.end method

.method public zza(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzcd;)V
    .registers 7

    iget v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->errorCode:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_10

    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzgx$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzgx$1;-><init>(Lcom/google/android/gms/internal/zzgx;Lcom/google/android/gms/internal/zzhj$zza;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_f
    return-void

    :cond_10
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v1, 0x0

    iput v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    new-instance v1, Lcom/google/android/gms/internal/zzhe;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgx;->zzGh:Ljava/lang/String;

    invoke-direct {v1, v2, v3, p1, p0}, Lcom/google/android/gms/internal/zzhe;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzgx;)V

    iput-object v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AdRenderer: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhq;->zzgn()Ljava/util/concurrent/Future;

    goto :goto_f
.end method

.method public zza(Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/internal/zzhj;)Z
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    if-eqz v0, :cond_9

    :try_start_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/reward/client/zzd;->onRewardedVideoAdLoaded()V
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_9} :catch_b

    :cond_9
    :goto_9
    const/4 v0, 0x1

    return v0

    :catch_b
    move-exception v0

    const-string v1, "Could not call RewardedVideoAdListener.onAdLoaded()."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_9
.end method

.method public zzar(Ljava/lang/String;)Lcom/google/android/gms/internal/zzgy;
    .registers 7

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGj:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgy;

    if-nez v0, :cond_1b

    :try_start_a
    new-instance v1, Lcom/google/android/gms/internal/zzgy;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgx;->zzow:Lcom/google/android/gms/internal/zzeh;

    invoke-interface {v2, p1}, Lcom/google/android/gms/internal/zzeh;->zzab(Ljava/lang/String;)Lcom/google/android/gms/internal/zzei;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Lcom/google/android/gms/internal/zzgy;-><init>(Lcom/google/android/gms/internal/zzei;Lcom/google/android/gms/internal/zzhb;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_15} :catch_1c

    :try_start_15
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGj:Ljava/util/HashMap;

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_1a} :catch_34

    move-object v0, v1

    :cond_1b
    :goto_1b
    return-object v0

    :catch_1c
    move-exception v1

    :goto_1d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fail to instantiate adapter "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1b

    :catch_34
    move-exception v0

    move-object v4, v0

    move-object v0, v1

    move-object v1, v4

    goto :goto_1d
.end method

.method protected zze(I)Z
    .registers 5

    const/4 v0, 0x0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to load ad: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    if-nez v1, :cond_1c

    :goto_1b
    return v0

    :cond_1c
    :try_start_1c
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgx;->zzGg:Lcom/google/android/gms/ads/internal/reward/client/zzd;

    invoke-interface {v1, p1}, Lcom/google/android/gms/ads/internal/reward/client/zzd;->onRewardedVideoAdFailedToLoad(I)V
    :try_end_21
    .catch Landroid/os/RemoteException; {:try_start_1c .. :try_end_21} :catch_23

    const/4 v0, 0x1

    goto :goto_1b

    :catch_23
    move-exception v1

    const-string v2, "Could not call RewardedVideoAdListener.onAdFailedToLoad()."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1b
.end method

.method public zzfO()V
    .registers 3

    const-string v0, "showAd must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgx;->isLoaded()Z

    move-result v0

    if-nez v0, :cond_11

    const-string v0, "The reward video has not loaded."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_10
    :goto_10
    return-void

    :cond_11
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgx;->zzGi:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyS:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzgx;->zzar(Ljava/lang/String;)Lcom/google/android/gms/internal/zzgy;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgy;->zzfQ()Lcom/google/android/gms/internal/zzei;

    move-result-object v1

    if-eqz v1, :cond_10

    :try_start_26
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgy;->zzfQ()Lcom/google/android/gms/internal/zzei;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzei;->showVideo()V
    :try_end_2d
    .catch Landroid/os/RemoteException; {:try_start_26 .. :try_end_2d} :catch_2e

    goto :goto_10

    :catch_2e
    move-exception v0

    const-string v1, "Could not call showVideo."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_10
.end method

.method public zzfP()V
    .registers 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgx;->onAdClicked()V

    return-void
.end method
