.class public Lcom/google/android/gms/internal/zzcy;
.super Lcom/google/android/gms/internal/zzct$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzwD:Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzct$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzcy;->zzwD:Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzcn;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcy;->zzwD:Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzcy;->zzb(Lcom/google/android/gms/internal/zzcn;)Lcom/google/android/gms/internal/zzco;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/formats/NativeAppInstallAd$OnAppInstallAdLoadedListener;->onAppInstallAdLoaded(Lcom/google/android/gms/ads/formats/NativeAppInstallAd;)V

    return-void
.end method

.method zzb(Lcom/google/android/gms/internal/zzcn;)Lcom/google/android/gms/internal/zzco;
    .registers 3

    new-instance v0, Lcom/google/android/gms/internal/zzco;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzco;-><init>(Lcom/google/android/gms/internal/zzcn;)V

    return-object v0
.end method
