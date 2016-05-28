.class public final Lcom/google/android/gms/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final AdsAttrs:[I

.field public static final AdsAttrs_adSize:I = 0x0

.field public static final AdsAttrs_adSizes:I = 0x1

.field public static final AdsAttrs_adUnitId:I = 0x2

.field public static final LoadingImageView:[I

.field public static final LoadingImageView_circleCrop:I = 0x2

.field public static final LoadingImageView_imageAspectRatio:I = 0x1

.field public static final LoadingImageView_imageAspectRatioAdjust:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x3

    .line 119
    new-array v0, v1, [I

    fill-array-data v0, :array_10

    sput-object v0, Lcom/google/android/gms/R$styleable;->AdsAttrs:[I

    .line 123
    new-array v0, v1, [I

    fill-array-data v0, :array_1a

    sput-object v0, Lcom/google/android/gms/R$styleable;->LoadingImageView:[I

    return-void

    .line 119
    :array_10
    .array-data 4
        0x7f010090
        0x7f010091
        0x7f010092
    .end array-data

    .line 123
    :array_1a
    .array-data 4
        0x7f0100f1
        0x7f0100f2
        0x7f0100f3
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
