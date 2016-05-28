.class public Lcom/google/android/gms/ads/internal/formats/zza;
.super Ljava/lang/Object;


# static fields
.field private static final zzvA:I

.field static final zzvB:I

.field static final zzvC:I

.field private static final zzvz:I


# instance fields
.field private final mTextColor:I

.field private final zzvD:Ljava/lang/String;

.field private final zzvE:Landroid/graphics/drawable/Drawable;

.field private final zzvF:I

.field private final zzvG:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const/16 v3, 0xcc

    const/16 v0, 0xc

    const/16 v1, 0xae

    const/16 v2, 0xce

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvz:I

    invoke-static {v3, v3, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvA:I

    sget v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvA:I

    sput v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvB:I

    sget v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvz:I

    sput v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvC:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvD:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvE:Landroid/graphics/drawable/Drawable;

    if-eqz p3, :cond_20

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_d
    iput v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvF:I

    if-eqz p4, :cond_23

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_15
    iput v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->mTextColor:I

    if-eqz p5, :cond_26

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_1d
    iput v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvG:I

    return-void

    :cond_20
    sget v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvB:I

    goto :goto_d

    :cond_23
    sget v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvC:I

    goto :goto_15

    :cond_26
    const/16 v0, 0xc

    goto :goto_1d
.end method


# virtual methods
.method public getBackgroundColor()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvF:I

    return v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvE:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvD:Ljava/lang/String;

    return-object v0
.end method

.method public getTextColor()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->mTextColor:I

    return v0
.end method

.method public getTextSize()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzvG:I

    return v0
.end method
