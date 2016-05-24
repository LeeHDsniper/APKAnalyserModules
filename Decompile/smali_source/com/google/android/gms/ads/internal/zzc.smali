.class public abstract Lcom/google/android/gms/ads/internal/zzc;
.super Lcom/google/android/gms/ads/internal/zzb;

# interfaces
.implements Lcom/google/android/gms/ads/internal/zzg;
.implements Lcom/google/android/gms/internal/zzfc;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V
    .registers 7

    invoke-direct/range {p0 .. p6}, Lcom/google/android/gms/ads/internal/zzb;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V

    return-void
.end method


# virtual methods
.method public recordClick()V
    .registers 1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzc;->onAdClicked()V

    return-void
.end method

.method public recordImpression()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/ads/internal/zzc;->zza(Lcom/google/android/gms/internal/zzhj;Z)V

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/ads/internal/zze;)Lcom/google/android/gms/internal/zzip;
    .registers 14

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq$zza;->getNextView()Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Lcom/google/android/gms/internal/zzip;

    if-eqz v1, :cond_3e

    const-string v1, "Reusing webview..."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    check-cast v0, Lcom/google/android/gms/internal/zzip;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzip;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V

    move-object v10, v0

    :goto_1f
    invoke-interface {v10}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p0

    move-object v3, p0

    move-object v4, p0

    move-object v6, p0

    move-object v8, p2

    move-object v9, p0

    invoke-virtual/range {v0 .. v9}, Lcom/google/android/gms/internal/zziq;->zzb(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/internal/zzdd;Lcom/google/android/gms/ads/internal/overlay/zzn;ZLcom/google/android/gms/internal/zzdi;Lcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzfc;)V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDQ:Ljava/lang/String;

    invoke-interface {v10, v0}, Lcom/google/android/gms/internal/zzip;->zzaG(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDO:Ljava/lang/String;

    invoke-interface {v10, v0}, Lcom/google/android/gms/internal/zzip;->zzaH(Ljava/lang/String;)V

    return-object v10

    :cond_3e
    if-eqz v0, :cond_47

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/internal/zzq$zza;->removeView(Landroid/view/View;)V

    :cond_47
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzby()Lcom/google/android/gms/internal/zzir;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v5, Lcom/google/android/gms/ads/internal/zzq;->zzqa:Lcom/google/android/gms/internal/zzan;

    iget-object v6, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v7, p0, Lcom/google/android/gms/ads/internal/zzc;->zzov:Lcom/google/android/gms/ads/internal/zzd;

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/gms/internal/zzir;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)Lcom/google/android/gms/internal/zzip;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsI:[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    if-nez v1, :cond_72

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/ads/internal/zzc;->zzb(Landroid/view/View;)V

    :cond_72
    move-object v10, v0

    goto :goto_1f
.end method

.method public zza(IIII)V
    .registers 5

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzc;->zzaS()Z

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzch;)V
    .registers 3

    const-string v0, "setOnCustomRenderedAdLoadedListener must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqu:Lcom/google/android/gms/internal/zzch;

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzcd;)V
    .registers 13

    iget v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->errorCode:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_10

    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/ads/internal/zzc$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/ads/internal/zzc$1;-><init>(Lcom/google/android/gms/ads/internal/zzc;Lcom/google/android/gms/internal/zzhj$zza;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_f
    return-void

    :cond_10
    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iput-object v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    :cond_1a
    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzDX:Z

    if-eqz v0, :cond_41

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v1, 0x0

    iput v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    iget-object v9, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbw()Lcom/google/android/gms/internal/zzga;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqa:Lcom/google/android/gms/internal/zzan;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/android/gms/ads/internal/zzc;->zzow:Lcom/google/android/gms/internal/zzeh;

    move-object v2, p0

    move-object v3, p1

    move-object v7, p0

    move-object v8, p2

    invoke-virtual/range {v0 .. v8}, Lcom/google/android/gms/internal/zzga;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zza;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzan;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/internal/zzga$zza;Lcom/google/android/gms/internal/zzcd;)Lcom/google/android/gms/internal/zzhq;

    move-result-object v0

    iput-object v0, v9, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    goto :goto_f

    :cond_41
    sget-object v0, Lcom/google/android/gms/internal/zzhu;->zzHK:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/ads/internal/zzc$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/gms/ads/internal/zzc$2;-><init>(Lcom/google/android/gms/ads/internal/zzc;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzcd;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_f
.end method

.method protected zza(Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/internal/zzhj;)Z
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbP()Z

    move-result v0

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqc:Lcom/google/android/gms/ads/internal/zzq$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq$zza;->zzbT()Lcom/google/android/gms/internal/zzhw;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/internal/zzhj;->zzEc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhw;->zzaz(Ljava/lang/String;)V

    :cond_1b
    invoke-super {p0, p1, p2}, Lcom/google/android/gms/ads/internal/zzb;->zza(Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/internal/zzhj;)Z

    move-result v0

    return v0
.end method

.method public zzbc()V
    .registers 1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzc;->zzaQ()Z

    return-void
.end method

.method public zzc(Landroid/view/View;)V
    .registers 10

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-object p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqy:Landroid/view/View;

    new-instance v0, Lcom/google/android/gms/internal/zzhj;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqh:Lcom/google/android/gms/internal/zzhj$zza;

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzhj;-><init>(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzei;Ljava/lang/String;Lcom/google/android/gms/internal/zzec;Lcom/google/android/gms/ads/internal/formats/zzh$zza;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/zzc;->zzb(Lcom/google/android/gms/internal/zzhj;)V

    return-void
.end method
