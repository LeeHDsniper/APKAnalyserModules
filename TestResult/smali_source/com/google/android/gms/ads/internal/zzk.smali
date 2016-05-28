.class public Lcom/google/android/gms/ads/internal/zzk;
.super Lcom/google/android/gms/ads/internal/zzc;

# interfaces
.implements Lcom/google/android/gms/internal/zzdk;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field protected transient zzpj:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V
    .registers 8

    invoke-direct/range {p0 .. p6}, Lcom/google/android/gms/ads/internal/zzc;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzpj:Z

    return-void
.end method

.method private zzb(Landroid/os/Bundle;)V
    .registers 8

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    const-string v3, "gmob-apps"

    const/4 v5, 0x0

    move-object v4, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzhu;->zzb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Z)V

    return-void
.end method

.method private zzbm()V
    .registers 4

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbP()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbM()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-boolean v2, v0, Lcom/google/android/gms/ads/internal/zzq;->zzpk:Z

    iput-boolean v2, p0, Lcom/google/android/gms/ads/internal/zzk;->zzpj:Z

    :cond_19
    return-void
.end method


# virtual methods
.method public showInterstitial()V
    .registers 10

    const-string v0, "showInterstitial must be called on the main UI thread."

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-nez v0, :cond_11

    const-string v0, "The interstitial has not loaded."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_10
    :goto_10
    return-void

    :cond_11
    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuZ:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_79

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_9f

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    :goto_35
    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/zzk;->zzpj:Z

    if-nez v1, :cond_52

    const-string v1, "It is not recommended to show an interstitial before onAdLoaded completes."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "appid"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "action"

    const-string v3, "show_interstitial_before_load_finish"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/google/android/gms/ads/internal/zzk;->zzb(Landroid/os/Bundle;)V

    :cond_52
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzhu;->zzO(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_79

    const-string v1, "It is not recommended to show an interstitial when app is not in foreground."

    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "appid"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "action"

    const-string v2, "show_interstitial_app_not_in_foreground"

    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/google/android/gms/ads/internal/zzk;->zzb(Landroid/os/Bundle;)V

    :cond_79
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbQ()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzhj;->zzDX:Z

    if-eqz v0, :cond_a8

    :try_start_89
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzyR:Lcom/google/android/gms/internal/zzei;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzei;->showInterstitial()V
    :try_end_92
    .catch Landroid/os/RemoteException; {:try_start_89 .. :try_end_92} :catch_94

    goto/16 :goto_10

    :catch_94
    move-exception v0

    const-string v1, "Could not show interstitial."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/zzk;->zzbm()V

    goto/16 :goto_10

    :cond_9f
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    goto :goto_35

    :cond_a8
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-nez v0, :cond_b7

    const-string v0, "The interstitial failed to load."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_10

    :cond_b7
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgW()Z

    move-result v0

    if-eqz v0, :cond_ca

    const-string v0, "The interstitial is already showing."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_10

    :cond_ca
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzip;->zzC(Z)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzGF:Lorg/json/JSONObject;

    if-eqz v0, :cond_e9

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzou:Lcom/google/android/gms/internal/zzay;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzay;->zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzhj;)Lcom/google/android/gms/internal/zzaz;

    :cond_e9
    new-instance v8, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzpk:Z

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzk;->zzbl()Z

    move-result v1

    invoke-direct {v8, v0, v1}, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;-><init>(ZZ)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->getRequestedOrientation()I

    move-result v5

    const/4 v0, -0x1

    if-ne v5, v0, :cond_109

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget v5, v0, Lcom/google/android/gms/internal/zzhj;->orientation:I

    :cond_109
    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v4, v1, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    iget-object v7, v1, Lcom/google/android/gms/internal/zzhj;->zzEc:Ljava/lang/String;

    move-object v1, p0

    move-object v2, p0

    move-object v3, p0

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/ads/internal/overlay/zzn;Lcom/google/android/gms/internal/zzip;ILcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbv()Lcom/google/android/gms/ads/internal/overlay/zze;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/ads/internal/overlay/zze;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    goto/16 :goto_10
.end method

.method protected zza(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/ads/internal/zze;)Lcom/google/android/gms/internal/zzip;
    .registers 15

    const/4 v11, 0x0

    const/4 v3, 0x0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzby()Lcom/google/android/gms/internal/zzir;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v5, v4, Lcom/google/android/gms/ads/internal/zzq;->zzqa:Lcom/google/android/gms/internal/zzan;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v6, v4, Lcom/google/android/gms/ads/internal/zzq;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v7, p0, Lcom/google/android/gms/ads/internal/zzk;->zzov:Lcom/google/android/gms/ads/internal/zzd;

    move v4, v3

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/gms/internal/zzir;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/ads/internal/zzd;)Lcom/google/android/gms/internal/zzip;

    move-result-object v10

    invoke-interface {v10}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/zzby;->zzuN:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object v1, p0

    move-object v2, v11

    move-object v3, p0

    move-object v4, p0

    move-object v6, p0

    move-object v7, p0

    move-object v8, p2

    move-object v9, v11

    invoke-virtual/range {v0 .. v9}, Lcom/google/android/gms/internal/zziq;->zzb(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/internal/zzdd;Lcom/google/android/gms/ads/internal/overlay/zzn;ZLcom/google/android/gms/internal/zzdi;Lcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzfc;)V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDQ:Ljava/lang/String;

    invoke-interface {v10, v0}, Lcom/google/android/gms/internal/zzip;->zzaG(Ljava/lang/String;)V

    return-object v10
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzcd;)Z
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqg:Lcom/google/android/gms/internal/zzhj;

    if-eqz v0, :cond_d

    const-string v0, "An interstitial is already loading. Aborting."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_c
    return v0

    :cond_d
    invoke-super {p0, p1, p2}, Lcom/google/android/gms/ads/internal/zzc;->zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzcd;)Z

    move-result v0

    goto :goto_c
.end method

.method protected zza(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzhj;Z)Z
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbP()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, p2, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_19

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/internal/zzhj;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/webkit/WebView;)Z

    :cond_19
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzor:Lcom/google/android/gms/ads/internal/zzo;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzo;->zzbr()Z

    move-result v0

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/internal/zzhj;)Z
    .registers 6

    invoke-super {p0, p1, p2}, Lcom/google/android/gms/ads/internal/zzc;->zza(Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/internal/zzhj;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzbP()Z

    move-result v0

    if-nez v0, :cond_27

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqy:Landroid/view/View;

    if-eqz v0, :cond_27

    iget-object v0, p2, Lcom/google/android/gms/internal/zzhj;->zzGF:Lorg/json/JSONObject;

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzou:Lcom/google/android/gms/internal/zzay;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/zzq;->zzqy:Landroid/view/View;

    invoke-virtual {v0, v1, p2, v2}, Lcom/google/android/gms/internal/zzay;->zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzhj;Landroid/view/View;)Lcom/google/android/gms/internal/zzaz;

    :cond_27
    const/4 v0, 0x1

    goto :goto_7
.end method

.method protected zzaT()Z
    .registers 3

    const/4 v0, 0x1

    invoke-super {p0}, Lcom/google/android/gms/ads/internal/zzc;->zzaT()Z

    move-result v1

    if-eqz v1, :cond_a

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzpj:Z

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public zzaV()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/ads/internal/zzk;->zzbm()V

    invoke-super {p0}, Lcom/google/android/gms/ads/internal/zzc;->zzaV()V

    return-void
.end method

.method public zzaW()V
    .registers 1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/zzk;->recordImpression()V

    invoke-super {p0}, Lcom/google/android/gms/ads/internal/zzc;->zzaW()V

    return-void
.end method

.method protected zzbl()Z
    .registers 7

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_a

    :cond_9
    :goto_9
    return v1

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_9

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;Landroid/graphics/Point;)Z

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    iget v0, v2, Landroid/graphics/Rect;->bottom:I

    if-eqz v0, :cond_46

    iget v0, v3, Landroid/graphics/Rect;->bottom:I

    if-eqz v0, :cond_46

    iget v0, v2, Landroid/graphics/Rect;->top:I

    iget v2, v3, Landroid/graphics/Rect;->top:I

    if-ne v0, v2, :cond_46

    const/4 v0, 0x1

    :goto_44
    move v1, v0

    goto :goto_9

    :cond_46
    move v0, v1

    goto :goto_44
.end method

.method public zzd(Z)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzk;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iput-boolean p1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzpk:Z

    return-void
.end method
