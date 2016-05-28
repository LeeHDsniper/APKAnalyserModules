.class public Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;
.super Ljava/lang/Object;
.source "BehanceSDKCustomFadeInBitmapDisplayer.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;


# instance fields
.field private final animateFromDisk:Z

.field private final animateFromMemory:Z

.field private final animateFromNetwork:Z

.field private final durationMillis:I


# direct methods
.method public constructor <init>(IZZZ)V
    .registers 5
    .param p1, "durationMillis"    # I
    .param p2, "animateFromNetwork"    # Z
    .param p3, "animateFromDisk"    # Z
    .param p4, "animateFromMemory"    # Z

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput p1, p0, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;->durationMillis:I

    .line 40
    iput-boolean p2, p0, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;->animateFromNetwork:Z

    .line 41
    iput-boolean p3, p0, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;->animateFromDisk:Z

    .line 42
    iput-boolean p4, p0, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;->animateFromMemory:Z

    .line 43
    return-void
.end method


# virtual methods
.method public display(Landroid/graphics/Bitmap;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;)V
    .registers 10
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "imageAware"    # Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;
    .param p3, "loadedFrom"    # Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;

    .prologue
    const/4 v5, 0x1

    .line 48
    iget-boolean v1, p0, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;->animateFromNetwork:Z

    if-eqz v1, :cond_9

    sget-object v1, Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;->NETWORK:Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;

    if-eq p3, v1, :cond_19

    :cond_9
    iget-boolean v1, p0, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;->animateFromDisk:Z

    if-eqz v1, :cond_11

    sget-object v1, Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;->DISC_CACHE:Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;

    if-eq p3, v1, :cond_19

    :cond_11
    iget-boolean v1, p0, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;->animateFromMemory:Z

    if-eqz v1, :cond_40

    sget-object v1, Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;->MEMORY_CACHE:Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;

    if-ne p3, v1, :cond_40

    .line 52
    :cond_19
    new-instance v0, Landroid/graphics/drawable/TransitionDrawable;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const v4, 0xf0f0f0

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    aput-object v3, v1, v2

    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 57
    .local v0, "td":Landroid/graphics/drawable/TransitionDrawable;
    invoke-virtual {v0, v5}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 58
    invoke-interface {p2, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setImageDrawable(Landroid/graphics/drawable/Drawable;)Z

    .line 59
    iget v1, p0, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;->durationMillis:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 63
    .end local v0    # "td":Landroid/graphics/drawable/TransitionDrawable;
    :goto_3f
    return-void

    .line 62
    :cond_40
    invoke-interface {p2, p1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setImageBitmap(Landroid/graphics/Bitmap;)Z

    goto :goto_3f
.end method
