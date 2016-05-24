.class public final Lcom/google/android/gms/internal/zzfr;
.super Lcom/google/android/gms/internal/zzfm$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zztp:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfm$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfr;->zztp:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzfl;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfr;->zztp:Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;

    new-instance v1, Lcom/google/android/gms/internal/zzfu;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzfu;-><init>(Lcom/google/android/gms/internal/zzfl;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/purchase/InAppPurchaseListener;->onInAppPurchaseRequested(Lcom/google/android/gms/ads/purchase/InAppPurchase;)V

    return-void
.end method
