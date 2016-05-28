.class public abstract Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;
.super Lcom/google/android/gms/ads/mediation/NativeAdMapper;


# instance fields
.field private zzJE:Lcom/google/android/gms/ads/formats/NativeAd$Image;

.field private zzvK:Ljava/lang/String;

.field private zzvL:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/ads/formats/NativeAd$Image;",
            ">;"
        }
    .end annotation
.end field

.field private zzvM:Ljava/lang/String;

.field private zzvO:Ljava/lang/String;

.field private zzvP:D

.field private zzvQ:Ljava/lang/String;

.field private zzvR:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/ads/mediation/NativeAdMapper;-><init>()V

    return-void
.end method


# virtual methods
.method public final getBody()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvM:Ljava/lang/String;

    return-object v0
.end method

.method public final getCallToAction()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvO:Ljava/lang/String;

    return-object v0
.end method

.method public final getHeadline()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvK:Ljava/lang/String;

    return-object v0
.end method

.method public final getIcon()Lcom/google/android/gms/ads/formats/NativeAd$Image;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzJE:Lcom/google/android/gms/ads/formats/NativeAd$Image;

    return-object v0
.end method

.method public final getImages()Ljava/util/List;
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

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvL:Ljava/util/List;

    return-object v0
.end method

.method public final getPrice()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvR:Ljava/lang/String;

    return-object v0
.end method

.method public final getStarRating()D
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvP:D

    return-wide v0
.end method

.method public final getStore()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvQ:Ljava/lang/String;

    return-object v0
.end method

.method public final setBody(Ljava/lang/String;)V
    .registers 2
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvM:Ljava/lang/String;

    return-void
.end method

.method public final setCallToAction(Ljava/lang/String;)V
    .registers 2
    .param p1, "callToAction"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvO:Ljava/lang/String;

    return-void
.end method

.method public final setHeadline(Ljava/lang/String;)V
    .registers 2
    .param p1, "headline"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvK:Ljava/lang/String;

    return-void
.end method

.method public final setIcon(Lcom/google/android/gms/ads/formats/NativeAd$Image;)V
    .registers 2
    .param p1, "icon"    # Lcom/google/android/gms/ads/formats/NativeAd$Image;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzJE:Lcom/google/android/gms/ads/formats/NativeAd$Image;

    return-void
.end method

.method public final setImages(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/ads/formats/NativeAd$Image;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "images":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/ads/formats/NativeAd$Image;>;"
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvL:Ljava/util/List;

    return-void
.end method

.method public final setPrice(Ljava/lang/String;)V
    .registers 2
    .param p1, "price"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvR:Ljava/lang/String;

    return-void
.end method

.method public final setStarRating(D)V
    .registers 4
    .param p1, "starRating"    # D

    .prologue
    iput-wide p1, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvP:D

    return-void
.end method

.method public final setStore(Ljava/lang/String;)V
    .registers 2
    .param p1, "store"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/ads/mediation/NativeAppInstallAdMapper;->zzvQ:Ljava/lang/String;

    return-void
.end method
