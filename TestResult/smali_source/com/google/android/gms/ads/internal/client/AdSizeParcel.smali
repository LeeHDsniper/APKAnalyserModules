.class public final Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/ads/internal/client/zzh;


# instance fields
.field public final height:I

.field public final heightPixels:I

.field public final versionCode:I

.field public final width:I

.field public final widthPixels:I

.field public final zzsG:Ljava/lang/String;

.field public final zzsH:Z

.field public final zzsI:[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

.field public final zzsJ:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/ads/internal/client/zzh;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/client/zzh;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->CREATOR:Lcom/google/android/gms/ads/internal/client/zzh;

    return-void
.end method

.method public constructor <init>()V
    .registers 11

    const/4 v3, 0x0

    const/4 v1, 0x3

    const-string v2, "interstitial_mb"

    const/4 v5, 0x1

    const/4 v8, 0x0

    move-object v0, p0

    move v4, v3

    move v6, v3

    move v7, v3

    move v9, v3

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;-><init>(ILjava/lang/String;IIZII[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Z)V

    return-void
.end method

.method constructor <init>(ILjava/lang/String;IIZII[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Z)V
    .registers 10
    .param p1, "versionCode"    # I
    .param p2, "formatString"    # Ljava/lang/String;
    .param p3, "height"    # I
    .param p4, "heightPixels"    # I
    .param p5, "isInterstitial"    # Z
    .param p6, "width"    # I
    .param p7, "widthPixels"    # I
    .param p8, "supportedAdSizes"    # [Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .param p9, "isNative"    # Z

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->versionCode:I

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsG:Ljava/lang/String;

    iput p3, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->height:I

    iput p4, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    iput-boolean p5, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    iput p6, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    iput p7, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    iput-object p8, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsI:[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iput-boolean p9, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsJ:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdSize;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "adSize"    # Lcom/google/android/gms/ads/AdSize;

    .prologue
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/android/gms/ads/AdSize;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;-><init>(Landroid/content/Context;[Lcom/google/android/gms/ads/AdSize;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;[Lcom/google/android/gms/ads/AdSize;)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "adSizes"    # [Lcom/google/android/gms/ads/AdSize;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    aget-object v6, p2, v2

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->versionCode:I

    iput-boolean v2, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    invoke-virtual {v6}, Lcom/google/android/gms/ads/AdSize;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    invoke-virtual {v6}, Lcom/google/android/gms/ads/AdSize;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->height:I

    iget v0, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    const/4 v3, -0x1

    if-ne v0, v3, :cond_b5

    move v0, v1

    :goto_1e
    iget v3, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->height:I

    const/4 v4, -0x2

    if-ne v3, v4, :cond_b8

    move v3, v1

    :goto_24
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    if-eqz v0, :cond_c2

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzS(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_bb

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzT(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_bb

    invoke-static {v7}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zza(Landroid/util/DisplayMetrics;)I

    move-result v4

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v5

    invoke-virtual {v5, p1}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzU(Landroid/content/Context;)I

    move-result v5

    sub-int/2addr v4, v5

    iput v4, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    :goto_51
    iget v4, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    int-to-float v4, v4

    iget v5, v7, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v4, v5

    float-to-double v8, v4

    double-to-int v4, v8

    double-to-int v5, v8

    int-to-double v10, v5

    sub-double/2addr v8, v10

    const-wide v10, 0x3f847ae147ae147bL

    cmpl-double v5, v8, v10

    if-ltz v5, :cond_67

    add-int/lit8 v4, v4, 0x1

    :cond_67
    move v5, v4

    :goto_68
    if-eqz v3, :cond_d2

    invoke-static {v7}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzc(Landroid/util/DisplayMetrics;)I

    move-result v4

    :goto_6e
    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v8

    invoke-virtual {v8, v7, v4}, Lcom/google/android/gms/ads/internal/util/client/zza;->zza(Landroid/util/DisplayMetrics;I)I

    move-result v7

    iput v7, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    if-nez v0, :cond_7c

    if-eqz v3, :cond_d5

    :cond_7c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "x"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "_as"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsG:Ljava/lang/String;

    :goto_9b
    array-length v0, p2

    if-le v0, v1, :cond_dc

    array-length v0, p2

    new-array v0, v0, [Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsI:[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move v0, v2

    :goto_a4
    array-length v1, p2

    if-ge v0, v1, :cond_df

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsI:[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    new-instance v3, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    aget-object v4, p2, v0

    invoke-direct {v3, p1, v4}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/AdSize;)V

    aput-object v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_a4

    :cond_b5
    move v0, v2

    goto/16 :goto_1e

    :cond_b8
    move v3, v2

    goto/16 :goto_24

    :cond_bb
    invoke-static {v7}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zza(Landroid/util/DisplayMetrics;)I

    move-result v4

    iput v4, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    goto :goto_51

    :cond_c2
    iget v4, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v5

    iget v8, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    invoke-virtual {v5, v7, v8}, Lcom/google/android/gms/ads/internal/util/client/zza;->zza(Landroid/util/DisplayMetrics;I)I

    move-result v5

    iput v5, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    move v5, v4

    goto :goto_68

    :cond_d2
    iget v4, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->height:I

    goto :goto_6e

    :cond_d5
    invoke-virtual {v6}, Lcom/google/android/gms/ads/AdSize;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsG:Ljava/lang/String;

    goto :goto_9b

    :cond_dc
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsI:[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    :cond_df
    iput-boolean v2, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsJ:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;)V
    .registers 13
    .param p1, "adSize"    # Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .param p2, "supportedAdSizes"    # [Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    .prologue
    const/4 v1, 0x3

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsG:Ljava/lang/String;

    iget v3, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->height:I

    iget v4, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->heightPixels:I

    iget-boolean v5, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsH:Z

    iget v6, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    iget v7, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->widthPixels:I

    iget-boolean v9, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsJ:Z

    move-object v0, p0

    move-object v8, p2

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;-><init>(ILjava/lang/String;IIZII[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Z)V

    return-void
.end method

.method public static zza(Landroid/util/DisplayMetrics;)I
    .registers 2

    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    return v0
.end method

.method public static zzb(Landroid/util/DisplayMetrics;)I
    .registers 3

    invoke-static {p0}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzc(Landroid/util/DisplayMetrics;)I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private static zzc(Landroid/util/DisplayMetrics;)I
    .registers 3

    iget v0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v0, v0

    iget v1, p0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, v1

    float-to-int v0, v0

    const/16 v1, 0x190

    if-gt v0, v1, :cond_e

    const/16 v0, 0x20

    :goto_d
    return v0

    :cond_e
    const/16 v1, 0x2d0

    if-gt v0, v1, :cond_15

    const/16 v0, 0x32

    goto :goto_d

    :cond_15
    const/16 v0, 0x5a

    goto :goto_d
.end method

.method public static zzcB()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .registers 10

    const/4 v3, 0x0

    new-instance v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    const/4 v1, 0x3

    const-string v2, "reward_mb"

    const/4 v8, 0x0

    move v4, v3

    move v5, v3

    move v6, v3

    move v7, v3

    move v9, v3

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;-><init>(ILjava/lang/String;IIZII[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Z)V

    return-object v0
.end method

.method public static zzs(Landroid/content/Context;)Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .registers 11

    const/4 v3, 0x0

    new-instance v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    const/4 v1, 0x3

    const-string v2, "320x50_mb"

    const/4 v8, 0x0

    const/4 v9, 0x1

    move v4, v3

    move v5, v3

    move v6, v3

    move v7, v3

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;-><init>(ILjava/lang/String;IIZII[Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Z)V

    return-object v0
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
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/ads/internal/client/zzh;->zza(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzcC()Lcom/google/android/gms/ads/AdSize;
    .registers 4

    iget v0, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->width:I

    iget v1, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->height:I

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsG:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/ads/zza;->zza(IILjava/lang/String;)Lcom/google/android/gms/ads/AdSize;

    move-result-object v0

    return-object v0
.end method
