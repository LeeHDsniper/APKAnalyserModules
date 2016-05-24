.class Lcom/google/android/gms/ads/internal/formats/zzb;
.super Landroid/widget/RelativeLayout;


# static fields
.field private static final zzvH:[F


# instance fields
.field private final zzvI:Landroid/widget/RelativeLayout;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_a

    sput-object v0, Lcom/google/android/gms/ads/internal/formats/zzb;->zzvH:[F

    return-void

    :array_a
    .array-data 4
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/formats/zza;)V
    .registers 11

    const/4 v7, 0x0

    const/4 v6, 0x4

    const/4 v5, 0x0

    const/4 v4, -0x2

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v2, Landroid/graphics/drawable/shapes/RoundRectShape;

    sget-object v3, Lcom/google/android/gms/ads/internal/formats/zzb;->zzvH:[F

    invoke-direct {v2, v3, v7, v7}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v2

    invoke-virtual {p2}, Lcom/google/android/gms/ads/internal/formats/zza;->getBackgroundColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v2, Landroid/widget/RelativeLayout;

    invoke-direct {v2, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzb;->zzvI:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzb;->zzvI:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/formats/zzb;->zzvI:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/internal/zzhv;->zza(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v0, 0x47470001

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setId(I)V

    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-virtual {p2}, Lcom/google/android/gms/ads/internal/formats/zza;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Lcom/google/android/gms/ads/internal/formats/zza;->getTextColor()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p2}, Lcom/google/android/gms/ads/internal/formats/zza;->getTextSize()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v0

    invoke-virtual {v0, p1, v6}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/content/Context;I)I

    move-result v0

    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v2

    invoke-virtual {v2, p1, v6}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v0, v5, v2, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/4 v2, 0x1

    invoke-virtual {v1}, Landroid/widget/TextView;->getId()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v0, 0x47470002

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setId(I)V

    invoke-virtual {p2}, Lcom/google/android/gms/ads/internal/formats/zza;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzb;->zzvI:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzb;->zzvI:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzb;->zzvI:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/ads/internal/formats/zzb;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public zzdq()Landroid/view/ViewGroup;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zzb;->zzvI:Landroid/widget/RelativeLayout;

    return-object v0
.end method
