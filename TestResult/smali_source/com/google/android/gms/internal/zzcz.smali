.class public Lcom/google/android/gms/internal/zzcz;
.super Lcom/google/android/gms/internal/zzcu$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzwE:Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzcu$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzcz;->zzwE:Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzcp;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcz;->zzwE:Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzcz;->zzb(Lcom/google/android/gms/internal/zzcp;)Lcom/google/android/gms/internal/zzcq;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/formats/NativeContentAd$OnContentAdLoadedListener;->onContentAdLoaded(Lcom/google/android/gms/ads/formats/NativeContentAd;)V

    return-void
.end method

.method zzb(Lcom/google/android/gms/internal/zzcp;)Lcom/google/android/gms/internal/zzcq;
    .registers 3

    new-instance v0, Lcom/google/android/gms/internal/zzcq;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzcq;-><init>(Lcom/google/android/gms/internal/zzcp;)V

    return-object v0
.end method
