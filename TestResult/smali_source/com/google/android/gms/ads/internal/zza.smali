.class public abstract Lcom/google/android/gms/ads/internal/zza;
.super Lcom/google/android/gms/ads/internal/client/zzr$zza;

# interfaces
.implements Lcom/google/android/gms/ads/internal/client/zza;
.implements Lcom/google/android/gms/ads/internal/overlay/zzn;
.implements Lcom/google/android/gms/ads/internal/request/zza$zza;
.implements Lcom/google/android/gms/internal/zzdd;
.implements Lcom/google/android/gms/internal/zzga$zza;
.implements Lcom/google/android/gms/internal/zzhn;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private zzon:Lcom/google/android/gms/internal/zzcd;

.field private zzoo:Lcom/google/android/gms/internal/zzcc;

.field private zzop:Lcom/google/android/gms/internal/zzcc;

.field zzoq:Z

.field protected final zzor:Lcom/google/android/gms/ads/internal/zzo;

.field protected final zzos:Lcom/google/android/gms/ads/internal/zzq;

.field protected transient zzot:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

.field protected final zzou:Lcom/google/android/gms/internal/zzay;

.field protected final zzov:Lcom/google/android/gms/ads/internal/zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/zzq;Lcom/google/android/gms/ads/internal/zzo;Lcom/google/android/gms/ads/internal/zzd;)V
    .registers 7

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/client/zzr$zza;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzoq:Z

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    if-eqz p2, :cond_33

    :goto_a
    iput-object p2, p0, Lcom/google/android/gms/ads/internal/zza;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/zza;->zzov:Lcom/google/android/gms/ads/internal/zzd;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhu;->zzJ(Landroid/content/Context;)Z

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzhl;->zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgh()Lcom/google/android/gms/internal/zzay;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzou:Lcom/google/android/gms/internal/zzay;

    return-void

    :cond_33
    new-instance p2, Lcom/google/android/gms/ads/internal/zzo;

    invoke-direct {p2, p0}, Lcom/google/android/gms/ads/internal/zzo;-><init>(Lcom/google/android/gms/ads/internal/zza;)V

    goto :goto_a
.end method

.method private zzaR()Z
    .registers 4

    const/4 v0, 0x0

    const-string v1, "Ad leaving application."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    if-nez v1, :cond_d

    :goto_c
    return v0

    :cond_d
    :try_start_d
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    invoke-interface {v1}, Lcom/google/android/gms/ads/internal/client/zzn;->onAdLeftApplication()V
    :try_end_14
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_14} :catch_16

    const/4 v0, 0x1

    goto :goto_c

    :catch_16
    move-exception v1

    const-string v2, "Could not call AdListener.onAdLeftApplication()."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_c
.end method


# virtual methods
.method public destroy()V
    .registers 3

    const-string v0, "destroy must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzo;->cancel()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzou:Lcom/google/android/gms/internal/zzay;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzay;->zzf(Lcom/google/android/gms/internal/zzhj;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->destroy()V

    return-void
.end method

.method public isLoading()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzoq:Z

    return v0
.end method

.method public isReady()Z
    .registers 2

    const-string v0, "isLoaded must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqd:Lcom/google/android/gms/internal/zzhq;

    if-nez v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    if-nez v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    :goto_18
    return v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method public onAdClicked()V
    .registers 8

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-nez v0, :cond_c

    const-string v0, "Ad state was null when trying to ping click URLs."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_b
    :goto_b
    return-void

    :cond_c
    const-string v0, "Pinging click URLs."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqi:Lcom/google/android/gms/internal/zzhk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhk;->zzfU()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyw:Ljava/util/List;

    if-eqz v0, :cond_49

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v5, v5, Lcom/google/android/gms/internal/zzhj;->zzyw:Ljava/util/List;

    iget-object v6, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzhj;->zzDO:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)V

    :cond_49
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqj:Lcom/google/android/gms/ads/internal/client/zzm;

    if-eqz v0, :cond_b

    :try_start_4f
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqj:Lcom/google/android/gms/ads/internal/client/zzm;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/client/zzm;->onAdClicked()V
    :try_end_56
    .catch Landroid/os/RemoteException; {:try_start_4f .. :try_end_56} :catch_57

    goto :goto_b

    :catch_57
    move-exception v0

    const-string v1, "Could not notify onAdClicked event."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_b
.end method

.method public onAppEvent(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "info"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzql:Lcom/google/android/gms/ads/internal/client/zzt;

    if-eqz v0, :cond_d

    :try_start_6
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzql:Lcom/google/android/gms/ads/internal/client/zzt;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/ads/internal/client/zzt;->onAppEvent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_d
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_d} :catch_e

    :cond_d
    :goto_d
    return-void

    :catch_e
    move-exception v0

    const-string v1, "Could not call the AppEventListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_d
.end method

.method public pause()V
    .registers 2

    const-string v0, "pause must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    return-void
.end method

.method protected recordImpression()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/zza;->zzc(Lcom/google/android/gms/internal/zzhj;)V

    return-void
.end method

.method public resume()V
    .registers 2

    const-string v0, "resume must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    return-void
.end method

.method public setManualImpressionsEnabled(Z)V
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Attempt to call setManualImpressionsEnabled for an unsupported ad type."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public stopLoading()V
    .registers 3

    const-string v0, "stopLoading must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzoq:Z

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/zzq;->zzf(Z)V

    return-void
.end method

.method zza(Lcom/google/android/gms/internal/zzbk;)Landroid/os/Bundle;
    .registers 8

    const/4 v5, 0x1

    const/4 v0, 0x0

    if-nez p1, :cond_5

    :cond_4
    :goto_4
    return-object v0

    :cond_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbk;->zzcx()Z

    move-result v1

    if-eqz v1, :cond_e

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbk;->wakeup()V

    :cond_e
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzbk;->zzcv()Lcom/google/android/gms/internal/zzbh;

    move-result-object v2

    if-eqz v2, :cond_44

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbh;->zzcm()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "In AdManger: loadAd, "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzbh;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    :goto_32
    if-eqz v1, :cond_4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0, v5}, Landroid/os/Bundle;-><init>(I)V

    const-string v2, "fingerprint"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "v"

    invoke-virtual {v0, v1, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_4

    :cond_44
    move-object v1, v0

    goto :goto_32
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V
    .registers 4

    const-string v0, "setAdSize must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_26

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_26

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    if-nez v0, :cond_26

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzip;->zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V

    :cond_26
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    if-nez v0, :cond_2d

    :goto_2c
    return-void

    :cond_2d
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq$zza;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_47

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/internal/zzq$zza;->getNextView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/zzq$zza;->removeView(Landroid/view/View;)V

    :cond_47
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/zzq$zza;->setMinimumWidth(I)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    iget v1, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/zzq$zza;->setMinimumHeight(I)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq$zza;->requestLayout()V

    goto :goto_2c
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzm;)V
    .registers 3

    const-string v0, "setAdListener must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqj:Lcom/google/android/gms/ads/internal/client/zzm;

    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzn;)V
    .registers 3

    const-string v0, "setAdListener must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzt;)V
    .registers 3

    const-string v0, "setAppEventListener must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzql:Lcom/google/android/gms/ads/internal/client/zzt;

    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zzu;)V
    .registers 3

    const-string v0, "setCorrelationIdProvider must be called on the main UI thread"

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqm:Lcom/google/android/gms/ads/internal/client/zzu;

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzch;)V
    .registers 4

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setOnCustomRenderedAdLoadedListener is not supported for current ad type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzfm;)V
    .registers 4

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setInAppPurchaseListener is not supported for current ad type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzfq;Ljava/lang/String;)V
    .registers 5

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setPlayStorePurchaseParams is not supported for current ad type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzhj$zza;)V
    .registers 10

    const-wide/16 v2, -0x1

    const/4 v7, 0x1

    const/4 v6, 0x0

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEb:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_38

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_38

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEl:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/zza;->zzo(Ljava/lang/String;)J

    move-result-wide v0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_38

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-wide v4, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEb:J

    add-long/2addr v0, v4

    invoke-virtual {v2, v0, v1}, Lcom/google/android/gms/internal/zzcd;->zzb(J)Lcom/google/android/gms/internal/zzcc;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "stc"

    aput-object v3, v2, v6

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    :cond_38
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzcd;->zzR(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzoo:Lcom/google/android/gms/internal/zzcc;

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "arf"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzop:Lcom/google/android/gms/internal/zzcc;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqd:Lcom/google/android/gms/internal/zzhq;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqh:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/ads/internal/zza;->zza(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzcd;)V

    return-void
.end method

.method protected abstract zza(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzcd;)V
.end method

.method public zza(Ljava/util/HashSet;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Lcom/google/android/gms/internal/zzhk;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzq;->zza(Ljava/util/HashSet;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z
    .registers 5

    const-string v0, "loadAd must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqd:Lcom/google/android/gms/internal/zzhq;

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    if-eqz v0, :cond_1e

    :cond_11
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzot:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    if-eqz v0, :cond_1a

    const-string v0, "Aborting last ad request since another ad request is already in progress. The current request object will still be cached for future refreshes."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_1a
    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zza;->zzot:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    const/4 v0, 0x0

    :goto_1d
    return v0

    :cond_1e
    const-string v0, "Starting ad request."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzoq:Z

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zza;->zzaL()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzoo:Lcom/google/android/gms/internal/zzcc;

    iget-boolean v0, p1, Lcom/google/android/gms/ads/internal/client/AdRequestParcel;->zzst:Z

    if-nez v0, :cond_5d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Use AdRequest.Builder.addTestDevice(\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzQ(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\") to get test ads on this device."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    :cond_5d
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/ads/internal/zza;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzcd;)Z

    move-result v0

    goto :goto_1d
.end method

.method protected abstract zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzcd;)Z
.end method

.method zza(Lcom/google/android/gms/internal/zzhj;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method protected abstract zza(Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/internal/zzhj;)Z
.end method

.method zzaL()V
    .registers 9

    const-wide/16 v6, -0x1

    const/4 v4, 0x0

    new-instance v1, Lcom/google/android/gms/internal/zzcd;

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuB:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const-string v2, "load_ad"

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsG:Ljava/lang/String;

    invoke-direct {v1, v0, v2, v3}, Lcom/google/android/gms/internal/zzcd;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    new-instance v0, Lcom/google/android/gms/internal/zzcc;

    invoke-direct {v0, v6, v7, v4, v4}, Lcom/google/android/gms/internal/zzcc;-><init>(JLjava/lang/String;Lcom/google/android/gms/internal/zzcc;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzoo:Lcom/google/android/gms/internal/zzcc;

    new-instance v0, Lcom/google/android/gms/internal/zzcc;

    invoke-direct {v0, v6, v7, v4, v4}, Lcom/google/android/gms/internal/zzcc;-><init>(JLjava/lang/String;Lcom/google/android/gms/internal/zzcc;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzop:Lcom/google/android/gms/internal/zzcc;

    return-void
.end method

.method public zzaM()Lcom/google/android/gms/dynamic/zzd;
    .registers 2

    const-string v0, "getAdFrame must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzx(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v0

    return-object v0
.end method

.method public zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .registers 2

    const-string v0, "getAdSize must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    return-object v0
.end method

.method public zzaO()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/zza;->zzaR()Z

    return-void
.end method

.method public zzaP()V
    .registers 8

    const-string v0, "recordManualImpression must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-nez v0, :cond_11

    const-string v0, "Ad state was null when trying to ping manual tracking URLs."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_10
    :goto_10
    return-void

    :cond_11
    const-string v0, "Pinging manual tracking URLs."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzDZ:Ljava/util/List;

    if-eqz v0, :cond_10

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v5, v5, Lcom/google/android/gms/internal/zzhj;->zzDZ:Ljava/util/List;

    iget-object v6, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v6, v6, Lcom/google/android/gms/internal/zzhj;->zzDO:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_10
.end method

.method protected zzaQ()Z
    .registers 4

    const/4 v0, 0x0

    const-string v1, "Ad closing."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    if-nez v1, :cond_d

    :goto_c
    return v0

    :cond_d
    :try_start_d
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    invoke-interface {v1}, Lcom/google/android/gms/ads/internal/client/zzn;->onAdClosed()V
    :try_end_14
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_14} :catch_16

    const/4 v0, 0x1

    goto :goto_c

    :catch_16
    move-exception v1

    const-string v2, "Could not call AdListener.onAdClosed()."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_c
.end method

.method protected zzaS()Z
    .registers 4

    const/4 v0, 0x0

    const-string v1, "Ad opening."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    if-nez v1, :cond_d

    :goto_c
    return v0

    :cond_d
    :try_start_d
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    invoke-interface {v1}, Lcom/google/android/gms/ads/internal/client/zzn;->onAdOpened()V
    :try_end_14
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_14} :catch_16

    const/4 v0, 0x1

    goto :goto_c

    :catch_16
    move-exception v1

    const-string v2, "Could not call AdListener.onAdOpened()."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_c
.end method

.method protected zzaT()Z
    .registers 4

    const/4 v0, 0x0

    const-string v1, "Ad finished loading."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzoq:Z

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    if-nez v1, :cond_f

    :goto_e
    return v0

    :cond_f
    :try_start_f
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    invoke-interface {v1}, Lcom/google/android/gms/ads/internal/client/zzn;->onAdLoaded()V
    :try_end_16
    .catch Landroid/os/RemoteException; {:try_start_f .. :try_end_16} :catch_18

    const/4 v0, 0x1

    goto :goto_e

    :catch_18
    move-exception v1

    const-string v2, "Could not call AdListener.onAdLoaded()."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_e
.end method

.method protected zzb(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzhv;->zzgy()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/ads/internal/zzq$zza;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public zzb(Lcom/google/android/gms/internal/zzhj;)V
    .registers 9

    const/4 v6, 0x1

    const/4 v5, -0x2

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzop:Lcom/google/android/gms/internal/zzcc;

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "awr"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    iget v0, p1, Lcom/google/android/gms/internal/zzhj;->errorCode:I

    if-eq v0, v5, :cond_2b

    iget v0, p1, Lcom/google/android/gms/internal/zzhj;->errorCode:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2b

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/internal/zzq;->zzbL()Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhl;->zzb(Ljava/util/HashSet;)V

    :cond_2b
    iget v0, p1, Lcom/google/android/gms/internal/zzhj;->errorCode:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_33

    iput-boolean v4, p0, Lcom/google/android/gms/ads/internal/zza;->zzoq:Z

    :cond_32
    :goto_32
    return-void

    :cond_33
    invoke-virtual {p0, p1}, Lcom/google/android/gms/ads/internal/zza;->zza(Lcom/google/android/gms/internal/zzhj;)Z

    move-result v0

    if-eqz v0, :cond_3e

    const-string v0, "Ad refresh scheduled."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    :cond_3e
    iget v0, p1, Lcom/google/android/gms/internal/zzhj;->errorCode:I

    if-eq v0, v5, :cond_48

    iget v0, p1, Lcom/google/android/gms/internal/zzhj;->errorCode:I

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/zza;->zze(I)Z

    goto :goto_32

    :cond_48
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqx:Lcom/google/android/gms/internal/zzho;

    if-nez v0, :cond_5b

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    new-instance v1, Lcom/google/android/gms/internal/zzho;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzpZ:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzho;-><init>(Ljava/lang/String;)V

    iput-object v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqx:Lcom/google/android/gms/internal/zzho;

    :cond_5b
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzou:Lcom/google/android/gms/internal/zzay;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzay;->zze(Lcom/google/android/gms/internal/zzhj;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/ads/internal/zza;->zza(Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/internal/zzhj;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbS()V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    const-string v2, "is_mraid"

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhj;->zzbY()Z

    move-result v0

    if-eqz v0, :cond_f9

    const-string v0, "1"

    :goto_87
    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzcd;->zzd(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    const-string v2, "is_mediation"

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzhj;->zzDX:Z

    if-eqz v0, :cond_fc

    const-string v0, "1"

    :goto_98
    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzcd;->zzd(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_c8

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    if-eqz v0, :cond_c8

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    const-string v2, "is_video"

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziq;->zzhc()Z

    move-result v0

    if-eqz v0, :cond_ff

    const-string v0, "1"

    :goto_c5
    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzcd;->zzd(Ljava/lang/String;Ljava/lang/String;)V

    :cond_c8
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzoo:Lcom/google/android/gms/internal/zzcc;

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "ttc"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgc()Lcom/google/android/gms/internal/zzca;

    move-result-object v0

    if-eqz v0, :cond_ec

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgc()Lcom/google/android/gms/internal/zzca;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzon:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzca;->zza(Lcom/google/android/gms/internal/zzcd;)Z

    :cond_ec
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbP()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zza;->zzaT()Z

    goto/16 :goto_32

    :cond_f9
    const-string v0, "0"

    goto :goto_87

    :cond_fc
    const-string v0, "0"

    goto :goto_98

    :cond_ff
    const-string v0, "0"

    goto :goto_c5
.end method

.method protected zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq$zza;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_20

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhu;->zzgq()Z

    move-result v0

    if-eqz v0, :cond_20

    const/4 v0, 0x1

    :goto_1f
    return v0

    :cond_20
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method public zzc(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/ads/internal/zza;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p0, p1}, Lcom/google/android/gms/ads/internal/zza;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    :goto_9
    return-void

    :cond_a
    const-string v0, "Ad is not visible. Not refreshing ad."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/ads/internal/zzo;->zzf(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V

    goto :goto_9
.end method

.method protected zzc(Lcom/google/android/gms/internal/zzhj;)V
    .registers 9

    if-nez p1, :cond_8

    const-string v0, "Ad state was null when trying to ping impression URLs."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_7
    :goto_7
    return-void

    :cond_8
    const-string v0, "Pinging Impression URLs."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqi:Lcom/google/android/gms/internal/zzhk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhk;->zzfT()V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj;->zzyx:Ljava/util/List;

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v5, p1, Lcom/google/android/gms/internal/zzhj;->zzyx:Ljava/util/List;

    iget-object v6, p1, Lcom/google/android/gms/internal/zzhj;->zzDO:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzhu;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_7
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

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zza;->zzoq:Z

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    if-nez v1, :cond_20

    :goto_1f
    return v0

    :cond_20
    :try_start_20
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zza;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqk:Lcom/google/android/gms/ads/internal/client/zzn;

    invoke-interface {v1, p1}, Lcom/google/android/gms/ads/internal/client/zzn;->onAdFailedToLoad(I)V
    :try_end_27
    .catch Landroid/os/RemoteException; {:try_start_20 .. :try_end_27} :catch_29

    const/4 v0, 0x1

    goto :goto_1f

    :catch_29
    move-exception v1

    const-string v2, "Could not call AdListener.onAdFailedToLoad()."

    invoke-static {v2, v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1f
.end method

.method zzo(Ljava/lang/String;)J
    .registers 5

    const-string v0, "ufe"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/16 v0, 0x2c

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_13

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    :cond_13
    add-int/lit8 v1, v1, 0x4

    :try_start_15
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_1c
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_15 .. :try_end_1c} :catch_1e
    .catch Ljava/lang/NumberFormatException; {:try_start_15 .. :try_end_1c} :catch_27

    move-result-wide v0

    :goto_1d
    return-wide v0

    :catch_1e
    move-exception v0

    const-string v0, "Invalid index for Url fetch time in CSI latency info."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :goto_24
    const-wide/16 v0, -0x1

    goto :goto_1d

    :catch_27
    move-exception v0

    const-string v0, "Cannot find valid format of Url fetch time in CSI latency info."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_24
.end method
