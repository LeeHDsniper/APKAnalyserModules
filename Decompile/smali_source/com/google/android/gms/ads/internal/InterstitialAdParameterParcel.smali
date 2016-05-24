.class public final Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/ads/internal/zzl;


# instance fields
.field public final versionCode:I

.field public final zzpk:Z

.field public final zzpl:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/ads/internal/zzl;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/zzl;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;->CREATOR:Lcom/google/android/gms/ads/internal/zzl;

    return-void
.end method

.method constructor <init>(IZZ)V
    .registers 4
    .param p1, "versionCode"    # I
    .param p2, "transparentBackground"    # Z
    .param p3, "hideStatusBar"    # Z

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;->versionCode:I

    iput-boolean p2, p0, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;->zzpk:Z

    iput-boolean p3, p0, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;->zzpl:Z

    return-void
.end method

.method public constructor <init>(ZZ)V
    .registers 4
    .param p1, "transparentBackground"    # Z
    .param p2, "hideStatusBar"    # Z

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;->versionCode:I

    iput-boolean p1, p0, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;->zzpk:Z

    iput-boolean p2, p0, Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;->zzpl:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/ads/internal/zzl;->zza(Lcom/google/android/gms/ads/internal/InterstitialAdParameterParcel;Landroid/os/Parcel;I)V

    return-void
.end method
