.class public Lcom/google/android/gms/ads/internal/overlay/zzd;
.super Lcom/google/android/gms/internal/zzfe$zza;

# interfaces
.implements Lcom/google/android/gms/ads/internal/overlay/zzo;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/internal/overlay/zzd$zzb;,
        Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;,
        Lcom/google/android/gms/ads/internal/overlay/zzd$zza;
    }
.end annotation


# static fields
.field static final zzAu:I


# instance fields
.field private final mActivity:Landroid/app/Activity;

.field zzAA:Lcom/google/android/gms/ads/internal/overlay/zzm;

.field zzAB:Z

.field zzAC:Landroid/widget/FrameLayout;

.field zzAD:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field zzAE:Z

.field zzAF:Z

.field zzAG:Z

.field zzAH:I

.field private zzAI:Z

.field private zzAJ:Z

.field private zzAK:Z

.field private final zzAv:Lcom/google/android/gms/internal/zzcd;

.field private final zzAw:Lcom/google/android/gms/internal/zzcc;

.field zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

.field zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

.field zzAz:Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

.field zzoL:Lcom/google/android/gms/internal/zzip;

.field zzzA:Landroid/widget/RelativeLayout;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    invoke-static {v0, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    sput v0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAu:I

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfe$zza;-><init>()V

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAB:Z

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAE:Z

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAF:Z

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAG:Z

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAJ:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAK:Z

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    new-instance v1, Lcom/google/android/gms/internal/zzcd;

    sget-object v0, Lcom/google/android/gms/internal/zzby;->zzuB:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const-string v2, "show_interstitial"

    const-string v3, "interstitial"

    invoke-direct {v1, v0, v2, v3}, Lcom/google/android/gms/internal/zzcd;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAv:Lcom/google/android/gms/internal/zzcd;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAv:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAw:Lcom/google/android/gms/internal/zzcc;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onBackPressed()V
    .registers 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x3

    const/4 v0, 0x0

    if-eqz p1, :cond_b

    const-string v1, "com.google.android.gms.ads.internal.overlay.hasResumed"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    :cond_b
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAE:Z

    :try_start_d
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzb(Landroid/content/Intent;)Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-nez v0, :cond_35

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzd$zza;

    const-string v1, "Could not get info for ad overlay."

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzd$zza;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_25
    .catch Lcom/google/android/gms/ads/internal/overlay/zzd$zza; {:try_start_d .. :try_end_25} :catch_25

    :catch_25
    move-exception v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzd$zza;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    iput v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_34
    :goto_34
    return-void

    :cond_35
    :try_start_35
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIB:I

    const v1, 0x7270e0

    if-le v0, v1, :cond_43

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    :cond_43
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "shouldCallOnOverlayOpened"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAK:Z

    :cond_5a
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzBa:Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;

    if-eqz v0, :cond_aa

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzBa:Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;->zzpk:Z

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAF:Z

    :goto_68
    if-nez p1, :cond_8e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAQ:Lcom/google/android/gms/ads/internal/overlay/zzg;

    if-eqz v0, :cond_7b

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAK:Z

    if-eqz v0, :cond_7b

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAQ:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;->zzaW()V

    :cond_7b
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAX:I

    if-eq v0, v3, :cond_8e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAP:Lcom/google/android/gms/ads/internal/client/zza;

    if-eqz v0, :cond_8e

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAP:Lcom/google/android/gms/ads/internal/client/zza;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/client/zza;->onAdClicked()V

    :cond_8e
    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzd$zzb;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAZ:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/internal/overlay/zzd$zzb;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAX:I

    packed-switch v0, :pswitch_data_f6

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzd$zza;

    const-string v1, "Could not determine ad overlay type."

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzd$zza;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_aa
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAF:Z

    goto :goto_68

    :pswitch_ae
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzv(Z)V

    goto :goto_34

    :pswitch_b3
    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;-><init>(Lcom/google/android/gms/internal/zzip;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAz:Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzv(Z)V

    goto/16 :goto_34

    :pswitch_c4
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzv(Z)V

    goto/16 :goto_34

    :pswitch_ca
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAE:Z

    if-eqz v0, :cond_d8

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto/16 :goto_34

    :cond_d8
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbu()Lcom/google/android/gms/ads/internal/overlay/zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAO:Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAW:Lcom/google/android/gms/ads/internal/overlay/zzn;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/ads/internal/overlay/zza;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;Lcom/google/android/gms/ads/internal/overlay/zzn;)Z

    move-result v0

    if-nez v0, :cond_34

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_f4
    .catch Lcom/google/android/gms/ads/internal/overlay/zzd$zza; {:try_start_35 .. :try_end_f4} :catch_25

    goto/16 :goto_34

    :pswitch_data_f6
    .packed-switch 0x1
        :pswitch_ae
        :pswitch_b3
        :pswitch_c4
        :pswitch_ca
    .end packed-switch
.end method

.method public onDestroy()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzk;->destroy()V

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    :cond_18
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzeB()V

    return-void
.end method

.method public onPause()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzk;->pause()V

    :cond_9
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzex()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAz:Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

    if-nez v0, :cond_29

    :cond_1c
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/webkit/WebView;)Z

    :cond_29
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzeB()V

    return-void
.end method

.method public onRestart()V
    .registers 1

    return-void
.end method

.method public onResume()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAX:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_17

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAE:Z

    if-eqz v0, :cond_31

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_17
    :goto_17
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_35

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_35

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhv;->zzb(Landroid/webkit/WebView;)Z

    :goto_30
    return-void

    :cond_31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAE:Z

    goto :goto_17

    :cond_35
    const-string v0, "The webview does not exit. Ignoring action."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_30
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outBundle"    # Landroid/os/Bundle;

    .prologue
    const-string v0, "com.google.android.gms.ads.internal.overlay.hasResumed"

    iget-boolean v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAE:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onStart()V
    .registers 1

    return-void
.end method

.method public onStop()V
    .registers 1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzeB()V

    return-void
.end method

.method public setRequestedOrientation(I)V
    .registers 3
    .param p1, "requestedOrientation"    # I

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    return-void
.end method

.method public zza(IIIII)V
    .registers 14

    const/4 v7, -0x1

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAv:Lcom/google/android/gms/internal/zzcd;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAw:Lcom/google/android/gms/internal/zzcc;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "vpr"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAv:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v5

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    if-nez v0, :cond_42

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzk;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAv:Lcom/google/android/gms/internal/zzcd;

    move v3, p5

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/overlay/zzk;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzip;ILcom/google/android/gms/internal/zzcd;Lcom/google/android/gms/internal/zzcc;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v7, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v6, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zze(IIII)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/google/android/gms/internal/zziq;->zzF(Z)V

    :cond_42
    return-void
.end method

.method public zza(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .registers 6

    const/4 v2, -0x1

    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAC:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAC:Landroid/widget/FrameLayout;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAC:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1, v2, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAC:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzaE()V

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAD:Landroid/webkit/WebChromeClient$CustomViewCallback;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAB:Z

    return-void
.end method

.method public zza(ZZ)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAA:Lcom/google/android/gms/ads/internal/overlay/zzm;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAA:Lcom/google/android/gms/ads/internal/overlay/zzm;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/ads/internal/overlay/zzm;->zza(ZZ)V

    :cond_9
    return-void
.end method

.method public zzaE()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAI:Z

    return-void
.end method

.method public zzd(IIII)V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zze(IIII)V

    :cond_9
    return-void
.end method

.method public zzeA()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAA:Lcom/google/android/gms/ads/internal/overlay/zzm;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzu(Z)V

    return-void
.end method

.method protected zzeB()V
    .registers 6

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAJ:Z

    if-eqz v0, :cond_e

    :cond_d
    :goto_d
    return-void

    :cond_e
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAJ:Z

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgc()Lcom/google/android/gms/internal/zzca;

    move-result-object v0

    if-eqz v0, :cond_28

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbA()Lcom/google/android/gms/internal/zzhl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhl;->zzgc()Lcom/google/android/gms/internal/zzca;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAv:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzca;->zza(Lcom/google/android/gms/internal/zzcd;)Z

    :cond_28
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_68

    iget v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzv(I)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAz:Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

    if-eqz v0, :cond_66

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAz:Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;->context:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzip;->setContext(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzip;->zzC(Z)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAz:Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;->zzAN:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAz:Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

    iget v2, v2, Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;->index:I

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAz:Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;->zzAM:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iput-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAz:Lcom/google/android/gms/ads/internal/overlay/zzd$zzc;

    :cond_66
    iput-object v4, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    :cond_68
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAQ:Lcom/google/android/gms/ads/internal/overlay/zzg;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAQ:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;->zzaV()V

    goto :goto_d
.end method

.method public zzeC()V
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAG:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAG:Z

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzeD()V

    :cond_a
    return-void
.end method

.method protected zzeD()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzeD()V

    return-void
.end method

.method public zzew()Lcom/google/android/gms/ads/internal/overlay/zzk;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAy:Lcom/google/android/gms/ads/internal/overlay/zzk;

    return-object v0
.end method

.method public zzex()V
    .registers 4

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v0, :cond_10

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAB:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->orientation:I

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->setRequestedOrientation(I)V

    :cond_10
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAC:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzaE()V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAC:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAC:Landroid/widget/FrameLayout;

    :cond_25
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAD:Landroid/webkit/WebChromeClient$CustomViewCallback;

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAD:Landroid/webkit/WebChromeClient$CustomViewCallback;

    invoke-interface {v0}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAD:Landroid/webkit/WebChromeClient$CustomViewCallback;

    :cond_30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAB:Z

    return-void
.end method

.method public zzey()V
    .registers 2

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public zzez()Z
    .registers 5

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAH:I

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :cond_8
    :goto_8
    return v0

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgY()Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    const-string v2, "onbackblocked"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/google/android/gms/internal/zzip;->zzc(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_8
.end method

.method public zzu(Z)V
    .registers 6

    const/4 v3, -0x2

    if-eqz p1, :cond_30

    const/16 v0, 0x32

    :goto_5
    new-instance v1, Lcom/google/android/gms/ads/internal/overlay/zzm;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, v2, v0, p0}, Lcom/google/android/gms/ads/internal/overlay/zzm;-><init>(Landroid/content/Context;ILcom/google/android/gms/ads/internal/overlay/zzo;)V

    iput-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAA:Lcom/google/android/gms/ads/internal/overlay/zzm;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v0, 0xa

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    if-eqz p1, :cond_33

    const/16 v0, 0xb

    :goto_1c
    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAA:Lcom/google/android/gms/ads/internal/overlay/zzm;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-boolean v2, v2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAU:Z

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/ads/internal/overlay/zzm;->zza(ZZ)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAA:Lcom/google/android/gms/ads/internal/overlay/zzm;

    invoke-virtual {v0, v2, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_30
    const/16 v0, 0x20

    goto :goto_5

    :cond_33
    const/16 v0, 0x9

    goto :goto_1c
.end method

.method protected zzv(I)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzip;->zzv(I)V

    return-void
.end method

.method protected zzv(Z)V
    .registers 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/ads/internal/overlay/zzd$zza;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAI:Z

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->requestWindowFeature(I)Z

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_1a

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzd$zza;

    const-string v1, "Invalid activity, no window available."

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzd$zza;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1a
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAF:Z

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzBa:Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;

    if-eqz v0, :cond_33

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzBa:Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;->zzpl:Z

    if-eqz v0, :cond_33

    :cond_2c
    const/16 v0, 0x400

    const/16 v2, 0x400

    invoke-virtual {v1, v0, v2}, Landroid/view/Window;->setFlags(II)V

    :cond_33
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziq;->zzbY()Z

    move-result v4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAG:Z

    if-eqz v4, :cond_64

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->orientation:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzhv;->zzgv()I

    move-result v2

    if-ne v0, v2, :cond_163

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_160

    const/4 v0, 0x1

    :goto_62
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAG:Z

    :cond_64
    :goto_64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Delay onShow to next orientation change: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAG:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->orientation:I

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->setRequestedOrientation(I)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/view/Window;)Z

    move-result v0

    if-eqz v0, :cond_92

    const-string v0, "Hardware acceleration on the AdActivity window enabled."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    :cond_92
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAF:Z

    if-nez v0, :cond_187

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    :goto_9d
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzaE()V

    if-eqz p1, :cond_1b2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzby()Lcom/google/android/gms/internal/zzir;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzip;->zzaN()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzir;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;ZZLcom/google/android/gms/internal/zzan;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzip;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v8, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAS:Lcom/google/android/gms/internal/zzdd;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v9, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAW:Lcom/google/android/gms/ads/internal/overlay/zzn;

    const/4 v10, 0x1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v11, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAY:Lcom/google/android/gms/internal/zzdi;

    const/4 v12, 0x0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziq;->zzhb()Lcom/google/android/gms/ads/internal/zze;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual/range {v5 .. v14}, Lcom/google/android/gms/internal/zziq;->zzb(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/internal/zzdd;Lcom/google/android/gms/ads/internal/overlay/zzn;ZLcom/google/android/gms/internal/zzdi;Lcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzfc;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/ads/internal/overlay/zzd$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/ads/internal/overlay/zzd$1;-><init>(Lcom/google/android/gms/ads/internal/overlay/zzd;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/internal/zziq$zza;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->url:Ljava/lang/String;

    if-eqz v0, :cond_190

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->url:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzip;->loadUrl(Ljava/lang/String;)V

    :goto_106
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAR:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_113

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAR:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0, p0}, Lcom/google/android/gms/internal/zzip;->zzb(Lcom/google/android/gms/ads/internal/overlay/zzd;)V

    :cond_113
    :goto_113
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0, p0}, Lcom/google/android/gms/internal/zzip;->zza(Lcom/google/android/gms/ads/internal/overlay/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_12f

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_12f

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_12f
    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAF:Z

    if-eqz v0, :cond_13a

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    sget v1, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAu:I

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzip;->setBackgroundColor(I)V

    :cond_13a
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    const/4 v2, -0x1

    const/4 v3, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;II)V

    if-nez p1, :cond_150

    iget-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAG:Z

    if-nez v0, :cond_150

    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzeD()V

    :cond_150
    invoke-virtual {p0, v4}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzu(Z)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgT()Z

    move-result v0

    if-eqz v0, :cond_15f

    const/4 v0, 0x1

    invoke-virtual {p0, v4, v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zza(ZZ)V

    :cond_15f
    return-void

    :cond_160
    const/4 v0, 0x0

    goto/16 :goto_62

    :cond_163
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->orientation:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzhv;->zzgw()I

    move-result v2

    if-ne v0, v2, :cond_64

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_185

    const/4 v0, 0x1

    :goto_181
    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAG:Z

    goto/16 :goto_64

    :cond_185
    const/4 v0, 0x0

    goto :goto_181

    :cond_187
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzzA:Landroid/widget/RelativeLayout;

    sget v1, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAu:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    goto/16 :goto_9d

    :cond_190
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAV:Ljava/lang/String;

    if-eqz v0, :cond_1aa

    iget-object v5, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v6, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAT:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v7, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAV:Ljava/lang/String;

    const-string v8, "text/html"

    const-string v9, "UTF-8"

    const/4 v10, 0x0

    invoke-interface/range {v5 .. v10}, Lcom/google/android/gms/internal/zzip;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_106

    :cond_1aa
    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/zzd$zza;

    const-string v1, "No URL or HTML to display in ad overlay."

    invoke-direct {v0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzd$zza;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1b2
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzAx:Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzAR:Lcom/google/android/gms/internal/zzip;

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/overlay/zzd;->mActivity:Landroid/app/Activity;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzip;->setContext(Landroid/content/Context;)V

    goto/16 :goto_113
.end method
